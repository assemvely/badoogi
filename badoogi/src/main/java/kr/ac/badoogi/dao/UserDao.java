package kr.ac.badoogi.dao;

import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.vo.LicenseeVo;
import kr.ac.badoogi.vo.UserVo;

public interface UserDao {

	
	public void Insertuser(UserVo uservo)throws Exception;
	public void Insertnick(UserVo uservo)throws Exception;
	public void Insertlicensee(LicenseeVo licenseevo)throws Exception;
	public void Insertimg(UserVo uservo)throws Exception;
	
	public LoginDto Login(LoginDto logindto)throws Exception;
}
