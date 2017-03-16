package com.acorn.unicorn.dto;

public class ProductDTO {
	private int p_id, p_price, p_stock, po_stock, pageNum, startPrice, endPrice, p_number;
	private String p_name, p_img, po_size, p_category, p_sort, p_sex;
	private int rate;
	
	public int getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = (int)Math.round(rate);
	}
	
	public int getP_number() {
		return p_number;
	}

	public void setP_number(int p_number) {
		this.p_number = p_number;
	}

	public int getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(double startPrice) {
		this.startPrice = (int) startPrice;
	}

	public int getEndPrice() {
		return endPrice;
	}

	public void setEndPrice(double endPrice) {
		this.endPrice = (int) endPrice;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name.replaceAll("\"", "\'");
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getPo_size() {
		return po_size;
	}

	public void setPo_size(String po_size) {
		this.po_size = po_size;
	}

	public int getPo_stock() {
		return po_stock;
	}

	public void setPo_stock(int po_stock) {
		this.po_stock = po_stock;
	}

	public String getP_sex() {
		return p_sex;
	}

	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
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
}
