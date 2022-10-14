package com.service.unix.mypageDao;

import java.util.List;

import com.service.unix.mypageVo.Criteria;
import com.service.unix.mypageVo.MypageVo;

public interface MypageDao {
	
	public void create(MypageVo mypageVo) throws Exception;
	public MypageVo read(int bid) throws Exception;
	public int update(MypageVo mypageVo) throws Exception;
	public int delete(MypageVo mypagevo) throws Exception;
	public List<MypageVo> getBoardList(String writer) throws Exception;
	public List<MypageVo> listCriteria(Criteria criteria, String writer) throws Exception;
	public int countBoard(String writer) throws Exception;
	
}
