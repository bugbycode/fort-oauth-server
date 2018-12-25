package com.bugbycode.dao.user.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.bugbycode.dao.base.BaseDao;
import com.bugbycode.dao.user.UserDao;
import com.bugbycode.module.user.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao {

	private final Logger logger = LogManager.getLogger(UserDaoImpl.class);
	
	@Override
	public User queryByUserName(String username) {
		try {
			return getSqlSession().selectOne("user.queryByUserName", username);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new RuntimeException("根据用户名查询单一用户信息时连接数据库超时，" + e.getMessage());
		}
	}
	
	@Override
	public User queryByUserNameAndPassword(String username,String password) {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("username", username);
		param.put("password", password);
		try {
			return getSqlSession().selectOne("user.queryByUserNameAndPassword", param);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new RuntimeException("根据用户名和密码查询单一用户信息时连接数据库超时，" + e.getMessage());
		}
	}
	
}
