package com.service.unix.checklistVo;

import lombok.Data;

@Data
public class CheckQuestionVo {
	
	private int id;
	private int nm_category_id;
	private String contents;
	private int seq;
	private int weight;
	private int multiple;
	private String flag;
	
	

}
