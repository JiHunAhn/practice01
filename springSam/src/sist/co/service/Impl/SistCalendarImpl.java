package sist.co.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sist.co.model.SistCalendar;
import sist.co.model.SistCalendarParam;
import sist.co.service.SistCalendarDAO;
import sist.co.service.SistCalendarService;

@Service
public class SistCalendarImpl implements SistCalendarService{

	@Autowired
	private SistCalendarDAO SistCalendarDAO;
	
	@Override
	public List<SistCalendar> getCalendarList(SistCalendar fcal) throws Exception {
		
		return SistCalendarDAO.getCalendarList(fcal) ;
	}

	@Override
	public List<SistCalendar> getDayList(SistCalendar fcal) throws Exception {
		
		return SistCalendarDAO.getDayList(fcal) ;
	}

	@Override
	public boolean writeCalendar(SistCalendar cal) throws Exception {
		return SistCalendarDAO.writeCalendar(cal);
	}

	@Override
	@Transactional(readOnly=true)
	public SistCalendar getCal(SistCalendar caldto) throws Exception {
		
		return SistCalendarDAO.getCal(caldto);
	}

	@Override
	public boolean caldelete(int seq) throws Exception {
		
		return SistCalendarDAO.caldelete(seq);
	}

	@Override
	public boolean calupdate(SistCalendar caldto) throws Exception {
		return SistCalendarDAO.calupdate(caldto);
	}

	@Override
	public List<SistCalendar> getMonthList(SistCalendar fcal) throws Exception {
		
		return SistCalendarDAO.getMonthList(fcal);
	}

	@Override
	public List<SistCalendar> getCalList(SistCalendarParam param) throws Exception {
		return SistCalendarDAO.getCalList(param);
	}
	
	
	

	
	
}
