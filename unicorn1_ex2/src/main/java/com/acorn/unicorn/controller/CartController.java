package com.acorn.unicorn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.CartBean;
import com.acorn.unicorn.bean.ProductBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.ProductOptionDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.service.CartService;
import com.acorn.unicorn.service.JoinService;

@Controller
public class CartController {
   HttpSession session;
   Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name = "cartService")
   private CartService cartService;
   
   @Resource(name = "joinService")
   private JoinService joinService;
   
   @RequestMapping(value = "/wishlist.do")	//위시리스트
   public ModelAndView WishListView(HttpSession session,CartBean bean) throws Exception {
	   ModelAndView mv = new ModelAndView("/views/wishlist");
	  if(session.getAttribute("userid") == null){
		  mv.setViewName("errors/error");
		  return mv;
	  }
	  bean.setWish_userid(session.getAttribute("userid").toString());          //카트안에있는 품목 위시리스트로
      String[] str1 = bean.getWish_p_id().substring(0, bean.getWish_p_id().length()-1).split(",");  //품번
	  String[] str2 = bean.getP_price().substring(0, bean.getP_price().length()-1).split(",");	//가격
	  String[] str3 = bean.getWish_size().substring(0, bean.getWish_size().length()-1).split(","); //사이즈
	  String[] str4 = bean.getWish_number().substring(0, bean.getWish_number().length()-1).split(","); //수량
	  for (int i = 0; i < str1.length; i++) {
		bean.setWish_p_id(str1[i]);
		bean.setP_price(str2[i]);
		bean.setWish_size(str3[i]);
		bean.setWish_number(str4[i]);
		if(cartService.configProduct(bean) == null){   //장바구니에 제품이 없을때
			cartService.insertCart1(bean);   //추가
		}else{   //장바구니에 제품이 있을 때
			cartService.updateCart(bean);   //수정
		}		
	  }
	  
	  UserBean userBean = new UserBean();     //헤더 위시리스트 숫자 갱신
	  userBean.setU_userid(bean.getWish_userid());
	  List<BasketDTO> list2 = joinService.configWish(userBean);
	  session.setAttribute("configW", list2.size());		  
	  session.removeAttribute(session.getAttribute("userid") + "cart");	//카트 비워주기
      List<BasketDTO> list = cartService.selectCartList(bean.getWish_userid());  //위시리스트 불러오기
      List<CouponDTO> list4 = cartService.configCoupon(session.getAttribute("userid").toString()); //쿠폰조회
      UserDTO dto = cartService.configPoint(session.getAttribute("userid").toString()); //포인트조회
      String str = "";		//products_option 호출
	   if(list.size() > 0){
		   for (int i = 0; i < list.size(); i++) {
			   str += list.get(i).getWish_p_id() + ",";
		   }		   
	   }
	   if(str != ""){
		   bean.setWish_p_id(str.substring(0, str.length()-1));
		   List<ProductOptionDTO> list3 = cartService.configOption(bean);
		   mv.addObject("list2", list3);		   
	   }
      mv.addObject("list", list);
      mv.addObject("list3", list4);
      mv.addObject("point", dto);
      return mv;
   }
   
   @RequestMapping(value = "/detailWishlist.do")  //상품상세보기에서 위시리스트 담을때
   public ModelAndView WishListView2(HttpSession session,CartBean bean) throws Exception {
	   ModelAndView mv = new ModelAndView("/views/wishlist");
	   if(session.getAttribute("userid") == null){
		   mv.setViewName("errors/error");
		   return mv;
	   }
	   bean.setWish_userid(session.getAttribute("userid").toString());          //카트안에있는 품목 위시리스트로
	   
	   if(cartService.configProduct(bean) == null){   //장바구니에 제품이 없을때
		   cartService.insertCart1(bean);   //추가
	   }else{   //장바구니에 제품이 있을 때
		   cartService.updateCart(bean);   //수정
	   }		
	   
	   UserBean userBean = new UserBean();     //헤더 위시리스트 숫자 갱신
	   userBean.setU_userid(bean.getWish_userid());
	   List<BasketDTO> list2 = joinService.configWish(userBean);
	   session.setAttribute("configW", list2.size());		  
	   List<BasketDTO> list = cartService.selectCartList(bean.getWish_userid());  //위시리스트 불러오기
	   List<CouponDTO> list4 = cartService.configCoupon(session.getAttribute("userid").toString()); //쿠폰조회
	   UserDTO dto = cartService.configPoint(session.getAttribute("userid").toString()); //포인트조회
	   String str = "";		//products_option 호출
	   if(list.size() > 0){
		   for (int i = 0; i < list.size(); i++) {
			   str += list.get(i).getWish_p_id() + ",";
		   }		   
	   }
	   if(str != ""){
		   bean.setWish_p_id(str.substring(0, str.length()-1));
		   List<ProductOptionDTO> list3 = cartService.configOption(bean);
		   mv.addObject("list2", list3);		   
	   }
	   mv.addObject("list", list);
	   mv.addObject("list3", list4);
	   mv.addObject("point", dto);
	   return mv;
   }
   
   @RequestMapping(value = "/wishlist.do", method=RequestMethod.GET)
   public ModelAndView WishListView1(HttpSession session,CartBean bean) throws Exception {
	   if(session.getAttribute("userid") != null) bean.setWish_userid(session.getAttribute("userid").toString());
	   ModelAndView mv = new ModelAndView("/views/wishlist");
	   if(session.getAttribute("userid") != null) {
		   bean.setWish_userid(session.getAttribute("userid").toString());
		   List<CouponDTO> list4 = cartService.configCoupon(session.getAttribute("userid").toString()); //쿠폰조회
		   UserDTO dto = cartService.configPoint(session.getAttribute("userid").toString()); //포인트조회
		   mv.addObject("list3", list4);
		   mv.addObject("point", dto);
	   }
	   UserBean userBean = new UserBean();     //헤더 위시리스트 숫자 갱신
	   userBean.setU_userid(bean.getWish_userid());
	   List<BasketDTO> list3 = joinService.configWish(userBean);
	   session.setAttribute("configW", list3.size());
	   
	   List<BasketDTO> list = cartService.selectCartList(bean.getWish_userid());
	   String str = "";
	   if(list.size() > 0){
		   for (int i = 0; i < list.size(); i++) {
			   str += list.get(i).getWish_p_id() + ",";
		   }		   
	   }
	   if(str != ""){
		   bean.setWish_p_id(str.substring(0, str.length()-1));
		   List<ProductOptionDTO> list2 = cartService.configOption(bean);
		   mv.addObject("list2", list2);		   
	   }
	   mv.addObject("list", list);
	   return mv;
   }
   
   @RequestMapping(value = "/wishDelete.do")
   public ModelAndView SelectCartDel(HttpSession session,CartBean bean,ProductBean productbean) throws Exception {
	   ModelAndView mv = new ModelAndView("redirect:/wishlist.do");
	   bean.setWish_userid(session.getAttribute("userid").toString());
	   //bean.setWish_userid();
	   cartService.deleteCart(bean);
	   
	   UserBean userBean = new UserBean();     //헤더 위시리스트 숫자 갱신
	   userBean.setU_userid(session.getAttribute("userid").toString());
	   List<BasketDTO> list2 = joinService.configWish(userBean);
	   session.setAttribute("configW", list2.size());		  
	   return mv;
   }
   
   @RequestMapping(value = "/ProductUp.do")
   public ModelAndView SelectCartUp(CartBean bean) throws Exception {
      ModelAndView mv = new ModelAndView("redirect:/views/BasketView.do");
      cartService.updateCart(bean);
      return mv;
   }
   
   @RequestMapping(value= "/addToCart.do", method=RequestMethod.POST)
   public ModelAndView addToCart(CartBean cart_bean, final ProductBean product_bean, HttpSession session){
	  int no = 0;
	  int count = 0;
      ModelAndView view = new ModelAndView("redirect:/productlist.do");
      view.addObject("p_sex", product_bean.getP_sex());
      boolean ok = false;
      Object o = session.getAttribute((String)session.getAttribute("userid") + "cart");
      List<HashMap<String,Object>> wishList = null;
      if(o != null){
         wishList = (ArrayList) o;
         System.out.println(product_bean.getPo_size());
         System.out.println(product_bean.getP_number());
         System.out.println(product_bean.getP_id());
         for(int i = 0; i < wishList.size(); i++){
            if(wishList.get(i).get("p_id").equals(product_bean.getP_id()) && wishList.get(i).get("po_size").equals(product_bean.getPo_size())){
               ok = true;
               count = i;
               System.out.println(wishList.get(count).get("p_number").toString());
            }
         }
         if(ok == false){
            HashMap<String,Object> wishMap = new HashMap<String,Object>();
            wishMap.put("p_id",product_bean.getP_id());
            wishMap.put("p_name",product_bean.getP_name());
            wishMap.put("p_price",product_bean.getP_price());
            wishMap.put("p_img",product_bean.getP_img());
            wishMap.put("p_sex",product_bean.getP_sex());
            if(product_bean.getP_number() != 0){
            	wishMap.put("p_number",product_bean.getP_number());
            }else if(product_bean.getP_number() == 0){
            	wishMap.put("p_number",1);
            }
            if(product_bean.getPo_size() == null || product_bean.getPo_size().equals("")){
             	wishMap.put("po_size","X");
             }else{
            	 wishMap.put("po_size",product_bean.getPo_size());
             }
            wishList.add(wishMap);
         }else{
            //return new ModelAndView("errors/CartAlert");
        	 no = Integer.parseInt(wishList.get(count).get("p_number").toString());
        	 
        	 wishList.removeIf(new Predicate<Map<String, Object>>() {
                 @Override
                 public boolean test(Map<String, Object> wishmap) {
                    if (wishmap.containsValue(product_bean.getP_id())) {
                    	if (wishmap.containsValue(product_bean.getPo_size())) {
                            return true;
                         }
                    }
                    return false;
                 }
              });
        	 HashMap<String,Object> wishMap = new HashMap<String,Object>();
             wishMap.put("p_id",product_bean.getP_id());
             wishMap.put("p_name",product_bean.getP_name());
             wishMap.put("p_price",product_bean.getP_price());
             wishMap.put("p_img",product_bean.getP_img());
             wishMap.put("p_sex",product_bean.getP_sex());
             if(product_bean.getP_number() != 0){
             	wishMap.put("p_number",no + product_bean.getP_number());
             }else if(product_bean.getP_number() == 0){
             	wishMap.put("p_number",no + 1);
             }
             if(product_bean.getPo_size() == null || product_bean.getPo_size().equals("")){
              	wishMap.put("po_size","X");
              }else{
             	 wishMap.put("po_size",product_bean.getPo_size());
              }
             wishList.add(wishMap);
         }
      }else{
         wishList = new ArrayList<HashMap<String,Object>>();
         HashMap<String,Object> wishMap = new HashMap<String,Object>();
         wishMap.put("p_id",product_bean.getP_id());
         wishMap.put("p_name",product_bean.getP_name());
         wishMap.put("p_price",product_bean.getP_price());
         wishMap.put("p_img",product_bean.getP_img());
         wishMap.put("p_sex",product_bean.getP_sex());
         if(product_bean.getP_number() != 0){
         	wishMap.put("p_number",product_bean.getP_number());
         }else if(product_bean.getP_number() == 0){
         	wishMap.put("p_number",1);
         }
         if(product_bean.getPo_size() == null || product_bean.getPo_size().equals("")){
         	wishMap.put("po_size","X");
         }else{
        	 wishMap.put("po_size",product_bean.getPo_size());
         }
         wishList.add(wishMap);
         session.setAttribute((String)session.getAttribute("userid") + "cart", wishList);
      }
      return view;
   }
   
   @RequestMapping(value = "/deleteCart.do")
   @ResponseBody
   public void deleteCart(final ProductBean bean, HttpSession session) {
      Object o = session.getAttribute((String) session.getAttribute("userid") + "cart");
      List<HashMap<String, Object>> wishList = (ArrayList) o;
      wishList.removeIf(new Predicate<Map<String, Object>>() {
          @Override
          public boolean test(Map<String, Object> wishmap) {
             if (wishmap.containsValue(bean.getP_id())) {
                if (wishmap.containsValue(bean.getPo_size())) {
                     return true;
                  }
             }
             return false;
          }
       });
   }
}