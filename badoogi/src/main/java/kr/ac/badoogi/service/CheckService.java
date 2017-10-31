package kr.ac.badoogi.service;

import kr.ac.badoogi.vo.CheckVo;

public interface CheckService {

	public String Nickoverlap(CheckVo checkvo)throws Exception;
	public String Emailoverlap(CheckVo checkvo)throws Exception;

}
