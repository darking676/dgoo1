package com.acorn.unicorn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.bean.BoardBean;
import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.CartDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.UserDTO;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<BasketDTO> selectCartList(String user_id) throws Exception{
		 return selectList("cart.selectCartList", user_id);
	}
//	
//	@SuppressWarnings("unchecked")
//	public BoardDTO selectBoardDetail(int idx) throws Exception{
//		return selectOne("board.selectBoardDetail", idx);
//	}

	public void insertCart1(CartBean bean) {
		insert("cart.insertCart", bean);
		
	}
	
	public CartDTO configProduct(CartBean bean) throws Exception{
		return selectOne("cart.configProduct", bean);
		
	}

	public void updateCart(CartBean bean) {
		update("cart.updateCart", bean);
		
	}
	
	public void deleteCart(CartBean bean) {
		delete("cart.deleteCart", bean);
		
	}

	@SuppressWarnings("unchecked")
	public List<ProductOptionDTO> configOption(CartBean bean) throws Exception{
		return selectList("cart.configOption", bean);
	}

	@SuppressWarnings("unchecked")
	public List<CouponDTO> configCoupon(String string) {
		return selectList("cart.configCoupon", string);
	}

	public UserDTO configPoint(String string) {
		return selectOne1("cart.configPoint", string);
	}
 
}
