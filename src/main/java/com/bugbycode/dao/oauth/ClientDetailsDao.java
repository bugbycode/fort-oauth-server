package com.bugbycode.dao.oauth;

import com.bugbycode.module.oauth.OauthClientDetails;

public interface ClientDetailsDao {
	
	public OauthClientDetails queryByClientId(String clientId);
}
