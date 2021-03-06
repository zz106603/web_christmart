package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.OrderProducts;
import com.mycompany.webapp.dto.Orders;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.Wishlist;
import com.mycompany.webapp.service.CartService;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.WishlistService;


@Controller
@RequestMapping("/user")
public class OrderController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrderController.class);

	Cart[] cartArray;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductsService productService;
	
	@Autowired
	private WishlistService wishlistService;


	@Autowired
	private OrdersService ordersService;

	@Autowired
	private OrderProductsService orderProductsService;
	
	@GetMapping("/cart")
	public String openCart(String pageNo, Model model, HttpSession session) {
		Cart cart = new Cart();
		cart.setUserId("a1@gmail.com");
		String userId = cart.getUserId();
		
		int intPageNo = 1;
		if(pageNo == null ) {
			Pager pager = (Pager)session.getAttribute("pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}
				
		int totalRows = cartService.getTotalRows(userId);
		Pager pager = new Pager(5, 5, totalRows, intPageNo);
		session.setAttribute("pager", pager);		
		
		List<Cart> clist = cartService.getCart(pager, userId);
		cartArray = new Cart[clist.size()];
		
		//logger.info(String.valueOf(clist.size()));
		//logger.info(clist.getIndex(1).getIndex);
		model.addAttribute("clist",clist);
		model.addAttribute("pager", pager);	
		
		return "order/cart";
	}
	//???????????? ??????
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
			logger.info("false???");
		}

		return "redirect:/product?productNo=" + cart.getProductNo();
	}

	@GetMapping("/delcart")
	public String delCart(int productNo) {
		logger.info("??????");
		int pno = productNo;
		String userID = "a1@gmail.com";
		
		/*Cart cart = new Cart();
		cart.setUserId("a1@gmail.com");
		cart.setProductNo(productNo);
		cart.setAmount(2);
		cart.setAllprice(20000);
		cart.setRegdate(new Date());
		cart.setProductName("??????1");
		cart.setPrice(10000);
		cart.setImgOname("26.jpg");
		cart.setImgSname("132546-1231");
		cart.setImgType("image");*/
		
		logger.info(String.valueOf(productNo));
		
		cartService.deleteCart(pno, userID);
		
		return "redirect:/cart";
	}
	
	@PostMapping("/updateamount")
	public String updateAmount(Cart cart) {
		//Products product = productsService.getProduct(cart.getProductNo());
		int allprice = cart.getAmount() * cart.getPrice();
		cart.setAllPrice(allprice);
		cartService.updateAmount(cart);
		return "redirect:/cart";
	}

	@PostMapping("/order")
	public String openOrder(HttpServletRequest request, Model model) {
		String[] productNo = request.getParameterValues("productNo");
		String[] userId = request.getParameterValues("userId");
		String[] amount = request.getParameterValues("amount");
		String[] allPrice = request.getParameterValues("allPrice");
		String[] productName = request.getParameterValues("productName");
		String[] price = request.getParameterValues("price");
		String[] imgOname = request.getParameterValues("imgOname");
		String[] imgSname = request.getParameterValues("imgSname");
		String[] imgType = request.getParameterValues("imgType");
		for(int i =0; i < productName.length; i++) {
			cartArray[i] = new Cart();
//			logger.info(productName[i]);
//			logger.info(String.valueOf(productNo[i]));
			if(cartArray[i].getProductName() == null) {
				cartArray[i].setProductNo(Integer.parseInt(productNo[i]));
				cartArray[i].setUserId(userId[i]);
				cartArray[i].setAmount(Integer.parseInt(amount[i]));
				cartArray[i].setAllPrice(Integer.parseInt(allPrice[i]));
				cartArray[i].setProductName(productName[i]);
				cartArray[i].setPrice(Integer.parseInt(price[i]));
				cartArray[i].setImgOname(imgOname[i]);
				cartArray[i].setImgSname(imgSname[i]);
				cartArray[i].setImgType(imgType[i]);
				
			}
			//logger.info(String.valueOf(cartArray[i].getProductNo()));
//			logger.info(cartArray[i].getUserId());
//			logger.info(String.valueOf(cartArray[i].getAmount()));
//			logger.info(String.valueOf(cartArray[i].getAllPrice()));
//			logger.info(cartArray[i].getProductName());
//			logger.info(String.valueOf(cartArray[i].getProductNo()));
//			logger.info(cartArray[i].getImgOname());
//			logger.info(cartArray[i].getImgSname());
//			logger.info(cartArray[i].getImgType());			
		}
		
		String sum = request.getParameter("sum");
		String count = request.getParameter("count");
//		logger.info(sum);
//		logger.info(count);
		model.addAttribute("sum", Integer.parseInt(sum));
		model.addAttribute("count", Integer.parseInt(count));
		
		return "order/order";
	}

	@PostMapping("/ordercomplete")
	public String openOrdercomplete(HttpServletRequest request) {
		Orders orders = new Orders();
		String allPrice = request.getParameter("allPrice");
		String zipCode = request.getParameter("zipCode");
		
		orders.setUserId(cartArray[0].getUserId());	
		orders.setAllPrice(Integer.parseInt(allPrice));
		orders.setZipCode(Integer.parseInt(zipCode));
		orders.setRoadAddress(request.getParameter("roadAddress"));
		orders.setDetailAddress(request.getParameter("detailAddress"));
		
//		logger.info(orders.getUserId());
//		logger.info(orders.getRoadAddress());
//		logger.info(orders.getDetailAddress());
		ordersService.saveOrder(orders);
		
		OrderProducts orderProducts = new OrderProducts();
		
		for(int i = 0; i < 4; i++) {
			if(cartArray[i].getProductName() == null) {
				break;
			}
			else{
				//logger.info(String.valueOf(cartArray[i].getProductNo()));
				orderProducts.setProductNo(cartArray[i].getProductNo());
				orderProducts.setUserId(cartArray[i].getUserId());
				orderProducts.setAmount(cartArray[i].getAmount());
				orderProducts.setPrice(cartArray[i].getAllPrice());
//				
//				logger.info(String.valueOf(orderProducts.getProductNo()));
//				logger.info(orderProducts.getUserId());
				
				orderProductsService.saveOrderProduct(orderProducts);
				cartService.deleteCart(orderProducts.getProductNo(), orderProducts.getUserId());
			} 
		}		
		//cartArray.fill();
		//cartArray = 0;
		
		cartArray = new Cart[10];
		return "order/ordercomplete";
	}

	@GetMapping("/wishlist")
	public String openWishlist(String pageNo, Model model, HttpSession session) {

		int intPageNo = 1;
		if (pageNo == null) {
			// ???????????? Pager??? ??????, ????????? pageNo??? ????????????,
			Pager pager = (Pager) session.getAttribute("pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
			// ????????? Pager??? ????????? ?????????
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}

		/*Wishlist wishlist = new Wishlist();
		wishlist.setUserId("a3@gmail.com");
		wishlist.setProductNo(intPageNo);*/

		int totalRows = wishlistService.getTotalRows();
		Pager pager = new Pager(12, 10, totalRows, intPageNo);
		session.setAttribute("pager", pager);

		List<Wishlist> list = wishlistService.getWishlist(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);

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
				logger.info("??????");
				logger.info("??????");
				logger.info("??????");
				logger.info("??????");
				logger.info("??????");
				check = false; 
				break; 
			} 
		}
		
		if(check == true) {
			int result = wishlistService.saveWishlist(wishlist);;
		}else {
			logger.info("false???");
		}

		return "redirect:/product?productNo=" + wishlist.getProductNo();
	}

	@GetMapping("/delwishlist")
	public String delWishList(int productNo) {
		/*logger.info(String.valueOf(productNo));*/

		wishlistService.deleteWishlist(productNo);
		return "redirect:/wishlist";
	}


}
