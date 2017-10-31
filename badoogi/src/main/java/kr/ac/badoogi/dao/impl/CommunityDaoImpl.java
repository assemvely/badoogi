package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.CommunityDao;
import kr.ac.badoogi.vo.CommunityVo;
import kr.ac.badoogi.vo.ImageVo;


@Repository
public class CommunityDaoImpl implements CommunityDao{

	@Inject
	private SqlSession session;
	private final String namespace="kr.ac.badoogi.mapper.CommunityMapper";
	@Override
	public int Upload(CommunityVo commuvo) throws Exception {
		// TODO Auto-generated method stub
	 return	session.insert(namespace+".Upload",commuvo);
	}
	@Override
	public void Uploadimg(ImageVo imgvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Uploadimg",imgvo);
	}
	@Override
	public List<CommunityVo> Communitylist(String email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Communitylist",email);
	}
	@Override
	public CommunityVo Detail(CommunityVo commuvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".Detail",commuvo);
	}
	@Override
	public void Changeprivate(CommunityVo commuvo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".Changeprivate",commuvo);
		
	}
	@Override
	public List<CommunityVo> Personallist(String email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Personallist",email);
	}
}
