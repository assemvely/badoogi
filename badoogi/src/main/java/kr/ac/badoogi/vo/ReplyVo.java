package kr.ac.badoogi.vo;

import java.sql.Date;

public class ReplyVo {

	
	int replybno;
	String replycode;
	String licensenumber;
	int communitybno;
	String email;
	Date writedate;
	String reply;
	String nickname;
	String usercode;
	int rownum;
	
	
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
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
	public int getReplybno() {
		return replybno;
	}
	public void setReplybno(int replybno) {
		this.replybno = replybno;
	}
	public String getReplycode() {
		return replycode;
	}
	public void setReplycode(String replycode) {
		this.replycode = replycode;
	}
	public String getLicensenumber() {
		return licensenumber;
	}
	public void setLicensenumber(String licensenumber) {
		this.licensenumber = licensenumber;
	}
	public int getCommunitybno() {
		return communitybno;
	}
	public void setCommunitybno(int communitybno) {
		this.communitybno = communitybno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	
	
}
