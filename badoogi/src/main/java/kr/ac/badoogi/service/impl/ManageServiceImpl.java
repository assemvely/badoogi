package kr.ac.badoogi.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.badoogi.dao.ManageDao;
import kr.ac.badoogi.dto.CatelistDto;
import kr.ac.badoogi.dto.EmailbnoDto;
import kr.ac.badoogi.dto.ProVo;
import kr.ac.badoogi.service.ManageService;
import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.ManageVo;
import kr.ac.badoogi.vo.Pro_cpimgVo;
import kr.ac.badoogi.vo.PromotionVo;

@Service
public class ManageServiceImpl implements ManageService{

	@Inject
	private ManageDao managedao;

	@Transactional
	@Override
	public void Insertmanage(ImageVo imgvo, ManageVo managevo) throws Exception {
		// TODO Auto-generated method stub

		int rownum=managedao.Insertmanage(managevo);
		int bno=managevo.getBno();
	
		if(managevo.getManagecode().equals("ba")){
		
			imgvo.setBno(bno);
			managedao.Insertmanageimg(imgvo);
		}
		
	}

	@Override
	public List<ManageVo> Managelist() throws Exception {
		// TODO Auto-generated method stub
		return managedao.Managelist();
	}

	@Override
	public ManageVo Readposting(int bno) throws Exception {
		// TODO Auto-generated method stub
		return managedao.Readposting(bno);
	}

	@Override
	public void Insertbanner(ManageVo managevo) throws Exception {
		managedao.Insertbanner(managevo);
		
	}

	@Override
	public List<ManageVo> Getbanner() throws Exception {
		// TODO Auto-generated method stub
		return managedao.Getbanner();
	}

	@Override
	public void Delbanner(int bno) throws Exception {
		// TODO Auto-generated method stub
		managedao.Delbanner(bno);
	}

	@Override
	public List<ManageVo> Getlist(String managecode) throws Exception {
		// TODO Auto-generated method stub
		return managedao.Getlist(managecode);
	}

	@Transactional
	@Override
	public void Insertpromotion(String[] chk, Pro_cpimgVo promotionvo)throws Exception {
		// TODO Auto-generated method stub
		int row=managedao.Insertproimg(promotionvo);
		int bno=promotionvo.getBno();
		
		
		ProVo provo=new ProVo();
		for(int i=0;i<chk.length;i++){
			provo.setBno(bno);
			provo.setLicensenumber(chk[i]);
			managedao.Insertpromotion(provo);
		}
		
	}

	@Override
	public List<Pro_cpimgVo> Promotionlist(String code) throws Exception {
		// TODO Auto-generated method stub
		 return managedao.Promotionlist(code);
	}

	
	@Override
	public Pro_cpimgVo Readpromotion(EmailbnoDto bnodto) throws Exception {
		// TODO Auto-generated method stub
		
		
		 return managedao.promotionimg(bnodto);
	}

	@Override
	public List<CatelistDto> Readcatepromotion(EmailbnoDto bnodto) throws Exception {
		// TODO Auto-generated method stub
		return managedao.Readpromotion(bnodto);
	}

	@Override
	public void Promotiondisplay(int bno)throws Exception {
		// TODO Auto-generated method stub
		managedao.Promotiondisplay(bno);
	}

	@Override
	public List<Pro_cpimgVo> Getpro_dispaly() throws Exception {
		// TODO Auto-generated method stub
		return managedao.Getpro_dispaly();
	}
	
	
}
