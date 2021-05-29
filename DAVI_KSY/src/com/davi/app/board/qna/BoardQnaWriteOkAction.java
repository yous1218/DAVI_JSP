package com.davi.app.board.qna;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardQnaDAO;
import com.davi.app.board.vo.BoardQnaVO;

public class BoardQnaWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BoardQnaVO qvo = new BoardQnaVO();
		BoardQnaDAO qdao = new BoardQnaDAO();
		
		ActionForward forward = null;	
		
		String qnaHead = req.getParameter("qnaHead");
		System.out.println("qnaHead: " + qnaHead);
		
		String urlHead = URLEncoder.encode(qnaHead, "UTF-8");
		
		qvo.setQnaHead(req.getParameter("qnaHead"));
		qvo.setMemberId(req.getParameter("memberId"));
		qvo.setQnaTitle(req.getParameter("qnaTitle"));
		qvo.setQnaContent(req.getParameter("qnaContent"));		
		
		if(req.getParameter("qnaPassword") != null) {			
			qvo.setQnaPassword(req.getParameter("qnaPassword"));
		}else {			
			qvo.setQnaPassword("");
		}
		
		if(req.getParameter("qnaHead").equals("공지")) {
			qvo.setQnaNotice(0);			
		}else {
			qvo.setQnaNotice(1);
		}
		
		
		
		if(qdao.write(qvo)) {
			//등록성공
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/qnaList.bo?qnaHead=" + urlHead);
		}		
		return forward;
	}

}
