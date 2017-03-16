package com.acorn.unicorn.dto;

public class BestSellerDTO {
	private String p_name, p_img, p_category, p_sort;
	private int p_id,p_price, p_sex, pur_cnt, rate;
	
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getP_id() {
		return p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_sort() {
		return p_sort;
	}
	public void setP_sort(String p_sort) {
		this.p_sort = p_sort;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_sex() {
		return p_sex;
	}
	public void setP_sex(int p_sex) {
		this.p_sex = p_sex;
	}
	public int getPur_cnt() {
		return pur_cnt;
	}
	public void setPur_cnt(int pur_cnt) {
		this.pur_cnt = pur_cnt;
	}
	
	
}
