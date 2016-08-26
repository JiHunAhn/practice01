package sist.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.model.SistBBSDTO;
import sist.co.model.SistBBSParam;
import sist.co.service.SistBBSDAO;
import sist.co.service.SistBBSService;

@Service
public class SistBBSImpl implements SistBBSService{
	
	@Autowired
	private SistBBSDAO sistBBSDAO;
	
	@Override
	@Transactional(readOnly=true)
	public List<SistBBSDTO> getBBSList() throws Exception {
		return sistBBSDAO.getBBSList();
	}

	@Override
	@Transactional
	public boolean writeBBS(SistBBSDTO bbs) throws Exception {
		return sistBBSDAO.writeBBS(bbs);
	}

	@Override
	@Transactional(readOnly=true)
	public SistBBSDTO getBBS(SistBBSDTO bbs) throws Exception {
		return sistBBSDAO.getBBS(bbs);
	}

	@Override
	@Transactional
	public boolean readcount(int seq) throws Exception {
		return sistBBSDAO.readcount(seq);
	}

	@Override
	@Transactional
	public boolean bbsupdate(SistBBSDTO bbs) throws Exception {
		return sistBBSDAO.bbsupdate(bbs);
	}
	
	@Override
	@Transactional
	public boolean bbsdelete(int seq) throws Exception {
		return sistBBSDAO.bbsdelete(seq);
	}

	@Override
	@Transactional
	public int getBBSCount(SistBBSParam param) throws Exception {
		return sistBBSDAO.getBBSCount(param);
	}

	@Override
	@Transactional
	public List<SistBBSDTO> getBBSPagingList(SistBBSParam param) throws Exception {
		return sistBBSDAO.getBBSPagingList(param);
	}

	@Override
	@Transactional
	public void reply(SistBBSDTO bbs) throws Exception {
		sistBBSDAO.replyBBSUpdate(bbs);
		sistBBSDAO.replyBBSInsert(bbs);		
	}
	
	

}
