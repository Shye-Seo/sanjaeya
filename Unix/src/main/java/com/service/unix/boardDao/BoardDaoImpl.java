package com.service.unix.boardDao;

import com.service.unix.boardVo.BoardFileVo;
import com.service.unix.boardVo.BoardVo;
import com.service.unix.boardVo.LibraryFileVo;
import com.service.unix.boardVo.LibraryVo;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDaoImpl
  implements BoardDao
{
  @Autowired
  private SqlSession sqlsession;
  
  public void write_board(BoardVo boardVo)
    throws Exception
  {
    this.sqlsession.insert("boardMapper.insert", boardVo);
  }
  
  public List<BoardVo> board_list()
    throws Exception
  {
    return this.sqlsession.selectList("boardMapper.board_list");
  }
  
  public BoardVo read(int id)
    throws Exception
  {
    return (BoardVo)this.sqlsession.selectOne("boardMapper.read", Integer.valueOf(id));
  }
  
  public void update(BoardVo boardVo)
    throws Exception
  {
    this.sqlsession.update("boardMapper.update", boardVo);
  }
  
  public void delete(int id)
    throws Exception
  {
    this.sqlsession.delete("boardMapper.delete", Integer.valueOf(id));
  }
  
  public void write_library(LibraryVo libraryVo)
    throws Exception
  {
    this.sqlsession.insert("boardMapper.write_library", libraryVo);
  }
  
  public List<LibraryVo> library_list()
    throws Exception
  {
    return this.sqlsession.selectList("boardMapper.library_list");
  }
  
  public LibraryVo readLibrary(int id)
    throws Exception
  {
    return (LibraryVo)this.sqlsession.selectOne("boardMapper.readLibrary", Integer.valueOf(id));
  }
  
  public void updateLibrary(LibraryVo libraryVo)
    throws Exception
  {
    this.sqlsession.update("boardMapper.updateLibrary", libraryVo);
  }
  
  public void deleteLibrary(int id)
    throws Exception
  {
    this.sqlsession.delete("boardMapper.deleteLibrary", Integer.valueOf(id));
  }
  
  public void set_boardFile(List<BoardFileVo> boardFile_list)
  {
    for (BoardFileVo file : boardFile_list) {
      this.sqlsession.insert("boardMapper.set_boardFile", file);
    }
  }
  
  public void set_libraryFile(List<LibraryFileVo> libraryFile_list)
  {
    for (LibraryFileVo file : libraryFile_list) {
      this.sqlsession.insert("boardMapper.set_libraryFile", file);
    }
  }
  
  public int get_board_Id(int id)
    throws Exception
  {
    return ((Integer)this.sqlsession.selectOne("boardMapper.get_board_Id", Integer.valueOf(id))).intValue();
  }
  
  public List<BoardFileVo> get_board_files(int id)
    throws Exception
  {
    return this.sqlsession.selectList("get_board_files", Integer.valueOf(id));
  }
  
  public int get_library_Id(int id)
    throws Exception
  {
    return ((Integer)this.sqlsession.selectOne("boardMapper.get_library_Id", Integer.valueOf(id))).intValue();
  }
  
  public List<LibraryFileVo> get_library_files(int id)
    throws Exception
  {
    return this.sqlsession.selectList("get_library_files", Integer.valueOf(id));
  }
  
  public void delete_boardFiles(BoardFileVo boardFileVo)
    throws Exception
  {
    this.sqlsession.delete("boardMapper.delete_boardFiles", boardFileVo);
  }
  
  public void delete_libraryFiles(LibraryFileVo libraryFileVo)
    throws Exception
  {
    this.sqlsession.delete("boardMapper.delete_libraryFiles", libraryFileVo);
  }
}
