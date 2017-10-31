package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.dto.CatelistDto;

import kr.ac.badoogi.vo.EntVo;


public interface CategoryService {

	public void Insertent(EntVo entvo)throws Exception;
	public  List<CatelistDto>  Catelist(CatelistDto catelist)throws Exception;
	public List<CatelistDto> Allcatelist()throws Exception;
	public EntVo Entdetail(String licensenumber,String email,EntVo entvo)throws Exception;
	
}
