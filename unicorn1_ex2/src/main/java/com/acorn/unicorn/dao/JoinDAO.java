package com.acorn.unicorn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.dto.ZipcodeDTO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{

	public UserDTO idcheck(String idcheck){
		return idcheck("join.idcheck", idcheck);
	}
	
	public List<ZipcodeDTO> zipcode(String area3){
		return zipcode("join.zipcode", area3);
	}
	
	
	public int insertUser(UserBean bean) {
		return insert("user.insertUser", bean);
		
	}
	
}
