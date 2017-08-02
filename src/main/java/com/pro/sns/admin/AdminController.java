package com.pro.sns.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value = "/admin/allMemberList.do")
	public String allMemberList(){
		return "admin/memberList";
	}
	
	@RequestMapping(value = "/admin/allReportRequestList.do")
	public String allReportRequestList(){
		return "admin/allReportRequest";
	}
	
	@RequestMapping(value = "/admin/banMemberList.do")
	public String banMemberList(){
		return "admin/banMemberList";
	}
}
