package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PurchaseController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderController.class);
	
	@GetMapping("/purchaselist")
	public String openPurchaseList() {
		return "purchase/purchaseList";
	}
	
	@GetMapping("/exchangerefund")
	public String openExchangeRefund() {
		return "purchase/exchangeRefund";
	}
	
	@PostMapping("/exchangerefund")
	public String ExchangeRefund() {
		return "redirect:/purchaselist";
	}
	
	@GetMapping("/review")
	public String openReview() {
		return "purchase/review";
	}
	
	@PostMapping("/delreview")
	public String delReview() {
		return "redirect:/product";
	}

}
