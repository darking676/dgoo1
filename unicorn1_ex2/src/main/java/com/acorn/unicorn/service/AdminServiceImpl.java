package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.acorn.unicorn.bean.AdminBean;
import com.acorn.unicorn.bean.BoardreplyBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dao.AdminDAO;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ChartDTO;
import com.acorn.unicorn.dto.DeliveryDTO;
import com.acorn.unicorn.dto.ReviewDTO;
import com.acorn.unicorn.dto.UserDTO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public int newboardcount() throws Exception {
		return adminDAO.newboardcount();
	}

	@Override
	public int uercount() throws Exception {
		return adminDAO.newusercount();
	}

	@Override
	public int ordercount() throws Exception {
		return adminDAO.newordercount();
	}
	
	@Override
	public int comentcount() throws Exception{
		return adminDAO.admincomentcount();
	}
	
	@Override
	public List<DeliveryDTO> adminorderlist(int opagenum) throws Exception {
		return adminDAO.adminorderlist(opagenum);
	}

	@Override
	public boolean admindeliverystate(AdminBean bean) throws Exception {
		boolean admindeliverystate = false;
		admindeliverystate = adminDAO.admindeliverystate(bean);
		return admindeliverystate;
	}
	
	@Override
	public List<BoardDTO> adminboardlist(int pagenum) throws Exception {
		return adminDAO.adminboardlist(pagenum);
	}
	
	@Override
	public List<UserDTO> adminuserlist(int upagenum) throws Exception {
		return adminDAO.adminuserlist(upagenum);
	}
	
	@Override
	public List<ReviewDTO> adminconmentlist(int cpagenum) throws Exception {
		return adminDAO.admincomentlist(cpagenum);
	}

	@Override
	public List<DeliveryDTO> deliverylist(int opagenum) throws Exception {
		return adminDAO.deliverylist(opagenum);
	}

	@Override
	public List<BoardDTO> boardlist(int pagenum) throws Exception {
		return adminDAO.boardlist(pagenum);
	}

	@Override
	public List<UserDTO> userlist(int upagenum) throws Exception {
		return adminDAO.userlist(upagenum);
	}

	@Override
	public int deliverycount() throws Exception {
		return adminDAO.ordercount();
	}

	@Override
	public int boardcount() throws Exception {
		return adminDAO.boardcount();
	}

	@Override
	public int usercount() throws Exception {
		return adminDAO.usercount();
	}
	
	//adminboardreply
	public BoardDTO newboardreply(int b_id){
		return adminDAO.newboardreply(b_id);
	}
	
	public boolean boardstateup(int b_id){
		return adminDAO.boardstateup(b_id);
	}
	
	public boolean boardreplyins(BoardreplyBean bean){
		return adminDAO.boardreplyins(bean);
	}

	@Override
	public ReviewDTO commentreply(int rv_index) throws Exception {
		return adminDAO.commentreply(rv_index);
	}

	@Override
	public boolean commentstateup(int rv_index) throws Exception {
		return adminDAO.commentstateup(rv_index);
	}

	@Override
	public boolean commentreplyins(ReviewBean bean) throws Exception {
		return adminDAO.commentreplyins(bean);
	}

	//			2016.11.25
	@Override
	public List<ChartDTO> categorypurchases() throws Exception {
		return adminDAO.categorypurchases();
	}

	@Override
	public List<ChartDTO> productpurchases() throws Exception {
		return adminDAO.productpurchases();
	}

	@Override
	public List<ChartDTO> monthpurchases() throws Exception {
		return adminDAO.monthpurchases();
	}

	@Override
	public int daypurchases() throws Exception {
		return adminDAO.todaypurchases();
	}
	
	@Override
	public String configCoupon(int c_discount) {
		return adminDAO.configCoupon(c_discount);
	}
	
	@Override
	public boolean insertCoupon(CouponBean bean) {
		return adminDAO.insertCoupon(bean);
	}
	
}
