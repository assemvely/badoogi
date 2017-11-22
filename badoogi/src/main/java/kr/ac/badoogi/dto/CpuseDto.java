package kr.ac.badoogi.dto;

public class CpuseDto {

	String licensenumber;
	int couponbno;
	String email;
	String randomnum;
	int cp_entnum;
	String status;

	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLicensenumber() {
		return licensenumber;
	}
	public void setLicensenumber(String licensenumber) {
		this.licensenumber = licensenumber;
	}
	public int getCouponbno() {
		return couponbno;
	}
	public void setCouponbno(int couponbno) {
		this.couponbno = couponbno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRandomnum() {
		return randomnum;
	}
	public void setRandomnum(String randomnum) {
		this.randomnum = randomnum;
	}
	public int getCp_entnum() {
		return cp_entnum;
	}
	public void setCp_entnum(int cp_entnum) {
		this.cp_entnum = cp_entnum;
	}
	
	
}
