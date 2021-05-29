package com.davi.app.board;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.CertificatedBoardDAO;
import com.davi.app.board.vo.CertificatedBoardVO;
import com.davi.app.board.vo.CertificatedFilesVO;

public class CertificatedBoardViewAjaxOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		CertificatedBoardDAO c_dao = new CertificatedBoardDAO();
		CertificatedFilesVO cf_vo = new CertificatedFilesVO();
		
		HttpSession session = req.getSession();
		
		int certificatedNum = Integer.parseInt(req.getParameter("certificatedNum"));
		String replyWriterId = (String)session.getAttribute("session_id");
					
		PrintWriter out = resp.getWriter();		
		
		JSONArray arReply = new JSONArray();
		
		List<CertificatedBoardVO> replys = c_dao.getCertificatedList(certificatedNum, certificatedNum+1);
		
		String text = "";
		boolean likeCheck ;
		
//		시간
		Calendar now = Calendar.getInstance();
		Calendar date = Calendar.getInstance();
		Date changeDate = null;
		SimpleDateFormat MMddHHmmss = new SimpleDateFormat("MM-dd HH:mm:ss");
		String boardDate = "";
		String finalDate = "";
		
		int diffHour = 0;
		int diffMinute = 0; 
		int diffSecond = 0; 
		int diffDay = 0;
		
		String[] times = new String[2];
		
		
		
		
		
		
		
		
		
		
				
		for(CertificatedBoardVO c_vo : replys) {
			
			JSONObject reply = new JSONObject();
			
			//시간
			boardDate = c_dao.getDate(c_vo.getCertificatedNum());
			changeDate = MMddHHmmss.parse(boardDate);
			date.setTime(changeDate);
			diffDay = now.get(Calendar.DAY_OF_YEAR) - date.get(Calendar.DAY_OF_YEAR);
			diffHour = now.get(Calendar.HOUR_OF_DAY) - date.get(Calendar.HOUR_OF_DAY); 
			diffMinute = now.get(Calendar.MINUTE) - date.get(Calendar.MINUTE);
			diffSecond = now.get(Calendar.SECOND) - date.get(Calendar.SECOND);
			
			if(diffDay != 0) {
				if(diffDay == 1) {
					finalDate = "하루전";
				}else if (diffDay == 2) {
					finalDate = "이틀전";
				}else {
					finalDate = diffDay + "일전"; 
				}
			}else if(diffHour != 0) {
				finalDate = diffHour + "시간 전";
			}else if(diffMinute != 0) {
				finalDate = diffMinute + "분 전";
			}else {
				finalDate = "몇초 전";
			}
			
			System.out.println(finalDate);
			
			reply.put("certificatedTime",finalDate);
			
		
			
			
			
			int likeCnt = c_dao.certificatedLikeCnt(c_vo.getCertificatedNum());
			System.out.println(likeCnt);
			likeCheck = c_dao.certificatedLikeCheck(c_vo.getCertificatedNum(), replyWriterId);
			reply.put("memberId", c_vo.getMemberId());
			reply.put("certificatedNum", c_vo.getCertificatedNum());
			reply.put("certificatedTitle", c_vo.getCertificatedTitle());
			reply.put("certificatedContent", c_vo.getCertificatedContent());						
			reply.put("certificatedDate", c_vo.getCertificatedDate());
			reply.put("replyWriterId", replyWriterId);
			reply.put("certificatedlikeCnt", likeCnt );
			reply.put("certificatedlikeCheck", likeCheck);			
			
			if(c_vo.getCertificatedContent().length() > 10) {
				text  = c_vo.getCertificatedContent().substring(0, 10) + "...";				
			}else {
				text  = c_vo.getCertificatedContent();
			}
			reply.put("certificatedContentMini", text);
			
			//cf_vo = c_dao.getFilePath(c_vo.getCertificatedNum()); //파일명 경로 가져오기			
			reply.put("certificatedFilePath", c_dao.getFilePath(c_vo.getCertificatedNum()));
			
			arReply.add(reply);
		}
		out.println(arReply.toJSONString());
		out.close();
		
		return null;
	}
}
