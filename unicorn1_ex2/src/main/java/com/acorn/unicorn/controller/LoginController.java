package com.acorn.unicorn.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.BestSellerDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.service.JoinService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService")
	private JoinService joinService;

	@RequestMapping(value = "/home.do")
	public ModelAndView index_view(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/views/home");
		List<BestSellerDTO> list = joinService.bestseller();
		mv.addObject("list", list);
		if(session.getAttribute("userid") != null){		//헤더쪽 위시리스트 숫자 갱신
			UserBean bean = new UserBean(); 
			bean.setU_userid(session.getAttribute("userid").toString());
			List<BasketDTO> list2 = joinService.configWish(bean);
			System.out.println(list2.size());
			session.setAttribute("configW", list2.size());
		}
		return mv;
	}
	
	@RequestMapping(value = "/promotion.do")
	public ModelAndView promotionView(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/views/promotion");
		List<BestSellerDTO> list = joinService.bestseller();
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public ModelAndView login_config(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/login/login1");
		
		return mv;
	}
	
	@RequestMapping(value = "/Login.do", method = RequestMethod.POST)
	public ModelAndView login_config2() throws Exception {
		ModelAndView mv = new ModelAndView("/login/login1");
		
		return mv;
	}
	
/*	@RequestMapping(value = "/Login.do", method = RequestMethod.POST)
	public ModelAndView login_config2() throws Exception {
		ModelAndView mv = new ModelAndView("/login/login");
		
		return mv;
	}*/
	

	@RequestMapping(value = "/logincheck.do")
	public ModelAndView loginProcess(HttpSession session, HttpServletResponse response, UserBean bean) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/home.do");
		if (session.getAttribute("userid") != null) {
			session.removeAttribute("userid");
			session.removeAttribute("configW");
			return mv;
		}

		if (joinService.configUser(bean) != null) {
			UserDTO dto = joinService.configUser(bean);
			if (bean.getU_userid().equals(dto.getU_userid()) && bean.getU_password().equals(dto.getU_password()))
				session.setAttribute("userid", dto.getU_userid());
		} else {
			mv.setViewName("/login/login1");
			mv.addObject("fail", "fail");
			return mv;
		}
		return mv;
	}	

	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public ModelAndView error_view() throws Exception {
		return new ModelAndView("/errors/error2");
	}
}