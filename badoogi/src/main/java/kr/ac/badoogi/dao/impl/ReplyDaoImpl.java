package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.ReplyDao;
import kr.ac.badoogi.vo.ReplyVo;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	
	
	@Inject
	private SqlSession session;
	private final String namespace="kr.ac.badoogi.mapper.ReplyMapper";
	@Override
	public void Insertreply(ReplyVo replyvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertreply",replyvo);
	}

	@Override
	public List<ReplyVo> Replylist(ReplyVo replyvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Replylist",replyvo);
	}


	
	public List<ReplyVo> Rereplylist(int replybno) throws Exception{
		return session.selectList(namespace+".Rereplylist",replybno);
	}

	@Override
	public ReplyVo Replyone(int replybno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".Replyone",replybno);
	}

	@Override
	public void Insertsubreply(ReplyVo replyvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertsubreply",replyvo);
	}

}
