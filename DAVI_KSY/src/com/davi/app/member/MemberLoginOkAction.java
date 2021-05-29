package com.davi.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;

public class MemberLoginOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();
		
		session.setMaxInactiveInterval(600);
		
		
		String id = req.getParameter("memberId");
		String pw = req.getParameter("memberPw");
		//String certificatedCheck = req.getParameter("certificatedCheck");	
		
		//로그인시 이전 페이지로 이동
		//String prepage = req.getParameter("prepage");
		//prepage = prepage.substring(prepage.indexOf(req.getContextPath()) + req.getContextPath().length());		
		
		//이동하려는 페이지 주소 가져오기
						
		
		if(m_dao.login(id, pw)) {
			//로그인 성공
			session.setAttribute("session_id", id);
			forward.setRedirect(true);
			//인덱스로 보내기
			forward.setPath(req.getContextPath() + "/index.jsp");
			
		}else {
			//로그인 실패
			forward.setRedirect(false);
			forward.setPath("/member/login.me?login=false");
			
		}
		
		return forward;
	}
}
