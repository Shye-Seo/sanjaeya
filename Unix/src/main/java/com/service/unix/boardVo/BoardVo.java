package com.service.unix.boardVo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVo
{
  private int id;
  private String title;
  private String content;
  private String writer;
  private Date date;
  
}
