package kr.ac.badoogi.vo;

import java.util.Date;

public class CommunityVo {

	int communitybno;
	String email;
	String licensenumber;
	String usercode;
	String comment;
	String privateor;
	Date writedate;
	String realfilename;
	String realPath;
	String nickname;
	int rownum;
	int badoom;
	int badoomnum;
	int likee;
	int likenum;
	
	
	
	public int getLikee() {
		return likee;
	}
	public void setLikee(int likee) {
		this.likee = likee;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getBadoomnum() {
		return badoomnum;
	}
	public void setBadoomnum(int badoomnum) {
		this.badoomnum = badoomnum;
	}
	public int getBadoom() {
		return badoom;
	}
	public void setBadoom(int badoom) {
		this.badoom = badoom;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRealfilename() {
		return realfilename;
	}
	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public int getCommunitybno() {
		return communitybno;
	}
	public void setCommunitybno(int communitybno) {
		this.communitybno = communitybno;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLicensenumber() {
		return licensenumber;
	}
	public void setLicensenumber(String licensenumber) {
		this.licensenumber = licensenumber;
	}
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getPrivateor() {
		return privateor;
	}
	public void setPrivateor(String privateor) {
		this.privateor = privateor;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	
	
	
}
