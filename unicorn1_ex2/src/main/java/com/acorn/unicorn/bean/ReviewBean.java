package com.acorn.unicorn.bean;

import java.sql.Timestamp;

public class ReviewBean {
	private int rv_index, rv_pid, rv_gnum, rv_lvl, rv_rate;
	private String rv_content, rv_userid;
	private Timestamp rv_regdate;
	
	public int getRv_index() {
		return rv_index;
	}
	public void setRv_index(int rv_index) {
		this.rv_index = rv_index;
	}
	public int getRv_pid() {
		return rv_pid;
	}
	public void setRv_pid(int rv_pid) {
		this.rv_pid = rv_pid;
	}
	public int getRv_gnum() {
		return rv_gnum;
	}
	public void setRv_gnum(int rv_gnum) {
		this.rv_gnum = rv_gnum;
	}
	public int getRv_lvl() {
		return rv_lvl;
	}
	public void setRv_lvl(int rv_lvl) {
		this.rv_lvl = rv_lvl;
	}
	public int getRv_rate() {
		return rv_rate;
	}
	public void setRv_rate(String rv_rate) {
		this.rv_rate = Integer.parseInt(rv_rate.substring(rv_rate.length()-1,rv_rate.length()));
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_userid() {
		return rv_userid;
	}
	public void setRv_userid(String rv_userid) {
		this.rv_userid = rv_userid;
	}
	public Timestamp getRv_regdate() {
		return rv_regdate;
	}
	public void setRv_regdate(Timestamp rv_regdate) {
		this.rv_regdate = rv_regdate;
	}
}
