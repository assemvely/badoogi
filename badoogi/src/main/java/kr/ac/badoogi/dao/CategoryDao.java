package kr.ac.badoogi.dao;

import java.util.List;

import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.DetailVo;
import kr.ac.badoogi.vo.EntVo;
import kr.ac.badoogi.vo.EntdetailVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.RuleVo;

public interface CategoryDao {
	
	public void Insertcategory(CategoryVo categoryvo)throws Exception;
	public void Insertdetail(DetailVo detailvo)throws Exception;
	public void Insertrule(RuleVo rulevo)throws Exception;
	public void Insertfacility(CategoryVo categoryvo)throws Exception;
	public void Insertentimg(ImageVo imgvo)throws Exception;
	public  List<CatelistDto>  Catelist(CatelistDto catelist)throws Exception;
	public List<CatelistDto> Allcatelist()throws Exception;
	public EntdetailVo Entdetail(EntdetailVo entdetailvo)throws Exception;
	public List<CategoryVo> Facility(String licensenumber)throws Exception;
}
