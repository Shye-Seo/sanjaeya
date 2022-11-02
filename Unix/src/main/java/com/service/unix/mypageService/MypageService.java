package com.service.unix.mypageService;

import java.util.HashMap;
import java.util.List;

import com.service.unix.mypageVo.Criteria;
import com.service.unix.mypageVo.MypageVo;

public interface MypageService {

	public void create(MypageVo mypagevo) throws Exception;
	public MypageVo read(int id) throws Exception;
	public int update(int id) throws Exception;
	public int delete(MypageVo mypagevo) throws Exception;
	public int count(String writer) throws Exception;
	public List<MypageVo> listCriteria(HashMap<String, Object> map) throws Exception;
}
