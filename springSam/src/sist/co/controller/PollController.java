package sist.co.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sist.co.Help.PollBean;
import sist.co.model.SistMemberDTO;
import sist.co.model.SistPollDTO;
import sist.co.model.SistVoter;
import sist.co.service.SistPollService;

@Controller
public class PollController {
	
	@Autowired
	private SistPollService sistPollService;
	
	private static final Logger logger = LoggerFactory.getLogger(PollController.class);
	
	@RequestMapping(value="polllist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polllist(HttpServletRequest request, Model model) throws Exception{
		logger.info("투표보자" + new Date());
		
		String id = ((SistMemberDTO)request.getSession().getAttribute("login")).getId();
		model.addAttribute("doc_title", "투표 리스트");
		model.addAttribute("plists",sistPollService.getPollAllList(id));
		
		return "polllist.tiles";
	}
	
	//make로 이동
	@RequestMapping(value="pollmake.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pollmake(Model model) throws Exception{
		logger.info("투표 만들자" + new Date());
		model.addAttribute("doc_title", "투표 만들기");
		return "pollmake.tiles";
	}
	
	//make 완성
	@RequestMapping(value="pollmakeAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pollmakeAf(PollBean pbean, Model model) throws Exception{
		logger.info("투표 만들기 완성" + new Date());
		
		sistPollService.makePoll(pbean);
		
		return "redirect:/polllist.do";
	}
	
	//디테일
	@RequestMapping(value="polldetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polldetail(SistPollDTO poll, Model model) throws Exception{
		logger.info("투표 보기" + new Date());
		
		model.addAttribute("doc_title", "투표 보기");
		model.addAttribute("poll", sistPollService.getPoll(poll));
		model.addAttribute("pollsublist", sistPollService.getPollSubList(poll));
		
		return "polldetail.tiles";
	}
	
	//투표
	@RequestMapping(value="polling.do", method={RequestMethod.GET, RequestMethod.POST})
	public String polling(SistVoter voter, Model model) {
		logger.info("polling " + new Date());
		
		sistPollService.polling(voter);
		
		return "redirect:/polllist.do";
	}
	
	//투표 결과
	@RequestMapping(value="pollresult.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pollresult(SistPollDTO poll, Model model) {		// poll -> 문제 번호
		logger.info("pollresult " + new Date());
		
		model.addAttribute("doc_title", "투표 결과");
		
		model.addAttribute("poll", sistPollService.getPoll(poll));	// 문제
		model.addAttribute("pollsublist", sistPollService.getPollSubList(poll));	// 보기
		
		return "pollresult.tiles";
	}
}














