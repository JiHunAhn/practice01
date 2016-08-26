package sist.co.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sist.co.model.SistMemberDTO;
import sist.co.model.YesMember;
import sist.co.service.SistMemberService;

@Controller
public class SistMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(SistMemberController.class);
	
	@Autowired
	SistMemberService sistMemberService;
	
	//system 아웃은 무거우니 logger 사용하자
	//Model은 디폴트 값이라고 생각하자
	@RequestMapping(value="login.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login(Model model){
		logger.info("안녕 로그인!!!! = " + new Date());
		return "login.tiles";
	}
	
	@RequestMapping(value="regi.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regi(Model model){
		logger.info("뉴비가 나타났다~~~~~  " + new Date());
		return "regi.tiles";
	}
	
	@RequestMapping(value="regiAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String regiAf(SistMemberDTO member, Model model) throws Exception{
		logger.info("뉴비 등록한다~~  " + new Date());
		
		//확인용
		System.out.println("id =" +member.getId());
		System.out.println("pwd =" +member.getPwd());
		System.out.println("name =" +member.getName());
		System.out.println("email =" +member.getEmail());
		
		//db로 이동(mybatis)
		sistMemberService.addMember(member);
				
		return "login.tiles";
	}
	
	@RequestMapping(value="loginAf.do", method=RequestMethod.POST)
	public String loginAf(HttpServletRequest request, SistMemberDTO member, Model model) throws Exception {
		logger.info("로그인 한다~~  " + new Date());
		
		//세션 저장
		SistMemberDTO login=null;
		login=sistMemberService.login(member);
		
		if(login !=null && !login.getId().equals("")){
			request.getSession().setAttribute("login", login);
			return "redirect:/bbslist.do";
		}else{
			logger.info("로그인 실패");
			return "login.tiles";
		}
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request, Model model) throws Exception{
		logger.info("로그아웃한다~~  " + new Date());
		
			request.getSession().invalidate();
			return "login.tiles";
	}
	
	@RequestMapping(value="getID.do", method=RequestMethod.POST)
	@ResponseBody
	public YesMember getID(SistMemberDTO member, Model model) {
		logger.info("아이디 찾는다~~  " + new Date());
		
		int count=sistMemberService.getID(member);
		YesMember yes=new YesMember();
		
		if(count >0){
			yes.setMessage("Sucs");
		}else{
			yes.setMessage("Fail");
		}
		return yes;
	}
	
	

	
}
