package kr.ac.badoogi.dao;

import java.util.List;

import kr.ac.badoogi.vo.CommunityVo;
import kr.ac.badoogi.vo.ImageVo;

public interface CommunityDao {

	
	public int Upload(CommunityVo commuvo)throws Exception;
	public void Uploadimg(ImageVo imgvo)throws Exception;
	public List<CommunityVo> Communitylist(String email) throws Exception;
	public CommunityVo Detail(CommunityVo commuvo)throws Exception;
	public void Changeprivate(CommunityVo commuvo)throws Exception;
	public List<CommunityVo> Personallist(String email)throws Exception;
}
