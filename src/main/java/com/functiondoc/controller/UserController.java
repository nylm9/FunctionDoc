package com.functiondoc.controller;

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
	
	// 이메밍 확인 절차 기능 
	@RequestMapping(value ="/registerEmailConfirm")
	public @ResponseBody String registerEmailConfirm(String email) {
		System.out.println("Email : " + email);
		return usersvc.registerEmail(email);
	}

	// 로그인 기능
	@RequestMapping(value = "/userLogin")
	public ModelAndView uesrLogin(UserDTO user) {
		
		
		return null;
	}
	
	// 회원가입 기능
	@RequestMapping(value = "/userRegister" )
	public ModelAndView userRegister(UserDTO user) {
		System.out.println("Server->userRegister");
		ModelAndView mav = new ModelAndView();
		System.out.println(user);
		int registerResult = usersvc.userRegister(user);
		if(registerResult > 0) {
			mav.addObject("Msg", "회원가입이 성공하였습니다.");
		} else {
			mav.addObject("Msg", "회원가입에 실패하였습니다.");
		}
		mav.setViewName("home");
		return mav;
	}
}
