package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.badoogi.dao.LikebadoomDao;
import kr.ac.badoogi.service.LikebadoomService;
import kr.ac.badoogi.vo.LikebadoomVo;

@Service
public class LikebadoomServiceImpl implements LikebadoomService {

	
	@Inject
	LikebadoomDao lbdao;

	@Override
	public void Insertlb(LikebadoomVo lbvo) throws Exception {
		// TODO Auto-generated method stub
		lbdao.Insertlb(lbvo);
	}

	@Override
	public void Delete(LikebadoomVo lbvo) throws Exception {
		// TODO Auto-generated method stub
		if(lbvo.getLicensenumber()==null){
			// 커뮤니티삭제시
			lbdao.Delfromcommu(lbvo);
		}else if(lbvo.getCommunitybno()==0){
			//카테고리 삭제
			lbdao.Delfromcate(lbvo);
		}
	}

	@Override
	public List<LikebadoomVo> Getlist(String email) throws Exception {
		// TODO Auto-generated method stub
		return lbdao.Getlist(email);
	}
}
