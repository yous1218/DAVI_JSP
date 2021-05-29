package com.davi.app.board.qna;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardQnaDAO;

public class BoardQnaDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		BoardQnaDAO f_dao = new BoardQnaDAO();
		ActionForward forward = new ActionForward();
		int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
		System.out.println("qnaHead" + req.getParameter("qnaHead"));
		
		if(f_dao.delete(qnaNum)) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/qnaList.bo?qnaHead=" + URLEncoder.encode(req.getParameter("qnaHead"),"UTF-8"));
		}
		
		return forward;
	}

}
