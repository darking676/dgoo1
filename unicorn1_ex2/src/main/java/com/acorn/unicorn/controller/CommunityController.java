package com.acorn.unicorn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dto.DetailDTO;
import com.acorn.unicorn.dto.PurchasesDTO;
import com.acorn.unicorn.dto.ReviewDTO;
import com.acorn.unicorn.service.DetailService;

@Controller
public class CommunityController {
	HttpSession session;
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "detailService")
	private DetailService detailService;
	
	
	@RequestMapping(value = "/community.do")
	public ModelAndView communityProcess(@RequestParam("p_id") String p_id, HttpSession session) throws Exception{
		
		String user_id = (String)session.getAttribute("userid");
		ModelAndView mv = new ModelAndView("/views/productdetail2");
		
		DetailDTO detailDTO = new DetailDTO();
		detailDTO = detailService.selectProductList(p_id);
		String a = detailDTO.getP_name(); //상품이름
		String b = a.replace(a.substring(0, a.lastIndexOf("]")+1), "").replace(" ", ""); //상품 이름에 []뺀것
		//String b = a.replace(a.substring(0, a.lastIndexOf("]")+1), "").replace(" ", "");
		List<DetailDTO> optionlist = detailService.selectProductoptionList(p_id);
		
		ArrayList<ArrayList> mArrayList = new ArrayList<ArrayList>();
		String url1 = "";
		String url2 = "";
		String url = "https://m.search.naver.com/search.naver?where=m_blog&sm=mtb_jum&query=아디다스" + b;
		Document doc = Jsoup.connect(url).get();

		Elements title = doc.select("li.api_bx").select("a");

		for(Element e : title){
			ArrayList<String> mArrayList2 = new ArrayList<String>();
			url1 = e.attr("href");
			Document doc2 = Jsoup.connect(url1).get();
			
			Elements title2 = doc2.select("img");
			
			for(Element e2 : title2){
				
				if(e2.attr("src").startsWith("http://mblogthumb")){
					mArrayList2.add(e2.attr("src"));
				}
			}
			
			Elements title3 = doc2.select("span._img");
			for(Element e3 : title3){
				mArrayList2.add(e3.attr("thumburl") + "w2");
				
			}
			
			mArrayList.add(mArrayList2);
			
		}
		
		//상품 상제정보 파싱
		DetailDTO dto = new DetailDTO();
		dto = detailService.selectP_bun(p_id);
		//System.out.println(dto.getP_bun());
		String pum = dto.getP_bun();
		String url_adidas = "http://shop.adidas.co.kr/PF020401.action?PROD_CD=" + pum;
		Document doc_adidas = Jsoup.connect(url_adidas).get();
		Elements title_adidas = doc_adidas.select("div.product-description").select("div.ct950");
		String ele_title = "";
		String ele_desc = "";
		
		for(Element e : title_adidas){
			ele_title = e.select("div.prd_title").toString();
			ele_desc = e.select("div.desc").toString();
		}
		

		//----------------------------review 쓸 수 있는 권한 확인 ----------------------------------------------
		
		List<ReviewDTO> reviewList = detailService.reviewList(p_id);	//한번쓴 고객은 리뷰를 또 쓸 수 없음
		int ReviewListSize = detailService.getReviewListSize(p_id);
		
		if(user_id != null){
			List<PurchasesDTO> purlist = detailService.reviewAuthority(user_id, p_id);	//구매한 고객만 리뷰를 쓸 수 있어야함
			List<ReviewDTO> CheckReviewList = detailService.reviewList(user_id, p_id);	//한번쓴 고객은 리뷰를 또 쓸 수 없음
			
			if(purlist.size() != 0 ){	//구매한 고객이 들어올경우
				if(CheckReviewList.size() != 0 ){	//그 고객이 이미 글을 썼을 경우
					mv.addObject("authority", "X");
				}else if(CheckReviewList.size() == 0 ){	//그 고객이 첫글일 경우
					mv.addObject("authority", "O");
				}
			}else{
				mv.addObject("authority", "X");
			}
		}else{
			mv.addObject("authority", "X");
		}
		
		//---------------------------------------##------------------------------------------
		mv.addObject("list", mArrayList);
		mv.addObject("reviewList", reviewList);
		mv.addObject("dto", detailDTO);
		mv.addObject("optionlist", optionlist);
		mv.addObject("ele_title", ele_title);
		mv.addObject("ele_desc", ele_desc);
		mv.addObject("rvlistSize",ReviewListSize);
		return mv;
	}
	
	@RequestMapping(value="/insertReview.do", method=RequestMethod.POST)
	   public ModelAndView insertReview(ReviewBean bean) throws Exception{   //이거 리뷰 쓰는거
	      ModelAndView view = new ModelAndView();
	      int gnum = 0;
	      if(bean.getRv_userid().equals("admin")){   //admin일때는 부모글의 gnum이 넘어옴
	         bean.setRv_lvl(1);
	      }else{                        //user는 내가 정해줌
	         bean.setRv_lvl(0);
	         gnum = detailService.getGnum();   //gnum 구한거
	         bean.setRv_gnum(gnum);
	      }
	      int result = detailService.insertReview(bean);
	      if(result < 1){
	         view.setViewName("redirect:/insertReviewError.do");
	      }else{
	         view.setViewName("redirect:/community.do?p_id=" + bean.getRv_pid());
	      }
	      return view;
	}
}
