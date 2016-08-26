package sist.co.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.model.SistMemberDTO;
import sist.co.service.SistMemberDAO;
import sist.co.service.SistMemberService;

@Service
public class SistMemberImpl implements SistMemberService{

	@Autowired SistMemberDAO sistMemberDAO;
	
	
	@Override
	@Transactional(readOnly=true)
	public SistMemberDTO login(SistMemberDTO member) throws Exception {
		return sistMemberDAO.login(member);
	}


	@Override
	@Transactional
	public boolean addMember(SistMemberDTO member) throws Exception {
		return sistMemberDAO.addMember(member);
	}


	@Override
	@Transactional(readOnly=true)
	public int getID(SistMemberDTO member){
		return sistMemberDAO.getID(member);
	}
	
	
	
	

}
