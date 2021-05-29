package com.davi.action;

//컨트롤러에서의 연산 결과에 따라
//전송 방식과 전송할 페이지 정보를 담을 수 있는 클래스 타입
public class ActionForward {
	private boolean isRedirect;	//true일 때 redirect 방식, false일 때 forward 방식
	private String path; //응답할 페이지 경로
	
	public ActionForward() {;}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
