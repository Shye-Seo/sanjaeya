package com.service.unix.boardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.unix.boardDao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao boardDao;

}
