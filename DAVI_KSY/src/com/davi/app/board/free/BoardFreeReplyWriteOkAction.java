package com.davi.app.board.free;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardFreeDAO;
import com.davi.app.board.vo.BoardFreeReplyVO;

public class BoardFreeReplyWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		BoardFreeReplyVO fr_vo = new BoardFreeReplyVO();
		BoardFreeDAO f_dao = new BoardFreeDAO();
		
		String page = req.getParameter("page");
		String freeReplyNum = req.getParameter("freeReplyNum"); //부모 댓글 번호	
		
		fr_vo.setFreeNum(Integer.parseInt(req.getParameter("freeNum")));		
		fr_vo.setMemberId(req.getParameter("memberId"));
		fr_vo.setFreeReplyContent(req.getParameter("freeReplyContent"));		
		System.out.println(freeReplyNum);
		
		if(freeReplyNum == null) {			
			fr_vo.setParentReplyNum(0);
			fr_vo.setParentReplyId("");
		}else {
			fr_vo.setParentReplyNum(Integer.parseInt(freeReplyNum));
			
			try {
				fr_vo.setParentReplyId(f_dao.parentNumToId(freeReplyNum));
			} catch (Exception e) {
				fr_vo.setParentReplyId("");
			}			
		}
		
		if(f_dao.replyInsert(fr_vo)) {
			//성공
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/freeViewOk.bo?page=" + page + "&freeNum=" + req.getParameter("freeNum"));
		}
		
		return forward;
	}

}
