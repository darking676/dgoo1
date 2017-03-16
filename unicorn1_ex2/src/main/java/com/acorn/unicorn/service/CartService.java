package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.BoardBean;
import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.CartDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.ProductDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.UserDTO;

public interface CartService {

	List<BasketDTO> selectCartList(String user_id) throws Exception;

	void insertCart1(CartBean bean) throws Exception;
//
//	BoardDTO selectBoardDetail(int idx) throws Exception;

	CartDTO configProduct(CartBean bean) throws Exception;

	void updateCart(CartBean bean) throws Exception;

	void deleteCart(CartBean bean) throws Exception;

	List<ProductOptionDTO> configOption(CartBean bean) throws Exception;

	List<CouponDTO> configCoupon(String string) throws Exception;

	UserDTO configPoint(String string) throws Exception;

}
