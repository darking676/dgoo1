package com.acorn.unicorn.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.acorn.unicorn.bean.ProductBean;
import com.acorn.unicorn.dao.ProductDAO;
import com.acorn.unicorn.dto.ProductDTO;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	Logger log = Logger.getLogger(this.getClass());
    
    @Resource(name="productDAO")
    private ProductDAO productDAO;
	
	@Override
	public List<ProductDTO> selectProductList(ProductBean bean) throws Exception {
		return productDAO.selectProductList(bean);
	}
	
	@Override
	public ProductDTO selectProductDetail(int p_id) throws Exception {
		return productDAO.selectOne2(p_id);
	}
	
	@Override
	public List<ProductDTO> selectProductDetail_S(int p_id) throws Exception {
		return productDAO.selectProductDetail_S(p_id);
	}
	@Override
	public List<ProductDTO> ProductListBySearch(ProductBean bean) throws Exception {   //검색
	   return productDAO.productListBySearch(bean);
	}
}
