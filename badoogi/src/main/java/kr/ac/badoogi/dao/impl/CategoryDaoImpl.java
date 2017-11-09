package kr.ac.badoogi.dao.impl;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.CategoryDao;
import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.DetailVo;
import kr.ac.badoogi.vo.EntVo;
import kr.ac.badoogi.vo.EntdetailVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.RuleVo;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Inject
	private SqlSession session;

	private final String namespace="kr.ac.badoogi.mapper.CategoryMapper";
	
	@Override
	public void Insertcategory(CategoryVo categoryvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertcategory",categoryvo);
		
	}

	@Override
	public void Insertdetail(DetailVo detailvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertdetail",detailvo);
			
	}

	@Override
	public void Insertrule(RuleVo rulevo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertrule",rulevo);
		
		
	}

	@Override
	public void Insertfacility(CategoryVo categoryvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertfacility",categoryvo);
	}

	@Override
	public List<CatelistDto> Catelist(CatelistDto catelist) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Catelist",catelist);
	}

	@Override
	public EntdetailVo Entdetail(EntdetailVo entdetailvo) throws Exception {
	
		return session.selectOne(namespace+".Entdetail",entdetailvo);
		
	}

	@Override
	public List<CategoryVo> Facility(String licensenumber) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Facility",licensenumber);
	}

	@Override
	public List<CatelistDto> Allcatelist(String email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Allcatelist",email);
	}

	@Override
	public void Insertentimg(ImageVo imgvo) throws Exception {
		session.insert(namespace+".Insertentimg",imgvo);
		
	}
	
	
}
