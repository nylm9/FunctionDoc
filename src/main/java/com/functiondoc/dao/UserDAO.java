package com.functiondoc.dao;

import com.functiondoc.dto.UserDTO;

public interface UserDAO {

	int userRegister(UserDTO userRegister);

	String registerIdCheck(String registerId);

	String userEmailCheck(String email);

}
