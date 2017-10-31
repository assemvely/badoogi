package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.vo.ReplyVo;

public interface ReplyService {

	public void Insertreply(ReplyVo replyvo)throws Exception;
	public void Insertsubreply(ReplyVo replyvo)throws Exception;
	public List<ReplyVo> Replylist(ReplyVo replyvo)throws Exception;
	public List<ReplyVo> Rereply(int replybno)throws Exception;
	public ReplyVo Replyone(int replybno)throws Exception;

}
