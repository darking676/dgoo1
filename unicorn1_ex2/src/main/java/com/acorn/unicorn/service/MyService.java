package com.acorn.unicorn.service;

import java.util.List;

import org.apache.maven.model.Extension;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BoardAndReplyDTO;
import com.acorn.unicorn.dto.CouponDTO;
import com.acorn.unicorn.dto.MyDTO;
import com.acorn.unicorn.dto.UserDTO;

public interface MyService {
	List<MyDTO> selectPurchasList(String userid) throws Exception;
	List<MyDTO> selectPurchasListDistinct(String userid) throws Exception;
	List<MyDTO> MyModal(String gnum) throws Exception;
	UserDTO MyInfoList(String userid);
	int updateInfo(UserBean bean);
	List<BoardAndReplyDTO> myQnA(String userid);
	List<CouponDTO> selectCoupon(String userid);
	int updatePassword(UserBean bean);
}
