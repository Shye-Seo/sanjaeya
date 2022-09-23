package com.service.unix.checklistVo;

import java.util.Date;

import lombok.Data;

@Data
public class CheckQuestionVo {
	
	private int id;
	private int nm_category_id;
	private String contents;
	private int seq;
	private int weight;
	private String flag;
	
	

}
