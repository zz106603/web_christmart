package com.mycompany.webapp.controller;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		Users user = usersService.getUserDetail(userId); 
		model.addAttribute("user", user);		
		
		return "usermodify/changeInfo";
	}
	
	
	@PostMapping(value = "/changeinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Changeinfo(Users user) {
		
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		user.setUserPassword(bpe.encode(user.getUserPassword()));
		String encodedPassword = bpe.encode(user.getUserPassword());
		
		logger.info(user.getRoadAddress());
		logger.info(user.getUserId());
		
		
		int changeResult = usersService.changeInfo(user);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		
		logger.info(jsonObject.toString());
		return jsonObject.toString();
		
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

