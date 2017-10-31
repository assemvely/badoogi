package kr.ac.badoogi.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.badoogi.service.ReplyService;
import kr.ac.badoogi.vo.ReplyVo;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	
	@Inject
	ReplyService replyservice;
	
	//º» ´ñ±Û »ðÀÔ
	@RequestMapping("/insertreply")
	public @ResponseBody void insertreply(ReplyVo replyvo)throws Exception{

		replyservice.Insertreply(replyvo);
	}
	
	
	//´ë´ñ »ðÀÔ
	@RequestMapping("/insertsubreply")
	public @ResponseBody void insertsubreply(ReplyVo replyvo)throws Exception{
			System.out.println("¤·¤·");
		replyservice.Insertsubreply(replyvo);
	}
	
	//´ñ±Û²ø°í¿À±â
	@RequestMapping("/replylist")
	public @ResponseBody List<ReplyVo> replylist(ReplyVo replyvo)throws Exception{
	
		List<ReplyVo> replyvo1=replyservice.Replylist(replyvo);
		
		return replyvo1;
	}
	
	
	@RequestMapping("/replypage")
	public String replypage(int replybno,Model model)throws Exception{
		ReplyVo replyvo=replyservice.Replyone(replybno);
		model.addAttribute("replyvo", replyvo);
		return "reply";
	}
	
	@RequestMapping("/rereplylist")
	public @ResponseBody List<ReplyVo> Rereplylist(int replybno)throws Exception{
		
		List<ReplyVo> replyvo=replyservice.Rereply(replybno);
		return replyvo;
		
	}
	
	@RequestMapping("/showreply")
	public String showreply(ReplyVo replyvo,Model model)throws Exception{
		
		List<ReplyVo> replyvo1=replyservice.Replylist(replyvo);
		model.addAttribute("replyvo",replyvo1);
		return "reply";
		
	}
	
}
