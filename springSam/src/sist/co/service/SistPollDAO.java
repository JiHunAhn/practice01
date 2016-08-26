package sist.co.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.SistPollDTO;
import sist.co.model.SistPollSub;
import sist.co.model.SistVoter;

@Repository 
public class SistPollDAO {
	
	@Autowired //DI (의존성 주입)
	private SqlSessionTemplate sqlSession;
	
	private String ns = "SistPoll.";
	
	public List<SistPollDTO> getPollAllList(){
		List<SistPollDTO> list = new ArrayList<SistPollDTO>();
		
		return list = sqlSession.selectList(ns+"getPollAllList");
	}
	
	public int isVote(SistVoter voter){
		return (Integer)sqlSession.selectOne(ns+"isVote", voter);
	}
	
	public void makePoll(SistPollDTO poll){
		sqlSession.insert(ns+"makePoll", poll);
	}
	
	public void makePollSub(SistPollSub pollsub){
		sqlSession.insert(ns+"makePollSub", pollsub);
	}
	
	public SistPollDTO getPoll (SistPollDTO poll){
		SistPollDTO dto = new SistPollDTO();
		return dto = (SistPollDTO)sqlSession.selectOne(ns+"getPoll", poll);
	}
	
	public List<SistPollSub> getPollSubList(SistPollDTO poll){
		List<SistPollSub> lists = new ArrayList<SistPollSub>();
		return lists = sqlSession.selectList(ns+"getPollSubList", poll);
	}
	
	/////////////////////////////////////////////////////////////////////////////// 세 작업이 동시에 일어나야 한다. -> service에 한 메소드 만들고 -> 이것을 구현한 Impl에서 세작업 동시에!
	public void pollingVote(SistVoter voter) {
		sqlSession.insert(ns+"pollingVote", voter);
	}
	
	public void pollingPoll(SistVoter voter) {
		sqlSession.update(ns+"pollingPoll", voter);
	}
	
	public void pollingSub(SistVoter voter) {
		sqlSession.update(ns+"pollingSub", voter);
	}
	///////////////////////////////////////////////////////////////////////////////
	

}
