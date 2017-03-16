package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.dao.CartDAO;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.CartDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.UserDTO;

@Service("cartService")
public class CartServiceImpl implements CartService{
	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="cartDAO")
    private CartDAO cartDAO;
	
    @Override
    public void insertCart1(CartBean bean) throws Exception {
    	cartDAO.insertCart1(bean);	
    }
    
    @Override
    public List<BasketDTO> selectCartList(String user_id) throws Exception {
    	return cartDAO.selectCartList(user_id);
    }
    
    @Override
    public CartDTO configProduct(CartBean bean) throws Exception{
    	return cartDAO.configProduct(bean);
    }
    
    @Override
    public void updateCart(CartBean bean) throws Exception {
    	cartDAO.updateCart(bean);
    }
    @Override
    public void deleteCart(CartBean bean) throws Exception {
    	cartDAO.deleteCart(bean);
    	
    }
    @Override
    public List<ProductOptionDTO> configOption(CartBean bean) throws Exception {
    	return cartDAO.configOption(bean);
    	
    }
    @Override
    public List<CouponDTO> configCoupon(String string) throws Exception {
    	return cartDAO.configCoupon(string);
    }
    
    @Override
    public UserDTO configPoint(String string) throws Exception {
    	return cartDAO.configPoint(string);
    }
}
