package com.pro.sns.boardRep;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.pro.sns.board.BoardDaoMapper;

@Component("boardRepService")
public class BoardRepServiceImpl implements BoardRepService{
	
	@Resource(name = "sqlSession")
	private SqlSession  sqlSession;
	
	private BoardDaoMapper dao;
	private BoardRepDaoMapper dao_rep;
	
	@Override
	public ArrayList<BoardRep> boardRepSelectAllLoginUserOnly(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardRep> boardRepSelectAllLoginUserOnly_myBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardRep> boardRepSelectAllNoLoginUserOnly(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void boardRepInsert(BoardRep br) {
		// TODO Auto-generated method stub
		dao_rep = sqlSession.getMapper(BoardRepDaoMapper.class);
		dao_rep.boardRepInsert(br);
		dao_rep.boardRepInsert_backup(br);
	}
	
	@Override
	public void deleteRep(int num) {
		dao_rep = sqlSession.getMapper(BoardRepDaoMapper.class);
		dao_rep.deleteRep(num);
	}
	

	@Override
	public BoardRep selectByRepNum(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		return dao.selectByRepNum(num);
	}
	
	@Override
	public ArrayList<BoardRep> selectRepsByBoardNum(int num) {
		dao_rep = sqlSession.getMapper(BoardRepDaoMapper.class);
		return dao_rep.selectRepsByBoardNum(num);
	}


	

}
