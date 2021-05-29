package com.davi.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.ActionForward;
import com.davi.app.recipe.CreateWeekOkAction;
import com.davi.app.recipe.WeekMenuAction;

public class MemberFrontController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		
		switch(command) {
		case "/member/findIdOk.me" :
			try {
				forward = new MemberFindIdOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/findId.me" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/findId_before.jsp");			
			
			break;		
		case "/member/checkId.me" :
			
			try {
				forward = new MemberCheckIdAction().execute(req, resp);
			} catch (Exception e) {				
				e.printStackTrace();
			}			
			
			break;
		case "/member/join.me" :
			try {
				forward = new MemberJoinOkAction().execute(req, resp);				
			} catch (Exception e) {				
				e.printStackTrace();
			}
			break;
		case "/member/joinOk.me" :		
			if(req.getParameter("result").equals("true")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/member/login.jsp");
			}else {
				//회원기입 실패시 메세지
			}			
			
			break;
			//화원정보 페이지 이동
		case "/member/myPage.me" :
			String listCheck = req.getParameter("listCheck");
			System.out.println(listCheck);
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/mypage.jsp?" + (listCheck.equals("fail") ? "listCheck=fail" : "listCheck=success"));
			
			break;
		case "/member/myPageUpdate.me" :
			try {
				forward = new MemberMypageUpdateAction().execute(req, resp);				
			} catch (Exception e) {;}
			
			break;
			//회원 정보수정
		case "/member/myPageUpdateOk.me" :
			System.out.println("회원정보 수정ok 컨트롤러");
			try {
				forward = new MemberMypageUpdateStatusOkAction().execute(req, resp);				
			} catch (Exception e) {;}
			break;
			
		case "/member/loginOk.me":
			try {
				forward = new MemberLoginOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;
		case "/member/logoutOk.me":
			try {
				forward = new MemberLogoutOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;	
		case "/member/login.me":
			String login = req.getParameter("login");
//			System.out.println(req.getParameter("certificatedCheck"));
//			req.setAttribute("certificatedCheck", req.getParameter("certificatedCheck"));
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/login.jsp" + (login != null ? "?login=false" : ""));
			break;	
		
		case "/member/findPwOk.me" :
			try {
				forward = new MemberFindPwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("비밀번호 찾기 Action 에러");
				System.out.println(e.getMessage());
			} 
			break;
		
		case "/member/findPwBefore.me" :
			String check = req.getParameter("check");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/findpw_before.jsp" +(check != null ? "?check=false" : ""));
			break;
			
		case "/member/findPwAfter.me" :
			String email = req.getParameter("email");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/findpw_after.jsp?email=" + email);
			break;	
			
		case "/member/changePwOk.me" :
			try {
				System.out.println("프론트 컨트롤러 들어옴");
				forward = new MemberChangePwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("비번바꾸기 Action 에러");
				e.printStackTrace();
			}
			break;
			
		case "/member/changePw.me" :
			String checkPw = req.getParameter("checkPw");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/findPw_changePw.jsp"+ (checkPw != null? "?check=false" : ""));
			break;
			
		case "/member/myPageChangePw.me" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/mypage_changePw.jsp");
			break;
			
		case "/member/myPageChangePwOk.me" :
			try {
				forward = new MemberMypageChangePwOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/reportView.me" :
			try {
				forward = new MemberReportViewOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/bodyInsert.me" :
			try {
				forward = new MemberBodyInsertOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		case "/member/bodyChartList.me" :
			try {
				forward = new MemberChartListAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/weekMenu.me" :
			try {
				forward = new WeekMenuAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/CreateWeekOkAction.me" :
			try {
				forward = new CreateWeekOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/memberPay.me" :
			try {
				forward = new MemberPayOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "/member/memberPayListOk.me" :
			try {
				forward = new MemberPayListOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/member/memberPayListCheckOk.me" :
			try {
				forward = new MemberPayListCheckOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		case "/member/memberPayList.me" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/dietary/payList.jsp");
			
			break;

		case "/member/memberPayDetail.me" :
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/dietary/payDetail.jsp");
			
			break;

		
		case "/member/payInput.me" :
			try {
				forward = new MemberPayInputAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/payment.me" :
			try {
				forward = new MemberPaymenOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/member/sessionAdd.me" :
			try {
				forward = new MemberSessionAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;			
			
		case "/member/recipe.me" :
			try {
				forward = new MemberRecipeAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;			
		default:
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
	
}