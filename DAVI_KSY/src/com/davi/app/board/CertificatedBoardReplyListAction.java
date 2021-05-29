package com.davi.app.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.CertificatedBoardDAO;
import com.davi.app.board.vo.CertificatedReplyVO;

public class CertificatedBoardReplyListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		CertificatedReplyVO cr_vo = new CertificatedReplyVO();
		CertificatedBoardDAO c_dao = new CertificatedBoardDAO();
		
		PrintWriter out = resp.getWriter();
		
		JSONArray arReply = new JSONArray();
		
		List<CertificatedReplyVO> replyLists = c_dao.certificatedReply(Integer.parseInt(req.getParameter("certificatedNum")));
		
	
		
		for (CertificatedReplyVO vo : replyLists) {
			
			JSONObject reply = new JSONObject();
			
			reply.put("certificatedNum", vo.getCertificatedNum());
			reply.put("certificatedReplyNum", vo.getCertificatedReplyNum());
			reply.put("memberId", vo.getMemberId());
			reply.put("certificatedReplyContent", vo.getCertificatedReplyContent());
			reply.put("certificatedDate", vo.getCertificatedDate());
			
			arReply.add(reply);
		}
		
		out.print(arReply.toJSONString());
		
		return null;
	}
}
