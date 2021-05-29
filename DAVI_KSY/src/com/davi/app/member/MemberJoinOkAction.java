package com.davi.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;
import com.davi.app.member.vo.DaviMemberVO;

public class MemberJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
req.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		DaviMemberVO mvo = new DaviMemberVO();
		MemberDAO mdao = new MemberDAO();
		
		
		
		mvo.setMemberId(req.getParameter("memberId"));
		mvo.setMemberPw(req.getParameter("memberPw"));
		mvo.setMemberName(req.getParameter("memberName"));
		mvo.setMemberPhone(req.getParameter("memberPhone"));
		mvo.setMemberEmail(req.getParameter("memberEmail"));
		mvo.setMemberGender(req.getParameter("memberGender"));
		
		int memberHeight = 0;
		int memberWeight = 0;
		int memberGoalWeight = 0;
		
		try {
			memberHeight = Integer.parseInt(req.getParameter("memberHeight"));
		} catch (NumberFormatException e) {			
		
		} try {
			memberWeight = Integer.parseInt(req.getParameter("memberWeight"));
		} catch (Exception e) {

		} try {
			memberGoalWeight = Integer.parseInt(req.getParameter("memberGoalWeight"));
		} catch (Exception e) {
		}
		
		
		mvo.setMemberHeight(memberHeight);
		mvo.setMemberWeight(memberWeight);
		mvo.setMemberGoalWeight(memberGoalWeight);
		mvo.setMemberResolution(req.getParameter("memberResolution"));		
		
		if(mdao.join(mvo)) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/joinOk.me?result=true");			
		}		
		return forward;	
	}
	
}
