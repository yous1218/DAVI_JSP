package com.davi.app.board.free;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardFreeDAO;
import com.davi.app.board.vo.BoardFreeReplyVO;
import com.davi.app.board.vo.BoardFreeVO;

public class BoardFreeViewOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		
		BoardFreeDAO f_dao = new BoardFreeDAO();
		BoardFreeVO bf_vo = new BoardFreeVO();
		BoardFreeReplyVO fr_vo = new BoardFreeReplyVO();		
		
		ActionForward forward = null;
		ArrayList<Integer> reReplyCntList = new ArrayList<>();
		
		int freeNum = Integer.parseInt(req.getParameter("freeNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		int reReplyCount = 0;
				
		bf_vo = f_dao.getDetail(freeNum);
		
		
		if(bf_vo != null) {
			req.setAttribute("bf_vo", bf_vo);
			req.setAttribute("page", page);
			
			List<BoardFreeReplyVO> lists = f_dao.replyList(freeNum);		
			
			for(BoardFreeReplyVO vo : lists) {
				Calendar now = Calendar.getInstance();
				Calendar date = Calendar.getInstance();
				SimpleDateFormat YYYYMMddHHmmss = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String freeDate = vo.getFreeReplyDate();
				Date replyDate = YYYYMMddHHmmss.parse(freeDate);
				date.setTime(replyDate);
				
				int diffYear = now.get(Calendar.YEAR) - date.get(Calendar.YEAR);
				int diffMonth = now.get(Calendar.MONTH) - date.get(Calendar.MONTH);
				int diffDay = now.get(Calendar.DAY_OF_MONTH) - date.get(Calendar.DAY_OF_MONTH);
				int diffHour = now.get(Calendar.HOUR_OF_DAY) - date.get(Calendar.HOUR_OF_DAY);
				int diffMinute = now.get(Calendar.MINUTE) - date.get(Calendar.MINUTE);
				
				if(diffYear != 0) {
					vo.setFreeReplyDate(diffYear+"년 전");
				}else if(diffMonth != 0) {
					vo.setFreeReplyDate(diffMonth+"개월 전");
				}else if(diffDay != 0) {
					vo.setFreeReplyDate(diffDay+"일 전");
				}else if(diffHour !=0) {
					vo.setFreeReplyDate(diffHour+"시간 전");
				}else if(diffMinute !=0) {
					vo.setFreeReplyDate(diffMinute+"분 전");
				}else {
					vo.setFreeReplyDate("몇초 전");
				}
				
			}
			
			for (int i = 0; i <= lists.size(); i++) {
				
				if(i == lists.size()) {
					reReplyCntList.add(reReplyCount);
				}else {
					if(lists.get(i).getParentReplyId() == null) {
						reReplyCntList.add(reReplyCount);
						reReplyCount = 0;
					}else {
						reReplyCount++;
					}
				}
			
			}
			
			req.setAttribute("lists", lists);
			req.setAttribute("reReplyCntList", reReplyCntList);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/board/freeBoardView.jsp");
		}
		
		
		return forward;
		
	}
}
