package sist.co.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.jdbc.CallableStatement.CallableStatementParamInfo;

import sist.co.Help.FUpUtil;
import sist.co.model.SistPDSDTO;
import sist.co.service.SistPDSService;

@Controller
public class PdsController {

	private static final Logger logger = LoggerFactory.getLogger(SistBBSController.class);
	
	@Autowired
	private SistPDSService sistPDSService;
	
	@RequestMapping(value="pdslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdslist(Model model) throws Exception{
		logger.info("자료실 게시판 보자" + new Date());
		
		List<SistPDSDTO> pdslist =  sistPDSService.getPDSList();
		
		model.addAttribute("doc_title", "자료실 리스트");
		model.addAttribute("pdslist", pdslist);
		
		
		return "pdslist.tiles";
	}
	
	@RequestMapping(value="pdswrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdswrite(Model model) throws Exception{
		logger.info("자료 올려보자" + new Date());
		model.addAttribute("doc_title", "자료실 올리기");
		
		return "pdswrite.tiles";
	}
	
	@RequestMapping(value="pdsupload.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pdsupload(SistPDSDTO pdsdto, HttpServletRequest request, @RequestParam(value="fileload", required=false) MultipartFile fileload, Model model) throws Exception{
		logger.info("자료 올렸다." + new Date());
		
		pdsdto.setFilename(fileload.getOriginalFilename());
		
		String fupload = request.getServletContext().getRealPath("/upload");
		//폴더에 올릴때		//String fupload ="c:\\upload";
		logger.info("fupload= "+fupload);
		
		String f = pdsdto.getFilename();
		String newFile = FUpUtil.getNewFile(f);
		logger.info("newFile= "+newFile);
		
		pdsdto.setFilename(newFile);
		
		try{
		   File file = new File(fupload+"/"+newFile);
		   FileUtils.writeByteArrayToFile(file, fileload.getBytes());
		   sistPDSService.uploadPDS(pdsdto);
		   logger.info("업로드 성공~");
		}catch (IOException e) {
			logger.info("업로드 그지같네");
		}
        		
		
		return "redirect:/pdslist.do";
	}
	
	//디테일
		@RequestMapping(value="pdsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
		public String pdsdetail(int seq, Model model) throws Exception{
			logger.info("자료실 본다~~  " + new Date());
			
			model.addAttribute("doc_title", "자료실 게시판 보기");
			sistPDSService.readcount(seq);
			SistPDSDTO pds = sistPDSService.getPDS(seq);
			model.addAttribute("pds", pds);
			
			return "pdsdetail.tiles";
		}
		
		//삭제
		@RequestMapping(value="pdsdel.do", method={RequestMethod.GET, RequestMethod.POST})
		public String pdsdel(int seq) throws Exception{
			logger.info("삭제 한다~~  " + new Date());
			
			sistPDSService.pdsdel(seq);
			
			
			return "redirect:/pdslist.do";
		}
		
		//수정이동
		@RequestMapping(value="pdsupdate.do", method={RequestMethod.GET, RequestMethod.POST})
		public String pdsupdate(int seq, Model model) throws Exception{
			logger.info("수정 한다~~  " + new Date());
			
			model.addAttribute("doc_title", "자료실 수정하기");
			SistPDSDTO pds = sistPDSService.getPDS(seq);
			model.addAttribute("pds", pds);
			
			return "pdsupdate.tiles";
		}
		
		//수정완료
		@RequestMapping(value="pdsupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
		public String pdsupdateAf(SistPDSDTO pdsdto, String namefile, HttpServletRequest request, @RequestParam(value="fileload", required=false) MultipartFile fileload, Model model) throws Exception{
			logger.info("자료 수정한다." + new Date());
						
			pdsdto.setFilename(fileload.getOriginalFilename());
			String fupload = request.getServletContext().getRealPath("/upload");
			//폴더에 올릴때		//String fupload ="c:\\upload";
			
			if(pdsdto.getFilename() != null && !pdsdto.getFilename().equals("")){
				String f = pdsdto.getFilename();
				String newFile = FUpUtil.getNewFile(f);
				
				pdsdto.setFilename(newFile);
				try{
					File file = new File(fupload+"/"+newFile);
					FileUtils.writeByteArrayToFile(file, fileload.getBytes());
					sistPDSService.pdsupdate(pdsdto);
				}catch (IOException e) {
					logger.info("수정 그지같네");
				}
			}else{
				if(namefile !=null && !namefile.equals("")){
					pdsdto.setFilename(namefile);
					sistPDSService.pdsupdate(pdsdto);
				}else{
					logger.info("수정 그지같네");
				}
			}
			return "redirect:/pdslist.do";
		}
		
		//다운로드
    	@RequestMapping(value="fileDownload.do", method={RequestMethod.GET, RequestMethod.POST})
		public String download(int seq, HttpServletRequest request, String filename, Model model) throws Exception{
			logger.info("자료 다운받는다. seq = "+seq+" , filename = "+ filename +"  "+ new Date());
			
			String fupload = request.getServletContext().getRealPath("/upload");
			//폴더에 올릴때		//String fupload ="c:\\upload\\";
			
			File downloadFile = new File(fupload+"/"+filename);
			
			model.addAttribute("downloadFile", downloadFile);
			model.addAttribute("seq", seq);
			
			return "downloadView";
    	}

}
