package kr.ac.badoogi.dao;

import java.util.List;

import kr.ac.badoogi.vo.ImageVo;
import kr.ac.badoogi.vo.ManageVo;

public interface ManageDao {

	public int Insertmanage(ManageVo managevo)throws Exception;
	public void Insertmanageimg(ImageVo imgvo)throws Exception;
	public List<ManageVo> Managelist()throws Exception;
	public List<ManageVo> Getbanner()throws Exception;
	public ManageVo Readposting(int bno)throws Exception;
	public void Insertbanner(ManageVo managevo)throws Exception;
	public void Delbanner(int bno)throws Exception;
	public List<ManageVo> Getlist(String managecode)throws Exception;
}
