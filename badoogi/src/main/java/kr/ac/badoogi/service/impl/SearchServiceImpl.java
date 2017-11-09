package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.badoogi.dao.SearchDao;
import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.LocationDto;
import kr.ac.badoogi.dto.SearchDto;
import kr.ac.badoogi.service.SearchService;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.CommunityVo;


@Service
public class SearchServiceImpl implements SearchService{

	@Inject
	SearchDao searchdao;
	@Override
	public List<CommunityVo> Commusearch(SearchDto dto) throws Exception {
		// TODO Auto-generated method stub
	
	
		return  searchdao.Commusearch(dto);
	}
	@Override
	public List<CatelistDto> Getcatesearch(LocationDto locadto) throws Exception {
		// TODO Auto-generated method stub
		return searchdao.Getcatesearch(locadto);
	}
	@Override
	public List<CatelistDto> Getsearch(SearchDto dto) throws Exception {
		// TODO Auto-generated method stub
		return searchdao.Getsearch(dto);
	}

}
