package com.davi.app.board.cheat;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardCheatDAO;

public class BoardCheatDeleteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		BoardCheatDAO f_dao = new BoardCheatDAO();
		ActionForward forward = new ActionForward();
		int cheatNum = Integer.parseInt(req.getParameter("cheatNum"));
		String searchWord = req.getParameter("searchWord");
		String searchWordChange = URLEncoder.encode(searchWord, "UTF-8");
		
		if(f_dao.deleteCheat(cheatNum)) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/cheatList.bo?searchWord=" + searchWordChange);
		}
		
		return forward;
	}
}
