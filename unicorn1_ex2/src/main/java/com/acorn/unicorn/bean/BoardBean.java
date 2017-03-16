package com.acorn.unicorn.bean;

import java.sql.Timestamp;

public class BoardBean {
	private int b_id, b_gnum, b_hit_cnt,pageNum;
	private String b_title, b_content, b_delgb, b_userid, b_password, b_pass, b_state;
	private Timestamp b_crea_date;
	
	
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public String getB_state() {
		return b_state;
	}
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getB_pass() {
		return b_pass;
	}
	public void setB_pass(String b_pass) {
		this.b_pass = b_pass;
	}
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public int getB_gnum() {
		return b_gnum;
	}
	public void setB_gnum(int b_gnum) {
		this.b_gnum = b_gnum;
	}
	public int getB_hit_cnt() {
		return b_hit_cnt;
	}
	public void setB_hit_cnt(int b_hit_cnt) {
		this.b_hit_cnt = b_hit_cnt;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_delgb() {
		return b_delgb;
	}
	public void setB_delgb(String b_delgb) {
		this.b_delgb = b_delgb;
	}
	public String getB_userid() {
		return b_userid;
	}
	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}
	public String getB_password() {
		return b_password;
	}
	public void setB_password(String b_password) {
		this.b_password = b_password;
	}
	public Timestamp getB_crea_date() {
		return b_crea_date;
	}
	public void setB_crea_date(Timestamp b_crea_date) {
		this.b_crea_date = b_crea_date;
	}
	
	
	
	
}
