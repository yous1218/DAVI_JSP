package com.davi.app.board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardFreeDAO;
import com.davi.app.board.vo.BoardFreeVO;

public class BoardFreeWriteOkAcrion implements Action{
 
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		BoardFreeVO bvo = new BoardFreeVO();
		BoardFreeDAO bdao = new BoardFreeDAO();
		
		ActionForward forward = null;	
		
		
		bvo.setFreeHead(req.getParameter("freeHead"));
		bvo.setMemberId(req.getParameter("memberId"));
		bvo.setFreeTitle(req.getParameter("freeTitle"));
		bvo.setFreeContent(req.getParameter("freeContent"));
		
		if(req.getParameter("freeHead").equals("공지")) {
			bvo.setFreeNotice(0);			
		}else {
			bvo.setFreeNotice(1);
		}
		
		if(bdao.boardFreeWrite(bvo)) {
			//등록성공
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/freeList.bo");
		}		
		
		return forward;		
	}
}
