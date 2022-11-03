package com.service.unix.mypageDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.service.unix.mypageVo.Criteria;
import com.service.unix.mypageVo.MypageVo;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void create(MypageVo mypageVo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert("mypage.create", mypageVo);
	}

	@Override
	public MypageVo read(int id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mypage.read", id);
	}

	@Override
	public int update(MypageVo mypagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update("mypage.update", mypagevo);
	}

	@Override
	public int delete(MypageVo mypagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete("mypage.delete", mypagevo);
	}

	@Override
	public int countBoard(String writer) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mypage.countBoard", writer);
	} 

	@Override
	public List<MypageVo> listCriteria(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		return sqlsession.selectList("mypage.listCriteria", map);
	}
 
}
