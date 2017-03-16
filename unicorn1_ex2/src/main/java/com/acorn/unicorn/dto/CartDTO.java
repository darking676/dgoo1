package com.acorn.unicorn.dto;

public class CartDTO {
	private String wish_userid, p_img, p_price;
	private int wish_num, wish_p_id, wish_number;
	
	public String getWish_userid() {
		return wish_userid;
	}
	public void setWish_userid(String wish_userid) {
		this.wish_userid = wish_userid;
	}
	public int getWish_num() {
		return wish_num;
	}
	public void setWish_num(int wish_num) {
		this.wish_num = wish_num;
	}
	public int getWish_p_id() {
		return wish_p_id;
	}
	public void setWish_p_id(int wish_p_id) {
		this.wish_p_id = wish_p_id;
	}
	public int getWish_number() {
		return wish_number;
	}
	public void setWish_number(int wish_number) {
		this.wish_number = wish_number;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	
}
