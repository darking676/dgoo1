package com.acorn.unicorn.dto;

public class ProductOptionDTO {
	private String po_size;
	private int po_stock, po_p_id;
	
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
	public int getPo_p_id() {
		return po_p_id;
	}
	public void setPo_p_id(int po_p_id) {
		this.po_p_id = po_p_id;
	}
}
