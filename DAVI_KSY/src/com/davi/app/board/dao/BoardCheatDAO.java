package com.davi.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.davi.app.board.vo.BoardCheatReplyVO;
import com.davi.app.board.vo.BoardCheatVO;
import com.davi.mybatis.config.SqlMapConfig;

public class BoardCheatDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public BoardCheatDAO() {
		session = sessionf.openSession(true);		
	}
	
	// 자유게시판 글쓰기
	public boolean boardCheatWrite(BoardCheatVO bvo) {		
		return session.insert("CheatBoard.cheatWrite", bvo) == 1;
	}
	
	//자유게시판 목록 검색 헤드
	public List<BoardCheatVO> getBoardListCheatHead(int startRow, int endRow, String cheatHead){
		HashMap<String, String> page = new HashMap<>();
		page.put("startRow", String.valueOf(startRow));
		page.put("endRow", String.valueOf(endRow));
		page.put("cheatHead", "%" + cheatHead + "%");
		
		return session.selectList("CheatBoard.listSearchHead", page);
	}
	//자유게시판 목록 검색 타이틀
	public List<BoardCheatVO> getBoardListSearchTitle(int startRow, int endRow, String cheatHead, String cheatTitle){
		HashMap<String, String> page = new HashMap<>();
		page.put("startRow", String.valueOf(startRow));
		page.put("endRow", String.valueOf(endRow));
		page.put("cheatHead", "%" + cheatHead + "%");
		page.put("cheatTitle","%" + cheatTitle + "%");
		
		return session.selectList("CheatBoard.listSearchTitle", page);
	}
	//자유게시판 목록 검색 아이디
	public List<BoardCheatVO> getBoardListSearchId(int startRow, int endRow, String cheatHead ,String memberId){
		HashMap<String, String> page = new HashMap<>();
		page.put("startRow", String.valueOf(startRow));
		page.put("endRow", String.valueOf(endRow));
		page.put("cheatHead", "%" + cheatHead + "%");
		page.put("memberId", "%" + memberId + "%");
		
		return session.selectList("CheatBoard.listSearchId", page);
	}
	
	//자유게시판 목록 개수(검색 X)
	public int getBoardCntSearchHead(String head) {
		String cheatHead = "%" + head + "%";
		return session.selectOne("CheatBoard.getBoardCntCheatHead", cheatHead );
	}
	
	//자유게시판 목록 개수(제목 검색)
	public int getBoardCntSearchTitle(String cheatHead, String cheatTitle) {
		HashMap<String, String> map = new HashMap<>();
		map.put("cheatHead", "%" + cheatHead + "%" );
		map.put("cheatTitle", "%" + cheatTitle + "%" );
		
		return session.selectOne("CheatBoard.getBoardCntSelectTitle", map );
	}
	
	//자유게시판 목록 개수(아이디 검색)
	public int getBoardCntSearchId(String cheatHead, String memberId) {
		HashMap<String, String> map = new HashMap<>();
		map.put("cheatHead", "%" + cheatHead + "%" );
		map.put("memberId", "%" + memberId + "%" );
		
		return session.selectOne("CheatBoard.getBoardCntSelectId", map );
	}
	
	
	
	//게시글 가져오기
	public BoardCheatVO getDetail(int cheatNum) {
		return session.selectOne("CheatBoard.getDetail", cheatNum);
	}
	
	//게시글 삭제하기
		public boolean deleteCheat(int cheatNum) {
			return session.delete("CheatBoard.deleteCheat",cheatNum)==1;
		}
		
	//게시글 업데이트
	public boolean updateCheat(BoardCheatVO bvo) {
		return session.update("CheatBoard.updateCheat",bvo)==1;
	}
	
	//댓글 쓰기
	public boolean replyInsert(BoardCheatReplyVO cr_vo) {
		return session.insert("CheatBoard.replyInsert", cr_vo) == 1;
	}
	
	//댓글 리스트 
	public List<BoardCheatReplyVO> replyList(int cheatNum) {
		return session.selectList("CheatBoard.replyList", cheatNum) ;
	}
	//댓글 삭제
	public boolean replyDelete(int cheatReplyNum) {
		return session.delete("CheatBoard.replyDelete", cheatReplyNum) > 0;
	}
	//댓글 수정
	public boolean replyUpdate(BoardCheatReplyVO cr_vo) {
		return session.update("CheatBoard.replyUpdate", cr_vo) == 1;
	}	
	
	//댓글의 부모글 아이디 가져오기
	public String parentNumToId(String parentReplyNum) {
		return session.selectOne("CheatBoard.parentNumToId", parentReplyNum);
	}
}
