package com.davi.app.board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardFreeDAO;
import com.davi.app.board.vo.BoardFreeReplyVO;

public class BoardFreeReplyUpdateOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		BoardFreeDAO fr_dao = new BoardFreeDAO();
		BoardFreeReplyVO fr_vo = new BoardFreeReplyVO();
		ActionForward forward = new ActionForward();
		
		int freeReplyNum = Integer.parseInt(req.getParameter("freeReplyNum"));
		String freeReplyContent = req.getParameter("readReply"+freeReplyNum);
		fr_vo.setFreeReplyContent(freeReplyContent);
		fr_vo.setFreeReplyNum(freeReplyNum);
		
		if(fr_dao.replyUpdate(fr_vo)) {
			//수정성공
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/freeViewOk.bo?page=" + req.getParameter("page") + "&freeNum=" + req.getParameter("freeNum"));
		}else {
			//수정실패			
			
		}
		
		return forward;
	}
}
