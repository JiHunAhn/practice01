package sist.co.service;

import java.util.List;

import sist.co.model.SistCalendar;
import sist.co.model.SistCalendarParam;

public interface SistCalendarService {
	
	public List<SistCalendar> getCalendarList(SistCalendar fcal) throws Exception;
	
	public List<SistCalendar> getDayList(SistCalendar fcal) throws Exception;
	
	public boolean writeCalendar(SistCalendar cal)throws Exception;
	
	public SistCalendar getCal(SistCalendar caldto) throws Exception;
	
	public boolean caldelete(int seq) throws Exception;
	
	public boolean calupdate(SistCalendar caldto) throws Exception;
	
	public List<SistCalendar> getMonthList(SistCalendar fcal) throws Exception;
	
	public List<SistCalendar> getCalList(SistCalendarParam param) throws Exception;

}
