package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.LocationDto;
import kr.ac.badoogi.dto.SearchDto;
import kr.ac.badoogi.vo.CommunityVo;

public interface SearchService {

	
	public List<CommunityVo> Commusearch(SearchDto dto)throws Exception;
	public List<CatelistDto> Getcatesearch(LocationDto locadto)throws Exception;
	public List<CatelistDto> Getsearch(SearchDto dto)throws Exception;
}
