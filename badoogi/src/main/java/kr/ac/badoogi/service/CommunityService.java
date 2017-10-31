package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.vo.CommunityVo;
import kr.ac.badoogi.vo.ImageVo;

public interface CommunityService {

	public void Upload(ImageVo imgvo,CommunityVo commuvo)throws Exception;
	public List<CommunityVo> Communitylist(String email)throws Exception;
	public CommunityVo Detail(CommunityVo commuvo)throws Exception;
	public void Changeprivate(CommunityVo commuvo)throws Exception;
	public List<CommunityVo> Personallist(String email)throws Exception;
}
