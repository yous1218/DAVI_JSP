package com.davi.app.board.cheat;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardCheatDAO;
import com.davi.app.board.vo.BoardCheatVO;

public class BoardCheatWriteOkAcrion implements Action{
 
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BoardCheatVO bvo = new BoardCheatVO();
		BoardCheatDAO bdao = new BoardCheatDAO();
		
		ActionForward forward = null;	
		
		String searchWord = req.getParameter("searchWord");
		System.out.println(searchWord);
		String searchWordChange = URLEncoder.encode(searchWord, "UTF-8");
		
		bvo.setCheatHead(req.getParameter("cheatHead"));
		bvo.setMemberId(req.getParameter("memberId"));
		bvo.setCheatTitle(req.getParameter("cheatTitle"));
		bvo.setCheatContent(req.getParameter("cheatContent"));
		System.out.println(req.getParameter("memberId"));
		
		if(bdao.boardCheatWrite(bvo)) {
			//등록성공
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/cheatList.bo?searchWord=" + searchWordChange);
		}		
		
		return forward;		
	}
}
