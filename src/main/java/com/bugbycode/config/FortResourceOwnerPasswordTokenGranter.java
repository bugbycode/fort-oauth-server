package com.bugbycode.config;

import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.common.exceptions.InvalidGrantException;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.OAuth2Request;
import org.springframework.security.oauth2.provider.OAuth2RequestFactory;
import org.springframework.security.oauth2.provider.TokenRequest;
import org.springframework.security.oauth2.provider.password.ResourceOwnerPasswordTokenGranter;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;

import com.bugbycode.module.user.User;
import com.bugbycode.service.oauth.UserService;
import com.util.AESUtil;
import com.util.StringUtil;

public class FortResourceOwnerPasswordTokenGranter extends ResourceOwnerPasswordTokenGranter {

	private final Logger logger = LogManager.getLogger(FortResourceOwnerPasswordTokenGranter.class);

	private final AuthenticationManager authenticationManager;
	
	private UserService userService;
	
	public FortResourceOwnerPasswordTokenGranter(AuthenticationManager authenticationManager,
			AuthorizationServerTokenServices tokenServices, ClientDetailsService clientDetailsService,
			OAuth2RequestFactory requestFactory,UserService userService) {
		super(authenticationManager, tokenServices, clientDetailsService, requestFactory);
		this.authenticationManager = authenticationManager;
		this.userService = userService;
	}

	@Override
	protected OAuth2Authentication getOAuth2Authentication(ClientDetails client, TokenRequest tokenRequest) {

		Map<String, String> parameters = new LinkedHashMap<String, String>(tokenRequest.getRequestParameters());
		String username = parameters.get("username");
		logger.info("登录用户信息：" + username);
		String password = parameters.get("password");
		// Protect from downstream leaks of password
		parameters.remove("password");
		
		if(StringUtil.isEmpty(password)) {
			throw new InvalidGrantException("用户名密码错误");
		}
		
		password = AESUtil.encrypt(password);
		
		User user = userService.queryByUserNameAndPassword(username, password);
		if(user == null) {
			throw new InvalidGrantException("用户名密码错误");
		}
		
		if(user.getStatus() == 0) {
			throw new InvalidGrantException("用户已被锁定");
		}
		
		Authentication userAuth = new UsernamePasswordAuthenticationToken(username, "");
		((AbstractAuthenticationToken) userAuth).setDetails(parameters);
		try {
			userAuth = authenticationManager.authenticate(userAuth);
		}
		catch (AccountStatusException ase) {
			//covers expired, locked, disabled cases (mentioned in section 5.2, draft 31)
			throw new InvalidGrantException(ase.getMessage());
		}
		catch (BadCredentialsException e) {
			// If the username/password are wrong the spec says we should send 400/invalid grant
			throw new InvalidGrantException(e.getMessage());
		}
		if (userAuth == null || !userAuth.isAuthenticated()) {
			throw new InvalidGrantException("Could not authenticate user: " + username);
		}
		
		OAuth2Request storedOAuth2Request = getRequestFactory().createOAuth2Request(client, tokenRequest);		
		return new OAuth2Authentication(storedOAuth2Request, userAuth);
	}

}
