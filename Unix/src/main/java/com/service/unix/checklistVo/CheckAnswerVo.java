package com.service.unix.checklistVo;

import lombok.Data;

@Data
public class CheckAnswerVo {
	
	private int id;
	private int nm_question_id;
	private String contents;
	private int point;
	private int seq;
	private String flag;
	
	

}
