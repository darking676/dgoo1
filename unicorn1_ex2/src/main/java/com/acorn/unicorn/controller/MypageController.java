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

import com.acorn.unicorn.bean.BoardAndReplyBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BoardAndReplyDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.MyDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.service.MyService;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myService")
	private MyService myService;
	
	@RequestMapping(value="/my_info.do")
	   public ModelAndView my_infoView(HttpSession session) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")){
	         mv.setViewName("/login/login1");
	      }else{
	         UserDTO mydto = myService.MyInfoList((String)session.getAttribute("userid"));
	         List<CouponDTO> my_coupon = myService.selectCoupon((String)session.getAttribute("userid"));
	         mv.addObject("myDto", mydto);
	         mv.addObject("my_coupon", my_coupon);
	         mv.addObject("header_selecter","MyPage");//li active 용
	         mv.setViewName("/views/my_info");
	      }
	      return mv;
	   }
	   
	   @RequestMapping(value="/my_history.do")
	   public ModelAndView my_historyView(HttpSession session, @RequestParam(value="pageNum", defaultValue="1") String pageNum ) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")){
	         mv.setViewName("/login/login1");
	      }else{
	         mv.addObject("header_selecter","MyPage");//li active 용
	         mv.setViewName("/views/my_history");
	         String userid = (String)session.getAttribute("userid");
	         
	         List<MyDTO> list1 = myService.selectPurchasList(userid);
	         List<MyDTO> list2 = myService.selectPurchasListDistinct(userid);
	         
	         mv.addObject("list1", list1);
	         mv.addObject("list2", list2);
	         
	         int pagenum = Integer.parseInt(pageNum);   //페이징에 쓸거
	         mv.addObject("pageNum",pagenum);
	         
	      }
	      return mv;
	   }
	   
	   @RequestMapping(value="/my_QnA.do")
	   public ModelAndView my_QnAView(HttpSession session, BoardAndReplyBean bean) throws Exception{
	      ModelAndView mv = new ModelAndView();
	      if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")){
	         mv.setViewName("/login/login1");
	      }else{
	         List<BoardAndReplyDTO> list = myService.myQnA((String)session.getAttribute("userid"));
	         mv.setViewName("/views/my_QnA");
	         mv.addObject("QnAlist",list);
	         mv.addObject("header_selecter","MyPage");//li active 용
	         if(bean.getPageNum() == 0){
	             bean.setPageNum(1);
	          }
	          mv.addObject("pageNum",bean.getPageNum());
	      }
	      return mv;
	   }
	
	@RequestMapping(value="/updateMyInfo.do", method=RequestMethod.POST)
	public ModelAndView updateMyInfo(UserBean bean,HttpSession session){
		ModelAndView view = new ModelAndView();
		bean.setU_userid((String)session.getAttribute("userid"));
		if(bean.getU_mail().equals("NoneV") && bean.getU_name().equals("NoneV") && bean.getU_phone().equals("NoneV")
				&& bean.getU_address().equals("NoneV")){
			view.setViewName("/errors/myinfoAlert");
		}else{
			myService.updateInfo(bean);
			view.setViewName("redirect:/my_info.do");
		}
		return view;
	}
	
	@RequestMapping(value="/myModal.do")
	public ModelAndView myMoalProcess(@RequestParam("gnum") String gnum, HttpSession session)throws Exception{
		ModelAndView view = new ModelAndView("/views/my_modal");
		List<MyDTO> list = myService.MyModal(gnum);
		view.addObject("list", list);
		System.out.println(gnum);
		System.out.println(list.size());
		return view;
	}
	
	@RequestMapping(value="/updatePassword.do")
	public ModelAndView updatePassword(UserBean bean, HttpSession session){
		ModelAndView view = new ModelAndView("redirect:/my_info.do");
		myService.updatePassword(bean);
		return view;
	}
	
}
