package kr.ac.badoogi.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.badoogi.service.CommunityService;
import kr.ac.badoogi.vo.CommunityVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.UserVo;

@Controller
@RequestMapping("/community")
public class CommunityController {

	
	@Inject
	CommunityService communityservice;
	@RequestMapping(value="/uploadpage")
	public String uploadpage()throws Exception{
		
		
		return "/community/uploadcommunity";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(ImageVo imgvo,CommunityVo commuvo,String savePath,MultipartFile imageFile,HttpServletRequest request)throws Exception{
		
		Random random=new Random();
		//이미지 처리- userimg
		
		 MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
			Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			
			String realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
			String  realPath=savePath+"/"+realfilename;
	
			 File file = new File(realPath);
		
				// 파일 업로드 처리 완료.
				cmf.transferTo(file);
				imgvo.setRealfilename(realfilename);
				imgvo.setRealPath(realPath);
				
				String privateor=commuvo.getPrivateor();
	
				if(privateor==null||!privateor.equals("Y")){
							commuvo.setPrivateor("N");
				}else{
					commuvo.setPrivateor(privateor);
				}
				
				communityservice.Upload(imgvo,commuvo);
		return"redirect:/all/page";
	}

	@RequestMapping("/commulist")
	public String commulist(String email,Model model,HttpSession session)throws Exception{
	
		List<CommunityVo> commu=communityservice.Communitylist(email);
		model.addAttribute("commuvo",commu);
		return "/community/commulist";
	}
	
	//좋아요
	
	
	@RequestMapping("/detail")
	public String detail(CommunityVo commuvo,Model model)throws Exception{
		
		CommunityVo commu=communityservice.Detail(commuvo);
		model.addAttribute("commuvo",commu);
		return "/community/readupload";
	}
	
	@RequestMapping("/changeprivate")
	public  @ResponseBody void changeprivateor(CommunityVo commuvo)throws Exception{

		communityservice.Changeprivate(commuvo);
	}
	
	@RequestMapping("/personallist")
	public String personallist(String email,Model model)throws Exception{
	
		model.addAttribute("email",email);
		return "/community/personallist";
		
	}
	
	@RequestMapping("/personal")
	public @ResponseBody List<CommunityVo> personal(String email) throws Exception{
	
		List<CommunityVo> commuvo=communityservice.Personallist(email);
		
		
		return commuvo;
	}
	
	
}
