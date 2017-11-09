package kr.ac.badoogi.controller;




import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.badoogi.service.ManageService;
import kr.ac.badoogi.vo.ManageVo;
import kr.ac.badoogi.vo.Pro_cpimgVo;

@Controller
@RequestMapping("/all")
public class AllController {

	
	@Inject
	ManageService manageservice;
	
	@RequestMapping(value="/page")
	public String home(Model model)throws Exception{
		//배너불러오기

		List<ManageVo> managevo=manageservice.Getbanner();
		model.addAttribute("BANNER",managevo);
		
		//기획전불러오기
		List<Pro_cpimgVo> provo=manageservice.Getpro_dispaly();
		model.addAttribute("PROMOTION",provo);
		return "homemain";
	}
	
	@RequestMapping(value="/more")
	public String more()throws Exception{
		
		return "more";
	}
}
