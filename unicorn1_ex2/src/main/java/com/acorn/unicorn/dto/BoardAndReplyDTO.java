package com.acorn.unicorn.dto;

import java.sql.Timestamp;

public class BoardAndReplyDTO {
	private int b_id, b_gnum, b_hit_cnt, rp_index, rp_bid,pageNum;
	private String b_title, b_content, b_delgb, b_userid, b_password, rp_content,rp_userid;
	private Timestamp b_crea_date, rp_regdate;
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getRp_index() {
		return rp_index;
	}
	public void setRp_index(int rp_index) {
		this.rp_index = rp_index;
	}
	public int getRp_bid() {
		return rp_bid;
	}
	public void setRp_bid(int rp_bid) {
		this.rp_bid = rp_bid;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public String getRp_userid() {
		return rp_userid;
	}
	public void setRp_userid(String rp_userid) {
		this.rp_userid = rp_userid;
	}
	public Timestamp getRp_regdate() {
		return rp_regdate;
	}
	public void setRp_regdate(Timestamp rp_regdate) {
		this.rp_regdate = rp_regdate;
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
