package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.LikebadoomDao;
import kr.ac.badoogi.vo.LikebadoomVo;

@Repository
public class LikebadoomDaoImpl implements LikebadoomDao {

	@Inject
	SqlSession session;
	
	private final String namespace="kr.ac.badoogi.mapper.LikebadoomMapper";

	@Override
	public void Insertlb(LikebadoomVo lbvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertlb",lbvo);
	}

	@Override
	public void Delfromcommu(LikebadoomVo lbvo) throws Exception {
		// TODO Auto-generated method stub
		
		session.delete(namespace+".Delfromcommu",lbvo);
		
	}

	@Override
	public void Delfromcate(LikebadoomVo lbvo) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".Delfromcate",lbvo);
	}

	@Override
	public List<LikebadoomVo> Getlist(String email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Getlist",email);
	}

	
}
