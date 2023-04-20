package com.functiondoc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.functiondoc.dao.UserDAO;
import com.functiondoc.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	UserDAO udao;
	
	public void userRegister(UserDTO userRegister) {
		
		int insertResult = udao.userRegister(userRegister);
		
		System.out.println(insertResult);
		
	}

}
