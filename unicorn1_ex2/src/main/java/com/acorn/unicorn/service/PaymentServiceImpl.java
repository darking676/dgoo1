package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.BasketBean;
import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.DeliveryBean;
import com.acorn.unicorn.bean.PurchasesBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dao.PaymentDAO;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.PurchasesDTO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="paymentDAO")
    private PaymentDAO paymentDAO;
	
    @Override
    public List<BasketDTO> selectPaymentList(BasketBean bean) throws Exception {
    	return paymentDAO.selectPaymentList(bean);
    }
    
    @Override
    public int stockSub(PurchasesBean bean) throws Exception{
    	int re = paymentDAO.productSub(bean); 
    	return re;
    }
    
    @Override
    public int cartEmpty(PurchasesBean bean) throws Exception {
    	int re = paymentDAO.cartEmpty(bean);
    	return re;	
    }
    
    @Override
    public int insertPurchase(PurchasesBean bean) throws Exception {
    	int re = paymentDAO.insertPurchase(bean);
    	return re;	
    }
    
    @Override
    public ProductOptionDTO stockConfig(PurchasesBean bean) throws Exception{
    	return paymentDAO.stockConfig(bean);
    	
    }
    @Override
    public int insertDelivery(DeliveryBean bean2) throws Exception { //수정
    	int re = paymentDAO.insertDelivery(bean2);
    	return re;
    }
    @Override
    public List<PurchasesDTO> selectInvoice(PurchasesBean bean) {
    	return paymentDAO.selectList(bean);
    }
    
    @Override
    public void updatePoint(UserBean bean) throws Exception {
    	paymentDAO.updatePoint(bean);  	
    }
    
    @Override
    public void UpdateCoupon(CouponBean couponBean) {
    	paymentDAO.updateCoupon(couponBean);
    }
    
    @Override  //수정수정수정수정
    public int configGnum() throws Exception {  
    	return paymentDAO.configGnum();
    }
    
    @Override
	public void updateCart(Object setWish_p_id, Object setWish_size, Object setWish_userid, String string) throws Exception {
    	CartBean bean = new CartBean();
    	bean.setWish_p_id(setWish_p_id.toString());
    	bean.setWish_size(setWish_size.toString());
    	bean.setWish_userid(setWish_userid.toString());
    	bean.setPast_size(string);
    	paymentDAO.updateCart(bean);
	
    }
}
