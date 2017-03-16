package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dto.DetailDTO;
import com.acorn.unicorn.dto.PurchasesDTO;
import com.acorn.unicorn.dto.ReviewDTO;


public interface DetailService {
	DetailDTO selectProductList(String p_id) throws Exception;
	List<DetailDTO> selectProductoptionList(String p_id) throws Exception;
	DetailDTO selectP_bun(String p_id) throws Exception;
	List<PurchasesDTO> reviewAuthority(String userid, String productId) throws Exception; //리뷰 권한 확인
	List<ReviewDTO> reviewList(String user_id, String p_id) throws Exception;
	List<ReviewDTO> reviewList(String p_id) throws Exception;
	int getGnum() throws Exception;
    int insertReview(ReviewBean bean) throws Exception;
    int getReviewListSize(String p_id) throws Exception;
}
