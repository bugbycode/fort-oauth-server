package com.bugbycode.dao.oauth.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.bugbycode.dao.base.BaseDao;
import com.bugbycode.dao.oauth.ClientDetailsDao;
import com.bugbycode.module.oauth.OauthClientDetails;

@Repository("clientDetailsDao")
public class ClientDetailsDaoImpl extends BaseDao implements ClientDetailsDao {

	private final Logger logger = LogManager.getLogger(ClientDetailsDaoImpl.class);
	
	@Override
	public OauthClientDetails queryByClientId(String clientId) {
		try {
			return getSqlSession().selectOne("clientDetails.queryByClientId", clientId);
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new RuntimeException("根据客户端ID查询客户端信息时连接数据库超时，" + e.getMessage());
		}
	}

}
