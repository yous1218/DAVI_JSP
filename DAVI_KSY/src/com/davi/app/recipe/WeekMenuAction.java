package com.davi.app.recipe;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;

public class WeekMenuAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MemberDAO m_dao = new MemberDAO();
		List<Map<String, Integer>> list = m_dao.nowWeekMenu();
		ActionForward forward = new ActionForward();
		
		String[] weekDay = { "sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday" };   
		Calendar cal = Calendar.getInstance(); 
	    int num = cal.get(Calendar.DAY_OF_WEEK)-1; 
	    String today = weekDay[num]; 
		
		if(list.size() != 0) {
			forward.setRedirect(false);
			forward.setPath("/app/dietary/memberMenu.jsp");
			req.setAttribute("menus", list);
			req.setAttribute("today", today);
		}else {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/index.jsp");
		}
		
		
		return forward;
	}
}
