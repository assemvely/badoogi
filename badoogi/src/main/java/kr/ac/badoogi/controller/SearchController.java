package kr.ac.badoogi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	
	@RequestMapping(value="location")
	public String location()throws Exception{
		return "/search/location";
	}

}
