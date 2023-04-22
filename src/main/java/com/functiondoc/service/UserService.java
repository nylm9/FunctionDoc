package com.functiondoc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.functiondoc.dao.UserDAO;
import com.functiondoc.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	UserDAO userdao;
	
	public void userRegister(UserDTO userRegister) {
		
		int insertResult = userdao.userRegister(userRegister);
		
		System.out.println(insertResult);
		
	}

	public String registerIdCheck(String registerId) {
		
		String selectResult = userdao.registerIdCheck(registerId);
		
		System.out.println("selectResult : "+selectResult);
		
		if(selectResult != null) {
			return "unavailable";
		} else {
			return "available";
		}
		
	}

}
