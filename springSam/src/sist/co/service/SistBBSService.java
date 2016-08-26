package sist.co.service;

import java.util.List;

import sist.co.model.SistBBSDTO;
import sist.co.model.SistBBSParam;

public interface SistBBSService {
	
	List<SistBBSDTO> getBBSList() throws Exception;
	
	boolean writeBBS(SistBBSDTO bbs) throws Exception;
	
	public SistBBSDTO getBBS(SistBBSDTO bbs) throws Exception;
	
	public boolean readcount(int seq) throws Exception;
	
	public boolean bbsupdate(SistBBSDTO bbs) throws Exception;
	
	public boolean bbsdelete(int seq) throws Exception;
	
	public int getBBSCount(SistBBSParam param) throws Exception;
	
	public List<SistBBSDTO> getBBSPagingList(SistBBSParam param) throws Exception;
	
	void reply(SistBBSDTO bbs) throws Exception;
	


}
