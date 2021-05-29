package com.davi.app.board.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardQnaDAO;
import com.davi.app.board.dao.BoardWarningDAO;
import com.davi.app.board.vo.BoardQnaVO;
import com.davi.app.board.vo.BoardWarningVO;

public class BoardQnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BoardQnaDAO f_dao = new BoardQnaDAO();
		BoardWarningDAO w_dao = new BoardWarningDAO();
		ActionForward forward = new ActionForward();
		
		String temp = req.getParameter("page");
		req.getParameter("pwCheck");
		
		System.out.println(temp);
		
		String qnaHead = req.getParameter("qnaHead");
		
		int totalCnt = f_dao.getTotalCnt(qnaHead);
		
		// 목록으로 돌아갈 때 필요한 page
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		// 한 페이지당 10개의 목록과 10개의 순서버튼이 보이도록 설정
		int boardSize = 10;
		int pageSize = 5;
		
		// 페이지에서 가장 마지막 게시글
		int endRow = page * boardSize;
		
		// 페이지에서 가장 첫번째 게시글
		int startRow = endRow - (boardSize - 1);
		
		// 목록페이지(가로)
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + (pageSize - 1);
		int realEndPage = (totalCnt - 1) / boardSize + 1;
		
		endPage = endPage > realEndPage ? realEndPage : endPage;
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("QnaBoardList", f_dao.list(startRow, endRow, qnaHead));
		req.setAttribute("pwCheck", req.getParameter("pwCheck"));
		
		
		if(qnaHead.equals("신고목록")) {
			List<BoardWarningVO> warningList = w_dao.listWarning(startRow, endRow);
			
			for(BoardWarningVO vo : warningList) {
				String date = vo.getWarningDate().substring(0,11);
				vo.setWarningDate(date);
			}
			req.setAttribute("warningList", warningList);
			forward.setRedirect(false);
			forward.setPath("/app/board/qnaBoardList.jsp?warning=ok");
			
		}else {
			forward.setRedirect(false);
			forward.setPath("/app/board/qnaBoardList.jsp");
			
		}
		
		return forward;
	}

}
