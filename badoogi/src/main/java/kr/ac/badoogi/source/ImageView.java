package kr.ac.badoogi.source;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class ImageView {


	public String upload(String savePath,MultipartFile imageFile, MultipartHttpServletRequest request) throws IllegalStateException, IOException{
	
		Random random=new Random();
		//이미지 처리- userimg
		
		
		 MultipartHttpServletRequest imgrequest=(MultipartHttpServletRequest)request;
			Map<String, MultipartFile> files = ((MultipartRequest) imgrequest).getFileMap();
			CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("imageFile");
			//String savePath =request.getServletContext().getRealPath("/resources/managerimg");  
			 
			
			String realfilename=random.nextInt(10000)+cmf.getOriginalFilename();
			 String realPath=savePath+"/"+realfilename;
			
		
			 File file = new File(realPath);
		
				// 파일 업로드 처리 완료.
				cmf.transferTo(file);
				cmf.transferTo(null);
		
		return realfilename;
	}
	

	public ResponseEntity<byte[]> displayFile(String realPath,String realfilename)throws Exception{
		//이미지 출력
		InputStream in=null;
		ResponseEntity<byte[]> entity=null;
		
		try{
		
			HttpHeaders headers=new HttpHeaders();
			in=new FileInputStream(realPath);
			realfilename=realfilename.substring(realfilename.indexOf("_")+1);
			
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Contents-Disposition",  "attachment; realfilename=\""+new String(realfilename.getBytes("UTF-8"),"ISO-8859-1")+"\"");
				entity=new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
				System.out.println("여긴트라이");
		}catch(Exception e){
		System.out.println("여긴캐치");
			entity=new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	
		}finally{
			in.close();
		}
	
		return entity;
	}
}
