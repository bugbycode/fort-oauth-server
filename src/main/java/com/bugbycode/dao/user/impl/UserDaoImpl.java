package com.bugbycode.dao.user.impl;

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
	
}
