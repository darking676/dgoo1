package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.AdminBean;
import com.acorn.unicorn.bean.BoardreplyBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ChartDTO;
import com.acorn.unicorn.dto.DeliveryDTO;
import com.acorn.unicorn.dto.ReviewDTO;
import com.acorn.unicorn.dto.UserDTO;

public interface AdminService {
	//boardcount
	int newboardcount() throws Exception;
	
	//usercount
	int uercount() throws Exception;
	
	//ordercount
	int ordercount() throws Exception;
	
	//coment count
	int comentcount() throws Exception;
	
	List<DeliveryDTO> adminorderlist(int opagenum) throws Exception;
	
	boolean admindeliverystate(AdminBean bean) throws Exception;
		
	List<BoardDTO> adminboardlist(int pagenum) throws Exception;
	
	List<UserDTO> adminuserlist(int upagenum) throws Exception;
	
	List<ReviewDTO> adminconmentlist(int cpagenum) throws Exception;
	
	List<DeliveryDTO> deliverylist(int opagenum) throws Exception;
	
	int deliverycount() throws Exception;
	
	List<BoardDTO> boardlist(int pagenum) throws Exception;
	
	int boardcount() throws Exception;
	
	List<UserDTO> userlist(int upagenum) throws Exception;
	
	int usercount() throws Exception;
	
	//adminboardreply
	
	BoardDTO newboardreply(int b_id) throws Exception;
	
	boolean boardstateup(int b_id)throws Exception;
	
	boolean boardreplyins(BoardreplyBean bean) throws Exception;
	
	ReviewDTO commentreply(int rv_index) throws Exception;
	
	boolean commentstateup(int rv_index) throws Exception;
	
	boolean commentreplyins(ReviewBean bean) throws Exception;
	
	//		2016/11/25
	List<ChartDTO> categorypurchases() throws Exception;
	
	List<ChartDTO> productpurchases() throws Exception;
	
	List<ChartDTO> monthpurchases() throws Exception;
	
	int daypurchases() throws Exception;

	String configCoupon(int c_discount);

	boolean insertCoupon(CouponBean bean);
	
}
