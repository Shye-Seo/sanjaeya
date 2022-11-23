package com.service.unix.boardService;

import com.service.unix.boardVo.BoardFileVo;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryFileVo;
import com.service.unix.boardVo.LibraryVo;
import java.util.List;

public abstract interface BoardService
{
  public abstract void write_board(BoardVo paramBoardVo)
    throws Exception;
  
  public abstract List<BoardVo> board_list()
    throws Exception;
  
  public abstract BoardVo read(int paramInt)
    throws Exception;
  
  public abstract void update(BoardVo paramBoardVo)
    throws Exception;
  
  public abstract void delete(int paramInt)
    throws Exception;
  
  public abstract void write_library(LibraryVo paramLibraryVo)
    throws Exception;
  
  public abstract List<LibraryVo> library_list()
    throws Exception;
  
  public abstract LibraryVo readLibrary(int paramInt)
    throws Exception;
  
  public abstract void updateLibrary(LibraryVo paramLibraryVo)
    throws Exception;
  
  public abstract void deleteLibrary(int paramInt)
    throws Exception;
  
  public abstract void set_boardFile(List<BoardFileVo> paramList)
    throws Exception;
  
  public abstract void set_libraryFile(List<LibraryFileVo> paramList)
    throws Exception;
  
  public abstract int get_board_Id(int paramInt)
    throws Exception;
  
  public abstract List<BoardFileVo> get_board_files(int paramInt)
    throws Exception;
  
  public abstract int get_library_Id(int paramInt)
    throws Exception;
  
  public abstract List<LibraryFileVo> get_library_files(int paramInt)
    throws Exception;
  
  public abstract void delete_boardFiles(BoardFileVo paramBoardFileVo)
    throws Exception;
  
  public abstract void delete_libraryFiles(LibraryFileVo paramLibraryFileVo)
    throws Exception;
}
