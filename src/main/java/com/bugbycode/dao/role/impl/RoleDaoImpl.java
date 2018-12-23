package com.bugbycode.dao.role.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.bugbycode.dao.base.BaseDao;
import com.bugbycode.dao.role.RoleDao;
import com.bugbycode.module.role.Role;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDao implements RoleDao {

	private final Logger logger = LogManager.getLogger(RoleDaoImpl.class);
	
	@Override
	public List<Role> queryByUserId(int userId) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("userId", userId);
		try {
			return getSqlSession().selectList("role.queryByUserId", param);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new RuntimeException("根据用户ID查询角色信息时连接数据库超时，" + e.getMessage());
		}
	}

}
