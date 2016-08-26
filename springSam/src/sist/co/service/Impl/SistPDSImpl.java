package sist.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.model.SistPDSDTO;
import sist.co.service.SistPDSDAO;
import sist.co.service.SistPDSService;


@Service
public class SistPDSImpl implements SistPDSService{
	
	@Autowired
	private SistPDSDAO sistPDSDAO;

	@Override
	@Transactional
	public List<SistPDSDTO> getPDSList() {
		return sistPDSDAO.getPDSList();
	}

	@Override
	@Transactional
	public void uploadPDS(SistPDSDTO dto) {
		sistPDSDAO.uploadPDS(dto);		
	}

	@Override
	@Transactional
	public void pdsupdate(SistPDSDTO dto) {
		sistPDSDAO.pdsupdate(dto);
		
	}

	@Override
	@Transactional
	public SistPDSDTO getPDS(int seq) throws Exception {
		return sistPDSDAO.getPDS(seq);
	}

	@Override
	@Transactional
	public boolean readcount(int seq) throws Exception {
		
		return sistPDSDAO.readcount(seq);
	}	

	@Override
	@Transactional
	public boolean pdsdel(int seq) throws Exception {
		
		return sistPDSDAO.pdsdel(seq) ;
	}

	@Override
	@Transactional
	public void downloadCount(int seq) throws Exception {
		sistPDSDAO.downloadCount(seq);
		
	}
	
	

}
