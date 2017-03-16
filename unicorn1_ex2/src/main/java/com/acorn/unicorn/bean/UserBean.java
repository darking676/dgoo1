package com.acorn.unicorn.bean;

public class UserBean {
	private String u_userid, u_password, u_name, u_jumin, u_phone, u_address, u_mail, u_gender, u_address1, u_address2, u_zipcode;
	private int u_point;
	public String getU_userid() {
		return u_userid;
	}

	public void setU_userid(String u_userid) {
		this.u_userid = u_userid;
	}

	public String getU_password() {
		return u_password;
	}

	public void setU_password(String u_password) {
		this.u_password = u_password;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_jumin() {
		return u_jumin;
	}

	public void setU_jumin(String u_jumin) {
		this.u_jumin = u_jumin;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_address() {
		u_address = u_address1 + " " + u_address2;
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_mail() {
		return u_mail;
	}

	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public String getU_address1() {
		return u_address1;
	}

	public void setU_address1(String u_address1) {
		this.u_address1 = u_address1;
	}

	public String getU_address2() {
		return u_address2;
	}

	public void setU_address2(String u_address2) {
		this.u_address2 = u_address2;
	}

	public String getU_zipcode() {
		return u_zipcode;
	}

	public void setU_zipcode(String u_zipcode) {
		this.u_zipcode = u_zipcode;
	}
	
	
}
