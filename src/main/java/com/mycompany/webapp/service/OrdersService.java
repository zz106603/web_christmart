package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderProductsDao;
import com.mycompany.webapp.dao.OrdersDao;
import com.mycompany.webapp.dto.OrderProducts;
import com.mycompany.webapp.dto.Orders;


@Service
public class OrdersService {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersService.class);
		
	@Autowired
	private OrdersDao ordersDao;
	
	@Autowired
	private OrderProductsDao orderproductsDao;
	
	
	/*주문리스트*/
	public List<Orders> getOrders(){
		List<Orders> list = ordersDao.selectAll();
		
		logger.info("서비스 실행");
		return list;
	}
	
	
	/*주문디테일*/
	public List<OrderProducts> getOrderDetail(int orderNo, int productNo){
		List<OrderProducts> list = orderproductsDao.selectAll(orderNo,productNo);
		
		return list;
	}
	
	public void saveOrder(Orders orders) {
		ordersDao.insert(orders);
	}
	

}
