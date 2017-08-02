package com.pro.sns.member;

import java.util.ArrayList;

public interface MemberDaoMapper {
	//-----------�� �ȿ� �ִ� �޼������ �ѹ��̻� ȣ��Ǽ� ���̰� ����---------------------
	void memberInsert(Member m);// ȸ������
	//-----------�� �ȿ� �ִ� �޼������ �ѹ��̻� ȣ��Ǽ� ���̰� ����---------------------
	Member selectMember(String id);// ���̵�� �˻��Ѵ�. �α���, ���̵��ߺ�üũ, ����������.. 
	void deleteMember(String id);//Ż��
	void updateMember(Member m);//��������
	ArrayList<Member> selectAllMember();
	
	ArrayList<Block> myBlockList(String id); //�ش��ϴ� ���̵� ���ؼ�(request) target�� �����;��Ѵ�
//	int blockMakeNum();
	void blockInsert(Block b); //block�� �ϴ� �޼���
	void blockDelete(int num); //block�� �������ִ� �޼���
}
