package com.acorn.unicorn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.dto.ZipcodeDTO;
import com.acorn.unicorn.service.JoinService;


@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name = "joinService")
	private JoinService joinService;
	
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView joinProcess() throws Exception {
		ModelAndView mv = new ModelAndView("/views/join");

		return mv;
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView joinProcess(UserBean bean) throws Exception {
		ModelAndView mv = new ModelAndView();

		int b = joinService.insertUser(bean);
		System.out.println(b);
		
		if(b > 0){
			mv.setViewName("redirect:home.do");
		}

		return mv;
	}

	
	
	@RequestMapping(value = "/idcheck.do")
	@ResponseBody()
	public Map<String, Object> idcheck(String idcheck, HttpServletResponse response) {
		Map<String, String> data = null;
		data = new HashMap<String, String>();
		try {
			UserDTO dto = joinService.idcheck(idcheck);
			if(idcheck.equals(dto.getU_userid())) data.put("result", "등록불가");
		} catch (Exception e) {
			data.put("result", "사용하기");
			// TODO: handle exception
		}
		
		List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		
		datalist.add(data);
		
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("datas", datalist);
		System.out.println(datas);
		return datas;
		
	}
	
	@RequestMapping(value = "/zipcheck.do")
	@ResponseBody()
	public Map<String, Object> zipcheck(String area3){
		System.out.println(area3);
		List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
		
		Map<String, String> data = null;
		try {
			List<ZipcodeDTO> list = joinService.zipcode(area3);
			for(ZipcodeDTO d : list){
				data = new HashMap<String, String>();
				data.put("zipcode", d.getZipcode());
				data.put("area1", d.getArea1());
				data.put("area2", d.getArea2());
				data.put("area3", d.getArea3());
				data.put("area4", d.getArea4());
				data.put("area5", d.getArea5());
				data.put("area6", d.getArea6());
				datalist.add(data);
			}
		} catch (Exception e) {
			data.put("area3", "����");
		}
		
		
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("datas", datalist);
		return datas;
	}
	
}
