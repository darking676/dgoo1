package com.acorn.unicorn.dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int rp_index,rp_bid;
	private String rp_userid,rp_content;
	private Timestamp rp_regdate;
	
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
	public String getRp_userid() {
		return rp_userid;
	}
	public void setRp_userid(String rp_userid) {
		this.rp_userid = rp_userid;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public Timestamp getRp_regdate() {
		return rp_regdate;
	}
	public void setRp_regdate(Timestamp rp_regdate) {
		this.rp_regdate = rp_regdate;
	}
}
