package kr.ac.badoogi.dao.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.UserDao;
import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.vo.LicenseeVo;
import kr.ac.badoogi.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao{

	@Inject
	private SqlSession session;
	
	private final String namespace="kr.ac.badoogi.mapper.UserMapper";
	
	@Override
	public void Insertuser(UserVo uservo) throws Exception {

		session.insert(namespace+".Insertuser",uservo);
	}

	@Override
	public void Insertnick(UserVo uservo) throws Exception {
		
		session.insert(namespace+".Insertnick",uservo);
	}


	@Override
	public void Insertlicensee(LicenseeVo licenseevo) throws Exception {
		session.insert(namespace+".Insertlicensee",licenseevo);		
	}

	@Override
	public LoginDto Login(LoginDto logindto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".Login",logindto);
		
	}

	@Override
	public void Insertimg(UserVo uservo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertimg",uservo);
	}

}
