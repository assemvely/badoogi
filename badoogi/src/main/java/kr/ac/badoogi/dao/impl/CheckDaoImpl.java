package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.CheckDao;
import kr.ac.badoogi.dto.EntinfoDto;
import kr.ac.badoogi.vo.CheckVo;

@Repository
public class CheckDaoImpl implements CheckDao{

	@Inject
	private SqlSession session;
	
	private final String namespace="kr.ac.badoogi.mapper.CheckMapper";
	@Override
	public String Nickoverlap(CheckVo checkvo) throws Exception {
		
		return session.selectOne(namespace+".Nickoverlap",checkvo);
	}

	@Override
	public String Emailoverlap(CheckVo checkvo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".Emailoverlap",checkvo);
	}

	@Override
	public List<EntinfoDto> Storename(String storename) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Storename",storename);
	}

}
