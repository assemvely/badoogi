package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.badoogi.dao.CommunityDao;
import kr.ac.badoogi.service.CommunityService;
import kr.ac.badoogi.vo.CommunityVo;
import kr.ac.badoogi.vo.ImageVo;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Inject
	CommunityDao communitydao;
	
	@Transactional
	@Override
	public void Upload(ImageVo imgvo, CommunityVo commuvo) throws Exception {
		// TODO Auto-generated method stub
		int rownum=communitydao.Upload(commuvo);
		int bno=commuvo.getCommunitybno();
	
			imgvo.setBno(bno);
			communitydao.Uploadimg(imgvo);
	}

	@Override
	public List<CommunityVo> Communitylist(String email) throws Exception {
		// TODO Auto-generated method stub
		return communitydao.Communitylist(email);
	}

	@Override
	public CommunityVo Detail(CommunityVo commuvo) throws Exception {
		// TODO Auto-generated method stub
		return communitydao.Detail(commuvo);
	}

	@Override
	public void Changeprivate(CommunityVo commuvo) throws Exception {
		// TODO Auto-generated method stub
		communitydao.Changeprivate(commuvo);
	}

	@Override
	public List<CommunityVo> Personallist(String email) throws Exception {
		// TODO Auto-generated method stub
		return communitydao.Personallist(email);
	}

	

	
}
