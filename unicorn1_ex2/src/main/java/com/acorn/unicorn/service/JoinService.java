package com.acorn.unicorn.service;

import java.util.List;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.BestSellerDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.dto.ZipcodeDTO;

public interface JoinService {
	int insertUser(UserBean bean) throws Exception;
	
	UserDTO configUser(UserBean bean) throws Exception;

	//bestseller
	List<BestSellerDTO> bestseller() throws Exception;

	List<BasketDTO> configWish(UserBean bean);
	
	//idcheck
	UserDTO idcheck(String idcheck) throws Exception;
	
	//zipcode
	List<ZipcodeDTO> zipcode(String area3) throws Exception;
	
}
