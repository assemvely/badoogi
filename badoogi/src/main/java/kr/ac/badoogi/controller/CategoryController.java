package kr.ac.badoogi.controller;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
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

import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.service.CategoryService;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.DetailVo;
import kr.ac.badoogi.vo.EntVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.RuleVo;

@Controller
@RequestMapping("/category")
public class CategoryController {

	
	@Inject
	private CategoryService categoryservice;
	
	@RequestMapping(value="/regist")
	public String welcomeregist()throws Exception{						//가족환영페이지
	
		return "/category/category_regist";
	}
	
	
	@RequestMapping(value="/select")
	public String selectcate()throws Exception{							//카테고리 선택
		return "/category/category_select";
	}
	
	@RequestMapping(value="/regist_place")
	public String registplace(String[] category,Model model,HttpSession session)throws Exception{						//상세 입력페이지로
		
		//entvo.setCategoryvo(categoryvo);
		//categoryservice.Insertent(entvo);								//상세페이지로
		if(category!=null)
		session.setAttribute("category",category);
		return "/category/category_regist_place";						
	
	}
	
	@RequestMapping(value="/ent_details")
	public String ent_details(String[] facility,DetailVo detailvo,HttpSession session)throws Exception{
		if(facility!=null)
		session.setAttribute("facility",facility);					//코멘트 페이지로
		session.setAttribute("detailvo", detailvo);
		
		return "/category/category_rules";
	}

	@RequestMapping(value="/insert_entdetails",method=RequestMethod.POST)
	public String insert_entdetails(String savePath,ImageVo imgvo,
			MultipartFile imageFile, MultipartHttpServletRequest request,CategoryVo categoryvo,DetailVo detailvo,RuleVo rulevo,HttpSession session,EntVo entvo)throws Exception{
		//이미지
		Random random=new Random();
		MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
		Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
		//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
		 
		
		String realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
		 String realPath=savePath+"/"+realfilename;
		
		
		 File file = new File(realPath);
	
			// 파일 업로드 처리 완료.
			cmf.transferTo(file);
		
			imgvo.setRealPath(realPath);
			imgvo.setRealfilename(realfilename);
		
		//detail(comment)등을 가지고옴
			String privateor=detailvo.getPrivateor();
			String hashtag=detailvo.getHashtag();
			detailvo=(DetailVo) session.getAttribute("detailvo");
			detailvo.setHashtag(hashtag);
			if(privateor==null||!privateor.equals("Y")){
				//비공개가아니면
				detailvo.setPrivateor("N");
				//공개
			}else{
				//비공개면
			detailvo.setPrivateor(privateor);
			}
		//부대시설 가지고옴-아직 기능구현x
		
	
	
		//넣기
		entvo.setCategory((String[])session.getAttribute("category"));
		entvo.setFacility((String[])session.getAttribute("facility"));
		entvo.setDetailvo(detailvo);
		entvo.setRulevo(rulevo);
		entvo.setCategoryvo(categoryvo);
		entvo.setImgvo(imgvo);
		//서비스로 보냄
		
		categoryservice.Insertent(entvo);
		
		return "redirect:/all/page";
	}
	
	@RequestMapping(value="/categorylist")
	public String categorylist(CatelistDto catelist,Model model)throws Exception{
		String all=catelist.getCategory();
		if(all.equals("All")){
				catelist.setCategory("%%");
			}
			System.out.println("어어"+catelist.getCategory());
		
		
				model.addAttribute("catelist",catelist);												//목록으로 
		return "/category/categorylist";
	}
	@RequestMapping(value="/getlist")
	public @ResponseBody List<CatelistDto> getlist(CatelistDto catelist)throws Exception{
		
		List<CatelistDto> cate=categoryservice.Catelist(catelist);
		
		return cate;
	}
	@RequestMapping(value="/detail")
	public String catedatail(String licensenumber,String email,EntVo ent,Model model)throws Exception{
																			//업체정보 상세보기
		
		EntVo entvo=(EntVo) categoryservice.Entdetail(licensenumber,email,ent);
		System.out.println("엉"+entvo.getEntdetail().getBadoom());
		model.addAttribute("DETAIL",entvo.getEntdetail());
	
		model.addAttribute("FACILITY",entvo.getCatelist());
		return "/category/ent_detail";
		
	}
	
	
	
	/*@RequestMapping(value="/allcatelist")
	public String allcatelist(Model model)throws Exception{
												//모든 카테고리 보기
		List<CatelistDto> cate=categoryservice.Allcatelist();
		model.addAttribute("CATELIST",cate);
		return "/category/categorylist";
	}*/
	
	@RequestMapping(value="/jusoPopup")
	public String jusoPopup( HttpSession session, Model model) throws Exception
	{
	
		return "/popup/jusoPopup";
		
	}
	
	@RequestMapping(value="/Alllist")
	public @ResponseBody List<CatelistDto> Allcatelist(String email)throws Exception{
		
		List<CatelistDto> cate=categoryservice.Allcatelist(email);
		return cate;
	}
}
