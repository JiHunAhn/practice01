package sist.co.model;



public class SistBBSParam {
	        //글의 순서(번호)
			private int seq;
			//글 쓴넘
			private String id;
			
			//부모 글의 번호(답글 관련해서 필요)
			private int ref;
			//답글의 순서
			private int step;
			
			//글의 깊이(답글의 답글 같은거 표시)
			private int depth;
			private String title;
			private String content;
			private String wdate; 
			//답글인지 아닌지 확인
			private int parent; 
			//게시판 지웠는지 확인
			private int del;   
			//조회 수 확인
			private int readcount;
			
			private String s_category;
			private String s_keyword;
			
			private int recordCountPerPage = 10;
			private int pageNumber = 0;
			
			private int start = 1;
			private int end = 10;
			
			
			//기본생성자
			public SistBBSParam(){}

           //readcount까지만
			public SistBBSParam(int seq, String id, int ref, int step, int depth, String title, String content,
					String wdate, int parent, int del, int readcount) {
				super();
				this.seq = seq;
				this.id = id;
				this.ref = ref;
				this.step = step;
				this.depth = depth;
				this.title = title;
				this.content = content;
				this.wdate = wdate;
				this.parent = parent;
				this.del = del;
				this.readcount = readcount;
			}


			
			//게시판용
			public SistBBSParam(String id, String title, String content) {
				super();
				this.id = id;
				this.title = title;
				this.content = content;
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

			public int getReadcount() {
				return readcount;
			}

			public void setReadcount(int readcount) {
				this.readcount = readcount;
			}

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

			public int getRecordCountPerPage() {
				return recordCountPerPage;
			}

			public void setRecordCountPerPage(int recordCountPerPage) {
				this.recordCountPerPage = recordCountPerPage;
			}

			public int getPageNumber() {
				return pageNumber;
			}

			public void setPageNumber(int pageNumber) {
				this.pageNumber = pageNumber;
			}

			public int getStart() {
				return start;
			}

			public void setStart(int start) {
				this.start = start;
			}

			public int getEnd() {
				return end;
			}

			public void setEnd(int end) {
				this.end = end;
			}
				
			
		

			
		
			
		
}