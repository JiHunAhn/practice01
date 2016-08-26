package sist.co.model;

import java.io.Serializable;

public class SistCalendarParam implements Serializable {
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate; 
	private String regdate; 
	
	private int year;
	private int month;
	private int day;
	
	private int hour;
	private int min;
	
	private String s_category;
	private String s_keyword;
	
	
    //세터 게터
	public String getS_category() {
		return s_category;
	}


	public void setS_category(String s_category) {
		this.s_category = s_category;
	}


	public String getS_keyword() {
		return s_keyword;
	}


	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}


	public SistCalendarParam(){}

	

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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}


	public int getHour() {
		return hour;
	}


	public void setHour(int hour) {
		this.hour = hour;
	}


	public int getMin() {
		return min;
	}


	public void setMin(int min) {
		this.min = min;
	}
	
	

}
