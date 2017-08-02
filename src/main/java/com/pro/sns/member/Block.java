package com.pro.sns.member;

public class Block {
	/* 1. block�� �ϸ� ������ ����� ���ܸ�Ͽ��� �����ְ� : select������ member.img, block.target�� �����´�.
	 *  -> block.jsp���� ������� �� ArrayList<Block>���� ����ؼ� �� ����� ������� �Ѵ�.
	 *  -> select sns_member.img, sns_personal_block.target, sns_personal_block.num(���� ��ư�� ������ �� �� ��ȣ��
	 *  ���� �Ǿ�� �Ѵ�)
	 *  
	 * 2. ������ ����� �ۼ��� �Խñ��� ���� �ʴ´� : target�̶� �Ȱ��� writer�� ������ ��� �ش� �Խù��� �������� �ʴ´�.
	 *  -> index���� �ؾ��� ��
	 *   
	 * 3. �����Ҷ� table���� �ִ� num�� ���� �;� �Ѵ�. 
	 */
	
	private int num;
	private String requester;
	private String target;
	private Member member;
	
	public Block(int num, String requester, String target, Member member) {
		super();
		this.num = num;
		this.requester = requester;
		this.target = target;
		this.member = member;
	}

	public Block(int num, String requester, String target) {
		super();
		this.num = num;
		this.requester = requester;
		this.target = target;
	}

	public Block() {
		super();
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getRequester() {
		return requester;
	}

	public void setRequester(String requester) {
		this.requester = requester;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Block [num=" + num + ", requester=" + requester + ", target=" + target + ", member=" + member + "]";
	}
	
	

}
