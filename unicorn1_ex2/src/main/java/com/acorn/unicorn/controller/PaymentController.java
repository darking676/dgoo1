package com.acorn.unicorn.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.BasketBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.DeliveryBean;
import com.acorn.unicorn.bean.PurchasesBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.PurchasesDTO;
import com.acorn.unicorn.service.JoinService;
import com.acorn.unicorn.service.PaymentService;

@Controller
public class PaymentController {
	HttpSession session;
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	TransactionTemplate transactionTemplate;
	
	@Resource(name = "paymentService")
	private PaymentService paymentService;
	
	@Resource(name = "joinService")
	private JoinService joinService;
	
	
	@RequestMapping(value = "/PaymentList.do", method=RequestMethod.POST)
	public ModelAndView paymentView(BasketBean bean, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		bean.setWish_p_id(bean.getWish_p_id().substring(0, bean.getWish_p_id().length()-1));
		String[] modi_num = bean.getWish_number().substring(0, bean.getWish_number().length()-1).split(",");
		List<BasketDTO> list = paymentService.selectPaymentList(bean);
		mv.setViewName("/views/paymentlist");
		mv.addObject("list", list);
		mv.addObject("modi_num", modi_num);
		return mv;
	}
	
	@RequestMapping(value = "/payment.do", method=RequestMethod.POST)
	public ModelAndView paymentSub(final PurchasesBean bean, final DeliveryBean bean2,final HttpSession session) throws Exception {
		System.out.println(bean.getPur_c_bun() + "//씨번" + bean.getC_discount() +"//할인율" + bean.getU_point() + "///포인트");
		bean.setPur_userid(session.getAttribute("userid").toString());
		final int users_point = bean.getU_point() - bean.getTot() / 100 * 4; //사용포인트 & 적립포인트 정산 
		final UserBean userBean = new UserBean();
		userBean.setU_userid(session.getAttribute("userid").toString());
		int gnum = paymentService.configGnum();
		bean.setPur_gnum(gnum + 1);	//gnum 설정
		bean.setPur_point(bean.getU_point()); //포인트 설정 
		final List<BasketDTO> list = joinService.configWish(userBean);
		bean2.setD_userid(session.getAttribute("userid").toString());
		final ModelAndView mv = new ModelAndView();
		transactionTemplate.execute(new TransactionCallbackWithoutResult() {
			
			boolean b = true; 
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				// TODO Auto-generated method stub
				String[] str1 = bean.getPur_p_id().substring(0, bean.getPur_p_id().length()-1).split(",");  //품번
				String[] str2 = bean.getPur_cnt().substring(0, bean.getPur_cnt().length()-1).split(",");	//수량
				String[] str3 = bean.getPur_price().substring(0, bean.getPur_price().length()-1).split(",");//가격
				String[] str4 = bean.getPur_po_size().substring(0, bean.getPur_po_size().length()-1).split(",");//사이즈
				String[] str5 = bean2.getD_name().substring(0, bean2.getD_name().length()-1).split(",");//품명
				ArrayList<DeliveryBean> list2 = new ArrayList<DeliveryBean>(); //트랜잭션에 걸리는 상품 담을 list
				Timestamp time = new Timestamp(System.currentTimeMillis());
				if(time.toString().length() == 22) {
					time.toString().concat("0");
				}
				bean.setPur_created(time.toString().substring(0, time.toString().length()-4)); //구매시간
				int count = 0;
				for (int i = 0; i < str3.length; i++) {
					try {
						paymentService.updateCart(str1[i], str4[i], session.getAttribute("userid").toString(), list.get(i).getWish_size());
						bean.setPur_p_id(str1[i]); 
						bean.setPur_cnt(str2[i]);
						bean.setPur_price(str3[i]);
						bean.setPur_po_size(str4[i]);
						bean2.setD_name(str5[i]);
						if(paymentService.insertDelivery(bean2) == 0 || paymentService.insertPurchase(bean) == 0 || paymentService.stockSub(bean) == 0 || paymentService.cartEmpty(bean) == 0 ||  paymentService.stockConfig(bean).getPo_stock() <= 0){
							System.out.println("재고부족");
							status.setRollbackOnly(); //에러 발생시 롤백처리
							DeliveryBean bean2 = new DeliveryBean();
							b = false;
							bean2.setD_name(str5[i]);
							bean2.setD_size(bean.getPur_po_size());
							list2.add(count, bean2);
							count++;
						}else{
							
						}
					}catch (Exception e) {
						System.out.println(e);
					}
				}
			if(b == false){
				mv.addObject("list", list2);
				mv.setViewName("errors/error");					
			}else{
				String log = bean.getPur_created();
				userBean.setU_point(users_point);	//에러없을때 포인트 세터주입
				try {
					paymentService.updatePoint(userBean); //유저 포인트 차감 & 적립금 추가					
				} catch (Exception e) {
					System.out.println(e);
				}
				if(!bean.getPur_c_bun().equals("NoneCode")){
					CouponBean couponBean = new CouponBean();
					couponBean.setC_userid(session.getAttribute("userid").toString());
					couponBean.setC_bun(bean.getPur_c_bun());
					paymentService.UpdateCoupon(couponBean);	//쿠폰 사용여부 업데이트						
				}
				mv.setViewName("redirect:/invoice.do?created=" + log);
			}
			}			
		});
		return mv;
	}
	
	@RequestMapping(value = "/invoice.do")
	public ModelAndView invoiceView(@RequestParam("created") String created, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		PurchasesBean bean = new PurchasesBean();
		bean.setPur_userid(session.getAttribute("userid").toString());
		bean.setPur_created(created);
		List<PurchasesDTO> list = paymentService.selectInvoice(bean);
		UserBean userBean = new UserBean();     //헤더 위시리스트 숫자 갱신
	    userBean.setU_userid(session.getAttribute("userid").toString());
	    List<BasketDTO> list2 = joinService.configWish(userBean);
	    session.setAttribute("configW", list2.size());		
		mv.addObject("list", list);
		mv.setViewName("/views/invoice");	
		return mv;
	}
}