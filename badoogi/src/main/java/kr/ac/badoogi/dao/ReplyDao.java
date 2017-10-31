package kr.ac.badoogi.dao;

import java.util.List;

import kr.ac.badoogi.vo.ReplyVo;

public interface ReplyDao {
	
	public void Insertreply(ReplyVo replyvo)throws Exception;
	public void Insertsubreply(ReplyVo replyvo)throws Exception;
	public List<ReplyVo> Replylist(ReplyVo replyvo)throws Exception;
	public List<ReplyVo> Rereplylist(int replybno)throws Exception;
	public ReplyVo Replyone(int replybno)throws Exception;
}
