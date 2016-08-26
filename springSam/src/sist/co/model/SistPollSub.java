package sist.co.model;

import java.io.Serializable;

//문항(보기)수
public class SistPollSub implements Serializable {
	
	private int pollsubid;      //보기의 순서에 대한 번호
	private int pollid;          //투표번호(seq)
	private String answer;    //보기 내용
	private int pcount;        //보기 선택한 사람 수

	//기본 생성자
	public SistPollSub(){}

	public SistPollSub(int pollsubid, int pollid, String answer, int pcount) {
		this.pollsubid = pollsubid;
		this.pollid = pollid;
		this.answer = answer;
		this.pcount = pcount;
	}
	
	public SistPollSub(int pollid, String answer, int pcount) {
		this.pollid = pollid;
		this.answer = answer;
		this.pcount = pcount;
	}

	//toString
	@Override
	public String toString() {
		return "pollSubDTO [pollsubid=" + pollsubid + ", pollid=" + pollid + ", answer=" + answer + ", pcount=" + pcount
				+ "]";
	}

	//세터게터
	public int getPollsubid() {
		return pollsubid;
	}

	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
}