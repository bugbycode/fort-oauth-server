-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: new_fort
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `new_fort`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `new_fort` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `new_fort`;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `employee_group` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin','admin','efa835205a97b3773fe2431a3dd4a527','bugbycode@gmail.com','15801189971',0,1,'2018-12-23 23:04:50',NULL,NULL,1),(2,'fort','fort','efa835205a97b3773fe2431a3dd4a527',NULL,NULL,NULL,1,'2018-12-28 18:10:08',NULL,1,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_group`
--

DROP TABLE IF EXISTS `employee_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `employee_group_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_group`
--

LOCK TABLES `employee_group` WRITE;
/*!40000 ALTER TABLE `employee_group` DISABLE KEYS */;
INSERT INTO `employee_group` VALUES (1,'系统管理员',NULL,'2018-12-28 17:28:34',NULL,1);
/*!40000 ALTER TABLE `employee_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('2492c7cf4b3cb1e3dcae89c2d2535919',_binary '�\�\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$�\�\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z\�\�\�\0\0xppsr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valueq\0~\0xpt\0$804dc6e0-b020-4a99-ab22-be340b8b0fbbsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0webxt\0bearert\0$bf1b0e14-7a31-4af4-acf5-a68855544274','078611329ec905433b0fc86f7e76c32f','admin','fort',_binary '�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_ROLES_UPDATEsq\0~\0\rt\0ROLE_ROLES_INSERTsq\0~\0\rt\0ROLE_USER_GROUP_DELETEsq\0~\0\rt\0ROLE_ROLES_QUERYsq\0~\0\rt\0ROLE_USER_QUERYsq\0~\0\rt\0ROLE_USER_DELETEsq\0~\0\rt\0ROLE_USER_GROUP_UPDATEsq\0~\0\rt\0ROLE_USER_GROUP_INSERTsq\0~\0\rt\0ROLE_USER_UPDATEsq\0~\0\rt\0ROLE_USER_INSERTsq\0~\0\rt\0ROLE_USER_GROUP_QUERYsq\0~\0\rt\0ROLE_ROLES_DELETExq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0*xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0(L\0scopeq\0~\0*xpt\0fortsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0(xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0fortt\0scopet\0webt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\07xsq\0~\0=w\0\0\0?@\0\0\0\0\0\0xsq\0~\00?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0=w\0\0\0?@\0\0\0\0\0\0xsq\0~\0=w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0#q\0~\0%xq\0~\0Fsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\00?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\02q\0~\03q\0~\06q\0~\07t\0\rclient_secrett\0j1d1sec.c0mq\0~\04q\0~\05q\0~\08q\0~\09x\0psr\0com.bugbycode.module.user.User\r���q��\0I\0groupIdI\0idI\0roleIdI\0statusI\0typeL\0\ncreateTimet\0Ljava/util/Date;L\0emailq\0~\0L\0	groupNameq\0~\0L\0mobileq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0roleListq\0~\0L\0roleNameq\0~\0L\0\nupdateTimeq\0~\0LL\0usernameq\0~\0xp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0java.util.Datehj�KYt\0\0xpw\0\0g\�c\�xt\0bugbycode@gmail.compt\015801189971t\0admint\0\0sq\0~\0\0\0\0w\0\0\0sr\0com.bugbycode.module.role.Role8�\\F{zT\0I\0idI\0typeL\0\ncreateTimeq\0~\0LL\0descriptionq\0~\0L\0grantedAuthorityq\0~\0L\0nameq\0~\0L\0\nupdateTimeq\0~\0Lxp\0\0\0\0\0\0\0sq\0~\0Nw\0\0gޛ\�8xpt\0�USER_UPDATE,USER_QUERY,USER_INSERT,USER_DELETE,USER_GROUP_UPDATE,USER_GROUP_INSERT,USER_GROUP_DELETE,USER_GROUP_QUERY,ROLES_UPDATE,ROLES_INSERT,ROLES_DELETE,ROLES_QUERYt\0系统管理员pxppt\0admin','f2f6551b7cde038d4b0a247950736a6f'),('299919a487e91a444ee05d172f9c5e99',_binary '�\�\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken��6$�\�\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6�Z\�\�\�\0\0xppsr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valueq\0~\0xpt\0$772aba89-6bcc-44d7-93e6-0013d36b2677sr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0webxt\0bearert\0$a2120315-fb9c-4497-b071-31b30cf6ac95','b589034226e98b4cd3cd51eb591fde98','fort','fort',_binary '�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_ROLES_UPDATEsq\0~\0\rt\0ROLE_ROLES_INSERTsq\0~\0\rt\0ROLE_USER_GROUP_DELETEsq\0~\0\rt\0ROLE_ROLES_QUERYsq\0~\0\rt\0ROLE_USER_QUERYsq\0~\0\rt\0ROLE_USER_DELETEsq\0~\0\rt\0ROLE_USER_GROUP_UPDATEsq\0~\0\rt\0ROLE_USER_GROUP_INSERTsq\0~\0\rt\0ROLE_USER_UPDATEsq\0~\0\rt\0ROLE_USER_INSERTsq\0~\0\rt\0ROLE_USER_GROUP_QUERYsq\0~\0\rt\0ROLE_ROLES_DELETExq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0*xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0(L\0scopeq\0~\0*xpt\0fortsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0(xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0fortt\0scopet\0webt\0usernamet\0fortxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\07xsq\0~\0=w\0\0\0?@\0\0\0\0\0\0xsq\0~\00?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0=w\0\0\0?@\0\0\0\0\0\0xsq\0~\0=w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0#q\0~\0%xq\0~\0Fsr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\00?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\02q\0~\03q\0~\06q\0~\07t\0\rclient_secrett\0j1d1sec.c0mq\0~\04q\0~\05q\0~\08q\0~\09x\0psr\0com.bugbycode.module.user.User\r���q��\0I\0groupIdI\0idI\0roleIdI\0statusI\0typeL\0\ncreateTimet\0Ljava/util/Date;L\0emailq\0~\0L\0	groupNameq\0~\0L\0mobileq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0roleListq\0~\0L\0roleNameq\0~\0L\0\nupdateTimeq\0~\0LL\0usernameq\0~\0xp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0java.util.Datehj�KYt\0\0xpw\0\0g�\0�xpppt\0fortt\0\0sq\0~\0\0\0\0w\0\0\0sr\0com.bugbycode.module.role.Role8�\\F{zT\0I\0idI\0typeL\0\ncreateTimeq\0~\0LL\0descriptionq\0~\0L\0grantedAuthorityq\0~\0L\0nameq\0~\0L\0\nupdateTimeq\0~\0Lxp\0\0\0\0\0\0\0sq\0~\0Nw\0\0gޛ\�8xpt\0�USER_UPDATE,USER_QUERY,USER_INSERT,USER_DELETE,USER_GROUP_UPDATE,USER_GROUP_INSERT,USER_GROUP_DELETE,USER_GROUP_QUERY,ROLES_UPDATE,ROLES_INSERT,ROLES_DELETE,ROLES_QUERYt\0系统管理员pxppt\0fort','6fc49a7fd57a71f88a929bd02b32d261');
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorized_grant_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web_server_redirect_uri` text COLLATE utf8_unicode_ci,
  `authorities` text COLLATE utf8_unicode_ci,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` text COLLATE utf8_unicode_ci,
  `autoapprove` text COLLATE utf8_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES (NULL,NULL,'fort','j1d1sec.c0m',NULL,'web','password,refresh_token',NULL,NULL,0,0,NULL,NULL,'2018-12-23 22:56:19',NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
INSERT INTO `oauth_refresh_token` VALUES ('f2f6551b7cde038d4b0a247950736a6f',_binary '�\�\0sr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valuet\0Ljava/lang/String;xpt\0$804dc6e0-b020-4a99-ab22-be340b8b0fbb',_binary '�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0�\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_SYSTEMsq\0~\0\rt\0\nROLE_ADMINxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0fortsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0fortt\0scopet\0webt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0#xsq\0~\0)w\0\0\0?@\0\0\0\0\0\0xsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0)w\0\0\0?@\0\0\0\0\0\0xsq\0~\0)w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0q\0~\0q\0~\0xq\0~\02sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0q\0~\0\"q\0~\0#t\0\rclient_secrett\0j1d1sec.c0mq\0~\0 q\0~\0!q\0~\0$q\0~\0%x\0psr\0com.bugbycode.module.user.User\r���q��\0\nI\0idI\0statusL\0\ncreateTimet\0Ljava/util/Date;L\0emailq\0~\0L\0mobileq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0roleListq\0~\0L\0\nupdateTimeq\0~\08L\0usernameq\0~\0xp\0\0\0\0\0\0sr\0java.util.Datehj�KYt\0\0xpw\0\0gۘ\�Pxt\0bugbycode@gmail.comt\015801189971t\0admint\0\0sq\0~\0\0\0\0w\0\0\0sr\0com.bugbycode.module.role.Role8�\\F{zT\0I\0idL\0\ncreateTimeq\0~\08L\0descriptionq\0~\0L\0grantedAuthorityq\0~\0L\0nameq\0~\0L\0\nupdateTimeq\0~\08xp\0\0\0sq\0~\0:w\0\0g\�\�̸xpt\0ADMIN,SYSTEMt\0系统管理员pxpt\0admin'),('6fc49a7fd57a71f88a929bd02b32d261',_binary '�\�\0sr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\�\ncT\�^\0L\0valuet\0Ljava/lang/String;xpt\0$772aba89-6bcc-44d7-93e6-0013d36b2677',_binary '�\�\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication�@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0\0w\0\0\0\0xq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUrit\0Ljava/lang/String;L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\0xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>�qi�\0L\0clientIdq\0~\0L\0requestParametersq\0~\0L\0scopeq\0~\0xpt\0fortsr\0%java.util.Collections$UnmodifiableMap��t�B\0L\0mq\0~\0xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0fortt\0scopet\0webt\0usernamet\0fortxsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\�l\�Z�\�*\0\0xr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0q\0~\0xsq\0~\0$w\0\0\0?@\0\0\0\0\0\0xsq\0~\0?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0$w\0\0\0?@\0\0\0\0\0\0xsq\0~\0$w\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0�\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\0xq\0~\0-sr\0java.util.LinkedHashMap4�N\\l��\0Z\0accessOrderxq\0~\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0q\0~\0\Zq\0~\0q\0~\0t\0\rclient_secrett\0j1d1sec.c0mq\0~\0q\0~\0q\0~\0q\0~\0 x\0psr\0com.bugbycode.module.user.User\r���q��\0I\0groupIdI\0idI\0roleIdI\0statusI\0typeL\0\ncreateTimet\0Ljava/util/Date;L\0emailq\0~\0L\0	groupNameq\0~\0L\0mobileq\0~\0L\0nameq\0~\0L\0passwordq\0~\0L\0roleListq\0~\0L\0roleNameq\0~\0L\0\nupdateTimeq\0~\03L\0usernameq\0~\0xp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0sr\0java.util.Datehj�KYt\0\0xpw\0\0g�\0�xpppt\0fortt\0\0sq\0~\0\0\0\0\0w\0\0\0\0xppt\0fort');
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_employee_group`
--

DROP TABLE IF EXISTS `rel_employee_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_employee_group` (
  `emp_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  KEY `emp_id` (`emp_id`),
  KEY `rel_employee_group_ibfk_2` (`group_id`),
  CONSTRAINT `rel_employee_group_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rel_employee_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `employee_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_employee_group`
--

LOCK TABLES `rel_employee_group` WRITE;
/*!40000 ALTER TABLE `rel_employee_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_employee_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_employee_group_role`
--

DROP TABLE IF EXISTS `rel_employee_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_employee_group_role` (
  `group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `rel_employee_group_role_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `employee_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rel_employee_group_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_employee_group_role`
--

LOCK TABLES `rel_employee_group_role` WRITE;
/*!40000 ALTER TABLE `rel_employee_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_employee_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_employee_role`
--

DROP TABLE IF EXISTS `rel_employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_employee_role` (
  `role_id` int(11) NOT NULL,
  `emp_id` int(255) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `rel_employee_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rel_employee_role_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_employee_role`
--

LOCK TABLES `rel_employee_role` WRITE;
/*!40000 ALTER TABLE `rel_employee_role` DISABLE KEYS */;
INSERT INTO `rel_employee_role` VALUES (1,1);
/*!40000 ALTER TABLE `rel_employee_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `granted_authority` text COLLATE utf8_unicode_ci,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'系统管理员',0,NULL,'USER_UPDATE,USER_QUERY,USER_INSERT,USER_DELETE,USER_GROUP_UPDATE,USER_GROUP_INSERT,USER_GROUP_DELETE,USER_GROUP_QUERY,ROLES_UPDATE,ROLES_INSERT,ROLES_DELETE,ROLES_QUERY','2018-12-24 00:06:59',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-28  5:29:27
