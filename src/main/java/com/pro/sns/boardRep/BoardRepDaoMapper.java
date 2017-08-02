package com.pro.sns.boardRep;

import java.util.ArrayList;
import java.util.HashMap;

public interface BoardRepDaoMapper {
	//�α���������� ���� �Ⱦ� ���� ������
	ArrayList<BoardRep> boardRepSelectAllLoginUserOnly(HashMap<String, Object> map); 
	
	//�α���������� ���� �� ���� ������
	ArrayList<BoardRep> boardRepSelectAllLoginUserOnly_myBoard(HashMap<String,Object>map);
	
	//�α��������ʾ�������� ������
	ArrayList<BoardRep> boardRepSelectAllNoLoginUserOnly(int boardNum);
	
	
	void boardRepInsert(BoardRep br);
	void boardRepInsert_backup(BoardRep br);
	void deleteRep(int num);
	ArrayList<BoardRep> selectRepsByBoardNum(int num);
}

