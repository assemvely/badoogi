package kr.ac.badoogi.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.badoogi.dao.CheckDao;
import kr.ac.badoogi.service.CheckService;
import kr.ac.badoogi.vo.CheckVo;

@Service
public class CheckServiceImpl implements CheckService{

	
	@Inject
	private CheckDao checkdao;
	
	
	@Override
	public String Nickoverlap(CheckVo checkvo) throws Exception {
	
		return checkdao.Nickoverlap(checkvo) ;
	}

	@Override
	public String Emailoverlap(CheckVo checkvo) throws Exception {
		// TODO Auto-generated method stub
		return checkdao.Emailoverlap(checkvo);
	}

}
