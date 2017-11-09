package kr.ac.badoogi.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ac.badoogi.dao.ManageDao;
import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.EmailbnoDto;
import kr.ac.badoogi.dto.ProVo;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.ManageVo;
import kr.ac.badoogi.vo.Pro_cpimgVo;

@Repository
public class ManageDaoImpl implements ManageDao{

	
	@Inject
	private SqlSession session;
	private final String namespace="kr.ac.badoogi.mapper.ManageMapper";
	@Override
	public int Insertmanage(ManageVo managevo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".Insertmanage",managevo);
		
	}
	@Override
	public void Insertmanageimg(ImageVo imgvo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertmanageimg",imgvo);
	}
	@Override
	public List<ManageVo> Managelist() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Managelist");
	}
	@Override
	public ManageVo Readposting(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".Readposting",bno);
	}
	@Override
	public void Insertbanner(ManageVo managevo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Inserbanner",managevo);
		
	}
	@Override
	public List<ManageVo> Getbanner() throws Exception{
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Getbanner");
	}
	@Override
	public void Delbanner(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".Delbanner",bno);
	}
	@Override
	public List<ManageVo> Getlist(String managecode) throws Exception {
		// TODO Auto-generated method stub
			
		return session.selectList(namespace+".Managelist1", managecode);
	}
	@Override
	public int Insertproimg(Pro_cpimgVo promotionvo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".Insertproimg",promotionvo);
	}
	@Override
	public void Insertpromotion(ProVo provo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Insertpromotion",provo);
	}
	@Override
	public List<Pro_cpimgVo> Promotionlist(String code) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Promotionlist",code);
	}
	@Override
	public List<CatelistDto> Readpromotion(EmailbnoDto bnodto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Readpromotion",bnodto);
	}
	@Override
	public Pro_cpimgVo promotionimg(EmailbnoDto bnodto) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".promotionimg",bnodto);
	}
	@Override
	public void Promotiondisplay(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".Promotiondisplay",bno);
	}
	@Override
	public List<Pro_cpimgVo> Getpro_dispaly() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".Getpro_dispaly");
	}
	

}
