package sist.co.model;

import java.io.Serializable;
import java.util.Date;


//질문 만드는 거
public class SistPollDTO implements Serializable{
	
	private int pollid;            //투표번호(seq)
	private String id;            //투표 아이디(title)
	private String question;   //투표 질문(content)
	private Date sdate;        //시작날짜
	private Date edate;       //종료일
	private int itemcount;    //보기의 수
	private int polltotal;      //투표한 사람수
	private Date regdate;    //투표 등록일
	private boolean vote;   //투표 여부
	
	//기본 생성자
	public SistPollDTO(){}


	public SistPollDTO(int pollid, String id, String question, Date sdate, Date edate, int itemcount, int polltotal,
			Date regdate, boolean vote) {
		super();
		this.pollid = pollid;
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
		this.regdate = regdate;
		this.vote = vote;
	}



	//핵심으로 필요한거
	public SistPollDTO(String id, String question, int itemcount) {
		this.id = id;
		this.question = question;
		this.itemcount = itemcount;
	}
	
	//필요한거1
	public SistPollDTO(String id, String question, int itemcount, int polltotal) {
		super();
		this.id = id;
		this.question = question;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
	}
	
	//필요한거2
	public SistPollDTO(String id, String question, Date sdate, Date edate, int itemcount, int polltotal) {
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;

	}






	//세터게터
	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public int getPolltotal() {
		return polltotal;
	}

	public void setPolltotal(int polltotal) {
		this.polltotal = polltotal;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public boolean isVote() {
		return vote;
	}

	public void setVote(boolean vote) {
		this.vote = vote;
	}

	
	
	//toString
	@Override
	public String toString() {
		return "SistPollDTO [pollid=" + pollid + ", id=" + id + ", question=" + question + ", sdate=" + sdate
				+ ", edate=" + edate + ", itemcount=" + itemcount + ", polltotal=" + polltotal + ", regdate=" + regdate
				+ ", vote=" + vote + "]";
	}


	
	
}
