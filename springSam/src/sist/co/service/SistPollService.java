package sist.co.service;

import java.util.ArrayList;
import java.util.List;

import sist.co.Help.PollBean;
import sist.co.model.SistPollDTO;
import sist.co.model.SistPollSub;
import sist.co.model.SistVoter;

public interface SistPollService {
	
	public List<SistPollDTO> getPollAllList(String id);
		
	public void makePoll(PollBean pBean);
	
	public SistPollDTO getPoll (SistPollDTO poll);
	
	public List<SistPollSub> getPollSubList(SistPollDTO poll);
		
	public void polling(SistVoter voter);
	
	
	
	

}
