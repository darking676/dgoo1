package com.acorn.unicorn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.bean.AdminBean;
import com.acorn.unicorn.bean.BoardreplyBean;
import com.acorn.unicorn.bean.CouponBean;
import com.acorn.unicorn.bean.ReviewBean;
import com.acorn.unicorn.dto.AdminDTO;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ChartDTO;
import com.acorn.unicorn.dto.DeliveryDTO;
import com.acorn.unicorn.dto.ReviewDTO;
import com.acorn.unicorn.dto.UserDTO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{

	public int newboardcount() throws Exception{
		return newboardcount("admin.newboardcount");
	}
	
	public int newordercount() throws Exception{
		return newordercount("admin.newordercount");
	}
	
	public int newusercount() throws Exception{
		return newusercount("admin.newusercount");
	}
	
	
	public List<DeliveryDTO> adminorderlist(int opagenum) throws Exception{
		return admindeliberylist("admin.admindeliverylist", opagenum);
	}
	
	//admindeliverystate
	public boolean admindeliverystate(AdminBean bean) throws Exception{
		boolean b = admindeliverystate("admin.deliverystate", bean);
		return b;
	}
	
	//adminUserList
	public List<UserDTO> adminuserlist(int upagenum)throws Exception{
		return adminuserlist("admin.adminuserlist", upagenum);
	}
	
	//adminBoardList
	public List<BoardDTO> adminboardlist(int pagenum) throws Exception{
	return adminboardlist("admin.adminboardlist", pagenum);
	}
	
	//admin coment count
	public int admincomentcount() throws Exception{
		int comentcount = admincomentcount("admin.newcomentcount");
		return comentcount;
	}
	
	//admin coment list
	public List<ReviewDTO> admincomentlist(int cpagenum) throws Exception{
		return admincomentlist("admin.admincomentlist", cpagenum);
	}
	
	//delivery list
	public List<DeliveryDTO> deliverylist(int opagenum) throws Exception{
		return orderlist("admin.deliverylist", opagenum);
	}
	
	//board list
	public List<BoardDTO> boardlist(int pagenum) throws Exception{
		return boardlist("admin.boardlist", pagenum);
	}
	
	//user list
	public List<UserDTO> userlist(int upagenum) throws Exception{
		return userlist("admin.userlist", upagenum);
	}
	
	public int ordercount() throws Exception{
		return ordercount("admin.deliverycount");
	}
	
	public int boardcount() throws Exception{
		return boardcount("admin.boardcount");
	}
	
	public int usercount() throws Exception{
		return usercount("admin.usercount");
	}
	
	//admin board reply
	public BoardDTO newboardreply(int b_id){
		return newboardreply("admin.newboardreply", b_id);
	}
	
	public boolean boardstateup(int b_id){
		boolean b = boardstateup("admin.boardstateup",b_id); 
		return b;
	}
	
	public boolean boardreplyins(BoardreplyBean bean){
		boolean b = boardreplyins("admin.boardreplyins",bean);
		return b;
	}
	
	public ReviewDTO commentreply(int rv_index){
		return commentreply("admin.commentreply",rv_index);
	}

	public boolean commentstateup(int rv_index){
		boolean b = commentstateup("admin.commentstateup",rv_index); 
		return b;
	}
	
	public boolean commentreplyins(ReviewBean bean){
		boolean b = commentreplyins("admin.commentreplyins", bean);
		return b;
	}
	
	
	//			2016.11.25
	public List<ChartDTO> categorypurchases(){
		return categorypurchases("admin.categorypurchases");
	}
	
	public List<ChartDTO> productpurchases(){
		return productpurchases("admin.productpurchases");
	}
	
	public int todaypurchases(){
		return todaypurchases("admin.daypurchases");
	}
	
	public List<ChartDTO> monthpurchases(){
		return monthpurchases("admin.monthpurchases");
	}

	public String configCoupon(int c_discount) {
		return selectOne3("admin.configCoupon", c_discount);
	}

	public boolean insertCoupon(CouponBean bean) {
		boolean b = insert2("admin.insertCoupon", bean);
		return b;
	}

}
