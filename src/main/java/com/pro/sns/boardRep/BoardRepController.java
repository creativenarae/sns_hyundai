package com.pro.sns.boardRep;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.sns.member.Member;

@Controller
public class BoardRepController {
	
	@Resource(name = "boardRepService")
	private BoardRepService brService;
	
	@RequestMapping(value="/boardRep/writeRep.do", method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public BoardRep boardRepInsert(@RequestBody Map<String, Object> params, HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		int rep_num = brService.boardRepMakeNum();
		int board_num = Integer.parseInt(params.get("board_num").toString());
		int rep_type = Integer.parseInt(params.get("rep_type").toString());
		String content = params.get("content").toString();
		
		BoardRep boardRep = new BoardRep();
		boardRep.setNum(rep_num);
		boardRep.setBoard_num(board_num);
		boardRep.setContent(content);
		boardRep.setWriter(id);
		boardRep.setType(rep_type);
		
		brService.boardRepInsert(boardRep);
		System.out.println("insert boardRep : "+boardRep);
		return boardRep;
	}
	
	@RequestMapping(value="/boardRep/deleteRep.do", method=RequestMethod.POST,produces="application/json")
	@ResponseBody
	public ArrayList<BoardRep> deleteRep(@RequestBody Map<String, Object> params) {
		ArrayList<BoardRep> boardReps = new ArrayList<BoardRep>();
		
		int rep_num = Integer.parseInt(params.get("rep_num").toString());
		System.out.println("rep_num : "+rep_num);
		int board_num = Integer.parseInt(params.get("board_num").toString());
		
		boardReps = brService.selectRepsByBoardNum(board_num);
		System.out.println("boardReps before delete : "+boardReps);
		
		brService.deleteRep(rep_num);
		
		boardReps = brService.selectRepsByBoardNum(board_num);
		System.out.println("boardReps after delete : "+boardReps);
		
		return boardReps;
		
	}
	
	

}
