package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.badoogi.dao.CategoryDao;
import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.service.CategoryService;
import kr.ac.badoogi.vo.CategoryVo;
import kr.ac.badoogi.vo.DetailVo;
import kr.ac.badoogi.vo.EntVo;
import kr.ac.badoogi.vo.EntdetailVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.RuleVo;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Inject
	private CategoryDao categorydao;


	@Transactional
	@Override
	public void Insertent(EntVo entvo) throws Exception {			//ent ¼¼ºÎ»çÇ× ÀÎ¼­Æ®
	
		CategoryVo categoryvo=entvo.getCategoryvo();
		DetailVo detailvo=entvo.getDetailvo();
		RuleVo rulevo=entvo.getRulevo();
		ImageVo imgvo=entvo.getImgvo();
		
		for(int i=0;i<entvo.getCategory().length;i++){
			String category=entvo.getCategory()[i];
			categoryvo.setCategory(category);
			categorydao.Insertcategory(categoryvo);						//category»ðÀÔ
			
		}
		
		for(int i=0;i<entvo.getFacility().length;i++){
			String facility=entvo.getFacility()[i];
			categoryvo.setCategory(facility);
			categorydao.Insertfacility(categoryvo);						//facility»ðÀÔ
			
		}
		
		categorydao.Insertdetail(detailvo);							//detail»ðÀÔ
		categorydao.Insertrule(rulevo);								//rule »ðÀÔ
		categorydao.Insertentimg(imgvo);
	}


	@Override
	public  List<CatelistDto>  Catelist(CatelistDto catelist) throws Exception{
		// TODO Auto-generated method stub
		return categorydao.Catelist(catelist);
	}

	
	@Transactional
	@Override
	public EntVo Entdetail(String licensenumber,String email,EntVo entvo) throws Exception {
		// TODO Auto-generated method stub					//detail²ø¾î¿À±â
		
		EntdetailVo entdetailvo=new EntdetailVo();
		entdetailvo.setEmail(email);
		entdetailvo.setLicensenumber(licensenumber);
		EntdetailVo entdvo=categorydao.Entdetail(entdetailvo);
		
		List<CategoryVo> facilityvo=(List<CategoryVo>) categorydao.Facility(licensenumber);
		
		entvo.setEntdetail(entdvo);
		
		entvo.setCatelist(facilityvo);
		
		
		
		return entvo;
	}


	@Override
	public List<CatelistDto> Allcatelist(String email) throws Exception {
		// TODO Auto-generated method stub
		return categorydao.Allcatelist(email);
	}





}
