package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ProductsRefund;



@Mapper
public interface ProductsRefundDao {
	
	public List<ProductsRefund> selectAll(int orderNo);
	public int insert(ProductsRefund productsefund);
	public int update(ProductsRefund productsrefund);
}
