package sist.co.Help;

import java.io.Serializable;

public class PagingBean implements Serializable {

	int totalRecordCount=1;
	int pageNumber=1;
	int pageCountPerScreen=10;
	int recordCountPerPage=10;	
	
	int totalPageCount;
	int screenStartPageIndex;
	int screenEndPageIndex;
		
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {		
		this.totalRecordCount=totalRecordCount;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber=pageNumber;		
	}
	public int getPageCountPerScreen() {
		return pageCountPerScreen;
	}
	public void setPageCountPerScreen(int pageCountPerScreen) {
		this.pageCountPerScreen =  pageCountPerScreen;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int  recordCountPerPage) {		
		this.recordCountPerPage=recordCountPerPage;
	}
	public int getTotalPageCount() {
		totalPageCount = (int)(Math.ceil(1.0*totalRecordCount / recordCountPerPage));
		return totalPageCount;
	}
	public int getScreenStartPageIndex() {
		screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;
		if (((pageNumber+1) % pageCountPerScreen) == 0)
		{
		    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
		}
		return screenStartPageIndex;
	}
	public int getScreenEndPageIndex() {
		screenEndPageIndex =(((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
		if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;
		if (((pageNumber+1) % pageCountPerScreen) == 0)
		{
		    screenEndPageIndex = pageNumber+1;
		}
		return screenEndPageIndex;
	}


}
