package com.pro.sns.board;

import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.pro.sns.boardRep.BoardRep;
import com.pro.sns.boardRep.BoardRepDaoMapper;

@Component("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name = "sqlSession")
	private SqlSession  sqlSession;
	
	private BoardDaoMapper dao;
	private BoardRepDaoMapper dao_rep;

	@Override
	public ArrayList<BoardTotal> getAllBoardLoginUserOnly(String id) {
		/**
		 * �� �޼���� Ư������ڰ� �α��������� �� ����ڿ� �´� �������� ��� �Խù��� ����� ������ش�
		 * �Խù� ����
		 * 1. ���� ģ���̸鼭 ������� �ƴ� ��� ��(ģ��,��ü����)
		 * 2. ���� ģ���� �ƴϸ鼭 ������� �����ϰ�, ģ�������� ������ ��ü��(type�� 2��)�͸� �����ش�(���� ���ڽŰ� ģ���� �ƴϹǷ� ���� ������)
		 * 3. �׸��� ���� ���۱��� �����ؾ��Ѵ�
		 * 4. ���� ������ ����� �Խù��� �����Ѵ�
		 * ��� ����
		 * 5. �Խù��� �ۼ���(writer)�� ��Ʈ�ѷ����� �޾ƿ� ����id���� ��ġ�Ѵٸ� (�����̶��) boardRepSelectAllLoginUserOnly_myBoard ȣ��
		 *   �׷��� �ʴٸ� boardRepSelectAllLoginUserOnly ȣ��
		 */
		System.out.println("����id�� : " + id);
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		dao_rep = sqlSession.getMapper(BoardRepDaoMapper.class);
		
		//�Խù��� ȸ���������Ϻ�(�������̹���)�� ��� ���� �޾��� ArrayList
		ArrayList<BoardTotal> totalList = new ArrayList<BoardTotal>();
		
		BoardTotal boardTotal;
		
		ArrayList<Board> boardList = dao.boardSelectAllLoginUserOnly(id);//Member�� Board���� �������
		
		System.out.println(boardList);
		ArrayList<BoardRep> boardRepList_my;
		ArrayList<BoardRep> boardRepList;
		
		for(int i = 0; i < boardList.size(); i ++){
			Board b = boardList.get(i);
			
			//�Խù��� ���ǿ� �°� �޾ƿ�����, ���߿��� �Խù��� ���� �� ������ �ƴ����� ���� �������� ����� �޶������� 
			if(b.getWriter().equals(id)){//�ۼ��ڰ� ��Ʈ�ѷ����� �޾ƿ� ��������(id)�� ��ġ�Ѵٸ� ���� �� ����
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("num", b.getNum());
				map.put("writer", b.getWriter());
				boardRepList_my = dao_rep.boardRepSelectAllLoginUserOnly_myBoard(map);
				boardTotal = new BoardTotal(b, boardRepList_my);
				System.out.println(boardTotal);
				
			}else{//������ �ƴ�
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("num", b.getNum());
				map.put("writer", b.getWriter());
				boardRepList = dao_rep.boardRepSelectAllLoginUserOnly(map);
				boardTotal = new BoardTotal(b, boardRepList);
				System.out.println(boardTotal);
			}
			totalList.add(boardTotal);
		}
		return totalList;
	}

	@Override
	public ArrayList<BoardTotal> getAllBoardNoLoginUserOnly() {
		// TODO Auto-generated method stub
		//�Խù��� ��� ���� �޾��� arraylist
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		dao_rep = sqlSession.getMapper(BoardRepDaoMapper.class);
		System.out.println("��ȸ�� ���ӽ� getAllBoardNoLoginUserOnly �޼��� ȣ��!");
		//�Խù��� ȸ���������Ϻ�(�������̹���)�� ��� ���� �޾��� ArrayList
		BoardTotal boardTotal;
		ArrayList<BoardRep> boardRepList;
		ArrayList<BoardTotal> totalList = new ArrayList<BoardTotal>();
//		totalList = boardTotal(board + boardRepList);
		
		ArrayList<Board> boardList = dao.boardSelectAllNoLoginUserOnly();//�������
		
		System.out.println(boardList);
		System.out.println(boardList.size());
			
		
		for(int i = 0; i < boardList.size(); i ++){
			Board board = boardList.get(i);
			boardRepList = dao_rep.boardRepSelectAllNoLoginUserOnly(board.getNum());
			boardTotal = new BoardTotal(board, boardRepList);
			System.out.println(boardTotal);
			totalList.add(boardTotal);
		}
		return totalList;
	}

	@Override
	public int boardMakeNum() {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		return dao.boardMakeNum();
	}

	@Override
	public void boardInsert(Board b) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		dao.boardInsert(b);
		dao.boardInsert_backup(b);
	}
	
	//------------------------------------------------------  07.28
	
	@Override
	public Board selectByNum(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		return dao.selectByNum(num);
	}

	@Override
	public Board selectById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteBoardByNum(int num) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		dao.deleteBoardByNum(num);
	}

	@Override
	public void boardUpdate(Board b) {
		// TODO Auto-generated method stub
		dao = sqlSession.getMapper(BoardDaoMapper.class);
		dao.boardUpdate(b);
		dao.boardUpdate_backup(b);
	}


}
