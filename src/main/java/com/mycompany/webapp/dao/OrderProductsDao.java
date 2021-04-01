package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderProducts;

@Mapper
public interface OrderProductsDao {

	public void insert(OrderProducts orderProducts);
	
	public List<OrderProducts> selectAll(int orderNo, int productNo);
}
