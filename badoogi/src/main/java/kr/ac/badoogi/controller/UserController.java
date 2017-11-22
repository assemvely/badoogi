package kr.ac.badoogi.controller;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.ac.badoogi.dto.CpuseDto;
import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.service.UserService;
import kr.ac.badoogi.source.ImageView;
import kr.ac.badoogi.vo.CouponVo;
import kr.ac.badoogi.vo.LicenseeVo;
import kr.ac.badoogi.vo.UserVo;


@Controller
@RequestMapping("/user")
public class UserController {

	
	@Inject
	private UserService userservice;
	

	
	
	@RequestMapping(value="/userjoin")
	public String tojoinpage()throws Exception{							//�Ϲ��� ����
		return "/login_join/join";
	}

	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String Insertuser(String savePath,Model model,UserVo uservo,MultipartFile imageFile,      MultipartHttpServletRequest request)throws Exception{			//�Ϲ��� ���Է���
		Random random=new Random();
		//�̹��� ó��- userimg
		
		
		 MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
			Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			
			String realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
			 String realPath=savePath+"/"+realfilename;
	
			 File file = new File(realPath);
		
				// ���� ���ε� ó�� �Ϸ�.
				cmf.transferTo(file);
		  
		uservo.setRealfilename(realfilename);
		uservo.setRealPath(realPath);
		
		userservice.Insertuser(uservo);
		
		model.addAttribute("realPath",realPath);
		model.addAttribute("realfilename",realfilename);
		return "userinfo";
		
	}
	
	@RequestMapping(value="/entjoin")
	public String Insertent()throws Exception{							//��ü����
					
		return "/login_join/licensenumber";								//license �Է�â���� �Ѿ
	}


	@RequestMapping(value="/license_join",method=RequestMethod.POST)
	public String license_join(LicenseeVo licenseevo,Model model)throws Exception{	//����� ��Ϲ�ȣ
		model.addAttribute("licesenumber",licenseevo.getLicensenumber());
		return "/login_join/ent_join";									//��ü�������� �Ѿ
	}
	
	@RequestMapping(value="/ent_licensee",method=RequestMethod.POST)
	public String ent_licnesee(String savePath,String savePath2,LicenseeVo licenseevo,UserVo ent_uservo,Model model,
			MultipartFile imageFile,MultipartFile imageFile2,
			 MultipartHttpServletRequest request, MultipartHttpServletRequest request2,
			 HttpServletResponse response)throws Exception{
		
		Random random=new Random();
		Map<String, MultipartFile> files = ((MultipartRequest) request).getFileMap();
		Map<String, MultipartFile> files2 = ((MultipartRequest) request).getFileMap();
		
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			CommonsMultipartFile cmf2 = (CommonsMultipartFile) files.get("imageFile2");
			
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			
			String realfilename1=random.nextInt(10000)+cmf.getOriginalFilename();
			 String realPath1=savePath+"/"+realfilename1;
			
			String realfilename2=random.nextInt(10000)+cmf2.getOriginalFilename();
			 String realPath2=savePath2+"/"+realfilename2;
			
			 File file = new File(realPath1);
			 File file2 = new File(realPath2);
		
				// ���� ���ε� ó�� �Ϸ�.
				cmf.transferTo(file);
				cmf2.transferTo(file2);
		  ent_uservo.setRealfilename(realfilename1);
		  ent_uservo.setRealfilename2(realfilename2);
		  ent_uservo.setRealPath(savePath);
		  ent_uservo.setRealPath2(savePath2);
		  
		  
		userservice.Insertent_licensee(licenseevo,ent_uservo);
		
		return "/login_join/ent_done";
	}
	
	@RequestMapping(value="/loginpage") 									//LOGIN��������
	public String loginpage()throws Exception{
		return "/login_join/login";
	}
	
	@RequestMapping(value="/login", method={RequestMethod.POST, RequestMethod.GET})
	public String login(LoginDto logindto,HttpSession session) throws Exception{ 
																	//login����
		String path="";
		
		LoginDto login=userservice.Login(logindto);
	
			if(login==null){
					path="/login_join/login";											//�α��ν���
			}else{
					if(login.getAdmission().equals("N")){							//���γ����������
							path="/category/denied";
					}else{															//���ν�
			
							session.setAttribute("login",login);	//��������
								
								
							if(login.getUsercode().equals("ent")){							//���γ� ���
									if(login.getStorename()==null){
								path="/category/category_regist";
								}else{
									path="redirect:/all/page";
								}
							
							}else{															//�Ϲ� �����
								path="redirect:/all/page";
							}
			
					}
		
			}
		return path;
	}

	@RequestMapping(value="/showimg")
	public ResponseEntity<byte[]> userimg(String realPath,String realfilename,Model model)throws Exception{
		ImageView imgview=new ImageView();
		
	
		ResponseEntity<byte[]> entity=imgview.displayFile(realPath, realfilename);
		return entity;
	}

	@RequestMapping(value="/userlist")
	public String userlist(Model model)throws Exception{
		
		List<UserVo> uservo=userservice.Userlist();
		List<UserVo> entvo=userservice.Entlist();
		model.addAttribute("uservo",uservo);
		model.addAttribute("entvo",entvo);
		
		return "/user/userlist";
	}

	@RequestMapping(value="/cpgive")
public String cpgive(Model model,int couponbno)throws Exception{
		
		List<UserVo> uservo=userservice.Userlist();
		List<UserVo> entvo=userservice.Entlist();
		model.addAttribute("uservo",uservo);
		model.addAttribute("entvo",entvo);
		model.addAttribute("couponbno",couponbno);
		
		return "/user/userlist";
	}

	@RequestMapping("/mycoupon")
	public String Mycoupon(String email,Model model)throws Exception{
	
		List<CouponVo> couponvo=userservice.Mycoupon(email);
		model.addAttribute("coupon",couponvo);
		return "/manager/couponlist";
	}
	
	@RequestMapping("/changestatus")
	public @ResponseBody String Changestatus(CpuseDto cpdto)throws Exception{
		String done="";
		cpdto.setStatus("used");
		userservice.Changestatus(cpdto);
		return done;
	}
}
