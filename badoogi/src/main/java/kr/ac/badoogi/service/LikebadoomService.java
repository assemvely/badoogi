package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.vo.LikebadoomVo;

public interface LikebadoomService {

	public void Insertlb(LikebadoomVo lbvo)throws Exception;
	public void Delete(LikebadoomVo lbvo)throws Exception;
	public List<LikebadoomVo> Getlist(String email)throws Exception;
}
