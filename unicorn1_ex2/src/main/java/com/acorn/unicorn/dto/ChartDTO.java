package com.acorn.unicorn.dto;

public class ChartDTO {
	private int total_price, pur_cnt, product5;
	public int getProduct5() {
		return product5;
	}
	public void setProduct5(int product5) {
		this.product5 = product5;
	}
	private String month, p_category, p_name;
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getPur_cnt() {
		return pur_cnt;
	}
	public void setPur_cnt(int pur_cnt) {
		this.pur_cnt = pur_cnt;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
}
