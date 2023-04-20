package com.functiondoc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.functiondoc.dto.UserDTO;
import com.functiondoc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService usersvc;
	
	@RequestMapping(value = "/userRegister" )
	public String userRegister(String registerId, String registerPw, String registerName) {
		System.out.println("Server->userRegister " + registerId);
		
		UserDTO userRegister = new UserDTO();
		userRegister.setUserId(registerId);
		userRegister.setUserPw(registerPw);
		userRegister.setUserName(registerName);
		
		usersvc.userRegister(userRegister);
		
		
		return null;
	}
}
