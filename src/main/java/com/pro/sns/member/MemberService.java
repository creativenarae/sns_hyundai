package com.pro.sns.member;

import java.util.ArrayList;

public interface MemberService {
	
	//--------------------�ѹ��̶� �� �޼��� ---------------
	void modifyMember(Member m);
	void memberJoin(Member m);
	boolean idcheck(String id);
	Member getMemberById(String id);//�� �޼��带 ���ؼ� ����Ȯ��, �α��� �Ѵ� �Ҽ� ����
	void outMember(String id);
	
	ArrayList<Block> getMyBlockList(String id);
//	int blockMakeNum();
	void blockInsert(Block b);
	void blockDelete(int num);
	//------------------------------------------------------
	

	ArrayList<Member> getAllMemberForAdmin();//�����ڰ� ��� ȸ������ ���� ���
	
	
	

	
}
