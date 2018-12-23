package com.bugbycode.service.oauth;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bugbycode.dao.role.RoleDao;
import com.bugbycode.dao.user.UserDao;
import com.bugbycode.module.role.Role;
import com.bugbycode.module.user.User;
import com.util.StringUtil;

@Service("userService")
public class UserService implements UserDetailsService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		if(StringUtil.isBlank(username)) {
			throw new RuntimeException("用户名密码错误");
		}
		User user = userDao.queryByUserName(username);
		if(user == null) {
			throw new RuntimeException("用户名密码错误");
		}
		user.setPassword("");
		List<Role> roleList = roleDao.queryByUserId(user.getId());
		user.setRoleList(roleList);
		return user;
	}

}
