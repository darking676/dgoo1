package com.acorn.unicorn.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.ProductBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.ProductDTO;
import com.acorn.unicorn.service.ProductService;

@Controller
public class ProductController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "productService")
	private ProductService productService;
	
	@RequestMapping(value = "/productlist.do", method=RequestMethod.GET)   //template 적용 상품리스트
	   public ModelAndView ProductList_template1(HttpSession session, ProductBean bean) throws Exception {
	      ModelAndView mv = new ModelAndView("/views/productlist1");
	      List<ProductDTO> list = (List<ProductDTO>) productService.selectProductList(bean);
	      mv.addObject("list", list);
	      mv.addObject("p_sort",bean.getP_sort());
	      mv.addObject("p_category",bean.getP_category());
	      mv.addObject("startPrice",bean.getEndPrice());
	      mv.addObject("endPrice",bean.getStartPrice());
	      
	      if(bean.getPageNum() == 0){
	         bean.setPageNum(1);
	      }
	      
	      mv.addObject("pageNum",bean.getPageNum());
	      
	      return mv;
	   }
	   
	   @RequestMapping(value = "/productlist.do", method=RequestMethod.POST)   //template 적용 상품리스트
	   public ModelAndView ProductList_template(HttpSession session, ProductBean bean) throws Exception {
	      ModelAndView mv = new ModelAndView("/views/productlist1");
	      List<ProductDTO> list = (List<ProductDTO>) productService.selectProductList(bean);
	      mv.addObject("list", list);
	      mv.addObject("p_sort",bean.getP_sort());
	      mv.addObject("p_category",bean.getP_category());
	      mv.addObject("startPrice",bean.getEndPrice());
	      mv.addObject("endPrice",bean.getStartPrice());
	      
	      if(bean.getPageNum() == 0){
	         bean.setPageNum(1);
	      }
	      mv.addObject("pageNum",bean.getPageNum());
	      
	      return mv;
	   }
	   
	   @RequestMapping(value="/search.do", method=RequestMethod.POST)
	   public ModelAndView search(ProductBean bean)  throws Exception {   //검색 기능
	      ModelAndView mv = new ModelAndView("/views/productlist1");
	      List<ProductDTO> list = (List<ProductDTO>) productService.ProductListBySearch(bean);
	      
	      mv.addObject("list", list);
	      if(bean.getPageNum() == 0){
	         bean.setPageNum(1);
	      }
	      mv.addObject("pageNum",bean.getPageNum());
	      return mv;
	   }
	
	@RequestMapping(value = "/ProductDetail.do", method=RequestMethod.GET)
	public ModelAndView ProductDetail(HttpSession session, @RequestParam("p_id") int p_id) throws Exception {
		ModelAndView mv = new ModelAndView("/views/productdetail");
		ProductDTO dto = productService.selectProductDetail(p_id);
		List<ProductDTO> list = productService.selectProductDetail_S(p_id);
		mv.addObject("dto", dto);
		mv.addObject("list", list);
		
		return mv;
	}
	
}