package com.davi.app.board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardFreeDAO;

public class BoardFreeReplyDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		BoardFreeDAO fr_dao = new BoardFreeDAO();
		ActionForward forward = new ActionForward();
		
		int freeReplyNum = Integer.parseInt(req.getParameter("freeReplyNum"));
		if(fr_dao.replyDelete(freeReplyNum)) {
			System.out.println("댓글 삭제 성공");			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/freeViewOk.bo?page=" + req.getParameter("page") + "&freeNum=" + req.getParameter("freeNum"));
		}else {
			System.out.println("삭제 실패");
			
		}
		
		return forward;
	}

}
