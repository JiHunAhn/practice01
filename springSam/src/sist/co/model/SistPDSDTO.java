package sist.co.model;

import java.io.Serializable;

public class SistPDSDTO implements Serializable{
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String filename;
	private int readcount;
	private int downcount;
	private String regidate;
	private int ref;
	private int step;
	private int depth;
	private int parent;
	private int del;
	
	//기본 생성자
	public SistPDSDTO(){}
	
	public SistPDSDTO(int seq, String id, String title, String content, String filename, int readcount, int downcount,
			String regidate, int ref, int step, int depth, int parent, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.readcount = readcount;
		this.downcount = downcount;
		this.regidate = regidate;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.parent = parent;
		this.del = del;
	}


	//사용자들이 필요한 것만 추린거
	public SistPDSDTO(String id, String title, String content, String filename) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
	}

	
	
	
	//toString
	@Override
	public String toString() {
		return "SistPDSDTO [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", filename="
				+ filename + ", readcount=" + readcount + ", downcount=" + downcount + ", regidate=" + regidate
				+ ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", parent=" + parent + ", del=" + del + "]";
	}


	
	//세터, 게터
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}


}
