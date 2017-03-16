package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dao.MyDAO;
import com.acorn.unicorn.dto.BoardAndReplyDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.MyDTO;
import com.acorn.unicorn.dto.UserDTO;

@Service("myService")
public class MyServiceImpl implements MyService{
	
	@Resource(name="myDAO")
	private MyDAO myDAO;
	
	@Override
	public List<MyDTO> selectPurchasList(String userid) throws Exception {
		return myDAO.selectpurchase(userid);
	}
	
	@Override
	public List<MyDTO> selectPurchasListDistinct(String userid) throws Exception {
		return myDAO.selectpurchaseDistinct(userid);
	}
	
	@Override
	public List<MyDTO> MyModal(String gnum) throws Exception {
		return myDAO.MyModal(gnum);
	}
	
	@Override
	public UserDTO MyInfoList(String userid) {
		return myDAO.selectUserOne("my.myinfo", userid);
	}
	
	@Override
	public int updateInfo(UserBean bean) {
		return myDAO.update("my.updateMyInfo", bean);
	}
	@Override
	public List<BoardAndReplyDTO> myQnA(String userid) {
		return myDAO.selectList("board.QnA",userid);
	}
	
	@Override
	public List<CouponDTO> selectCoupon(String userid) {
		return myDAO.selectList("my.selectCoupon", userid);
	}
	
	@Override
	public int updatePassword(UserBean bean) {
		return myDAO.update("my.updatePassword", bean);
	}
}
