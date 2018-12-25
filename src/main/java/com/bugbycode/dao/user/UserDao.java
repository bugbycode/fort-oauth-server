package com.bugbycode.dao.user;

import com.bugbycode.module.user.User;

public interface UserDao {
	
	public User queryByUserName(String username);
	
	public User queryByUserNameAndPassword(String username,String password);
}
