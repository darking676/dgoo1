package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dao.BoardDAO;
import com.acorn.unicorn.dao.JoinDAO;
import com.acorn.unicorn.dao.ProductDAO;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.BestSellerDTO;
import com.acorn.unicorn.dto.UserDTO;
import com.acorn.unicorn.dto.ZipcodeDTO;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="boardDAO")
    private BoardDAO boardDAO;
	
    @Resource(name = "productDAO")
    private ProductDAO productDAO;
    
    @Resource(name = "joinDAO")
    private JoinDAO joinDAO;
    
    
    @Override
    public int insertUser(UserBean bean) throws Exception {
    	int b = joinDAO.insertUser(bean);
		return b;
    }
    
    @Override
    public UserDTO configUser(UserBean bean) throws Exception {
    	return boardDAO.configUser(bean);
    }
    
    @Override
    public List<BestSellerDTO> bestseller() throws Exception {
    	return productDAO.bestseller();
    }
    @Override
    public List<BasketDTO> configWish(UserBean bean) {
    	return productDAO.selectList(bean);
    }
    
    //idcheck
    @Override
    public UserDTO idcheck(String idcheck) throws Exception {
    	return joinDAO.idcheck(idcheck);
    }
    
    //zipcode
    public List<ZipcodeDTO> zipcode(String area3) throws Exception{
    	return joinDAO.zipcode(area3);
    }
}
