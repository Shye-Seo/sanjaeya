package com.service.unix.boardController;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AccessControlList;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CanonicalGrantee;
import com.amazonaws.services.s3.model.CompleteMultipartUploadRequest;
import com.amazonaws.services.s3.model.CompleteMultipartUploadResult;
import com.amazonaws.services.s3.model.GroupGrantee;
import com.amazonaws.services.s3.model.InitiateMultipartUploadRequest;
import com.amazonaws.services.s3.model.InitiateMultipartUploadResult;
import com.amazonaws.services.s3.model.PartETag;
import com.amazonaws.services.s3.model.Permission;
import com.amazonaws.services.s3.model.UploadPartRequest;
import com.amazonaws.services.s3.model.UploadPartResult;
import com.service.unix.aws.AwsS3Service;
import com.service.unix.boardService.BoardService;
import com.service.unix.boardVo.BoardFileVo;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryFileVo;
import com.service.unix.boardVo.LibraryVo;
import com.service.unix.boardVo.PagingVO;
import com.service.unix.memberService.MemberService;
import com.service.unix.memberVo.MemberVo;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController
{
  @Autowired
  BoardService service;
  
  @Autowired
  AwsS3Service s3Service;
  
  @Inject
  MemberService memberService;
  
  String bucketName = "sanjaeya";
  String folderName = "board-folder/";
  String folderName_lib = "library-folder/";
  
  @RequestMapping(value="board_list", method=RequestMethod.GET)
  public String list( ModelMap modelMap, PagingVO pagingvo, BoardVo boardvo,
		  HttpSession session, HttpServletRequest request, HttpServletResponse response, 
		  @RequestParam(value = "nowPage", required = false) String nowPage,
		  @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
		  @RequestParam(value = "title", required = false) String title) throws Exception{
	
	String user_id = (String) session.getAttribute("user_id");
	System.out.println("user_id : "+user_id);
	
	
	if(user_id == null) {
		modelMap.addAttribute("authority", 0);
	}else if(service.check_authority(user_id) == null) {
		modelMap.addAttribute("authority", 0);
	} else {
		String authority = service.check_authority(user_id);
		modelMap.addAttribute("authority", authority);
	}
	System.out.println("authority : "+modelMap.getAttribute("authority"));
	
	String sql = "";
	int total = 0;
	if(title != null) { //검색 시 total set
		modelMap.addAttribute("title", title);
		sql = "where title like '%" + title + "%'";
		pagingvo.setTitle(title);
		pagingvo.setTotal(service.search_count(title));
		total = pagingvo.getTotal();
	}else {
		pagingvo.setSql(sql);
		total = service.board_count(pagingvo);
	}if(total == 0) {
		total = 1;
	}
	
	modelMap.addAttribute("total", total);
	
	if (nowPage == null && cntPerPage == null) {
		nowPage = "1";
		cntPerPage = "10";
	} else if (nowPage == null) {
		nowPage = "1";
	} else if (cntPerPage == null) {
		cntPerPage = "10";
	}
	
	pagingvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	modelMap.addAttribute("paging", pagingvo);
	
	if (total != 0) {
		pagingvo.setSql(sql);
		List<BoardVo> board_list = service.board_list(pagingvo);
		
		modelMap.addAttribute("board_list", board_list);
	}
	
    return "/board/list";
  }
  
  @RequestMapping(value={"write_board"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String write_board()
    throws Exception
  {
    return "/board/write_board";
  }
  
  @RequestMapping(value="board_list", method=RequestMethod.POST)
  public String list_post( ModelMap modelMap, PagingVO pagingvo, BoardVo boardvo,
		  HttpSession session, HttpServletRequest request, HttpServletResponse response, 
		  @RequestParam(value = "nowPage", required = false) String nowPage,
		  @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
		  @RequestParam(value = "title", required = false) String title) throws Exception{
	
	String user_id = (String) session.getAttribute("user_id");
	System.out.println("user_id : "+user_id);
	
	
	if(user_id == null) {
		modelMap.addAttribute("authority", 0);
	}else if(service.check_authority(user_id) == null) {
		modelMap.addAttribute("authority", 0);
	} else {
		String authority = service.check_authority(user_id);
		modelMap.addAttribute("authority", authority);
	}
	System.out.println("authority : "+modelMap.getAttribute("authority"));
	
	String sql = "";
	int total = 0;
	if(title != null) { //검색 시 total set
		modelMap.addAttribute("title", title);
		sql = "where title like '%" + title + "%'";
		pagingvo.setTitle(title);
		pagingvo.setTotal(service.search_count(title));
		total = pagingvo.getTotal();
	}else {
		pagingvo.setSql(sql);
		total = service.board_count(pagingvo);
	}
	
	modelMap.addAttribute("total", total);
	
	if (nowPage == null && cntPerPage == null) {
		nowPage = "1";
		cntPerPage = "10";
	} else if (nowPage == null) {
		nowPage = "1";
	} else if (cntPerPage == null) {
		cntPerPage = "10";
	}
	
	pagingvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	modelMap.addAttribute("paging", pagingvo);
	
	
	if (total != 0) {
		pagingvo.setSql(sql);
		List<BoardVo> board_list = service.board_list(pagingvo);
		
		modelMap.addAttribute("board_list", board_list);
	}
	
    return "/board/list";
  }
  
  @ResponseBody
  @RequestMapping(value={"write_board"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String write_board(HttpServletRequest request, ModelMap modelMap, BoardVo vo, List<MultipartFile> board_file)
    throws Exception
  {
    service.write_board(vo);
    int board_id = service.get_board_Id(vo.getId());
    
    List<BoardFileVo> boardFile_list = new ArrayList<BoardFileVo>();
    
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
    String time = dateFormat.format(cal.getTime());
    
    for (MultipartFile files : board_file)
    {
      System.out.println("-----------");
      System.out.println("파일명 : " + files.getOriginalFilename());
      System.out.println("파일 사이즈 : " + files.getSize());
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
    	
    	String new_fileName = time + "-" + fileName;
        BoardFileVo boardFile = new BoardFileVo(board_id, new_fileName);
        boardFile_list.add(boardFile);
      }
    }
    service.set_boardFile(boardFile_list);
    s3Service.upload_board(board_file);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value={"readView"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String read(BoardVo boardVo, Model model, List<MultipartFile> board_file)
    throws Exception
  {
    model.addAttribute("read", service.read(boardVo.getId()));
    
    List<BoardFileVo> boardFile_list = service.get_board_files(boardVo.getId());
    model.addAttribute("boardFile_list", boardFile_list);
    model.addAttribute("board_id", Integer.valueOf(boardVo.getId()));
    
    return "board/readView";
  }
  
  @RequestMapping(value={"updateView"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String updateView(BoardVo boardVo, Model model)
    throws Exception
  {
    model.addAttribute("update", service.read(boardVo.getId()));
    model.addAttribute("board_id", Integer.valueOf(boardVo.getId()));
    
    return "board/updateView";
  }
  
  @RequestMapping(value={"update"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String update(HttpServletRequest request, BoardVo boardVo, Model model, HttpServletResponse response, List<MultipartFile> board_file, @RequestParam(value="board_id", required=false) int board_id)
    throws Exception
  {
    model.addAttribute("board_id", board_id);
    boardVo.setId(board_id);
    service.update(boardVo);
    
    List<BoardFileVo> boardFile_list = service.get_board_files(boardVo.getId());
    for (BoardFileVo file : boardFile_list) {
		String fileName = file.getAddress();
		service.delete_boardFiles(file);
		s3Service.delete_s3Board(fileName);
	}
    
    boardFile_list = new ArrayList<BoardFileVo>();
    
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
    String time = dateFormat.format(cal.getTime());
    
    for (MultipartFile files : board_file)
    {
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
    	String new_fileName = time + "-" + fileName;
        BoardFileVo boardFile = new BoardFileVo(board_id, new_fileName);
        boardFile_list.add(boardFile);
      }
    }
    service.set_boardFile(boardFile_list);
    s3Service.upload_board(board_file);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value={"delete"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String delete(BoardVo boardVo, Model model)
    throws Exception
  {
	List<BoardFileVo> boardFile_list = service.get_board_files(boardVo.getId());
	
	for (BoardFileVo file : boardFile_list) {
		String fileName = file.getAddress();
		service.delete_boardFiles(file);
		s3Service.delete_s3Board(fileName);
	}
		
    int board_id = boardVo.getId();
    service.delete(board_id);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value="library_list", method=RequestMethod.GET)
  public String library_list(ModelMap modelMap, PagingVO pagingvo, LibraryVo libraryvo, 
		  HttpSession session, HttpServletRequest request, HttpServletResponse response, 
		  @RequestParam(value = "nowPage", required = false) String nowPage,
		  @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
		  @RequestParam(value = "title", required = false) String title)
    throws Exception
  {
	
	  String user_id = (String) session.getAttribute("user_id");
	  System.out.println("user_id : "+user_id);
		
	  if(user_id == null) {
			modelMap.addAttribute("authority", 0);
	  }else if(service.check_authority(user_id) == null) {
			modelMap.addAttribute("authority", 0);
	  } else {
			String authority = service.check_authority(user_id);
			modelMap.addAttribute("authority", authority);
	  }
	  System.out.println("authority : "+modelMap.getAttribute("authority"));
		
	  String sql = "";
	  int total = 0;
	  
		if(title != null) { //검색 시 total set
			modelMap.addAttribute("title", title);
			sql = "where title like '%" + title + "%'";
			pagingvo.setTitle(title);
			pagingvo.setTotal(service.search_count_lib(title));
			total = pagingvo.getTotal();
		}else {
			pagingvo.setSql(sql);
			total = service.library_count(pagingvo);
		} if(total == 0) {
			total = 1;

		}
		
		modelMap.addAttribute("total", total);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		pagingvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pagingvo);
		System.out.println("paging : " + pagingvo);
		
		if (total != 0) {
			pagingvo.setSql(sql);
			List<LibraryVo> library_list = service.library_list(pagingvo);
			
			System.out.println("검색 ===========================>");
			System.out.println("검색결과 : " + total);
			
			modelMap.addAttribute("library_list", library_list);
		}
    
    return "/board/library_list";
  }
  
  @RequestMapping(value="library_list", method=RequestMethod.POST)
  public String library_list_post(ModelMap modelMap, PagingVO pagingvo, LibraryVo libraryvo, 
		  HttpSession session, HttpServletRequest request, HttpServletResponse response, 
		  @RequestParam(value = "nowPage", required = false) String nowPage,
		  @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
		  @RequestParam(value = "title", required = false) String title)
    throws Exception
  {
	  String user_id = (String) session.getAttribute("user_id");
	  System.out.println("user_id : "+user_id);
		
	  if(user_id == null) {
			modelMap.addAttribute("authority", 0);
	  }else if(service.check_authority(user_id) == null) {
			modelMap.addAttribute("authority", 0);
	  } else {
			String authority = service.check_authority(user_id);
			modelMap.addAttribute("authority", authority);
	  }
	  System.out.println("authority : "+modelMap.getAttribute("authority"));
		
	  String sql = "";
	  int total = 0;
	  if(title != null) { //검색 시 total set
			modelMap.addAttribute("title", title);
			sql = "where title like '%" + title + "%'";
			pagingvo.setTitle(title);
			pagingvo.setTotal(service.search_count_lib(title));
			total = pagingvo.getTotal();
	  }else {
			pagingvo.setSql(sql);
			total = service.library_count(pagingvo);
	  }
		
		modelMap.addAttribute("total", total);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		pagingvo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", pagingvo);
		
		if (total != 0) {
			pagingvo.setSql(sql);
			List<LibraryVo> library_list = service.library_list(pagingvo);
			
			System.out.println("검색 ===========================>");
			System.out.println("검색결과 : " + total);
			
			modelMap.addAttribute("library_list", library_list);
		}
    
    return "/board/library_list";
  }
  
  @RequestMapping(value={"write_library"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String write_library()
    throws Exception
  {
    return "/board/write_library";
  }
  
  @ResponseBody
  @RequestMapping(value={"write_library"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String write_library(HttpServletRequest request, ModelMap modelMap, LibraryVo vo, List<MultipartFile> library_file)
    throws Exception
  {
    service.write_library(vo);
    int library_id = service.get_library_Id(vo.getId());
    
    List<LibraryFileVo> libraryFile_list = new ArrayList<LibraryFileVo>();
    
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
    String time = dateFormat.format(cal.getTime());
    
    for (MultipartFile files : library_file)
    {
      System.out.println("-----------");
      System.out.println("파일명: " + files.getOriginalFilename());
      System.out.println("파일 사이즈 : " + files.getSize());
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
    	String new_fileName = time + "-" + fileName;
        LibraryFileVo libraryFile = new LibraryFileVo(library_id, new_fileName);
        libraryFile_list.add(libraryFile);
      }
    }
    service.set_libraryFile(libraryFile_list);
    s3Service.upload_library(library_file);
    
    return "redirect:library_list";
  }
  
  @RequestMapping(value={"readLibrary"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String readLibrary(LibraryVo libraryVo, Model model, List<MultipartFile> library_file)
    throws Exception
  {
    model.addAttribute("read", service.readLibrary(libraryVo.getId()));
    
    List<LibraryFileVo> libraryFile_list = service.get_library_files(libraryVo.getId());
    model.addAttribute("libraryFile_list", libraryFile_list);
    model.addAttribute("library_id", Integer.valueOf(libraryVo.getId()));
    
    return "board/readLibrary";
  }
  
  @RequestMapping(value={"updateLibrary"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String updateLibrary(LibraryVo libraryVo, Model model)
    throws Exception
  {
    model.addAttribute("library", service.readLibrary(libraryVo.getId()));
    model.addAttribute("library_id", Integer.valueOf(libraryVo.getId()));
    
    return "board/updateLibrary";
  }
  
  @RequestMapping(value={"updateLibrary_post"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String updateLibrary_post(HttpServletRequest request, LibraryVo libraryVo, Model model, HttpServletResponse response, List<MultipartFile> library_file, @RequestParam(value="library_id", required=false) int library_id)
    throws Exception
  {
    model.addAttribute("library_id", library_id);
    libraryVo.setId(library_id);
    service.updateLibrary(libraryVo);
    
    List<LibraryFileVo> libraryFile_list = service.get_library_files(libraryVo.getId());
    for (LibraryFileVo file : libraryFile_list) {
		String fileName = file.getAddress();
		service.delete_libraryFiles(file);
		s3Service.delete_s3Library(fileName);
	}
    
    libraryFile_list = new ArrayList<LibraryFileVo>();
    
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
    String time = dateFormat.format(cal.getTime());
    
    for (MultipartFile files : library_file)
    {
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
    	String new_fileName = time + "-" + fileName;
        LibraryFileVo libraryFile = new LibraryFileVo(library_id, new_fileName);
        libraryFile_list.add(libraryFile);
      }
    }
    service.set_libraryFile(libraryFile_list);
    s3Service.upload_library(library_file);
    
    return "redirect:library_list";
  }
  
  @RequestMapping(value={"deleteLibrary"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String deleteLibrary(LibraryVo libraryVo, Model model)
    throws Exception
  {
	List<LibraryFileVo> libraryFile_list = service.get_library_files(libraryVo.getId());
	
	for (LibraryFileVo file : libraryFile_list) {
		String fileName = file.getAddress();
		service.delete_libraryFiles(file);
		s3Service.delete_s3Library(fileName);
	}
	
    int library_id = libraryVo.getId();
    service.deleteLibrary(library_id);
    
    return "redirect:library_list";
  }
  
  @RequestMapping({"download"})
  @ResponseBody
  public ResponseEntity<byte[]> download(HttpServletResponse response, @RequestParam String filename) throws IOException {
      return s3Service.getObject_board(filename);
  }
  
  @RequestMapping({"lib_download"})
  @ResponseBody
  public ResponseEntity<byte[]> lib_download(HttpServletResponse response, @RequestParam String filename) throws IOException {
      return s3Service.getObject_library(filename);
  }
}