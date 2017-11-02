package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.SearchDao;
import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.LocationDto;
import kr.ac.badoogi.dto.SearchDto;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.CommunityVo;

@Repository
public class SearchDaoImpl implements SearchDao{

	@Inject
	private SqlSession session;
	private final String namespace="kr.ac.badoogi.mapper.SearchMapper";

	@Override
	public List<CommunityVo> Commusearch(SearchDto dto) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectList(namespace+".Commusearch",dto);
	}

	@Override
	public List<CatelistDto> Getcatesearch(LocationDto locadto) throws Exception {
		// TODO Auto-generated method stub

		List<CatelistDto> dto=session.selectList(namespace+".Getcatesearch",locadto);
	
		
		return dto; 
	}
	
	
}
