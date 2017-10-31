package kr.ac.badoogi.service;

import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.vo.LicenseeVo;
import kr.ac.badoogi.vo.UserVo;


public interface UserService {

	
	public void Insertuser(UserVo uservo)throws Exception;
	public void Insertent_licensee(LicenseeVo licenseevo,UserVo ent_uservo)throws Exception;
	public LoginDto Login(LoginDto logindto)throws Exception;
	
	
}
