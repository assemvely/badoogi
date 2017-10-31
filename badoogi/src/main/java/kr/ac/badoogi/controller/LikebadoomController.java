package kr.ac.badoogi.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.badoogi.service.LikebadoomService;
import kr.ac.badoogi.vo.LikebadoomVo;

@Controller
@RequestMapping(value="/likebadoom")
public class LikebadoomController {
	
	@Inject
	LikebadoomService lbservice;
	
	@RequestMapping("/insert")
	public void insert(LikebadoomVo lbvo)throws Exception{
		lbservice.Insertlb(lbvo);
	}
	
	@RequestMapping("/delete")
	public void delete(LikebadoomVo lbvo)throws Exception{
		lbservice.Delete(lbvo);
	}
	@RequestMapping("/getlist")
	public @ResponseBody List<LikebadoomVo> getlist(String email)throws Exception{
		 List<LikebadoomVo> lbvo=lbservice.Getlist(email);
		 return lbvo;
	}

}
