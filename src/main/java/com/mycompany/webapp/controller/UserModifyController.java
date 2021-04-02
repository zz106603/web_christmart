package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/user")
public class UserModifyController {
	private static final Logger logger =
			LoggerFactory.getLogger(UserModifyController.class);
	
	@Autowired
	private UsersService usersService; 
	
	@GetMapping("/changeinfo")
	public String openChangeinfo(Authentication auth, Model model) {
		
		String userId = auth.getName();
		logger.info(userId);
		Users user = usersService.getUserDetail(userId); 
		model.addAttribute("user", user);		
		
		logger.info(user.getUserName());
		
		return "usermodify/changeInfo";
	}
	
	@PostMapping("/changeinfo")
	public String Changeinfo() {
		return "redirect:/main";
	}
	
	@GetMapping("/withdrawal")
	public String openWithdrawal() {
		return "usermodify/withdrawal";
	}
	
	@PostMapping("/withdrawal")
	public String Withdrawal() {
		return "redirect:/main";
	}
}
