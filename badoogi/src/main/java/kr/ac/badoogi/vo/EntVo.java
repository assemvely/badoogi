package kr.ac.badoogi.vo;

import java.util.List;

public class EntVo {

	CategoryVo categoryvo; 	//����
	DetailVo detailvo;		//����
	RuleVo rulevo;
	String[] facility;
	String[] category;
	EntdetailVo entdetail;	//�ѹ��� ������ ��->vo2���� ��� ������ ���� 
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
