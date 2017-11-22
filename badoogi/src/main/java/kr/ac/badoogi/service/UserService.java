package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.dto.CpuseDto;
import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.vo.CouponVo;
import kr.ac.badoogi.vo.LicenseeVo;
import kr.ac.badoogi.vo.UserVo;


public interface UserService {

	
	public void Insertuser(UserVo uservo)throws Exception;
	public void Insertent_licensee(LicenseeVo licenseevo,UserVo ent_uservo)throws Exception;
	public LoginDto Login(LoginDto logindto)throws Exception;
	public List<UserVo> Userlist()throws Exception;
	public List<UserVo> Entlist()throws Exception;
	public List<CouponVo> Mycoupon(String email)throws Exception;
	public void Changestatus(CpuseDto cpdto)throws Exception;
}
