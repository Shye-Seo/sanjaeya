package com.service.unix.boardService;

import com.service.unix.boardDao.BoardDao;
import com.service.unix.boardVo.BoardFileVo;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryFileVo;
import com.service.unix.boardVo.LibraryVo;
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
  
  public List<BoardVo> board_list()
    throws Exception
  {
    return this.boardDao.board_list();
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
  
  public List<LibraryVo> library_list()
    throws Exception
  {
    return this.boardDao.library_list();
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
}
