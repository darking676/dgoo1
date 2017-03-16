package com.acorn.unicorn.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.bean.PurchasesBean;
import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dto.DetailDTO;
import com.acorn.unicorn.dto.PurchasesDTO;
import com.acorn.unicorn.dto.ReviewDTO;

@Repository("DetailDAO")
public class DetailDAO extends AbstractDAO {
	
	public DetailDTO selectproducts (String p_id) throws Exception{
		return selectOne("detail.selectDetailProducts", p_id);
	}
	
	@SuppressWarnings("unchecked")
	public List<DetailDTO> selectproducts_option (String p_id) throws Exception{
		return selectList("detail.selectDetailProducts_option", p_id);
	}
	
	public DetailDTO selectP_bun(String p_id) throws Exception{
		return selectOne("detail.selectP_bun", p_id);
	}
	
	@SuppressWarnings("unchecked")
	   public List<PurchasesDTO> reviewAuthority(String userid, String productId) throws Exception{
	      PurchasesBean bean = new PurchasesBean();
	      bean.setPur_p_id(productId);
	      bean.setPur_userid(userid);
	      return selectList("detail.reviewAuthority", bean);
	   }
	   
	   @SuppressWarnings("unchecked")
	   public List<ReviewDTO> reviewList(String user_id, String p_id) throws Exception{
	      ReviewBean bean = new ReviewBean();
	      bean.setRv_userid(user_id);
	      bean.setRv_pid(Integer.parseInt(p_id));
	      return selectList("detail.reviewList", bean);
	   }
	   
	   @SuppressWarnings("unchecked")
	   public List<ReviewDTO> reviewList(String p_id) throws Exception{
	      ReviewBean bean = new ReviewBean();
	      bean.setRv_pid(Integer.parseInt(p_id));
	      return selectList("detail.reviewList", bean);
	   }
	   
	   public int getGnum() throws Exception{
	      return selectOneReturnInt("detail.getGnum");
	   }
	   public int insertReview(ReviewBean bean) throws Exception{
	      return insertReview("detail.insertReview", bean);
	   }

	   public int getReviewListSize(String p_id) throws Exception{
	      return selectOneReturnInt("detail.getReviewListSize",p_id);
	   }
}
