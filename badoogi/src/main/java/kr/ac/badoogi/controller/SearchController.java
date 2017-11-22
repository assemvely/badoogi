package kr.ac.badoogi.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.LocationDto;
import kr.ac.badoogi.dto.SearchDto;
import kr.ac.badoogi.service.SearchService;
import kr.ac.badoogi.source.GpsToAddress;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.CommunityVo;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Inject
	SearchService searchservice;
	@RequestMapping(value="location")
	public String location()throws Exception{
		return "/search/location";
	}
	
	@RequestMapping(value="commusearch")
	public String commusearch()throws Exception{
		return "/search/commusearch";
	}
	@RequestMapping(value="searchpage")
	public String searchpage(SearchDto dto, String keyword,Model model)throws Exception{
		
		model.addAttribute("dto",keyword+"검색결과입니다");
		dto.setKeyword(dto.getKeyword());
		
		List<CommunityVo> commuvo=searchservice.Commusearch(dto);
		model.addAttribute("commuvo",commuvo);
		return "/community/commulist";
	}
	
	@RequestMapping(value="catehash")
	public String Getsearch(String email,String keyword,SearchDto dto,Model model)throws Exception{

		
		model.addAttribute("keyword",keyword);
		List<CatelistDto> catedto=searchservice.Getsearch(dto);
		model.addAttribute("catedto",catedto);
		return "/category/searchcate";
	}
/*	@RequestMapping("/commulistsearch")
	public @ResponseBody List<CommunityVo> Commusearch(String keyword,SearchDto dto)throws Exception{
		dto.setKeyword("%"+dto.getKeyword()+"%");
	
		List<CommunityVo> commuvo=searchservice.Commusearch(dto);
	
		return commuvo;
	}*/
	@RequestMapping("/locadetail")
	public String location(String location,Model model)throws Exception{
		
		model.addAttribute("location",location);
		return "/search/locadetail";
		
	}
	

	
	@RequestMapping("/mygps")
	public String mygps(String email,String city,LocationDto locadto,Model model)throws Exception{

		JSONParser parser = new JSONParser();


		
			  URLConnection conn = null;         
	            BufferedReader br = null;   
	            BufferedWriter bw = null;

			
			  //�쐞移� 諛쏆븘�샂.
            
            conn = new URL("https://ipapi.co/json/").openConnection();   
            conn.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");   
         
            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            JSONObject br1 = (JSONObject)parser.parse(br);
    

             Double latitude = (Double)br1.get("latitude");
             Double longitude = (Double)br1.get("longitude");
             
             GpsToAddress gps = new GpsToAddress(latitude, longitude);
             String gps1=gps.getAddress().replaceAll("[\\S]+(구|군)\\s[\\S]+(면|동).*","");
             String realgps=gps1.replaceAll("[\\S]+(국)\\s","");
     		
     		
     		locadto.setEmail(email);
    		locadto.setCity(locadto.getCity());
    		
    		List<CatelistDto> catedto=searchservice.Getcatesearch(locadto);
    		model.addAttribute("keyword",realgps);
     		model.addAttribute("catedto",catedto);
		return "/category/searchcate";
	}
/*	@RequestMapping("/getcatesearch")
	public @ResponseBody List<CatelistDto> Getcatesearch(String email,String city,LocationDto locadto)throws Exception{
		//dto.setCity(mygps);
		locadto.setEmail(email);
		locadto.setCity(locadto.getCity()+"%");
		
		List<CatelistDto> catedto=searchservice.Getcatesearch(locadto);
	
		return catedto;
	}*/
	@RequestMapping("/catesearch")
	public String catesearch(String[] chk,Model model)throws Exception{
		
		
		return "/search/search";
	}


	
}
