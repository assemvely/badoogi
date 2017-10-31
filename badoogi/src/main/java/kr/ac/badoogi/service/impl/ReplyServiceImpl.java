package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.badoogi.dao.ReplyDao;
import kr.ac.badoogi.service.ReplyService;
import kr.ac.badoogi.vo.ReplyVo;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Inject
	ReplyDao replydao;
	@Override
	public void Insertreply(ReplyVo replyvo) throws Exception {
		// TODO Auto-generated method stub
		replydao.Insertreply(replyvo);
		
	}
	@Override
	public void Insertsubreply(ReplyVo replyvo) throws Exception {
		// TODO Auto-generated method stub
		replydao.Insertsubreply(replyvo);
		
	}

	@Override
	public List<ReplyVo> Replylist(ReplyVo replyvo) throws Exception {
		// TODO Auto-generated method stub
		return replydao.Replylist(replyvo);
	}


	@Override
	public List<ReplyVo> Rereply(int replybno) throws Exception {
		// TODO Auto-generated method stub
		return replydao.Rereplylist(replybno);
	}

	@Override
	public ReplyVo Replyone(int replybno) throws Exception {
		// TODO Auto-generated method stub
		return replydao.Replyone(replybno);
	}




}
