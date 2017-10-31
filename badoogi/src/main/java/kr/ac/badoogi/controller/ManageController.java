package kr.ac.badoogi.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.badoogi.service.ManageService;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.ManageVo;

@Controller
@RequestMapping("/manager")
public class ManageController {

	
	@Inject
	ManageService manageservice;
	
	
	@RequestMapping(value="/managepage")
	public String managepage()throws Exception{
		return "/manager/event_noti";
	}
	
	//���,�̺�Ʈ,���� insert
	@RequestMapping(value="/manageinsert",method=RequestMethod.POST)
	 public String insert(ImageVo imgvo,ManageVo managevo,String savePath, @RequestParam MultipartFile imageFile,HttpServletRequest request)throws Exception{

		String realfilename="";
		String realPath="";
		if(managevo.getManagecode().equals("ba")){
		Random random=new Random();
		//�̹��� ó��- userimg
		
		 MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
			Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			
			 realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
			 realPath=savePath+"/"+realfilename;
	
			 File file = new File(realPath);
		
				// ���� ���ε� ó�� �Ϸ�.
				cmf.transferTo(file);
			
		}
		
		imgvo.setRealfilename(realfilename);
		imgvo.setRealPath(realPath);
		managevo.setContent(request.getParameter("smarteditor"));
		manageservice.Insertmanage(imgvo,managevo);
	//���� Ÿ��
		return "redirect:/manager/managelist";
		
	}
	//�������Ͼ��ε� ���� ���ε常 ���
	@RequestMapping("/multipleUpload")
	public void multipleUpload(HttpServletRequest request, HttpServletResponse response){
	 
		try {
	         //��������W
	         String sFileInfo = "";
	         //���ϸ��� �޴´� - �Ϲ� �������ϸ�
	         String filename = request.getHeader("file-name");
	 
	         //���� Ȯ����
	          String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //Ȯ���ڸ��ҹ��ڷ� ����
	         filename_ext = filename_ext.toLowerCase();
	         //���� �⺻���
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //���� �⺻��� _ �󼼰��
	         String filePath = dftFilePath + "resources" +File.separator+"uploadfile";//�������� ���
	         
       
	        
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath +"/"+ realFileNm;
	         ///////////////// ������ ���Ͼ��� ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// ������ ���Ͼ��� /////////////////
	         // ���� ���
	         sFileInfo += "&bNewLine=true";
	         // img �±��� title �Ӽ��� �������ϸ����� ��������ֱ� ����
	         sFileInfo += "&sFileName="+ filename;
	         sFileInfo += "&sFileURL="+"/resources/uploadfile/"+realFileNm; //�������°���ε� ���� resources�ȿ� popup�ȿ� uploadfile�ִ�
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	//�Ŵ��� ���� ���/����/�̺�Ʈ ����Ʈ��
	@RequestMapping(value="/managelist")
	public String managelist(Model model)throws Exception{
		
		List<ManageVo> managevo =manageservice.Managelist();
		model.addAttribute("managevo",managevo);
List<ManageVo> banner= manageservice.Getbanner();
		
		model.addAttribute("BANNER",banner);
		
		
		return "/manager/managelist";
	}
	//�Ŵ����б� ���/����/�̺�Ʈ
	@RequestMapping(value="/readposting")
	public String readposting(int bno,Model model)throws Exception{
		
		ManageVo managevo=manageservice.Readposting(bno);
		model.addAttribute("readmanagevo",managevo);
		return "/manager/readposting";
	}
	
	
	//��ʷ� �ű��
	@RequestMapping(value="/banner")
	public String  banner(int[] chk,String[] managecodearr)throws Exception{
		ManageVo managevo=new ManageVo();
		for(int i=0;i<chk.length;i++){
			managevo.setBno(chk[i]);
			managevo.setManagecode(managecodearr[i]);

			manageservice.Insertbanner(managevo);
		}
		
	return "redirect:/all/page";
	}
	
	@RequestMapping(value="/delbanner")
	public @ResponseBody void delbanner(int bno)throws Exception{
		System.out.println("�񿣵�"+bno);
		manageservice.Delbanner(bno);
		
		
	}
	
	@RequestMapping(value="/getlist")
	public String getlist(String managecode,Model model)throws Exception{
		
		List<ManageVo> managevo =manageservice.Getlist(managecode);
		model.addAttribute("managevo",managevo);
		
		return "/manager/readevent_noti";
		
	}
}
