package com.davi.app.member;

import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;
import com.davi.mail.MailSend;

public class MemberFindPwOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		MemberDAO m_dao = new MemberDAO();
		
		String id = req.getParameter("memberId");
		String email = req.getParameter("memberEmail");
		String path = req.getContextPath();	
		String fullPath = req.getRequestURL().toString().replace(req.getRequestURI(),"") + path;
		
		if(m_dao.findPw(id, email)) {
			String new_email = "";
			
			for (int i = 0; i < email.length(); i++) {
				if(i>=4 && i<= email.indexOf("@") - 1) {
					new_email += "*";
					continue;
				}
				new_email += email.charAt(i);
			}               
			
			String random_s = randomString(8);
			
			Cookie cookie = new Cookie("docking", random_s);
			cookie.setMaxAge(300);
			resp.addCookie(cookie);
			
			System.out.println(random_s);
			
			MailSend.gmailSend(id, email, random_s, fullPath);
			forward.setRedirect(false);
			forward.setPath("/member/findPwAfter.me?email=" + new_email);
		}else {
			forward.setRedirect(false);
			forward.setPath("/member/findPwBefore.me?check=false");
		}
		
		return forward;
	}
	
	private String randomString(int size) {
		
		String s = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*";
		String random_string = "";
		Random random = new Random();
		
		for (int i = 0; i < size; i++) {
			random_string += s.charAt(random.nextInt(s.length()));
		}
		return random_string;
	}

}
