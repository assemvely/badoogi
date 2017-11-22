package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.UserDao;
import kr.ac.badoogi.dto.CpuseDto;
import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.vo.CouponVo;
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

	@Override
	public List<UserVo> Userlist() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Userlist");
	}

	@Override
	public List<UserVo> Entlist() throws Exception {
		// TODO Auto-generated method stub
		return  session.selectList(namespace+".Entlist");
	}

	@Override
	public List<CouponVo> Mycoupon(String email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Mycoupon",email);
	}

	@Override
	public void Changestatus(CpuseDto cpdto) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".Changestatus",cpdto);
	}

}
