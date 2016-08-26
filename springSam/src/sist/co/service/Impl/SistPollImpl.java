package sist.co.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sist.co.Help.PollBean;
import sist.co.model.SistPollDTO;
import sist.co.model.SistPollSub;
import sist.co.model.SistVoter;
import sist.co.service.SistPollDAO;
import sist.co.service.SistPollService;

@Service
public class SistPollImpl implements SistPollService{

	@Autowired
	private SistPollDAO sistPollDAO;
	
	@Override
	public List<SistPollDTO> getPollAllList(String id) {
		List<SistPollDTO> plists = sistPollDAO.getPollAllList();
		
		List<SistPollDTO> plists2 = new ArrayList<SistPollDTO>();
		
		for(SistPollDTO poll:plists){
			int pollid = poll.getPollid();
			int count = sistPollDAO.isVote(new SistVoter(pollid, -1, id));
			
			if(count > 0){
				poll.setVote(true);
			}else{
				poll.setVote(false);
			}
			plists2.add(poll);
		}
		
		
		return plists2;
	}

	@Override
	public void makePoll(PollBean pBean) {
		
		SistPollDTO poll = new SistPollDTO(pBean.getId(), pBean.getQuestion(), pBean.getSdate(), pBean.getEdate(), pBean.getItemcount(),0);
        sistPollDAO.makePoll(poll);
		
		int itemcount = pBean.getItemcount();
        String answer[] = pBean.getPollnum();
        
        for(int i=0; i<itemcount; i++){
        	SistPollSub pollsub = new SistPollSub();
        	pollsub.setAnswer(answer[i]);
        	sistPollDAO.makePollSub(pollsub);
        }
      
	}

	@Override
	public SistPollDTO getPoll(SistPollDTO poll) {
		return sistPollDAO.getPoll(poll);
	}

	@Override
	public List<SistPollSub> getPollSubList(SistPollDTO poll) {
		return sistPollDAO.getPollSubList(poll);
	}

	@Override
	public void polling(SistVoter voter) {

		sistPollDAO.pollingPoll(voter);
		sistPollDAO.pollingSub(voter);
		sistPollDAO.pollingVote(voter);
	}
	
	



	
	
}
