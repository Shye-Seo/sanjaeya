package com.service.unix.boardVo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFileVo
{
  private int id;
  private int board_id;
  private String address;
  private Date date;
  
  public BoardFileVo(int id, String fileName)
  {
    this.board_id = id;
    this.address = fileName;
  }
  
  public BoardFileVo() {}
}
