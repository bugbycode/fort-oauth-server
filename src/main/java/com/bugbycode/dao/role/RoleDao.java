package com.bugbycode.dao.role;

import java.util.List;

import com.bugbycode.module.role.Role;

public interface RoleDao {
	
	public List<Role> queryByUserId(int userId);
}
