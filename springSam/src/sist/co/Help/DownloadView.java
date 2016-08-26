package sist.co.Help;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import sist.co.service.SistPDSService;

public class DownloadView extends AbstractView {

	@Autowired
	private SistPDSService sistPDSService;
	
	public DownloadView(){
		setContentType("application/download; charset=utf-8"); 
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//AbstractView == 커스텀 뷰(사용자 뷰)
		System.out.println("랜더링 어쩌고 저쩌고~~~");
		
		File file = (File)model.get("downloadFile");
		
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		
		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String filename = null;
		
		if(ie){
			filename = URLEncoder.encode(file.getName(), "utf-8");
		}else{
			filename = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
		}
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Length", "" + file.length());
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        
        OutputStream out = response.getOutputStream();
        FileInputStream fi = null;
        
        
        try{
            fi = new FileInputStream(file);
            FileCopyUtils.copy(fi, out);
            int seq = (Integer)model.get("seq");
            
            sistPDSService.downloadCount(seq);
        }catch(IOException e){
        	System.out.println("망했어 " + e);
        }finally{
        	if(fi != null){
        		try{
        			fi.close();
        		}catch (IOException e1) {
				}
        	}
        	out.flush();
        }


	}

}
