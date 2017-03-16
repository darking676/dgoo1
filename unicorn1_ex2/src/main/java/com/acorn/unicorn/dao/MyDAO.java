package com.acorn.unicorn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.dto.MyDTO;


@Repository("myDAO")
public class MyDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<MyDTO> selectpurchase(String userid) throws Exception{
		return selectList("my.myselect", userid);
	}
	
	@SuppressWarnings("unchecked")
	public List<MyDTO> selectpurchaseDistinct(String userid) throws Exception{
		return selectList("my.myselectDistinct", userid);
	}
	
	@SuppressWarnings("unchecked")
	public List<MyDTO> MyModal(String gnum) throws Exception{
		return selectList("my.myModal", gnum);
	}
	
	
}
