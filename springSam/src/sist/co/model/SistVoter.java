package sist.co.model;

import java.io.Serializable;
import java.util.Date;

//누가 어디에 응답했는지 확인용
public class SistVoter implements Serializable {
	
	private int voterid;     //응답한 사람 카운터
	private int pollid;       //투표번호
	private int pollsubid;  //투표 보기 순서
	private String id;       //응답한 사람의 id
	private Date regdate;   //응답한 날짜
	
	//기본 생성자
	public SistVoter(){}

	public SistVoter(int voterid, int pollid, int pollsubid, String id, Date regdate) {
		this.voterid = voterid;
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
		this.regdate = regdate;
	}

	//핵심만
	public SistVoter(int pollid, int pollsubid, String id) {
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
	}
	
	public SistVoter(int voterid, int pollid, int pollsubid, String id) {
		this.voterid = voterid;
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
	}
	
	
	//toString
	@Override
	public String toString() {
		return "SistVoter [voterid=" + voterid + ", pollid=" + pollid + ", pollsubid=" + pollsubid + ", id=" + id
				+ ", regdate=" + regdate + "]";
	}

	//세터게터
	public int getVoterid() {
		return voterid;
	}

	public void setVoterid(int voterid) {
		this.voterid = voterid;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public int getPollsubid() {
		return pollsubid;
	}

	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	

}
