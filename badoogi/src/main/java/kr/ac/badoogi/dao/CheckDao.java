package kr.ac.badoogi.dao;

import kr.ac.badoogi.vo.CheckVo;

public interface CheckDao {

	public String Nickoverlap(CheckVo checkvo)throws Exception;
	public String Emailoverlap(CheckVo checkvo)throws Exception;
}
