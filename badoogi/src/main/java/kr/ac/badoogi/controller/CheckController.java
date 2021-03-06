package kr.ac.badoogi.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.badoogi.dto.EntinfoDto;
import kr.ac.badoogi.service.CheckService;
import kr.ac.badoogi.vo.CheckVo;

@Controller
@RequestMapping("/check")
public class CheckController {

	
	@Inject
	private CheckService checkservice;
	
	
	@RequestMapping(value="/nickoverlap",method=RequestMethod.GET)
	public @ResponseBody String Nickoverlap(CheckVo checkvo)throws Exception{
		
		String nick= checkservice.Nickoverlap(checkvo);
		
		return nick;
		}
	
	@RequestMapping(value="/emailoverlap",method=RequestMethod.GET)
	public @ResponseBody String Emailoverlap(CheckVo checkvo)throws Exception{
		
		String email=checkservice.Emailoverlap(checkvo);
	
		return email;
	}
	
	@RequestMapping(value="/storenamefind",method=RequestMethod.GET)
	public @ResponseBody List<EntinfoDto> Storename(String storename)throws Exception{
		List<EntinfoDto> entinfo=checkservice.Storename(storename);
		return entinfo;
		
	}
}
