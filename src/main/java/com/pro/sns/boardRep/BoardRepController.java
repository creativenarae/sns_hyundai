package com.pro.sns.boardRep;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardRepController {
	
	@Resource(name = "boardRepService")
	private BoardRepService brService;
	
	@RequestMapping(value="/boardRep/writeRep.do")
	@ResponseBody
	public BoardRep boardRepInsert(@RequestBody HashMap<String, Object> params) {
		BoardRep boardRep = new BoardRep();
		System.out.println("board_num : "+params.get("board_num"));
//		brService.boardRepInsert(params);
//		String id = params.get("writer").toString();
//		System.out.println("id : "+id);
//		System.out.println(params);
//		int num = brService.boardRepMakeNum();
//		br.setNum(num);
//		brService.boardRepInsert(br);
//		return "redirect:/board/totalListLoginUserOnly.do";
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
