package sist.co.service;

import java.util.List;

import sist.co.model.SistPDSDTO;

public interface SistPDSService {
	
	public List<SistPDSDTO> getPDSList();
	
	public void uploadPDS(SistPDSDTO dto);
	
	public SistPDSDTO getPDS(int seq) throws Exception;
	
	public boolean readcount(int seq) throws Exception;
	
	public void downloadCount(int seq) throws Exception;
	
	public boolean pdsdel(int seq) throws Exception;
	
	public void pdsupdate(SistPDSDTO dto);

}
