package com.mycompany.webapp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.Wishlist;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.WishlistService;


@Controller
public class OrderController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductsService productService;
	
	@Autowired
	private WishlistService wishlistService;

	@GetMapping("/cart")
	public String openCart() {
		return "order/cart";
	}

	//선택옵션 정보
	@PostMapping("/addcart")
	public String addCart(Cart cart) {

		boolean check = true;
		cart.setUserId("a1@gmail.com");

		Products product = productService.getProductDetail(cart.getProductNo()).get(0);
		int allprice = cart.getAmount()*product.getProductPrice();
		cart.setAllPrice(allprice);
		
		List<Cart> list = cartService.getCart();

		for(int i=0; i<list.size(); i++) { 
			if(list.get(i).getProductNo() == cart.getProductNo() 
					&& list.get(i).getUserId().equals(cart.getUserId())) {
				check = false; 
				break; 
			} 
		}
		
		if(check == true) {
			int result = cartService.saveCart(cart);
		}else {
			logger.info("false다");
		}

		return "redirect:/product?productNo=" + cart.getProductNo();
	}

	@PostMapping("/delcart")
	public String delCart() {
		return "redirect:/cart";
	}

	@GetMapping("/order")
	public String openOrder() {
		return "order/order";
	}

	@PostMapping("/ordercomplete")
	public String openOrdercomplete() {
		return "order/ordercomplete";
	}

	@GetMapping("/wishlist")
	public String openWishlist() {
		return "order/wishlist";
	}

	@PostMapping("/addwishlist")
	public String addWishList(Wishlist wishlist) {
		
		boolean check = true;
		wishlist.setUserId("a1@gmail.com");

		List<Wishlist> list = wishlistService.getWishlist();
		logger.info(String.valueOf(list.get(0).getProductNo()));
		logger.info(String.valueOf(list.get(0).getUserId()));

		for(int i=0; i<list.size(); i++) { 
			if(list.get(i).getProductNo() == wishlist.getProductNo() 
					&& list.get(i).getUserId().equals(wishlist.getUserId())) {
				logger.info("찾음");
				logger.info("찾음");
				logger.info("찾음");
				logger.info("찾음");
				logger.info("찾음");
				check = false; 
				break; 
			} 
		}
		
		if(check == true) {
			int result = wishlistService.saveWishlist(wishlist);;
		}else {
			logger.info("false다");
		}

		return "redirect:/product?productNo=" + wishlist.getProductNo();
	}

	@PostMapping("/delwishlist")
	public String delWishList() {
		return "redirect:/wishlist";
	}


}
