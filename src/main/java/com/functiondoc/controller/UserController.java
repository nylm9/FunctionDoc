package com.functiondoc.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.functiondoc.dto.UserDTO;
import com.functiondoc.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService usersvc;
	
	// 회원가입 페이지 이동
	@RequestMapping(value="/userRegisterPage")
	public ModelAndView userRegisterPage() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("user/userRegisterPage");
		
		return mav;
	};
	
	// 가입할 아이디 중복확인
	@RequestMapping(value = "/registerIdCheck")
	public @ResponseBody String registerIdCheck(String registerId) {
		
		String checkResult = usersvc.registerIdCheck(registerId);
		
		System.out.println(checkResult);
		
		Map<String, String> idCheckMsg = new HashMap<>();
		idCheckMsg.put("idCheckMsg", checkResult);
        Gson gson = new Gson();
		
		return gson.toJson(idCheckMsg);
	}
	
	// 회원가입 기능
	@RequestMapping(value = "/userRegister" )
	public ModelAndView userRegister(UserDTO user) throws UnsupportedEncodingException {
		System.out.println("Server->userRegister");
		ModelAndView mav = new ModelAndView();
		System.out.println(user);
		return null;
	}
}
