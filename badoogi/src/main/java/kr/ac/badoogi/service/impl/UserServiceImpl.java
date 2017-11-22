package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.ac.badoogi.dao.UserDao;
import kr.ac.badoogi.dto.CpuseDto;
import kr.ac.badoogi.dto.LoginDto;
import kr.ac.badoogi.service.UserService;
import kr.ac.badoogi.vo.CouponVo;
import kr.ac.badoogi.vo.LicenseeVo;
import kr.ac.badoogi.vo.UserVo;


@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDao userdao;

	
	@Transactional
	@Override
	public void Insertuser(UserVo uservo) {
			 try {
				userdao.Insertuser(uservo);
				userdao.Insertnick(uservo);
				userdao.Insertimg(uservo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();

			
			}
				
	}

	@Transactional
	@Override
	public void Insertent_licensee(LicenseeVo licenseevo, UserVo ent_uservo) throws Exception {
		userdao.Insertuser(ent_uservo);
		userdao.Insertnick(ent_uservo);
		userdao.Insertlicensee(licenseevo);
		ent_uservo.setRealfilename(ent_uservo.getRealfilename2());
		ent_uservo.setRealPath(ent_uservo.getRealPath2());
		userdao.Insertimg(ent_uservo);
		
	}

	@Override
	public LoginDto Login(LoginDto logindto) throws Exception {
		
		return userdao.Login(logindto);
		
	}

	@Override
	public List<UserVo> Userlist() throws Exception {
		// TODO Auto-generated method stub
		return userdao.Userlist();
	}

	@Override
	public List<UserVo> Entlist() throws Exception {
		// TODO Auto-generated method stub
		return userdao.Entlist();
	}

	@Override
	public List<CouponVo> Mycoupon(String email) throws Exception {
		// TODO Auto-generated method stub
		return userdao.Mycoupon(email);
	}

	@Override
	public void Changestatus(CpuseDto cpdto) throws Exception {
		// TODO Auto-generated method stub
		userdao.Changestatus(cpdto);
	}




}
