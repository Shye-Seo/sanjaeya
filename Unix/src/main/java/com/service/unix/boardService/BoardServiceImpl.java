package com.service.unix.boardService;

import com.service.unix.boardDao.BoardDao;
import com.service.unix.boardVo.BoardFileVo;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryFileVo;
import com.service.unix.boardVo.LibraryVo;
import com.service.unix.boardVo.PagingVO;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl
  implements BoardService
{
  @Autowired
  BoardDao boardDao;
  
  public void write_board(BoardVo boardVo)
    throws Exception
  {
    this.boardDao.write_board(boardVo);
  }
  
  public List<BoardVo> board_list(PagingVO pagingvo)
    throws Exception
  {
    return this.boardDao.board_list(pagingvo);
  }
  
  public BoardVo read(int bno)
    throws Exception
  {
    return this.boardDao.read(bno);
  }
  
  public void update(BoardVo boardVo)
    throws Exception
  {
    this.boardDao.update(boardVo);
  }
  
  public void delete(int id)
    throws Exception
  {
    this.boardDao.delete(id);
  }
  
  public List<LibraryVo> library_list(PagingVO pagingvo)
    throws Exception
  {
    return this.boardDao.library_list(pagingvo);
  }
  
  public void write_library(LibraryVo vo)
    throws Exception
  {
    this.boardDao.write_library(vo);
  }
  
  public LibraryVo readLibrary(int bno)
    throws Exception
  {
    return this.boardDao.readLibrary(bno);
  }
  
  public void updateLibrary(LibraryVo vo)
    throws Exception
  {
    this.boardDao.updateLibrary(vo);
  }
  
  public void deleteLibrary(int id)
    throws Exception
  {
    this.boardDao.deleteLibrary(id);
  }
  
  public void set_boardFile(List<BoardFileVo> boardFile_list)
    throws Exception
  {
    this.boardDao.set_boardFile(boardFile_list);
  }
  
  public void set_libraryFile(List<LibraryFileVo> libraryFile_list)
    throws Exception
  {
    this.boardDao.set_libraryFile(libraryFile_list);
  }
  
  public int get_board_Id(int id)
    throws Exception
  {
    return this.boardDao.get_board_Id(id);
  }
  
  public List<BoardFileVo> get_board_files(int id)
    throws Exception
  {
    return this.boardDao.get_board_files(id);
  }
  
  public int get_library_Id(int id)
    throws Exception
  {
    return this.boardDao.get_library_Id(id);
  }
  
  public List<LibraryFileVo> get_library_files(int id)
    throws Exception
  {
    return this.boardDao.get_library_files(id);
  }
  
  public void delete_boardFiles(BoardFileVo boardFile_list)
    throws Exception
  {
    this.boardDao.delete_boardFiles(boardFile_list);
  }
  
  public void delete_libraryFiles(LibraryFileVo library_files)
    throws Exception
  {
    this.boardDao.delete_libraryFiles(library_files);
  }

	@Override
	public List<BoardVo> getmainBoard() throws Exception {
		return this.boardDao.getmainBoard();
	}

	@Override
	public List<LibraryVo> getmainLibrary() throws Exception {
		return this.boardDao.getmainLibrary();
	}

	@Override
	public int board_count(PagingVO pagingvo) throws Exception {
		return this.boardDao.board_count(pagingvo);
	}

	@Override
	public int library_count(PagingVO pagingvo) throws Exception {
		return this.boardDao.library_count(pagingvo);
	}

	@Override
	public int board_count(String title, PagingVO pagingvo) throws Exception {
		return this.boardDao.board_count(title, pagingvo);
	}

	@Override
	public int search_count(String title) throws Exception {
		return this.boardDao.search_count(title);
	}

	@Override
	public int search_count_lib(String title) throws Exception {
		return this.boardDao.search_count_lib(title);
	}

	@Override
	public String check_authority(String user_id) throws Exception {
		return boardDao.check_authority(user_id);
	}


	//
	@Override
	public BoardVo get_board_pre(int this_id) throws Exception {
		return boardDao.get_board_pre(this_id);
	}
	@Override
	public BoardVo get_board_next(int this_id) throws Exception {
		return boardDao.get_board_next(this_id);
	}
	@Override
	public LibraryVo get_library_pre(int this_id) throws Exception {
		return boardDao.get_library_pre(this_id);
	}
	@Override
	public LibraryVo get_library_next(int this_id) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.get_library_next(this_id);
	}
}
