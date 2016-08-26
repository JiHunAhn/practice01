package sist.co.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sist.co.model.SistBBSDTO;
import sist.co.model.SistBBSParam;
import sist.co.model.SistMemberDTO;
import sist.co.service.SistBBSService;

@Controller
public class SistBBSController {
	
	private static final Logger logger = LoggerFactory.getLogger(SistBBSController.class);
	
	@Autowired
	private SistBBSService sistBBSService;
	
	@RequestMapping(value="bbslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbslist(SistBBSParam param, Model model) throws Exception{
		logger.info("안녕 게시판 리스트!!!! = " + new Date());
		
		/*List<SistBBSDTO> bbslist = sistBBSService.getBBSList();
		model.addAttribute("bbslist", bbslist);*/
		
		model.addAttribute("doc_title", "BBS 글목록");
		
		//페이지 처리
		int sn=param.getPageNumber();
		int start=(sn)*param.getRecordCountPerPage()+1;
		int end=(sn+1)*param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		int totalRecordCount = sistBBSService.getBBSCount(param);
		List<SistBBSDTO> bbslist = sistBBSService.getBBSPagingList(param);
		
		model.addAttribute("bbslist", bbslist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", 10);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("s_category", param.getS_category());
		model.addAttribute("s_keyword", param.getS_keyword());
				
		return "bbslist.tiles";
	}

	//write form으로 이동하는 메소드
	@RequestMapping(value="bbswrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbswrite(Model model) throws Exception{
		logger.info("안녕 글작성하기 = " + new Date());
		
		model.addAttribute("doc_title", "BBS 글작성");
		
		return "bbswrite.tiles";
	}
	
	//write form에 입력한 걸 DB에 등록하는 메소드
	@RequestMapping(value="bbswriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbswriteAf(SistBBSDTO bbs, Model model) throws Exception{
		logger.info("글 등록한다~~  " + new Date());
		
		if(bbs.getContent().equals("")||bbs.getTitle().equals("")){
			return "redirect:/bbslist.do";
		}
		//확인용
		System.out.println("id =" +bbs.getId());
		System.out.println("title =" +bbs.getTitle());
		System.out.println("content =" +bbs.getContent());
		
		//db로 이동(mybatis)
		sistBBSService.writeBBS(bbs);
				
		return "redirect:/bbslist.do";
	}
	
	
	//디테일
	@RequestMapping(value="bbsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsdetail(SistBBSDTO bbs, Model model) throws Exception{
		logger.info("글 본다~~  " + new Date());
		
		model.addAttribute("doc_title", "글 보자");
		
		SistBBSDTO rbbs = null;
		sistBBSService.readcount(bbs.getSeq());
		rbbs=sistBBSService.getBBS(bbs);
		
		model.addAttribute("rbbs", rbbs);
		
		return "bbsdetail.tiles";
	}
	
	//수정
	@RequestMapping(value="bbsupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsupdate(SistBBSDTO bbs, Model model) throws Exception{
		logger.info("글 수정~~  " + new Date());
		
		SistBBSDTO rbbs =sistBBSService.getBBS(bbs);
		
		model.addAttribute("doc_title", "글 고치자");
		model.addAttribute("bbs", rbbs);
		
		return "bbsupdate.tiles";
	}
	
	//수정 완료
	@RequestMapping(value="bbsupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsupdateAf(SistBBSDTO bbs, Model model) throws Exception{
		logger.info("글 수정완료~~  " + new Date());
					
		System.out.println(bbs.toString());
		
		sistBBSService.bbsupdate(bbs);
		return "redirect:/bbslist.do";
	}
	
	//삭제
	@RequestMapping(value="bbsdelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsdelete(int seq) throws Exception{
		logger.info("글 삭제완료~~  " + new Date());
							
		sistBBSService.bbsdelete(seq);
				
		return "redirect:/bbslist.do";
	}
	
	//답글이동
	@RequestMapping(value="bbsreply.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsreply(SistBBSDTO bbs, Model model) throws Exception{
		logger.info("답글달기~~  " + new Date());
		
		SistBBSDTO rbbs =sistBBSService.getBBS(bbs);
		
		model.addAttribute("bbs", rbbs);
		model.addAttribute("doc_title", "답글달자");

		return "bbsreply.tiles";
	}
	
	//답글 완료
	@RequestMapping(value="bbsreplyAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String bbsreplyAf(SistBBSDTO bbs, Model model) throws Exception{
		logger.info("답글완료~~  " + new Date());
		
		boolean isS= false;
		try{
			sistBBSService.reply(bbs);
			isS=true;
		}catch (Exception e) {
		}
		
		if(isS){
			return "redirect:/bbslist.do";
		}else{
			return "redirect:/bbslist.do";
		}
	}
	

}