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
import java.lang.Math;
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

import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.CpcheckDto;
import kr.ac.badoogi.dto.CpuseDto;
import kr.ac.badoogi.dto.EmailbnoDto;
import kr.ac.badoogi.service.ManageService;
import kr.ac.badoogi.vo.CouponVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.ManageVo;
import kr.ac.badoogi.vo.Pro_cpimgVo;
@Controller
@RequestMapping("/manager")
public class ManageController {

	
	@Inject
	ManageService manageservice;
	
	
	@RequestMapping(value="/managepage")
	public String managepage()throws Exception{
		return "/manager/event_noti";
	}
	
	//배너,이벤트,공지 insert
	@RequestMapping(value="/manageinsert",method=RequestMethod.POST)
	 public String insert(ImageVo imgvo,ManageVo managevo,String savePath, @RequestParam MultipartFile imageFile,HttpServletRequest request)throws Exception{

		String realfilename="";
		String realPath="";
		if(managevo.getManagecode().equals("ba")){
		Random random=new Random();
		//이미지 처리- userimg
		
		 MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
			Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			
			 realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
			 realPath=savePath+"/"+realfilename;
	
			 File file = new File(realPath);
		
				// 파일 업로드 처리 완료.
				cmf.transferTo(file);
			
		}
		
		imgvo.setRealfilename(realfilename);
		imgvo.setRealPath(realPath);
		managevo.setContent(request.getParameter("smarteditor"));
		manageservice.Insertmanage(imgvo,managevo);
	//서비스 타기
		return "redirect:/manager/managelist";
		
	}
	//다중파일업로드 파일 업로드만 담당
	@RequestMapping("/multipleUpload")
	public void multipleUpload(HttpServletRequest request, HttpServletResponse response){
	 
		try {
	         //파일정보W
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	 
	         //파일 확장자
	          String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" +File.separator+"uploadfile";//사진들어가는 경로
	         
       
	        
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath +"/"+ realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
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
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;
	         sFileInfo += "&sFileURL="+"/resources/uploadfile/"+realFileNm; //사진들어가는경로인데 나는 resources안에 popup안에 uploadfile있다
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	//매니저 관리 배너/공지/이벤트 리스트로
	@RequestMapping(value="/managelist")
	public String managelist(Model model)throws Exception{
		
		List<ManageVo> managevo =manageservice.Managelist();
		model.addAttribute("managevo",managevo);
List<ManageVo> banner= manageservice.Getbanner();
		
		model.addAttribute("BANNER",banner);
		
		
		return "/manager/managelist";
	}
	//매니저읽기 배너/공지/이벤트
	@RequestMapping(value="/readposting")
	public String readposting(int bno,Model model)throws Exception{
		
		ManageVo managevo=manageservice.Readposting(bno);
		model.addAttribute("readmanagevo",managevo);
		return "/manager/readposting";
	}
	
	@RequestMapping(value="/readevent_noti")
	public @ResponseBody ManageVo readevent_noti(int bno)throws Exception{
		ManageVo managevo=manageservice.Readposting(bno);
		return managevo;
	}
	//배너로 옮기기
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
		manageservice.Delbanner(bno);
		
		
	}
	@RequestMapping(value="/delprodisplay")
	public @ResponseBody void Delprodisplay(int bno)throws Exception{
		manageservice.Delprodisplay(bno);
		
	}
	@RequestMapping(value="/getlist")
	public String Getlist(String managecode,Model model)throws Exception{
		
		List<ManageVo> managevo =manageservice.Getlist(managecode);
		model.addAttribute("managevo",managevo);
		
		return "/manager/readevent_noti";
		
	}
	
	@RequestMapping(value="/promotion")
	public String promotion(ImageVo imgvo,String savePath, @RequestParam MultipartFile imageFile,HttpServletRequest request,Model model)throws Exception{
		Random random=new Random();
		//이미지 처리- userimg
		
		 MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
			Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			
			String realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
			String realPath=savePath+"/"+realfilename;
	
			 File file = new File(realPath);
		
				// 파일 업로드 처리 완료.
				cmf.transferTo(file);
				imgvo.setRealfilename(realfilename);
				imgvo.setRealPath(realPath);
				
				model.addAttribute("imgvo",imgvo);
				
				return "/search/realcatesearch";
		
	}
	@RequestMapping("/topromotion")
	public String topromotion()throws Exception{
		return "/manager/promotion";
	}
	@RequestMapping("/insertpromotion")
	public String Insertpromotion(String[] chk, String code,String realfilename,String realPath,Pro_cpimgVo imgvo)throws Exception{
		
		imgvo.setCode(code);
		imgvo.setRealfilename(realfilename);
		imgvo.setRealPath(realPath);
		
		manageservice.Insertpromotion(chk,imgvo);
		return "redirect:/manager/promotionlist";
	}
	
	@RequestMapping("/promotionlist")
	public String Promotionlist(Model model)throws Exception{
		String code="promotion";
		List<Pro_cpimgVo> provo=manageservice.Promotionlist(code);
		List<Pro_cpimgVo> display=manageservice.Getpro_dispaly();
		model.addAttribute("display",display);
		model.addAttribute("provo",provo);
		return "/manager/promotionlist";
	}
	@RequestMapping("/readpromotion")
	public String Readpromotion(int bno,String email,Model model,EmailbnoDto bnodto)throws Exception{
		bnodto.setBno(bno);
		bnodto.setEmail(email);
		Pro_cpimgVo imgvo=manageservice.Readpromotion(bnodto);
		
		model.addAttribute("imgvo",imgvo);
		
		return "/manager/readpromotion";
	}
	@RequestMapping("/readcatepromotion")
	public @ResponseBody List<CatelistDto> readcatepromotion(int bno,String email,EmailbnoDto bnodto)throws Exception{
		bnodto.setBno(bno);
		bnodto.setEmail(email);
		List<CatelistDto> dto=manageservice.Readcatepromotion(bnodto);
		
		return dto;
		
	}
	
	@RequestMapping("/promotiondisplay")
	public String Promotiondisplay(int[] chk) throws Exception{
		
		for(int i=0;i<chk.length;i++){
			 manageservice.Promotiondisplay(chk[i]);
			
		}
		
		return "redirect:/all/page";
	}
	
	@RequestMapping("/coupon")
	public String coupon()throws Exception{
		return "/manager/couponinsert";
	}
	
	 @RequestMapping("/couponupload")
	 public String Couponupload(String savePath,String savePath2,CouponVo couponvo,Pro_cpimgVo imgvo,Model model,
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
			
					// 파일 업로드 처리 완료.
					cmf.transferTo(file);
					cmf2.transferTo(file2);
			imgvo.setCode("coupon");
			imgvo.setRealfilename(realfilename1);
			imgvo.setRealPath(realPath1);//대문사진
			
			couponvo.setRealfilename(realfilename2);
			couponvo.setRealPath(realPath2);
			
			manageservice.Couponupload(couponvo,imgvo);
		 return "redirect:/manager/tocouponlist";
	 }
	 
		@RequestMapping("/tocouponlist")
		public String tocouponlist(Model model)throws Exception{
			String code="coupon";
			List<CouponVo> couponvo=manageservice.Couponlist(code);
			
			model.addAttribute("coupon",couponvo);
			return "/manager/couponlist";
		}
		@RequestMapping("/incoupon")
		public @ResponseBody CouponVo Incoupon(int couponbno)throws Exception{
			
			CouponVo couponvo=manageservice.Incoupon(couponbno);
		
			return couponvo;
		}
		@RequestMapping("/couponcheck")
		public String Couponcheck(String randomnum,String licensenumber,Model model)throws Exception{
			CpcheckDto coupon=manageservice.Couponcheck(licensenumber);
			model.addAttribute("coupon",coupon);
			model.addAttribute("randomnum",randomnum);

			return "/manager/couponcheck";
		}
		
		@RequestMapping("/cpgive")
		public String cpgive(Model model,int couponbno)throws Exception{
			model.addAttribute("couponbno",couponbno);
			return "redirect:/user/userlist";
		}
		
		@RequestMapping("/cptouser")
		public String Cptouser(String[] email,CpuseDto cpdto)throws Exception{
			String  possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			String random="";
			for(int i=0;i<email.length;i++){
				cpdto.setEmail(email[i]);
				
				
				 for(int j=0; j < 5; j++ )
				        random+= possible.charAt((int) Math.floor(Math.random() * possible.length()));
				cpdto.setRandomnum(random);
				cpdto.setStatus("valid");
				manageservice.Cptouser(cpdto);
				 
				random="";
			}
			return "redirect:/manager/tocouponlist";
		}
		
		
}
