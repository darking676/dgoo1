package com.acorn.unicorn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.AdminBean;
import com.acorn.unicorn.bean.BoardreplyBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ChartDTO;
import com.acorn.unicorn.dto.DeliveryDTO;
import com.acorn.unicorn.dto.ReviewDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.service.AdminService;
import com.acorn.unicorn.service.BoardService;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public ModelAndView admincheck(@RequestParam(value = "pagenum", defaultValue = "1") String pagenum,
									@RequestParam(value = "opagenum", defaultValue = "1") String opagenum,
									@RequestParam(value = "upagenum", defaultValue = "1") String upagenum,
									@RequestParam(value = "cpagenum", defaultValue = "1") String cpagenum, 
									@RequestParam(value = "reply", required=false)String reply
									) throws Exception{
		ModelAndView mv = new ModelAndView("views/admin");
		
		//////////////////////////////////////////////////
		int adminboardcount = adminService.newboardcount();
		int adminordercount = adminService.ordercount();
		int adminusercount = adminService.uercount();
		int admincomentcount = adminService.comentcount();

		/////////////////////////////////////////////////
		
		
		/////////////////////////////////////////////////
		int pageSize = 10;
		int count = adminboardcount;
		int currentPage = Integer.parseInt(pagenum);
		int startRow = (currentPage -1) * pageSize;
		
		List<BoardDTO> list = adminService.adminboardlist(startRow);

		mv.addObject("list", list);
		mv.addObject("currentPage", currentPage);
		mv.addObject("count", count);
		mv.addObject("pageSize", pageSize);
		
		///////////////////////////////////////////////

		///////////////////////////////////////////////
		int opageSize = 10;
		int ocount = adminordercount;
		int ocurrentPage = Integer.parseInt(opagenum);
		int ostartRow = (ocurrentPage - 1) * opageSize;
		
		List<DeliveryDTO> olist = adminService.adminorderlist(ostartRow);
		
		mv.addObject("olist", olist);
		mv.addObject("ocurrentPage", ocurrentPage);
		mv.addObject("ocount", ocount);
		mv.addObject("opageSize", opageSize);
		
		////////////////////////////////////////////////
		
		///////////////////////////////////////////////
		int upageSize = 10;
		int ucount = adminusercount;
		int ucurrentPage = Integer.parseInt(upagenum);
		int ustartRow = (ocurrentPage - 1) * upageSize;
		
		List<UserDTO> ulist = adminService.adminuserlist(ustartRow);
		
		mv.addObject("ulist", ulist);
		mv.addObject("ucurrentPage", ucurrentPage);
		mv.addObject("ucount", ucount);
		mv.addObject("upageSize", upageSize);
		
		////////////////////////////////////////////////
		
		///////////////////////////////////////////////
		int cpageSize = 10;
		int ccount = admincomentcount;
		
		int ccurrentPage = Integer.parseInt(cpagenum);
		int cstartRow = (ccurrentPage - 1) * cpageSize;
		
		List<ReviewDTO> clist = adminService.adminconmentlist(cstartRow);
		
		mv.addObject("clist", clist);
		mv.addObject("ccurrentPage", ccurrentPage);
		mv.addObject("ccount", ccount);
		mv.addObject("cpageSize", cpageSize);
		
		////////////////////////////////////////////////
		
		String tp = "";
		String top5name = "";
		String top5cnt = "";
		String category = "";
		String categorycnt = "";
		
		List<ChartDTO> categorylist = adminService.categorypurchases();
		List<ChartDTO> productlist = adminService.productpurchases();
		List<ChartDTO> monthlist = adminService.monthpurchases();
		int todaypurchases = adminService.daypurchases();
		
		for (int i = 0; i < monthlist.size(); i++) {
			tp += monthlist.get(i).getTotal_price() + ",";
		}
		
		for (int i = 0; i < productlist.size(); i++) {
			top5name += productlist.get(i).getP_name() + ",";
			top5cnt += productlist.get(i).getProduct5() + ",";
		}
		
		for (int i = 0; i < categorylist.size(); i++) {
			category += categorylist.get(i).getP_category() + ",";
			categorycnt += categorylist.get(i).getPur_cnt() + ",";
		}
		
		String[] tprice = tp.split(",");
		String[] t5name = top5name.split(",");
		String[] t5cnt = top5cnt.split(",");
		String[] categoryt5 = category.split(",");
		String[] catecnt5 = categorycnt.split(",");

		mv.addObject("category", categoryt5);
		mv.addObject("catecnt", catecnt5);
		mv.addObject("t5name", t5name);
		mv.addObject("t5cnt", t5cnt);
		mv.addObject("tp", tprice);
		mv.addObject("todaypurchases", todaypurchases);
		
		/////////////////////////////////////////////////
		
		mv.addObject("op", opagenum);
		mv.addObject("p", pagenum);
		mv.addObject("cp", cpagenum);
		mv.addObject("up", upagenum);
		
		mv.addObject("boardcount", adminboardcount);
		mv.addObject("usercount", adminusercount);
		mv.addObject("ordercount", adminordercount);
		mv.addObject("comentcount", admincomentcount);
		mv.addObject("reply", reply);
		
		return mv;
	}
	
	
	@RequestMapping(value = "dstateup.do", method = RequestMethod.GET)
	@ResponseBody()
	public boolean d_stateup(AdminBean bean)throws Exception{
		boolean b = false;
		b = adminService.admindeliverystate(bean);
		return b;
	}
	
	@RequestMapping(value = "adminorder.do")
	public ModelAndView adminorder(@RequestParam(value = "opagenum", defaultValue = "1") String opagenum)throws Exception{
		ModelAndView mv = new ModelAndView("views/adminorder");
		int adminordercount = adminService.deliverycount();

		int opageSize = 10;
		int ocount = adminordercount;
		int ocurrentPage = Integer.parseInt(opagenum);
		int ostartRow = (ocurrentPage - 1) * opageSize;

		List<DeliveryDTO> olist = adminService.deliverylist(ostartRow);
		
		mv.addObject("olist", olist);
		mv.addObject("ocurrentPage", ocurrentPage);
		mv.addObject("ocount", ocount);
		mv.addObject("opageSize", opageSize);
		
		return mv;
	}
	
	@RequestMapping(value = "adminboard.do")
	public ModelAndView adminboard(@RequestParam(value = "pagenum", defaultValue = "1")String pagenum) throws Exception{
		
		ModelAndView mv = new ModelAndView("views/adminboard");
		int adminboardcount = adminService.boardcount();
		
		int pageSize = 10;
		int count = adminboardcount;
		int currentPage = Integer.parseInt(pagenum);
		int startRow = (currentPage -1) * pageSize;
		
		List<BoardDTO> list = adminService.boardlist(startRow);

		mv.addObject("list", list);
		mv.addObject("currentPage", currentPage);
		mv.addObject("count", count);
		mv.addObject("pageSize", pageSize);

		
		
		return mv;
	}
	@RequestMapping(value = "adminuser.do")
	public ModelAndView adminuser(@RequestParam(value = "upagenum", defaultValue = "1")String upagenum)throws Exception{
		ModelAndView mv = new ModelAndView("views/adminuser");
		int adminusercount = adminService.usercount();
		
		int upageSize = 10;
		int ucount = adminusercount;
		int ucurrentPage = Integer.parseInt(upagenum);
		int ustartRow = (ucurrentPage - 1) * upageSize;
		
		List<UserDTO> ulist = adminService.userlist(ustartRow);
		
		mv.addObject("ulist", ulist);
		mv.addObject("ucurrentPage", ucurrentPage);
		mv.addObject("ucount", ucount);
		mv.addObject("upageSize", upageSize);

		return mv;
	}
	
	@RequestMapping(value = "coupon.do")
	public ModelAndView coupon(@RequestParam(value = "upagenum", defaultValue = "1")String upagenum)throws Exception{
		ModelAndView mv = new ModelAndView("views/adminCoupon");
		int adminusercount = adminService.usercount();
		
		int upageSize = 10;
		int ucount = adminusercount;
		int ucurrentPage = Integer.parseInt(upagenum);
		int ustartRow = (ucurrentPage - 1) * upageSize;
		
		List<UserDTO> ulist = adminService.userlist(ustartRow);
		
		mv.addObject("ulist", ulist);
		mv.addObject("ucurrentPage", ucurrentPage);
		mv.addObject("ucount", ucount);
		mv.addObject("upageSize", upageSize);
		
		return mv;
	}
	
	@RequestMapping(value = "/adminboardreply.do")
	@ResponseBody()
	public Map<String, Object> adminboardreply(String b_id) throws Exception{
		System.out.println(b_id);
		List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String, String> data = null;
		BoardDTO dto = adminService.newboardreply(Integer.parseInt(b_id));

		String bdate = dto.getB_crea_date().toString();
		
		data = new HashMap<String, String>();
		
		data.put("b_id", Integer.toString(dto.getB_id()));
		data.put("b_title", dto.getB_title());
		data.put("b_content", dto.getB_content());
		data.put("b_userid", dto.getB_userid());
		data.put("b_crea_date", bdate);
		datalist.add(data);
		
		
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("datas", datalist);
		return datas;
	}
	
	@RequestMapping(value = "/adminboardreplyup.do")
	public ModelAndView replyins(BoardreplyBean bean) throws Exception{
		ModelAndView mv = new ModelAndView();

		boolean stateup = false;
		boolean replyins = false;
		
		stateup = adminService.boardstateup(bean.getRp_bid());
		replyins = adminService.boardreplyins(bean);
		
		if (stateup == true && replyins == true){ 
			mv.setViewName("redirect:/admin.do");
		}else{ 
			mv.setViewName("redirect:error");
		}
		return mv;
	}
	
	@RequestMapping(value = "insertCoupon.do", method = RequestMethod.GET)
	@ResponseBody()
	public boolean insertCoupon(CouponBean bean)throws Exception{
		boolean b = false;
		String c_bun = Integer.toString(Integer.parseInt(adminService.configCoupon(bean.getC_discount())) + 1);
		bean.setC_bun(c_bun);
		b = adminService.insertCoupon(bean);
		return b;
	}
	
	@RequestMapping(value = "/commentreply.do")
	@ResponseBody()
	public Map<String, Object> commentreply(String rv_index) throws Exception{
		List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String, String> data = null;
		ReviewDTO dto = adminService.commentreply(Integer.parseInt(rv_index));

		String cdate = dto.getRv_regdate().toString();
		
		data = new HashMap<String, String>();
		data.put("rv_pid", Integer.toString(dto.getRv_pid()));
		data.put("rv_index", Integer.toString(dto.getRv_index()));
		data.put("p_name", dto.getP_name());
		data.put("rv_content", dto.getRv_content());
		data.put("rv_regdate", cdate);
		data.put("rv_userid", dto.getRv_userid());
		datalist.add(data);
		
		
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("datas", datalist);
		return datas;
	}
	
	@RequestMapping(value = "/commentreplyup.do")
	public ModelAndView reviewins(ReviewBean bean) throws Exception{
		
		
		ModelAndView mv = new ModelAndView();
		boolean reviewstate = adminService.commentstateup(bean.getRv_gnum());
		boolean reviewins = adminService.commentreplyins(bean);
		mv.setViewName("redirect:/admin.do");
		
		return mv;
	}
	
}
