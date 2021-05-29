package com.davi.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.davi.app.board.vo.BoardFreeReplyVO;
import com.davi.app.board.vo.BoardQnaReplyVO;
import com.davi.app.board.vo.BoardQnaVO;
import com.davi.mybatis.config.SqlMapConfig;

public class BoardQnaDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public BoardQnaDAO() {
		session = sessionf.openSession(true);		
	}
	
	//새글쓰기
	public boolean write(BoardQnaVO qvo) {
		return session.insert("QnaBoard.qnaWrite", qvo) == 1;
	}
	//글삭제
	public boolean delete(int qnaNum) {
		return session.delete("QnaBoard.deleteQna", qnaNum) == 1;	
	}
	//리스트
	public List<BoardQnaVO> list(int start, int end , String head){
		HashMap<String, Object> map = new HashMap<>();
		map.put("startRow", start);
		map.put("endRow", end);
		map.put("qnaHead", head);
		return session.selectList("QnaBoard.listAll", map);
	}
	//댓글여부
	public boolean checkReply(int qnaNum) {
		return (int)session.selectOne("QnaBoard.checkReply", qnaNum) > 0;
	}
	
	//totalCnt 구하기
	public int getTotalCnt(String head) {
		String qnaHead = "%" + head + "%";
		return session.selectOne("QnaBoard.getTotalCnt", qnaHead );
	}
	
	//글보기
	public BoardQnaVO qnaView(String qnaNum) {
		return session.selectOne("QnaBoard.qnaView", qnaNum);
	}
	//댓글리스트
	public List<BoardQnaReplyVO> replyList(String qnaNum){
		return session.selectList("QnaBoard.replyList", qnaNum);
	}
	
	//댓글 쓰기
	public boolean replyInsert(BoardQnaReplyVO fr_vo) {
		return session.insert("QnaBoard.replyInsert", fr_vo) == 1;
	}
	
	//댓글의 부모글 아이디 가져오기
	public String parentNumToId(String parentReplyNum) {
		return session.selectOne("QnaBoard.parentNumToId", parentReplyNum);
	}
	
	//댓글 삭제
	public boolean replyDelete(int qnaReplyNum) {
		return session.delete("QnaBoard.replyDelete", qnaReplyNum) == 1;
	}
	
	//댓글 수정
	public boolean replyUpdate(BoardQnaReplyVO fr_vo) {
		return session.update("QnaBoard.replyUpdate", fr_vo) == 1;
	}
	
	public boolean updateTitle(String title, String qnaNum) {
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("qnaNum" , qnaNum);
		return session.update("QnaBoard.updateTitle" , map) == 1;
	}
	
	public String selectTitle(String qnaNum) {
		return session.selectOne("QnaBoard.selectTitle" , qnaNum);
	}
}
