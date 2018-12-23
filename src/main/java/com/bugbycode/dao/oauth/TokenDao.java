package com.bugbycode.dao.oauth;

import java.util.List;

import com.bugbycode.module.oauth.OauthAccessToken;
import com.bugbycode.module.oauth.OauthRefreshToken;

public interface TokenDao {
	
	public OauthAccessToken queryByTokenId(String tokenId);
	
	public OauthAccessToken queryByAuthenticationId(String authenticationId);
	
	public List<OauthAccessToken> queryByClientIdAndUserName(String clientId,String username);
	
	public List<OauthAccessToken> queryByClientId(String clientId);
	
	public void deleteByTokenId(String tokenId);
	
	public void deleteByRefreshToken(String refreshToken);
	
	public void insert(OauthAccessToken accessToken);
	
	public void insert(OauthRefreshToken refreshToken);
	
	public OauthRefreshToken queryRefreshTokenByTokenId(String tokenId);
	
	public void deleteRefreshByTokenId(String tokenId);
}
