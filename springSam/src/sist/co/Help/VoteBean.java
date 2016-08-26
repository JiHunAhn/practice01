package sist.co.Help;

public class VoteBean {

	private int pcount;
	private int total;
	
	public void setPcount(int pcount) {
		this.pcount = pcount;
	} 
	public void setTotal(int total) {
		this.total = total;
	}
	public int barWidth(int pcount, int total){
		if(total==0){
			return 0;
		}else{
			return (int)(1.0*pcount/total*400);
		}
	}
	public String barRatio(int pcount, int total){
		if(total==0){
			return String.format("0 (%d%%)", 0);
		}else{
			//String.format -> %%가 %출력
			//.2 소수점 2자리
			return String.format("%d (%.2f%%)", 
					pcount,(1.0*pcount/total*100));
		}
	}
	public String getMakeBar(){
		//그림의 width를 변경시켜서 막대그래프를 만든다.
		String t="<img src='./image/rd.gif' width='%dpx' height='21px'/>%s";
		String s=String.format(t,
				barWidth(pcount, total), barRatio(pcount, total));
		return s;
	}
}
