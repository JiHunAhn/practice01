package sist.co.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.SistPDSDTO;

@Repository 
public class SistPDSDAO {
	
	@Autowired //DI (의존성 주입)
	private SqlSessionTemplate sqlSession;
	
	private String ns = "SistPDS.";
	
	public List<SistPDSDTO> getPDSList(){
		return sqlSession.selectList(ns+"getPDSList");
	}
	
	public void uploadPDS(SistPDSDTO dto){
		sqlSession.insert(ns+"uploadPDS", dto);
	}
	
	public SistPDSDTO getPDS(int seq) throws Exception{
		SistPDSDTO dto=sqlSession.selectOne(ns+"getPDS", seq);
		return dto;
	}
	
	public boolean readcount(int seq) throws Exception{
		sqlSession.update(ns+"readcount", seq);
		return true;
	}
	
	public void downloadCount(int seq) throws Exception{
		sqlSession.update(ns+"downloadCount", seq);
	}
	
	public boolean pdsdel(int seq) throws Exception{
		sqlSession.delete(ns+"pdsdel", seq);
		return true;
	}
	
	public void pdsupdate(SistPDSDTO dto){
		sqlSession.update(ns+"pdsupdate", dto);
	}
	
	
}
