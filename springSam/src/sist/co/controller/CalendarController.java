package sist.co.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.jdbc.CallableStatement.CallableStatementParamInfo;

import sist.co.Help.CalendarUtil;
import sist.co.Help.myCal;
import sist.co.model.SistCalendar;
import sist.co.model.SistCalendarParam;
import sist.co.model.SistMemberDTO;
import sist.co.service.SistCalendarService;


@Controller
public class CalendarController {
	

	
	private static final Logger logger = LoggerFactory.getLogger(SistBBSController.class);
	
	@Autowired
	private SistCalendarService sistCalendarService;
	
	@RequestMapping(value="calendar.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calendar(HttpServletRequest request, myCal jcal , Model model) throws Exception{
		logger.info("일정게시판 보자" + new Date());
		
		jcal.calculate();
		
		//자기 일정만 봐야 한다.
		String id = ((SistMemberDTO) request.getSession().getAttribute("login")).getId();
		
		//날짜 정보
		String yyyyMm = CalendarUtil.yyyymm(jcal.getYear(), jcal.getMonth());
		
		SistCalendar fcal = new SistCalendar();
		
		//아이디 설정
		fcal.setId(id);
		//날짜설정
		fcal.setWdate(yyyyMm);
		
		List<SistCalendar> flist = sistCalendarService.getCalendarList(fcal);
		
		model.addAttribute("flist", flist);
		model.addAttribute("doc_title", "달력");
		model.addAttribute("jcal", jcal);
		
		return "calendar.tiles";
	}
	
	@RequestMapping(value="callist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String callist(HttpServletRequest request, SistCalendarParam calparam , Model model) throws Exception{
		logger.info("일정리스트 보자" + new Date());
		
		//자기 일정만 봐야 한다.
		String id = ((SistMemberDTO) request.getSession().getAttribute("login")).getId();
		
		//날짜 정보
		String yyyyMmdd = CalendarUtil.yyyymmdd(calparam.getYear(), calparam.getMonth(), calparam.getDay());
		
		SistCalendar fcal = new SistCalendar(-1, id, null, null, yyyyMmdd, null);
		
		List<SistCalendar> flist = sistCalendarService.getDayList(fcal);
		
		model.addAttribute("callist", flist);
		model.addAttribute("doc_title", "날짜별 일정");
		model.addAttribute("year", calparam.getYear());
		model.addAttribute("month", calparam.getMonth());
				
		return "callist.tiles";	
	}
	
	@RequestMapping(value="calwrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calwrite(myCal jcal, Model model) throws Exception{
		logger.info("일정 쓰자" + new Date());
		
		jcal.calculate();
		model.addAttribute("jcal", jcal);
		model.addAttribute("doc_title", "일정 추가");

		return "calwrite.tiles";
	}
	
/*	@RequestMapping(value="calwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calwriteAf(HttpServletRequest request, SistCalendar sistCalendar, Model model) throws Exception{
		logger.info("일정 쓰기 완료" + new Date());
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int hour = Integer.parseInt(request.getParameter("hour"));
		int min = Integer.parseInt(request.getParameter("min"));

		String wdate = ""+year + CalendarUtil.two(month) +CalendarUtil.two(day) +CalendarUtil.two(hour) +CalendarUtil.two(min);
		
		System.out.println("id =" +sistCalendar.getId());
		System.out.println("TITLE =" +sistCalendar.getTitle());
		System.out.println("CONTENT =" +sistCalendar.getContent());
		System.out.println("WDATE =" +wdate);
				
		sistCalendar.setWdate(wdate);
		
		sistCalendarService.writeCalendar(sistCalendar);
		
		return "forward:/calendar.do";
	}
*/
	
	@RequestMapping(value="calwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calwriteAf(HttpServletRequest request, SistCalendarParam calparam, Model model) throws Exception{
		logger.info("일정 쓰기 완료" + new Date());
		
		String yyyyMmdd = CalendarUtil.yyyymmddhhmm(calparam.getYear(), calparam.getMonth(), calparam.getDay(), calparam.getHour(), calparam.getMin());
		SistCalendar fcal = new SistCalendar(calparam.getId(), calparam.getTitle(), calparam.getContent(), yyyyMmdd);
		
		sistCalendarService.writeCalendar(fcal);
		model.addAttribute("year", calparam.getYear());
		model.addAttribute("month", calparam.getMonth());
				
		return "forward:/calendar.do";
	}
	
//DI(의존성 ): 어노테이션
//AOP : 관점 지향 프로그램
//IOC  : 제어의 반전
	
	//디테일
	@RequestMapping(value="caldetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String caldetail(HttpServletRequest request, SistCalendar sistCalendar, Model model) throws Exception{
		logger.info("일정 본다~~  " + new Date());
		
		
		SistCalendar caldto = sistCalendarService.getCal(sistCalendar);
		String wd = caldto.getWdate();
		String year = wd.substring(0, 4);
		String month = CalendarUtil.toOne(wd.substring(4,6))+"";
		String day = CalendarUtil.toOne(wd.substring(6,8))+"";
		String hour = CalendarUtil.toOne(wd.substring(8,10))+"";
		String min = CalendarUtil.toOne(wd.substring(10,12))+"";
		
		String wdate = year+"년 "+month+"월 "+day+"일 "+hour+"시 "+min+"분";
		
		
		String urls = String.format("%s?year=%s&month=%s", "calendar.do", year, month);
				
		model.addAttribute("caldto", caldto);
		model.addAttribute("urls", urls);
		model.addAttribute("wdate", wdate);
		model.addAttribute("doc_title", "일정 보자");
		
		return "caldetail.tiles";
	}
	
	//삭제
    @RequestMapping(value="caldelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String caldelete(int seq) throws Exception{
		logger.info("일정 삭제완료~~  " + new Date());
								
		sistCalendarService.caldelete(seq);
					
		return "redirect:/calendar.do";
	}
    
	//수정
	@RequestMapping(value="calupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calupdate(SistCalendar sistCalendar, Model model) throws Exception{
		logger.info("일정 수정~~  " + new Date());
		
		SistCalendar caldto = null;
		caldto = sistCalendarService.getCal(sistCalendar);
		
		model.addAttribute("doc_title", "일정 고치자");
		model.addAttribute("caldto", caldto);
		
		return "calupdate.tiles";
	}
	
	//수정 완료
	@RequestMapping(value="calupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calupdateAf(SistCalendar caldto, Model model) throws Exception{
		logger.info("일정 수정완료~~  " + new Date());
				
		System.out.println(caldto.toString());
		
		sistCalendarService.calupdate(caldto);
		return "redirect:/calendar.do";
	}
	
	//월별일정
	@RequestMapping(value="calendar3.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calendar3(HttpServletRequest request, SistCalendarParam calparam , Model model) throws Exception{
		logger.info("월별 일정 보자" + new Date());
		
		//자기 일정만 봐야 한다.
		String id = ((SistMemberDTO) request.getSession().getAttribute("login")).getId();
		
		//날짜 정보
		String yyyyMm = CalendarUtil.yyyymm(calparam.getYear(), calparam.getMonth());
		
		SistCalendar fcal = new SistCalendar(-1, id, null, null, yyyyMm, null);
		
		List<SistCalendar> flist = sistCalendarService.getMonthList(fcal);
		
		model.addAttribute("callist", flist);
		model.addAttribute("doc_title", "월별 일정");
		model.addAttribute("year", calparam.getYear());
		model.addAttribute("month", calparam.getMonth());
				
		return "callist.tiles";	
	}
	
	//검색
	@RequestMapping(value="calget.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calget(SistCalendarParam param, Model model) throws Exception{
		logger.info("안녕 검색 리스트!!!! = " + new Date());
		
		model.addAttribute("doc_title", "달력 일정 검색");
		
		//페이지 처리
		
		List<SistCalendar> callist = sistCalendarService.getCalList(param);
		
		model.addAttribute("callist", callist);
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
				
		return "callist.tiles";
	}
	
	//ajax
	@RequestMapping(value="calendar2.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calendar2(myCal jcal, Model model) throws Exception{
		logger.info("안녕 Ajax!!! = " + new Date());
		model.addAttribute("doc_title", "hello Ajax");
		
		jcal.calculate();
		
		//날짜 정보
		String yyyyMm = CalendarUtil.yyyymm(jcal.getYear(), jcal.getMonth());
		
		SistCalendar fcal = new SistCalendar();
		fcal.setWdate(yyyyMm);
		
		model.addAttribute("jcal", jcal);
				
		return "calendar2.tiles";
	}
	
	//ajax
	@RequestMapping(value="calendarjson.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String, List<SistCalendar>> calendarjson(SistCalendar fcal, Model model) throws Exception{
		logger.info("겁나 어려워 Ajax!!! = " + new Date());
		
		List<SistCalendar> flist = sistCalendarService.getDayList(fcal);
		Map<String, List<SistCalendar>> map = new HashMap<String, List<SistCalendar>>();
		map.put("my", flist);
		
		return map;
	}
	
}
