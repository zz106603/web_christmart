package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/auth")
public class UserController {
	private static final Logger logger =
			LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/login")
	public String openLogin() {
		return "user/login";
	}
	

	@GetMapping("/signup")
	public String openSignup() {
		return "user/signup";
	}
	
	@PostMapping("/signup")
	public String Signup(Users user) {
		
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		user.setUserPassword(bpe.encode(user.getUserPassword()));
		String encodedPassword = bpe.encode(user.getUserPassword());
		
		int result = usersService.join(user);
		
		
		return "redirect:/main";
	}
	
	@GetMapping("/findidpw")
	public String openFindidpw() {
		return "user/findidpw";
	}
	

	
	
}
