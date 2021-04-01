package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderProductsDao;
import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.OrderProducts;

@Service
public class OrderProductsService {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderProductsService.class);
	
	@Autowired
	private OrderProductsDao orderProductsDao;
	
	public void saveOrderProduct(OrderProducts orderProducts) {
		orderProductsDao.insert(orderProducts);
	}
}
