package kr.ac.badoogi.service;

import java.util.List;

import kr.ac.badoogi.dto.EntinfoDto;
import kr.ac.badoogi.vo.CheckVo;

public interface CheckService {

	public String Nickoverlap(CheckVo checkvo)throws Exception;
	public String Emailoverlap(CheckVo checkvo)throws Exception;
	public List<EntinfoDto> Storename(String storename)throws Exception;
}
