package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	private static final Logger logger =
			LoggerFactory.getLogger(UserController.class);
	
	@GetMapping("/login")
	public String openLogin() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String Login() {
		return "redirect:/main";
	}

	@GetMapping("/signup")
	public String openSignup() {
		return "user/signup";
	}
	
	@PostMapping("/signup")
	public String Signup() {
		return "redirect:/main";
	}
	
	@GetMapping("/findidpw")
	public String openFindidpw() {
		return "user/findidpw";
	}
	

	
	
}
