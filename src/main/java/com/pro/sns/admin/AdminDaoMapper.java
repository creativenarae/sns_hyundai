package com.pro.sns.admin;

import java.util.ArrayList;

import com.pro.sns.member.Member;

public interface AdminDaoMapper {
	/**
	 * ��� ȸ�� ���� ���� AdminController�ʿ��� ȣ��ɵ�
	 * @return
	 */
	ArrayList<Member> selectAllMember();
}
