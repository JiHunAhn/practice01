package sist.co.Help;

public class BBSHelp {
	private int depth =0;
	private String arrow;

	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public String getArrow(){
		String rs = "<img src='image/arrow.png' width='20px;', height='13px;'/>";
		String nbsp = "&nbsp;&nbsp;";
		String ts = "";
		
		for(int i =0; i < depth ; i++){
			ts+= nbsp;
		}
		return depth==0?"":ts+rs;
	}

}
