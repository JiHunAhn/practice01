package sist.co.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.SistBBSDTO;
import sist.co.model.SistCalendar;
import sist.co.model.SistCalendarParam;

@Repository //저장소
public class SistCalendarDAO {
	
	@Autowired //DI (의존성 주입)
	private SqlSessionTemplate sqlSession;
	
	String ns ="SistCalendar.";
	
	public List<SistCalendar> getCalendarList(SistCalendar fcal) throws Exception{
		List<SistCalendar> callist = new ArrayList<SistCalendar>();
		
		return callist = sqlSession.selectList(ns+"getCalendarList", fcal);
	}
	
	public List<SistCalendar> getDayList(SistCalendar fcal) throws Exception{
		List<SistCalendar> callist = new ArrayList<SistCalendar>();
		
		return callist = sqlSession.selectList(ns+"getDayList", fcal);
	}
	
	public boolean writeCalendar(SistCalendar cal)throws Exception{
		sqlSession.insert(ns+"writeCalendar", cal);
		return true;
	}
	
	public SistCalendar getCal(SistCalendar caldto) throws Exception{
		caldto=sqlSession.selectOne(ns+"getCal", caldto);
		return caldto;
	}
	
	public boolean caldelete(int seq) throws Exception{
		sqlSession.delete(ns+"caldelete", seq);
		return true;
	}
	
	public boolean calupdate(SistCalendar caldto) throws Exception{
		sqlSession.delete(ns+"calupdate", caldto);
		return true;
	}
	
	public List<SistCalendar> getMonthList(SistCalendar fcal) throws Exception{
		List<SistCalendar> callist = new ArrayList<SistCalendar>();
		
		return callist = sqlSession.selectList(ns+"getMonthList", fcal);
	}
	
	public List<SistCalendar> getCalList(SistCalendarParam param) throws Exception{
		List<SistCalendar> callist = new ArrayList<SistCalendar>();
		
		return callist = sqlSession.selectList(ns+"getCalList", param);
	}
	
}
