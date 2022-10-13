package com.service.unix.mypageDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.service.unix.mypageVo.MypageVo;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<MypageVo> getBoardList(String writer) throws Exception {
		return sqlsession.selectList("mypage.boardList", writer);
	}

	@Override
	public void create(MypageVo mypageVo) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.insert("mypage.create", mypageVo);
	}

	@Override
	public MypageVo read(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mypage.read");
	}

	@Override
	public int update(MypageVo mypageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.update("mypage.update", mypageVo);
	}

	@Override
	public int delete(MypageVo mypagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.delete("mypage.delete", mypagevo);
	}

	@Override
	public int countBoard() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("mypage.countBoard");
	}
 
}
