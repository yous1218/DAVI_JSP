package com.davi.app.board;

import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.CertificatedBoardDAO;
import com.davi.app.board.vo.CertificatedBoardVO;
import com.davi.app.board.vo.CertificatedFilesVO;

public class CertificatedBoardWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		String path = req.getContextPath() + "/board/ceritificatedBoard.bo";
		
		CertificatedBoardVO c_vo = new CertificatedBoardVO();
		CertificatedFilesVO cf_vo = new CertificatedFilesVO();
		CertificatedBoardDAO c_dao = new CertificatedBoardDAO();
		
		c_vo.setMemberId(req.getParameter("memberId"));
		c_vo.setCertificatedTitle(req.getParameter("certificatedTitle"));
		c_vo.setCertificatedContent(req.getParameter("certificatedContent"));
		
		if (c_dao.certificatedBoardWrite(c_vo)) {
			cf_vo.setCertificatedPath(req.getParameter("certificatedPath"));
			cf_vo.setCertificatedFileName(req.getParameter("certificatedFileName"));
			cf_vo.setCertificatedNum(c_dao.getCertificatedNum(req.getParameter("memberId")));
			if(c_dao.certificatedFilesWrite(cf_vo) ) {
				//db 성공 
				//req.setAttribute("path", path);	
				
				// 세션 삭제
				session.removeAttribute("filename");
				session.removeAttribute("path");
				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(path);
			}
		}
		
		
		return forward;
	}
}
