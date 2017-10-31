package kr.ac.badoogi.vo;

import java.util.List;

public class EntVo {

	CategoryVo categoryvo; 	//따로
	DetailVo detailvo;		//따로
	RuleVo rulevo;
	String[] facility;
	String[] category;
	EntdetailVo entdetail;	//한번에 가지고 옴->vo2개에 어떻게 담을지 몰라서 
	List<CategoryVo> catelist;
	ImageVo imgvo;
	
	
	public ImageVo getImgvo() {
		return imgvo;
	}
	public void setImgvo(ImageVo imgvo) {
		this.imgvo = imgvo;
	}
	public List<CategoryVo> getCatelist() {
		return catelist;
	}
	public void setCatelist(List<CategoryVo> catelist) {
		this.catelist = catelist;
	}
	public EntdetailVo getEntdetail() {
		return entdetail;
	}
	public void setEntdetail(EntdetailVo entdetail) {
		this.entdetail = entdetail;
	}
	public String[] getFacility() {
		return facility;
	}
	public void setFacility(String[] facility) {
		this.facility = facility;
	}
	public String[] getCategory() {
		return category;
	}
	public void setCategory(String[] category) {
		this.category = category;
	}
	public CategoryVo getCategoryvo() {
		return categoryvo;
	}
	public void setCategoryvo(CategoryVo categoryvo) {
		this.categoryvo = categoryvo;
	}
	public DetailVo getDetailvo() {
		return detailvo;
	}
	public void setDetailvo(DetailVo detailvo) {
		this.detailvo = detailvo;
	}
	public RuleVo getRulevo() {
		return rulevo;
	}
	public void setRulevo(RuleVo rulevo) {
		this.rulevo = rulevo;
	}
	
	
}
