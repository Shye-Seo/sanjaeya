package com.service.unix.boardVo;

import java.util.Date;

import lombok.Data;

@Data
public class LibraryFileVo
{
  private int id;
  private int library_id;
  private String address;
  private Date date;
  
  public LibraryFileVo(int id, String fileName)
  {
    this.library_id = id;
    this.address = fileName;
  }
  
  public LibraryFileVo() {}
}
