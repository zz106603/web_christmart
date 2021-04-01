package com.mycompany.webapp.controller;

import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.webapp.dto.Orders;
import com.mycompany.webapp.dto.Reviews;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsRefundService;
import com.mycompany.webapp.service.ReviewsService;

@Controller
@RequestMapping("/user")
public class PurchaseController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	DataSource dateSource;
	
	@Autowired
	ProductsRefundService productsRefundService;
	
	@Autowired
	OrdersService ordersService;
	
	@Autowired
	private ReviewsService reviewsService;
	
	
	
	/*주문리스트*/
	@GetMapping("/purchaselist")
	public String openPurchaseList(Model model) {
		
		//String userId = "a1@gmail.com";
		List<Orders> list = ordersService.getOrders();
		model.addAttribute(list);
		
		logger.info("주문리스트 실행");
		
		return "purchase/purchaseList";
	}
	
//	
//	/*주문디테일*/
//	@GetMapping("/purchaseListDetail")
//	public String openPurchaseListDetail(Model model,int productNo, int orderNo) {
//		
//		List<OrderProducts> list = ordersService.getOrderDetail(orderNo,productNo);
//		model.addAttribute(list);
//		
//		logger.info("상세보기 실행");
//		return "purchase/purchaseListDetail";
//	}
//	
//	
//	/*환불*/
//	@GetMapping("/exchangerefund")
//	public String openExchangeRefund(Model model,int orderNo) {
//		
//		List<ProductsRefund> list = productsRefundService.getRefund(orderNo);
//		model.addAttribute(list);
//		
//		logger.info("환불 실행");
//		return "purchase/exchangeRefund";
//	}
//	
	
	@PostMapping("/exchangerefund")
	public String ExchangeRefund() {
		return "redirect:/purchaselist";
	}
	

	
	@GetMapping("/review")
	public String openReview() {
		Reviews review = new Reviews();
		review.setOrderNo(3);
		review.setProductName("트리");
		review.setUserId("a1@gmail.com");
		logger.info(review.getProductName());
		logger.info(review.getUserId());
		return "purchase/review";
	}
	
	@RequestMapping(value="/createreview", method = {RequestMethod.GET, RequestMethod.POST})
	public void updateReview(Reviews review) {
		reviewsService.saveReview(review);
	}
	
	@GetMapping("/delreview")
	public String delReview(int reviewNo) {
		String userId = "a1@gmail.com";
		reviewsService.deleteReview(reviewNo, userId);		
		return "redirect:/product";
	}

}
