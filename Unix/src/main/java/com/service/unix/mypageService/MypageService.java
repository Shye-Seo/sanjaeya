package com.service.unix.mypageService;

import java.util.List;

import com.service.unix.mypageVo.Criteria;
import com.service.unix.mypageVo.MypageVo;

public interface MypageService {

	
	public List<MypageVo> getBoardList(String writer) throws Exception;
	public void create(MypageVo mypagevo) throws Exception;
	public MypageVo read(Integer bid) throws Exception;
	public int update(MypageVo mypagevo) throws Exception;
	public int delete(MypageVo mypagevo) throws Exception;
	public int count(String writer) throws Exception;
	public List<MypageVo> listCriteria(Criteria criteria, String writer) throws Exception;
}
