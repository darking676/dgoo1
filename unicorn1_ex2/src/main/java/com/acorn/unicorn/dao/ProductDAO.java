package com.acorn.unicorn.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.acorn.unicorn.bean.BoardBean;
import com.acorn.unicorn.bean.ProductBean;
import com.acorn.unicorn.bean.UserBean;
import com.acorn.unicorn.dto.BasketDTO;
import com.acorn.unicorn.dto.BestSellerDTO;
import com.acorn.unicorn.dto.BoardDTO;
import com.acorn.unicorn.dto.ProductDTO;
import com.acorn.unicorn.dto.UserDTO;

@Repository("productDAO")
public class ProductDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<ProductDTO> selectProductList(ProductBean bean) throws Exception{
		 return selectList("product.selectProductList", bean);
	}
	
	@SuppressWarnings("unchecked")
	public BoardDTO selectBoardDetail(int idx) throws Exception{
		return selectOne("board.selectBoardDetail", idx);
	}

	public void insertBoard(BoardBean bean) {
		insert("board.insertBoard", bean);
		
	}
	
	public void insertUser(UserBean bean) {
		insert("user.insertUser", bean);
		
	}

	public ProductDTO selectOne2(int p_id) {
		return selectOne2("product.selectProductDetail", p_id);
		
	}

	@SuppressWarnings("unchecked")
	public List<ProductDTO> selectProductDetail_S(int p_id) throws Exception{
		return selectList("product.selectProductDetail_S", p_id);
	}
	
	//bestseller
	public List<BestSellerDTO> bestseller() throws Exception{
		return bestseller("product.bestseller");
	}

	public List<BasketDTO> selectList(UserBean bean) {
		return selectList("payment.configWish", bean);
	}
	
	public List<ProductDTO> productListBySearch(ProductBean bean) throws Exception{
	      return selectList("product.search", bean);
	   }
}
