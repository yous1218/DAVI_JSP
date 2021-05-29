package com.davi.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;

public class MemberLogoutOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		resp.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		//String refer = req.getHeader("referer");		
		
		req.getSession().invalidate();	
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/index.jsp");			
		return forward;
		
	}
}
