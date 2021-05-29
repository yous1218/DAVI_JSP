package com.davi.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.davi.app.board.vo.BoardWarningVO;
import com.davi.mybatis.config.SqlMapConfig;

public class BoardWarningDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public BoardWarningDAO() {
		session = sessionf.openSession(true);		
	}
	
	public boolean insertWarning(BoardWarningVO vo) {
		return session.insert("QnaBoard.insertWarning" , vo) == 1;
	}
	
	public List<BoardWarningVO> listWarning(int start, int end){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("startRow", start);
		map.put("endRow", end);
		return session.selectList("QnaBoard.listWarning", map);
	}
	
	public void deleteIdMember(String memberId) {
		session.delete("QnaBoard.deleteIdMember",memberId);
	}
	
	public void deleteIdFree(String memberId) {
		session.delete("QnaBoard.deleteIdFree",memberId);
	}
	
	public void deleteIdCheat(String memberId) {
		session.delete("QnaBoard.deleteIdCheat",memberId);
	}
	
	public void deleteIdCertificated(String memberId) {
		session.delete("QnaBoard.deleteIdCertificated",memberId);
	}
	
	public void deleteIdQna(String memberId) {
		session.delete("QnaBoard.deleteIdQna",memberId);
	}
	
	
}
