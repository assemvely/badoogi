package kr.ac.badoogi.vo;

import java.util.List;

import kr.ac.badoogi.dto.CatelistDto;

public class PromotionVo {

	Pro_cpimgVo provo;
	List<CatelistDto> catedto;
	public Pro_cpimgVo getProvo() {
		return provo;
	}
	public void setProvo(Pro_cpimgVo provo) {
		this.provo = provo;
	}
	public List<CatelistDto> getCatedto() {
		return catedto;
	}
	public void setCatedto(List<CatelistDto> catedto) {
		this.catedto = catedto;
	}
	
	
}
