package kr.ac.badoogi.dao;

import java.util.List;

import kr.ac.badoogi.vo.LikebadoomVo;

public interface LikebadoomDao {

	public void Insertlb(LikebadoomVo lbvo)throws Exception;
	public void Delfromcommu(LikebadoomVo lbvo)throws Exception;
	public void Delfromcate(LikebadoomVo lbvo)throws Exception;
	public List<LikebadoomVo> Getlist(String email)throws Exception;

}
