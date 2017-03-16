package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dao.DetailDAO;
import com.acorn.unicorn.dto.DetailDTO;
import com.acorn.unicorn.dto.PurchasesDTO;
import com.acorn.unicorn.dto.ReviewDTO;

@Service("detailService")
public class DetailServiceImpl implements DetailService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="DetailDAO")
	private DetailDAO detailDAO;
	
	@Override
	public DetailDTO selectProductList(String p_id) throws Exception {
		// TODO Auto-generated method stub
		return detailDAO.selectproducts(p_id);
	}
	
	@Override
	public List<DetailDTO> selectProductoptionList(String p_id) throws Exception {
		// TODO Auto-generated method stub
		return detailDAO.selectproducts_option(p_id);
	}
	
	@Override
	public DetailDTO selectP_bun(String p_id) throws Exception {
		// TODO Auto-generated method stub
		return detailDAO.selectP_bun(p_id);
	}
	@Override
	   public List<PurchasesDTO> reviewAuthority(String userid, String productId) throws Exception {   //리뷰 권한 확인
	      return detailDAO.reviewAuthority(userid, productId);
	   }
	   
	   @Override
	   public List<ReviewDTO> reviewList(String user_id, String p_id) throws Exception {
	      return detailDAO.reviewList(user_id, p_id);
	   }
	   
	   @Override
	   public List<ReviewDTO> reviewList(String p_id) throws Exception {
	      return detailDAO.reviewList(p_id);
	   }
	   
	   @Override
	   public int getGnum() throws Exception {
	      return detailDAO.getGnum();
	   }
	   
	   @Override
	   public int insertReview(ReviewBean bean) throws Exception {
	      return detailDAO.insertReview(bean);
	   }
	   
	   @Override
	   public int getReviewListSize(String p_id) throws Exception {
	      return detailDAO.getReviewListSize(p_id);
	   }
	
	
}
