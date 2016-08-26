package sist.co.model;

import java.io.Serializable;

public class SistCalendar implements Serializable{

	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate; 
	private String regdate;        //일정 기입에 해당하는 날짜
	
	public SistCalendar(){}

	public SistCalendar(int seq, String id, String title, String content, String wdate, String regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.regdate = regdate;
	}

	public SistCalendar(String id, String title, String content, String wdate) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
	}

	//세터 게터
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	
	

}
