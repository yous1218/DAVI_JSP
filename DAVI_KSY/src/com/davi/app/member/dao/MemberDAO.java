package com.davi.app.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.davi.app.member.vo.CommentVO;
import com.davi.app.member.vo.DaviBodyVO;
import com.davi.app.member.vo.DaviMemberVO;
import com.davi.app.member.vo.DaviPayVO;
import com.davi.mybatis.config.SqlMapConfig;


public class MemberDAO {
	
	private static final int KEY = 5;
	
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public MemberDAO() {
		session = sessionf.openSession(true);
		
	}
	
	//아이디 찾기
	
	public boolean checkFindId (String name, String email) {
		HashMap<String, String> member = new HashMap<>();
		
		member.put("name", name);
		member.put("email", email);
		
		return (Integer)session.selectOne("Member.checkFindId", member) == 1;
	}
	
	public String findId (String name, String email) {
		HashMap<String, String> member = new HashMap<>();
		
		member.put("name", name);
		member.put("email", email);
		
		return session.selectOne("Member.findId", member);
	}
	
	//로그인 
	public boolean login(String id,String pw) {
		HashMap<String, String> member = new HashMap<String, String>();
		member.put("id", id);
		member.put("pw",encrypt(pw));
		
		return (Integer)session.selectOne("Member.login", member)==1;
	}
	
	//회원가입
	public boolean join(DaviMemberVO mvo) {
		mvo.setMemberPw(encrypt(mvo.getMemberPw()));
		return session.insert("Member.join", mvo) == 1;
	}
	
	//회원정보 수정
	public boolean mypageUpdateStatus(DaviMemberVO mvo) {
		return session.update("Member.mypageUpdateStatus", mvo) == 1;
	}
	
	
	//아이디 중복 체크
	public boolean checkId(String memberId) {
		return (Integer)session.selectOne("Member.checkId", memberId)==1;
	}
	
	//암호화
	public String encrypt(String pw) {
		String en_pw = "";
		for (int i = 0; i < pw.length(); i++) {
			en_pw += (char)(pw.charAt(i) * KEY);
		}
		return en_pw;
	}
	
	//복호화
	public String decrypt(String en_pw) {
		String de_pw = "";
		for (int i = 0; i < en_pw.length(); i++) {
			de_pw += (char)(en_pw.charAt(i) / KEY);
		}
		return de_pw;
	}
	
	// 비밀번호 찾기
	public boolean findPw (String id, String email) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id",id);
		map.put("email",email);
		
		return (Integer)session.selectOne("Member.findPw", map) == 1;
	}
	
	// 비밀번호 변경
	public boolean changePw (String id, String new_pw, String email) {
		
		HashMap<String, String> map = new HashMap<>();
		String en_pw = encrypt(new_pw);
		map.put("pw", en_pw);
		map.put("email", email);
		map.put("memberId", id);
		
		return session.update("Member.changePw", map) == 1;
	}
	
	//마이페이지 비밀번호 변경
	public boolean mypageChangePw (String new_pw, String memberId) {
		HashMap<String, String> map = new HashMap<>();
		String en_pw = encrypt(new_pw);
		map.put("memberPw", en_pw);
		map.put("memberId", memberId);
		
		return session.update("Member.mypageChangePw", map) == 1;
		
	}
	//마이페이지 기존 비밀번호와 비교해주기 
	public boolean mypageChangePwCheck (String memberPw, String memberId) {
		HashMap<String, String> map = new HashMap<>();
		String en_pw = encrypt(memberPw);
		map.put("memberPw", en_pw);
		map.put("memberId", memberId);
		
		return (Integer)session.selectOne("Member.mypageChangePwCheck", map) == 1;
		
	}
	
	//기존 회원 정보 가져오기
	
	public DaviMemberVO getBeforeUpdateStatus (String memberId) {
		return session.selectOne("Member.getBeforeUpdateStatus", memberId);
	}
	
	
	// 몸무게 입력
	public boolean insertBody(DaviBodyVO vo) {
		return session.insert("Member.insertBody", vo) == 1;
	}
	
	// 프로필 가져오기
	public HashMap<String, Integer> getProfil(String memberId){
		return session.selectOne("Member.getProfil",memberId);
	}
	
	//이번주 주차 가져오기
	
	public int getThisWeek () {
		return session.selectOne("Member.getThisWeek");
	}
	
	//이번주 몸무게 가져오기
	public double getBodyWeightThisWeek (String memberId, int thisWeek) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("thisWeek", thisWeek);
		return session.selectOne("Member.getBodyWeightThisWeek", map);
	}
		
	
	//저번 몸무게 가져오기
	public double getBodyWeightLastWeek (String memberId, int thisWeek) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("lastWeek", (thisWeek-1));
		return session.selectOne("Member.getBodyWeightLastWeek", map);
	}
	
	//변화량 랭킹 가져오기
	public List<HashMap<String, Object>> getRanking () {
		return session.selectList("Member.getRanking");
	}
	
	//오늘 몸무게 입력 체크
	public boolean getBody(String memberId) {
		return (Integer)session.selectOne("Member.getBody", memberId) == 1;
	}
	
	//하루 몸무게변화량 
	public double getDailyRate(String memberId) {
		return session.selectOne("Member.getDailyRate", memberId);
	}
	
	//그래프용 한달간의 개인정보 가져오기
	public List<HashMap<String, Object>> getMonthBody(HashMap<String, Object> map){
		return session.selectList("Member.getMonthBody", map);
	}
	
	public int getWeekRate(String memberId) {
		return session.selectOne("Member.getWeekRate",memberId);
	}
	
	public HashMap<String, Integer> getAttendRate(String memberId){
		return session.selectOne("Member.getAttendRate",memberId);
	}
	
	//식단 가져오기
		public List<Map<String, Integer>> nowWeekMenu(){
			return session.selectList("Member.nowWeekMenu");
		}
		
		//메뉴(아침/저녁)가져오기
		public List<Map<String, Integer>> weekMenu(int recipeMorning){
			return session.selectList("Member.weekMenu",recipeMorning);
		}
		
		//일주일 식단 짜기
		public boolean createWeek(int recipeNum) {
			return session.insert("Member.createWeek", recipeNum) ==1;
		}
		//식단 개수 
		public int countRecipe() {
			return session.selectOne("Member.countRecipe");
		}
		
		//주문정보등록
		public boolean payInsert(DaviPayVO vo) {
			return session.insert("Member.payInsert",vo)==1;
		}
	//마이페이지 식단 결제내역 리스트
		public List<DaviPayVO> getPaymentList (String memberId) {
			return session.selectList("Member.getPaymentList", memberId) ;
		}
		
		//한마디 가져오기
		public List<CommentVO> getComment(){
			return session.selectList("Member.getComment");
		}
}














