package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.CpcheckDto;
import kr.ac.badoogi.dto.CpuseDto;
import kr.ac.badoogi.dto.EmailbnoDto;
import kr.ac.badoogi.vo.CouponVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.ManageVo;
import kr.ac.badoogi.vo.Pro_cpimgVo;

public interface ManageService {

	public void Insertmanage(ImageVo imgvo,ManageVo managevo)throws Exception;
	public List<ManageVo> Managelist()throws Exception;
	public List<ManageVo> Getbanner()throws Exception;
	public ManageVo Readposting(int bno)throws Exception;
	public void Insertbanner(ManageVo managevo)throws Exception;
	public void Delbanner(int bno)throws Exception;
	public List<ManageVo> Getlist(String managecode)throws Exception;
	public void Insertpromotion(String chk[],Pro_cpimgVo promotionvo)throws Exception;
	public List<Pro_cpimgVo> Promotionlist(String code)throws Exception;
	public Pro_cpimgVo Readpromotion(EmailbnoDto bnodto)throws Exception;
	public List<CatelistDto> Readcatepromotion(EmailbnoDto bnodto)throws Exception;
	public void Promotiondisplay(int bno)throws Exception;
	public List<Pro_cpimgVo> Getpro_dispaly()throws Exception;
	public void Couponupload(CouponVo couponvo,Pro_cpimgVo imgvo)throws Exception;
	public List<CouponVo> Couponlist(String code)throws Exception;
	public CouponVo Incoupon(int couponbno)throws Exception;
	public void Cptouser (CpuseDto cpdto)throws Exception;
	public CpcheckDto Couponcheck(String licensenumber)throws Exception;
	public void Delprodisplay(int bno)throws Exception;
}
