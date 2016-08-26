package sist.co.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.SistMemberDTO;

@Repository //저장소
public class SistMemberDAO {
	@Autowired //DI (의존성 주입)
	private SqlSession sqlSession;
	
	private String ns = "SistMember.";
	
	public SistMemberDTO login(SistMemberDTO member) throws Exception{
		
		return (SistMemberDTO)sqlSession.selectOne(ns+"login", member);
	}
	
	public boolean addMember(SistMemberDTO member) throws Exception{
		sqlSession.insert(ns+"addMember", member);
		return true;
	}
	
	public int getID(SistMemberDTO member) {
		return (int)sqlSession.selectOne(ns+"getID", member);
	}

}
