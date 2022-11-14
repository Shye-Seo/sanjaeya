package com.service.unix.checklistController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.unix.checklistService.ChecklistService;
import com.service.unix.checklistVo.CheckAnswerVo;
import com.service.unix.checklistVo.CheckCategoryVo;
import com.service.unix.checklistVo.CheckQuestionVo;


@Controller
public class ChecklistController {
	
	@Autowired
	ChecklistService checkService;
	
	//체크리스트 시작 화면(과로, 뇌, 심장)
	@RequestMapping("Checklist_s1")
	public String checklistCategory_1(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();	
		model.addAttribute("category", checkCategory);	
				
		return "diagnosis_start_1";
	}
	
	//체크리스트 시작 화면(직업성 암)
	@RequestMapping("Checklist_s2")
	public String checklistCategory_2(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();	
		model.addAttribute("category", checkCategory);	
				
		return "diagnosis_start_2";
	}
	
	//체크리스트 시작 화면(근골격계 질환)
	@RequestMapping("Checklist_s3")
	public String checklistCategory_3(CheckCategoryVo categoryVo, Model model) {
		
		List<CheckCategoryVo> checkCategory =checkService.categoryName();	
		model.addAttribute("category", checkCategory);	
				
		return "diagnosis_start_3";
	}

	//체크리스트 진단 화면_1(과로, 뇌, 심장)
	   @RequestMapping("Checklist_1")
	public String checklist_1(CheckCategoryVo categoryVo, CheckAnswerVo answerVo, Model model) {
	      int categoryNum = 1;

	      //카테고리 값 전체 
	      List<CheckCategoryVo> checkCategory = checkService.categoryName();
	      model.addAttribute("category", checkCategory);
	      //질문 값 전체
	      List<CheckQuestionVo> checkQuestion = checkService.questionName(categoryNum);
	      model.addAttribute("question", checkQuestion);
	      
	      List<String> questionContents = checkService.selectQuestionContents(categoryNum);
	      model.addAttribute("questionContents", questionContents);
	      
	      //답변 값 전체
	      List<CheckAnswerVo> checkAnswer1 = checkService.answerName(1);
	      model.addAttribute("answer1", checkAnswer1);
	      List<CheckAnswerVo> checkAnswer2 = checkService.answerName(2);
	      model.addAttribute("answer2", checkAnswer2);
	      List<CheckAnswerVo> checkAnswer3 = checkService.answerName(3);
	      model.addAttribute("answer3", checkAnswer3);
	      List<CheckAnswerVo> checkAnswer4 = checkService.answerName(4);
	      model.addAttribute("answer4", checkAnswer4);
	      List<CheckAnswerVo> checkAnswer5 = checkService.answerName(5);
	      model.addAttribute("answer5", checkAnswer5);
	      List<CheckAnswerVo> checkAnswer6 = checkService.answerName(6);
	      model.addAttribute("answer6", checkAnswer6);
	      List<CheckAnswerVo> checkAnswer7 = checkService.answerName(7);
	      model.addAttribute("answer7", checkAnswer7);
	      List<CheckAnswerVo> checkAnswer8 = checkService.answerName(8);
	      model.addAttribute("answer8", checkAnswer8);
	      List<CheckAnswerVo> checkAnswer9 = checkService.answerName(9);
	      model.addAttribute("answer9", checkAnswer9);
	      List<CheckAnswerVo> checkAnswer10 = checkService.answerName(10);
	      model.addAttribute("answer10", checkAnswer10);
	      List<CheckAnswerVo> checkAnswer11 = checkService.answerName(11);
	      model.addAttribute("answer11", checkAnswer11);
	      List<CheckAnswerVo> checkAnswer12 = checkService.answerName(12);
	      model.addAttribute("answer12", checkAnswer12);
	      List<CheckAnswerVo> checkAnswer13 = checkService.answerName(13);
	      model.addAttribute("answer13", checkAnswer13);
	      List<CheckAnswerVo> checkAnswer14 = checkService.answerName(14);
	      model.addAttribute("answer14", checkAnswer14);
	      List<CheckAnswerVo> checkAnswer15 = checkService.answerName(15);
	      model.addAttribute("answer15", checkAnswer15);
	      List<CheckAnswerVo> checkAnswer16 = checkService.answerName(16);
	      model.addAttribute("answer16", checkAnswer16);
	      List<CheckAnswerVo> checkAnswer17 = checkService.answerName(17);
	      model.addAttribute("answer17", checkAnswer17);

	      return "diagnosis_1";
	   }

	// 체크리스트 진단 화면_1(과로, 뇌, 심장)
	   @RequestMapping("Checklist_1_cal")
	public String checklist_1_cal(Model model, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		   int categoryNum = 1;
		   model.addAttribute("categoryNum", categoryNum);
		  List<String[]> answerArrayList = new ArrayList<String[]>();
		  
		  List<String[]> answerlist11 = new ArrayList<String[]>();
		  answerlist11.add(req.getParameterValues("answerList"+11));
		  List<String[]> answerlist17 = new ArrayList<String[]>();
		  answerlist17.add(req.getParameterValues("answerList"+17));
		  
	      //JSP에서 받은 답변 id 값
	      answerArrayList.add(req.getParameterValues("answerList"+1));
	      answerArrayList.add(req.getParameterValues("answerList"+2));
	      answerArrayList.add(req.getParameterValues("answerList"+3));
	      answerArrayList.add(req.getParameterValues("answerList"+4));
	      answerArrayList.add(req.getParameterValues("answerList"+5));
	      answerArrayList.add(req.getParameterValues("answerList"+6));
	      answerArrayList.add(req.getParameterValues("answerList"+7));
	      answerArrayList.add(req.getParameterValues("answerList"+8));
	      answerArrayList.add(req.getParameterValues("answerList"+9));
	      answerArrayList.add(req.getParameterValues("answerList"+10));
	      answerArrayList.add(req.getParameterValues("answerList"+11));
	      answerArrayList.add(req.getParameterValues("answerList"+12));
	      answerArrayList.add(req.getParameterValues("answerList"+13));
	      answerArrayList.add(req.getParameterValues("answerList"+14));
	      answerArrayList.add(req.getParameterValues("answerList"+15));
	      answerArrayList.add(req.getParameterValues("answerList"+16));
	      answerArrayList.add(req.getParameterValues("answerList"+17));
	      
	      
	      List<Integer> pointList = new ArrayList<Integer>();
	      
	      HashMap<String, Object> map = new HashMap<>();
	      
	      int test_userid = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	      
			
	      String user_id = (String) session.getAttribute("user_id");
	      int id =0;
	      int pointSum = 0;
	      double pointper =0;
	      int ques_num = 0;
	      
	      //insert 
	      
	      for(int i=0; i<answerArrayList.size(); i++) {
	    	  ques_num++;
	    	  String[] stringarray = answerArrayList.get(i);
	    	  if(i==10) {
	    		  for(int j=0; j<answerlist11.size(); j++) {
	    			  for(int num=0; num<stringarray.length; num++) {         
	 			         String pointStr = stringarray[num];
	 			         int pointInt = Integer.parseInt(pointStr);	         
	 			         pointList.addAll(checkService.selectAnswerPoint(pointInt));
	 			         map.put("category_number", categoryNum);
	 			         map.put("question_number", ques_num);
	 			         if(user_id != null ) {
	 			        	id = (int) session.getAttribute("id");
	 			        	 map.put("user_id", id);
	 			         } else if(user_id == null) {
	 			        	map.put("test_userid", test_userid);
	 			         }
	 			         map.put("answer_number", pointInt);
	 			         checkService.insertTestUser(map);
	 			         
	 			      }
	    		  }
	    	  } else if(i==16) {
	    		  for(int j=0; j<answerlist17.size(); j++) {
	    			  for(int num=0; num<stringarray.length; num++) {         
	 			         String pointStr = stringarray[num];
	 			         int pointInt = Integer.parseInt(pointStr);	         
	 			         pointList.addAll(checkService.selectAnswerPoint(pointInt));
	 			         map.put("category_number", categoryNum);
	 			         map.put("question_number", ques_num);
	 			         if(user_id != null) {
	 			        	id = (int) session.getAttribute("id");
	 			        	 map.put("user_id", id);
	 			         } else if(user_id == null) {
	 			        	map.put("test_userid", test_userid);
	 			         }
	 			         map.put("answer_number", pointInt);
	 			         checkService.insertTestUser(map);
	 			         
	 			      }
	    		  }
	    	  } else {
	    		  for(int num=0; num<stringarray.length; num++) {         
				         String pointStr = stringarray[num];
				         int pointInt = Integer.parseInt(pointStr);	         
				         pointList.addAll(checkService.selectAnswerPoint(pointInt));
				         map.put("category_number", categoryNum);
				         map.put("question_number", ques_num);
	 			         if(user_id != null) {
	 			        	id = (int) session.getAttribute("id");
	 			        	 map.put("user_id", id);
	 			         } else if(user_id == null) {
	 			        	map.put("test_userid", test_userid);
	 			         }
				         map.put("answer_number", pointInt);
				         checkService.insertTestUser(map);
				         
				      }
	    	  }
	    	  
	      }
	      
	      for(int pointnum=0; pointnum<pointList.size(); pointnum++) {
	         pointSum = pointSum  + pointList.get(pointnum);
	      }
	      
    	  pointper = (((double)pointSum/(double)80) * 100);
    	  String pointper2 = String.format("%.2f", pointper);
    	  model.addAttribute("test_userid", test_userid);
    	  
	      if(0<=pointSum && pointSum<=29) {
	    	  System.out.println("매우낮음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "매우낮음");
	      } else if(30<=pointSum && pointSum<=44){
	    	  System.out.println("낮음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "낮음");
	      } else if(45<=pointSum && pointSum<=59) {
	    	  System.out.println("보통");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "보통");
	      } else if(60<=pointSum && pointSum<=74) {
	    	  System.out.println("높음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "높음");
	      } else if(75<=pointSum) {
	    	  System.out.println("매우높음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "매우높음");
	      }
	      
	      System.out.println("pointper"+pointper);
	      return "diagnosis_result";
	   }
	
	//체크리스트 진단 화면_2(직업성 암)
	@RequestMapping("Checklist_2")
	public String checklist_2(CheckCategoryVo categoryVo, CheckAnswerVo answerVo, Model model) {
		int categoryNum = 2;
		
		//카테고리 값 전체 
	      List<CheckCategoryVo> checkCategory = checkService.categoryName();
	      model.addAttribute("category", checkCategory);
	      //질문 값 전체
	      List<CheckQuestionVo> checkQuestion = checkService.questionName(categoryNum);
	      model.addAttribute("question", checkQuestion);
	      
	      List<String> questionContents = checkService.selectQuestionContents(categoryNum);
	      model.addAttribute("questionContents", questionContents);
	      
	      //답변 값 전체
	      List<CheckAnswerVo> checkAnswer1 = checkService.answerName(18);
	      model.addAttribute("answer1", checkAnswer1);
	      List<CheckAnswerVo> checkAnswer2 = checkService.answerName(29);
	      model.addAttribute("answer2", checkAnswer2);
	      List<CheckAnswerVo> checkAnswer3 = checkService.answerName(19);
	      model.addAttribute("answer3", checkAnswer3);
	      List<CheckAnswerVo> checkAnswer4 = checkService.answerName(20);
	      model.addAttribute("answer4", checkAnswer4);
	      List<CheckAnswerVo> checkAnswer5 = checkService.answerName(21);
	      model.addAttribute("answer5", checkAnswer5);
	      List<CheckAnswerVo> checkAnswer6 = checkService.answerName(22);
	      model.addAttribute("answer6", checkAnswer6);
	      List<CheckAnswerVo> checkAnswer7 = checkService.answerName(23);
	      model.addAttribute("answer7", checkAnswer7);
	      List<CheckAnswerVo> checkAnswer8 = checkService.answerName(24);
	      model.addAttribute("answer8", checkAnswer8);
	      List<CheckAnswerVo> checkAnswer9 = checkService.answerName(25);
	      model.addAttribute("answer9", checkAnswer9);
	      List<CheckAnswerVo> checkAnswer10 = checkService.answerName(26);
	      model.addAttribute("answer10", checkAnswer10);
	      List<CheckAnswerVo> checkAnswer11 = checkService.answerName(27);
	      model.addAttribute("answer11", checkAnswer11);
	      List<CheckAnswerVo> checkAnswer12 = checkService.answerName(28);
	      model.addAttribute("answer12", checkAnswer12);
	
				
		return "diagnosis_2";
	}
	
	// 체크리스트 진단 화면)_2(직업성 암)
	   @RequestMapping("Checklist_2_cal")
	public String checklist_2_cal(Model model, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		  int categoryNum = 2;
		  model.addAttribute("categoryNum", categoryNum);
		  List<String[]> answerArrayList = new ArrayList<String[]>();
		  
	      //JSP에서 받은 답변 id 값
	      answerArrayList.add(req.getParameterValues("answerList"+1));
	      answerArrayList.add(req.getParameterValues("answerList"+2));
	      answerArrayList.add(req.getParameterValues("answerList"+3));
	      answerArrayList.add(req.getParameterValues("answerList"+4));
	      answerArrayList.add(req.getParameterValues("answerList"+5));
	      answerArrayList.add(req.getParameterValues("answerList"+6));
	      answerArrayList.add(req.getParameterValues("answerList"+7));
	      answerArrayList.add(req.getParameterValues("answerList"+8));
	      answerArrayList.add(req.getParameterValues("answerList"+9));
	      answerArrayList.add(req.getParameterValues("answerList"+10));
	      answerArrayList.add(req.getParameterValues("answerList"+11));
	      answerArrayList.add(req.getParameterValues("answerList"+12));

			List<Integer> pointList = new ArrayList<Integer>();

			HashMap<String, Object> map = new HashMap<>();

			int test_userid = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
			String user_id = (String) session.getAttribute("user_id");
			int id = 0;
			int pointSum = 0;
			double pointper = 0;
			int ques_num = 17;

			for (int i = 0; i < answerArrayList.size(); i++) {
				ques_num++;
				String[] stringarray = answerArrayList.get(i);
				for (int num = 0; num < stringarray.length; num++) {
					String pointStr = stringarray[num];
					int pointInt = Integer.parseInt(pointStr);	         
			         pointList.addAll(checkService.selectAnswerPoint(pointInt));
			         map.put("category_number", categoryNum);
			         map.put("question_number", ques_num);
 			         if(user_id != null) {
 			        	 id = (int) session.getAttribute("id");
 			        	 map.put("user_id", id);
 			         } else if(user_id == null) {
 			        	map.put("test_userid", test_userid);
 			         }
			         map.put("answer_number", pointInt);
			         checkService.insertTestUser(map);
			      }
	      }
	      
	      for(int pointnum=0; pointnum<pointList.size(); pointnum++) {
	         pointSum = pointSum  + pointList.get(pointnum);
	      }
	      
 	  pointper = (((double)pointSum/(double)80) * 100);
 	  String pointper2 = String.format("%.2f", pointper);
 	 model.addAttribute("test_userid", test_userid);
 	  
	      if(0<=pointSum && pointSum<=29) {
	    	  System.out.println("매우낮음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "매우낮음");
	      } else if(30<=pointSum && pointSum<=44){
	    	  System.out.println("낮음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "낮음");
	      } else if(45<=pointSum && pointSum<=59) {
	    	  System.out.println("보통");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "보통");
	      } else if(60<=pointSum && pointSum<=74) {
	    	  System.out.println("높음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "높음");
	      } else if(75<=pointSum) {
	    	  System.out.println("매우높음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "매우높음");
	      }
	      
	      return "diagnosis_result";
	   }
	
	//체크리스트 진단 화면_3(근골격계 질환)
	@RequestMapping("Checklist_3")
	public String checklist_3(CheckCategoryVo categoryVo, CheckAnswerVo answerVo, Model model) {
		int categoryNum = 3;
		//카테고리 값 전체 
	      List<CheckCategoryVo> checkCategory = checkService.categoryName();
	      model.addAttribute("category", checkCategory);
	      //질문 값 전체
	      List<CheckQuestionVo> checkQuestion = checkService.questionName(categoryNum);
	      model.addAttribute("question", checkQuestion);
	      
	      List<String> questionContents = checkService.selectQuestionContents(categoryNum);
	      model.addAttribute("questionContents", questionContents);
	      
	      //답변 값 전체
	      List<CheckAnswerVo> checkAnswer1 = checkService.answerName(31);
	      model.addAttribute("answer1", checkAnswer1);
	      List<CheckAnswerVo> checkAnswer2 = checkService.answerName(40);
	      model.addAttribute("answer2", checkAnswer2);
	      List<CheckAnswerVo> checkAnswer3 = checkService.answerName(30);
	      model.addAttribute("answer3", checkAnswer3);
	      List<CheckAnswerVo> checkAnswer4 = checkService.answerName(32);
	      model.addAttribute("answer4", checkAnswer4);
	      List<CheckAnswerVo> checkAnswer5 = checkService.answerName(33);
	      model.addAttribute("answer5", checkAnswer5);
	      List<CheckAnswerVo> checkAnswer6 = checkService.answerName(34);
	      model.addAttribute("answer6", checkAnswer6);
	      List<CheckAnswerVo> checkAnswer7 = checkService.answerName(35);
	      model.addAttribute("answer7", checkAnswer7);
	      List<CheckAnswerVo> checkAnswer8 = checkService.answerName(36);
	      model.addAttribute("answer8", checkAnswer8);
	      List<CheckAnswerVo> checkAnswer9 = checkService.answerName(37);
	      model.addAttribute("answer9", checkAnswer9);
	      List<CheckAnswerVo> checkAnswer10 = checkService.answerName(38);
	      model.addAttribute("answer10", checkAnswer10);
	      List<CheckAnswerVo> checkAnswer11 = checkService.answerName(39);
	      model.addAttribute("answer11", checkAnswer11);
	      List<CheckAnswerVo> checkAnswer12 = checkService.answerName(41);
	      model.addAttribute("answer12", checkAnswer12);
	      List<CheckAnswerVo> checkAnswer13 = checkService.answerName(42);
	      model.addAttribute("answer13", checkAnswer13);
	      List<CheckAnswerVo> checkAnswer14 = checkService.answerName(43);
	      model.addAttribute("answer14", checkAnswer14);
	      List<CheckAnswerVo> checkAnswer15 = checkService.answerName(44);
	      model.addAttribute("answer15", checkAnswer15);
				
		return "diagnosis_3";
	}
	
	// 체크리스트 진단 화면_3(근골격계 질환)
	   @RequestMapping("Checklist_3_cal")
	public String checklist_3_cal(Model model, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		   int categoryNum = 3;
		   model.addAttribute("categoryNum", categoryNum);
		  List<String[]> answerArrayList = new ArrayList<String[]>();
		  
		  List<String[]> answerlist13 = new ArrayList<String[]>();
		  answerlist13.add(req.getParameterValues("answerList"+13));
		  
	      //JSP에서 받은 답변 id 값
	      answerArrayList.add(req.getParameterValues("answerList"+1));
	      answerArrayList.add(req.getParameterValues("answerList"+2));
	      answerArrayList.add(req.getParameterValues("answerList"+3));
	      answerArrayList.add(req.getParameterValues("answerList"+4));
	      answerArrayList.add(req.getParameterValues("answerList"+5));
	      answerArrayList.add(req.getParameterValues("answerList"+6));
	      answerArrayList.add(req.getParameterValues("answerList"+7));
	      answerArrayList.add(req.getParameterValues("answerList"+8));
	      answerArrayList.add(req.getParameterValues("answerList"+9));
	      answerArrayList.add(req.getParameterValues("answerList"+10));
	      answerArrayList.add(req.getParameterValues("answerList"+11));
	      answerArrayList.add(req.getParameterValues("answerList"+12));
	      answerArrayList.add(req.getParameterValues("answerList"+13));
	      answerArrayList.add(req.getParameterValues("answerList"+14));
	      answerArrayList.add(req.getParameterValues("answerList"+15));
	      
	

			List<Integer> pointList = new ArrayList<Integer>();

			HashMap<String, Object> map = new HashMap<>();

			int test_userid = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
		    String user_id = (String) session.getAttribute("user_id");
			int id = 0;
			int pointSum = 0;
			double pointper = 0;
			int ques_num = 29;

			// insert

			for (int i = 0; i < answerArrayList.size(); i++) {
				ques_num++;
				String[] stringarray = answerArrayList.get(i);
				if(i==12) {
		    		  for(int j=0; j<answerlist13.size(); j++) {
		    			  for(int num=0; num<stringarray.length; num++) {         
		 			         String pointStr = stringarray[num];
		 			         int pointInt = Integer.parseInt(pointStr);	         
		 			         pointList.addAll(checkService.selectAnswerPoint(pointInt));
		 			         map.put("category_number", categoryNum);
		 			         map.put("question_number", ques_num);
		 			         if(user_id != null ) {
		 			        	 id = (int) session.getAttribute("id");
		 			        	 map.put("user_id", id);
		 			         } else if(user_id == null) {
		 			        	map.put("test_userid", test_userid);
		 			         }
		 			         map.put("answer_number", pointInt);
		 			         checkService.insertTestUser(map);
		 			         
		 			      }
		    		  }
		    	  } else {
		    		  for(int num=0; num<stringarray.length; num++) {         
					         String pointStr = stringarray[num];
					         int pointInt = Integer.parseInt(pointStr);	         
					         pointList.addAll(checkService.selectAnswerPoint(pointInt));
					         map.put("category_number", categoryNum);
					         map.put("question_number", ques_num);
		 			         if(user_id != null) {
		 			        	 id = (int) session.getAttribute("id");
		 			        	 map.put("user_id", id);
		 			         } else if(user_id == null) {
		 			        	map.put("test_userid", test_userid);
		 			         }
					         map.put("answer_number", pointInt);
					         checkService.insertTestUser(map);
					         
					      }
		    	  }
	      }
	      
	      for(int pointnum=0; pointnum<pointList.size(); pointnum++) {
	         pointSum = pointSum  + pointList.get(pointnum);
	      }
	      
 	      pointper = (((double)pointSum/(double)80) * 100);
 	      String pointper2 = String.format("%.2f", pointper);
 	      model.addAttribute("test_userid", test_userid);
 	     
	      if(0<=pointSum && pointSum<=29) {
	    	  System.out.println("매우낮음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "매우낮음");
	      } else if(30<=pointSum && pointSum<=44){
	    	  System.out.println("낮음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "낮음");
	      } else if(45<=pointSum && pointSum<=59) {
	    	  System.out.println("보통");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "보통");
	      } else if(60<=pointSum && pointSum<=74) {
	    	  System.out.println("높음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "높음");
	      } else if(75<=pointSum) {
	    	  System.out.println("매우높음");
	    	  model.addAttribute("ResultPoint", pointSum);
	    	  model.addAttribute("pointPer", pointper2);
	    	  model.addAttribute("Result", "매우높음");
	      }
	      
	      System.out.println("pointper"+pointper);
	      return "diagnosis_result";
	   }


}
