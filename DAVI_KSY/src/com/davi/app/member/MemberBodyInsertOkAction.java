package com.davi.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;
import com.davi.app.member.vo.DaviBodyVO;

public class MemberBodyInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();
		DaviBodyVO b_vo = new DaviBodyVO();
		HttpSession session = req.getSession();
		
		String memberId = (String)session.getAttribute("session_id");
		double bodyWeight = Double.parseDouble(req.getParameter("bodyWeight"));
		
		b_vo.setBodyWeight(bodyWeight);
		b_vo.setMemberId(memberId);
		
		//변수 선언
		int thisWeek = m_dao.getThisWeek();
		System.out.println(thisWeek);
		System.out.println(memberId);
		double thisWeekWeight = 0;		
		double lastWeekWeight = 0;
		double bodyRate = 0;
		
		try {
			thisWeekWeight = m_dao.getBodyWeightThisWeek(memberId, thisWeek);
			lastWeekWeight = m_dao.getBodyWeightLastWeek(memberId, thisWeek);
		} catch (Exception e) {
			System.out.println("예외발생");
		}
		
		System.out.println("이번주 저번주");
		
		//이번주 있을경우
		if(thisWeekWeight != 0) {
			System.out.println("연산들어옴");
			bodyRate = bodyWeight - thisWeekWeight;
		
		//이번주 없고 저번주 데이터가 있을 경우 
		}else if (lastWeekWeight != 0) {
			bodyRate = bodyWeight - lastWeekWeight;
		
		//이번주데이터와 저번주 데이터 모두 없는 경우
		}else {
			bodyRate = 0;
		}
		
		b_vo.setMemberRate(bodyRate);
		
		if(m_dao.insertBody(b_vo)) {
			System.out.println("성공");
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/reportView.me");
		}else {
			System.out.println("여기로 오지마");
			
		}
		
		return forward;
	}

}
