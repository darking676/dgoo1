package com.acorn.unicorn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.bean.BasketBean;
import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.DeliveryBean;
import com.acorn.unicorn.bean.PurchasesBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.PurchasesDTO;

@Repository("paymentDAO")
public class PaymentDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<BasketDTO> selectPaymentList(BasketBean bean) throws Exception{
		 return selectList("payment.selectPaymentList", bean);
	}

	public int productSub(PurchasesBean bean) throws Exception{
		int re = update("payment.productSub", bean);
		return re;
	}

	public int cartEmpty(PurchasesBean bean) throws Exception{
		int re = delete("payment.cartEmpty", bean);
		return re;
	}

	public int insertPurchase(PurchasesBean bean) throws Exception{
		int re = insert("payment.insertPurchase", bean); 
		return re;
	}

	public ProductOptionDTO stockConfig(PurchasesBean bean) throws Exception{
		return selectOne1("payment.stockConfig", bean);
	}

	public int insertDelivery(DeliveryBean bean) throws Exception{
		int re = insert("payment.insertDelivery", bean);
		return re;
	}

	@SuppressWarnings("unchecked")
	public List<PurchasesDTO> selectList(PurchasesBean bean) {
		return selectList("payment.selectInvoice", bean);
	}

	public void updatePoint(UserBean bean) {
		update1("payment.updatePoint", bean);
		
	}

	public void updateCoupon(CouponBean couponBean) {
		update1("payment.updateCoupon", couponBean);
	}

	public int configGnum() {
		return selectOne2("payment.configGnum");
	}

	public void updateCart(CartBean bean) {
		update1("payment.updateCart", bean);
		
	}
 
}
