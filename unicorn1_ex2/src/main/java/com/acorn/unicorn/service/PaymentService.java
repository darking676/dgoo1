package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.BasketBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.DeliveryBean;
import com.acorn.unicorn.bean.PurchasesBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.ProductDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.PurchasesDTO;

public interface PaymentService {

	List<BasketDTO> selectPaymentList(BasketBean bean) throws Exception;

	int stockSub(PurchasesBean bean) throws Exception;

	int cartEmpty(PurchasesBean bean) throws Exception;

	int insertPurchase(PurchasesBean bean) throws Exception;

	ProductOptionDTO stockConfig(PurchasesBean bean) throws Exception;

	int insertDelivery(DeliveryBean bean2) throws Exception;  //수정

	List<PurchasesDTO> selectInvoice(PurchasesBean bean);

	void updatePoint(UserBean userBean) throws Exception;

	void UpdateCoupon(CouponBean couponBean);

	int configGnum() throws Exception; 

	void updateCart(Object setWish_p_id, Object setWish_size, Object setWish_userid, String string) throws Exception;


//	BoardDTO selectBoardDetail(int idx) throws Exception;

	//CartDTO configProduct(CartBean bean) throws Exception;

	//void updateCart(CartBean bean) throws Exception;

	//void deleteCart(CartBean bean) throws Exception;

}
