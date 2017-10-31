package kr.ac.badoogi.vo;

import java.sql.Date;

public class UserVo {
	
	private String email;
	private String pw;
	private String nickname;
	private String certify;
	private Date joindate;
	private String usercode;
	private String realfilename;
	private String realfilename2;
	private String realPath;
	private String realPath2;
	
	
	
	public String getRealfilename2() {
		return realfilename2;
	}
	public void setRealfilename2(String realfilename2) {
		this.realfilename2 = realfilename2;
	}
	public String getRealPath2() {
		return realPath2;
	}
	public void setRealPath2(String realPath2) {
		this.realPath2 = realPath2;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCertify() {
		return certify;
	}
	public void setCertify(String certify) {
		this.certify = certify;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getRealfilename() {
		return realfilename;
	}
	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}
	
	
	
	
}
