package com.acorn.unicorn.dto;

public class DetailDTO {
	private String p_id, p_name, p_price, p_img, po_size, po_stock,p_sex,p_bun;

	public String getP_id() {
		return p_id;
	}

	public String getP_bun() {
		return p_bun;
	}

	public void setP_bun(String p_bun) {
		this.p_bun = p_bun;
	}

	public String getP_sex() {
		return p_sex;
	}

	public void setP_sex(String p_sex) {
		this.p_sex = p_sex;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
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

	public String getPo_stock() {
		return po_stock;
	}

	public void setPo_stock(String po_stock) {
		this.po_stock = po_stock;
	}
}
