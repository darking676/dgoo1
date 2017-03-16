package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.ProductBean;
import com.acorn.unicorn.dto.ProductDTO;

public interface ProductService {

	List<ProductDTO> selectProductList(ProductBean bean) throws Exception;

	ProductDTO selectProductDetail(int p_id) throws Exception;
	
	List<ProductDTO> selectProductDetail_S(int p_id) throws Exception;
	
	List<ProductDTO> ProductListBySearch(ProductBean bean) throws Exception;

//	void insertBoard(BoardBean bean) throws Exception;
//
//	BoardDTO selectBoardDetail(int idx) throws Exception;

}
