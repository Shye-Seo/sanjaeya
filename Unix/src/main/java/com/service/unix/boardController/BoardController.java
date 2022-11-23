package com.service.unix.boardController;

import com.service.unix.boardService.BoardService;
import com.service.unix.boardVo.BoardFileVo;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryFileVo;
import com.service.unix.boardVo.LibraryVo;
import com.service.unix.boardVo.PagingVO;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController
{
  @Autowired
  BoardService service;
  
  @RequestMapping(value={"board_list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String list(HttpServletRequest request, ModelMap modelMap, PagingVO pagingvo, BoardVo boardvo,
		  @RequestParam(value = "nowPage", required = false) String nowPage,
		  @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
		  @RequestParam(value = "title", required = false) String title)
    throws Exception
  {
	  
	String sql = "";
		
	if(title != null) {
		modelMap.addAttribute("title", title);
		sql = "where title like '%" + title + "%'";
	}
	
	pagingvo.setSql(sql);
	int total = service.board_count(pagingvo);
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
	
    modelMap.addAttribute("library_list", this.service.library_list());
    
    return "/board/list";
  }
  
  @RequestMapping(value={"write_board"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String write_board()
    throws Exception
  {
    return "/board/write_board";
  }
  
  @ResponseBody
  @RequestMapping(value={"write_board"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String write_board(HttpServletRequest request, ModelMap modelMap, BoardVo vo, List<MultipartFile> board_file)
    throws Exception
  {
    String boardFile_path = "C:\\upload\\board_file";
    this.service.write_board(vo);
    int board_id = this.service.get_board_Id(vo.getId());
    
    List<BoardFileVo> boardFile_list = new ArrayList();
    for (MultipartFile files : board_file)
    {
      System.out.println("-----------");
      System.out.println("������ : " + files.getOriginalFilename());
      System.out.println("�������� : " + files.getSize());
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
        File target_1 = new File(boardFile_path, fileName);
        
        target_1.setReadable(true, true);
        target_1.setWritable(true, true);
        target_1.setExecutable(true, true);
        
        FileCopyUtils.copy(files.getBytes(), target_1);
        
        BoardFileVo boardFile = new BoardFileVo(board_id, fileName);
        boardFile_list.add(boardFile);
      }
    }
    this.service.set_boardFile(boardFile_list);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value={"readView"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String read(BoardVo boardVo, Model model, List<MultipartFile> board_file)
    throws Exception
  {
    model.addAttribute("read", this.service.read(boardVo.getId()));
    
    List<BoardFileVo> boardFile_list = this.service.get_board_files(boardVo.getId());
    model.addAttribute("boardFile_list", boardFile_list);
    model.addAttribute("board_id", Integer.valueOf(boardVo.getId()));
    
    return "board/readView";
  }
  
  @RequestMapping(value={"updateView"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String updateView(BoardVo boardVo, Model model)
    throws Exception
  {
    model.addAttribute("update", this.service.read(boardVo.getId()));
    model.addAttribute("board_id", Integer.valueOf(boardVo.getId()));
    
    return "board/updateView";
  }
  
  @RequestMapping(value={"update"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String update(HttpServletRequest request, BoardVo boardVo, Model model, HttpServletResponse response, List<MultipartFile> board_file, @RequestParam(value="board_id", required=false) int board_id)
    throws Exception
  {
    model.addAttribute("board_id", Integer.valueOf(board_id));
    String boardFile_path = "C:\\upload\\board_file";
    
    boardVo.setId(board_id);
    this.service.update(boardVo);
    
    BoardFileVo board_files = new BoardFileVo(board_id, "null");
    this.service.delete_boardFiles(board_files);
    
    List<BoardFileVo> boardFile_list = new ArrayList();
    for (MultipartFile files : board_file)
    {
      System.out.println("-----------");
      System.out.println("������ : " + files.getOriginalFilename());
      System.out.println("�������� : " + files.getSize());
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
        File target_1 = new File(boardFile_path, fileName);
        FileCopyUtils.copy(files.getBytes(), target_1);
        
        target_1.setReadable(true, true);
        target_1.setWritable(true, true);
        target_1.setExecutable(true, true);
        
        BoardFileVo boardFile = new BoardFileVo(board_id, fileName);
        System.out.println("-----------");
        System.out.println("filelist : " + boardFile);
        boardFile_list.add(boardFile);
      }
    }
    this.service.set_boardFile(boardFile_list);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value={"delete"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String delete(BoardVo boardVo, Model model)
    throws Exception
  {
    int board_id = boardVo.getId();
    this.service.delete(board_id);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value={"library_list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String library_list(HttpServletRequest request, ModelMap modelMap)
    throws Exception
  {
    modelMap.addAttribute("library_list", this.service.library_list());
    
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
    String libraryFile_path = "C:\\upload\\library_file";
    this.service.write_library(vo);
    int library_id = this.service.get_library_Id(vo.getId());
    
    List<LibraryFileVo> libraryFile_list = new ArrayList();
    for (MultipartFile files : library_file)
    {
      System.out.println("-----------");
      System.out.println("������ : " + files.getOriginalFilename());
      System.out.println("�������� : " + files.getSize());
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
        File target_1 = new File(libraryFile_path, fileName);
        
        target_1.setReadable(true, true);
        target_1.setWritable(true, true);
        target_1.setExecutable(true, true);
        
        FileCopyUtils.copy(files.getBytes(), target_1);
        
        LibraryFileVo libraryFile = new LibraryFileVo(library_id, fileName);
        libraryFile_list.add(libraryFile);
      }
    }
    this.service.set_libraryFile(libraryFile_list);
    
    return "board_list";
  }
  
  @RequestMapping(value={"readLibrary"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String readLibrary(LibraryVo libraryVo, Model model, List<MultipartFile> library_file)
    throws Exception
  {
    model.addAttribute("read", this.service.readLibrary(libraryVo.getId()));
    
    List<LibraryFileVo> libraryFile_list = this.service.get_library_files(libraryVo.getId());
    model.addAttribute("libraryFile_list", libraryFile_list);
    model.addAttribute("library_id", Integer.valueOf(libraryVo.getId()));
    
    return "board/readLibrary";
  }
  
  @RequestMapping(value={"updateLibrary"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String updateLibrary(LibraryVo libraryVo, Model model)
    throws Exception
  {
    model.addAttribute("library", this.service.readLibrary(libraryVo.getId()));
    model.addAttribute("library_id", Integer.valueOf(libraryVo.getId()));
    
    return "board/updateLibrary";
  }
  
  @RequestMapping(value={"updateLibrary_post"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String updateLibrary_post(HttpServletRequest request, LibraryVo libraryVo, Model model, HttpServletResponse response, List<MultipartFile> library_file, @RequestParam(value="library_id", required=false) int library_id)
    throws Exception
  {
    model.addAttribute("library_id", Integer.valueOf(library_id));
    String boardFile_path = "C:\\upload\\library_file";
    
    libraryVo.setId(library_id);
    this.service.updateLibrary(libraryVo);
    
    LibraryFileVo library_files = new LibraryFileVo(library_id, "null");
    this.service.delete_libraryFiles(library_files);
    
    List<LibraryFileVo> libraryFile_list = new ArrayList();
    for (MultipartFile files : library_file)
    {
      System.out.println("-----------");
      System.out.println("������ : " + files.getOriginalFilename());
      System.out.println("�������� : " + files.getSize());
      
      String fileName = files.getOriginalFilename();
      if ((fileName != null) && (!fileName.equals("")))
      {
        File target_1 = new File(boardFile_path, fileName);
        FileCopyUtils.copy(files.getBytes(), target_1);
        
        target_1.setReadable(true, true);
        target_1.setWritable(true, true);
        target_1.setExecutable(true, true);
        
        LibraryFileVo libraryFile = new LibraryFileVo(library_id, fileName);
        System.out.println("-----------");
        System.out.println("filelist : " + libraryFile);
        libraryFile_list.add(libraryFile);
      }
    }
    this.service.set_libraryFile(libraryFile_list);
    
    return "redirect:board_list";
  }
  
  @RequestMapping(value={"deleteLibrary"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String deleteLibrary(LibraryVo libraryVo, Model model)
    throws Exception
  {
    int library_id = libraryVo.getId();
    this.service.deleteLibrary(library_id);
    
    return "redirect:board_list";
  }
  
  @RequestMapping({"download"})
  @ResponseBody
  public byte[] download(HttpServletResponse response, @RequestParam String filename)
    throws IOException
  {
    String boardFile_path = "C:\\upload\\board_file";
    
    File file = new File(boardFile_path, filename);
    byte[] bytes = FileCopyUtils.copyToByteArray(file);
    
    String fn = new String(file.getName().getBytes(), "utf-8");
    response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
    response.setContentLength(bytes.length);
    return bytes;
  }
  
  @RequestMapping({"lib_download"})
  @ResponseBody
  public byte[] lib_download(HttpServletResponse response, @RequestParam String filename)
    throws IOException
  {
    String libraryFile_path = "C:\\upload\\library_file";
    
    File file = new File(libraryFile_path, filename);
    byte[] bytes = FileCopyUtils.copyToByteArray(file);
    
    String fn = new String(file.getName().getBytes(), "utf-8");
    response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
    response.setContentLength(bytes.length);
    return bytes;
  }
}
