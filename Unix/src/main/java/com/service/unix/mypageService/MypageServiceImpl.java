package com.service.unix.mypageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.unix.mypageDao.MypageDao;
import java.util.List;

import com.service.unix.mypageVo.Criteria;
import com.service.unix.mypageVo.MypageVo;

@Service // 이 객체가 서비스 클래스라는 것을 알려줌 
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDao mypageDao;

	@Override
	public List<MypageVo> getBoardList(String writer) throws Exception {
		// TODO Auto-generated method stub
		return mypageDao.getBoardList(writer);
	}

	@Override
	public void create(MypageVo mypagevo) throws Exception {
		// TODO Auto-generated method stub
		mypageDao.create(mypagevo);
	}

	@Override
	public MypageVo read(Integer bid) throws Exception {
		// TODO Auto-generated method stub
		return mypageDao.read(bid);
	}

	@Override
	public int update(MypageVo mypagevo) throws Exception {
		// TODO Auto-generated method stub
		return mypageDao.update(mypagevo);
	}

	@Override
	public int delete(MypageVo mypagevo) throws Exception {
		// TODO Auto-generated method stub
		return mypageDao.delete(mypagevo);
	}

	@Override
	public int count(String writer) throws Exception {
		// TODO Auto-generated method stub
		return mypageDao.countBoard(writer);
	}

	@Override
	public List<MypageVo> listCriteria(Criteria criteria, String writer) throws Exception {
		// TODO Auto-generated method stub
		return mypageDao.listCriteria(criteria, writer);
	}

}
