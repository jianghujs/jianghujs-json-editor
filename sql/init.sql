# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户Id',
  `content` longtext COMMENT '缓存数据',
  `recordStatus` varchar(255) DEFAULT 'active',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '缓存表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _constant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_constant`;
CREATE TABLE `_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) DEFAULT NULL,
  `constantType` varchar(255) DEFAULT NULL COMMENT '常量类型; object, array',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `constantValue` text COMMENT '常量内容; object, array',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '常量表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _constant
# ------------------------------------------------------------




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _file
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_file`;
CREATE TABLE `_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` varchar(255) DEFAULT NULL COMMENT 'fileId',
  `fileDirectory` varchar(255) DEFAULT NULL COMMENT '文件保存路径;',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名;',
  `filenameStorage` varchar(255) DEFAULT NULL COMMENT '文件保存名',
  `downloadPath` varchar(255) DEFAULT NULL COMMENT '文件下载路径',
  `fileType` varchar(255) DEFAULT NULL COMMENT '文件类型;(预留字段)',
  `fileDesc` varchar(255) DEFAULT NULL COMMENT '文件描述',
  `binarySize` varchar(255) DEFAULT NULL COMMENT '文件二进制大小',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fileId_index` (`fileId`) USING BTREE
) ENGINE = InnoDB COMMENT = '文件表; 软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_group`;
CREATE TABLE `_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(255) NOT NULL COMMENT 'groupId',
  `groupName` varchar(255) DEFAULT NULL COMMENT '群组名',
  `groupDesc` varchar(255) DEFAULT NULL COMMENT '群组描述',
  `groupAvatar` varchar(255) DEFAULT NULL COMMENT '群logo',
  `groupExtend` varchar(1024) DEFAULT '{}' COMMENT '拓展字段; { groupNotice: ''xx'' }',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 COMMENT = '群组表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _group
# ------------------------------------------------------------

INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'adminGroup','管理组','管理组',NULL,'{}','insert',NULL,NULL,NULL);
INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'wudang','武当','武当',NULL,'{}','insert',NULL,NULL,NULL);
INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'gaibang','丐帮','丐帮',NULL,'{}','insert',NULL,NULL,NULL);
INSERT INTO `_group` (`id`,`groupId`,`groupName`,`groupDesc`,`groupAvatar`,`groupExtend`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (8,'huashan','华山派','华山派',NULL,'{}','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'pageId',
  `pageFile` varchar(255) DEFAULT NULL COMMENT 'page文件指定; 默认使用pageId.html',
  `pageName` varchar(255) DEFAULT NULL COMMENT 'page name',
  `pageType` varchar(255) DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `sort` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 COMMENT = '页面表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _page
# ------------------------------------------------------------

INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'help','helpV3','帮助','dynamicInMenu','11','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'login','loginV3','登陆','','','insert',NULL,NULL,NULL);
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (25,'constantUiManagement',NULL,'Ui配置','showInMenu','2','update','vscode','vscode','2022-08-11T17:45:42+08:00');
INSERT INTO `_page` (`id`,`pageId`,`pageFile`,`pageName`,`pageType`,`sort`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (39,'constantUiEditor',NULL,'Ui配置编辑','dynamicInMenu','3','update','vscode','vscode','2022-08-13T16:29:15+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _record_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` text NOT NULL COMMENT '数据',
  `packageContent` text NOT NULL COMMENT '当时请求的 package JSON',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_record_id` (`recordId`) USING BTREE,
  KEY `index_table_action` (`table`, `operation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 COMMENT = '数据历史表';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COMMENT '[ "before": {"service": "xx", "serviceFunction": "xxx"}, "after": [] }',
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COMMENT 'appData 参数校验',
  `resourceData` text COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COMMENT '请求Demo',
  `responseDemo` text COMMENT '响应Demo',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 379 COMMENT = '请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _resource
# ------------------------------------------------------------

INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (231,NULL,NULL,'login','passwordLogin','✅登陆','service','{}','{\"service\": \"user\", \"serviceFunction\": \"passwordLogin\"}','','','update',NULL,NULL,'2022-04-27T15:32:57+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (251,NULL,NULL,'allPage','logout','✅登出','service','{}','{\"service\": \"user\", \"serviceFunction\": \"logout\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (253,NULL,NULL,'allPage','userInfo','✅获取用户信息','service','{}','{\"service\": \"user\", \"serviceFunction\": \"userInfo\"}','','','update',NULL,NULL,'2022-04-27T15:37:21+08:00');
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (258,NULL,NULL,'allPage','getConstantList','✅查询常量','sql','{}','{\"table\": \"_constant\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (293,NULL,NULL,'protocolDemo','selectItemList','✅应用协议-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (294,NULL,NULL,'protocolDemo','insertItem','✅应用协议-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (295,NULL,NULL,'protocolDemo','updateItem','✅应用协议-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (296,NULL,NULL,'protocolDemo','deleteItem','✅应用协议-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (313,NULL,NULL,'frontendDemo02','selectItemList','✅前端优化-查询列表','sql','{}','{\"table\": \"student\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (314,NULL,NULL,'frontendDemo02','insertItem','✅前端优化-添加成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhInsert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (315,NULL,NULL,'frontendDemo02','updateItem','✅前端优化-更新成员','sql','{}','{\"table\": \"student\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (316,NULL,NULL,'frontendDemo02','deleteItem','✅前端优化-删除信息','sql','{}','{\"table\": \"student\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (374,NULL,NULL,'constantUiManagement','selectItemList','✅constantUiManagement查询-查询列表','sql','{}','{\"table\": \"web_constant_ui\", \"operation\": \"select\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (375,NULL,NULL,'constantUiManagement','insertItem','✅constantUiManagement查询-添加成员','sql','{}','{\"table\": \"web_constant_ui\", \"operation\": \"insert\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (376,NULL,NULL,'constantUiManagement','updateItem','✅constantUiManagement查询-更新成员','sql','{}','{\"table\": \"web_constant_ui\", \"operation\": \"jhUpdate\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (377,NULL,NULL,'constantUiManagement','deleteItem','✅constantUiManagement查询-删除信息','sql','{}','{\"table\": \"web_constant_ui\", \"operation\": \"jhDelete\"}','','','insert',NULL,NULL,NULL);
INSERT INTO `_resource` (`id`,`accessControlTable`,`resourceHook`,`pageId`,`actionId`,`desc`,`resourceType`,`appDataSchema`,`resourceData`,`requestDemo`,`responseDemo`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (378,NULL,NULL,'constantUiEditor','getItemInfo','✅查询-查询列表','sql',NULL,'{\"table\":\"web_constant_ui\",\"operation\":\"select\"}','','','insert','vscode','vscode','2022-09-05T20:40:17+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _resource_request_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_resource_request_log`;
CREATE TABLE `_resource_request_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` varchar(255) DEFAULT NULL COMMENT 'resource id;',
  `packageId` varchar(255) DEFAULT NULL COMMENT 'resource package id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip;',
  `userAgent` varchar(255) DEFAULT NULL COMMENT '设备信息',
  `userId` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `executeSql` varchar(255) DEFAULT NULL COMMENT '执行的sql',
  `requestBody` text COMMENT '请求body',
  `responseBody` text COMMENT '响应body',
  `responseStatus` varchar(255) DEFAULT NULL COMMENT '执行的结果;  success, fail',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `resourceId_index` (`resourceId`) USING BTREE,
  KEY `packageId_index` (`packageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232 COMMENT = '文件表; 软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) DEFAULT NULL COMMENT 'roleId',
  `roleName` varchar(255) DEFAULT NULL COMMENT 'role name',
  `roleDesc` varchar(255) DEFAULT NULL COMMENT 'role desc',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 COMMENT = '角色表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _role
# ------------------------------------------------------------

INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'administrator','系统管理员','','insert',NULL,NULL,NULL);
INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (6,'boss','掌门','','insert',NULL,NULL,NULL);
INSERT INTO `_role` (`id`,`roleId`,`roleName`,`roleDesc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (7,'disciple','门徒','','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_test_case`;
CREATE TABLE `_test_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT '页面Id',
  `testId` varchar(255) DEFAULT NULL COMMENT '测试用例Id; 10000 ++',
  `testName` varchar(255) DEFAULT NULL COMMENT '测试用例名',
  `uiActionIdList` varchar(255) DEFAULT NULL COMMENT 'uiAction列表; 一个测试用例对应多个uiActionId',
  `testOpeartion` text COMMENT '测试用例步骤;',
  `operation` varchar(255) DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB COMMENT = '测试用例表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _test_case
# ------------------------------------------------------------




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COMMENT 'ui 动作数据',
  `appDataSchema` text COMMENT 'ui 校验数据',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 COMMENT = 'ui 施工方案';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _ui
# ------------------------------------------------------------




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` varchar(255) DEFAULT NULL COMMENT '自增id; 用于生成userId',
  `userId` varchar(255) DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名(登陆)',
  `clearTextPassword` varchar(255) DEFAULT NULL COMMENT '明文密码',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `md5Salt` varchar(255) DEFAULT NULL COMMENT 'md5Salt',
  `userStatus` varchar(255) DEFAULT 'active' COMMENT '用户账号状态：活跃或关闭',
  `userType` varchar(255) DEFAULT NULL COMMENT '用户类型; staff, student.',
  `config` mediumtext COMMENT '配置信息',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE,
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 COMMENT = '用户表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user
# ------------------------------------------------------------

INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (42,NULL,'admin','系统管理员','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (43,NULL,'W00001','张三丰','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (44,NULL,'W00002','张无忌','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (45,NULL,'G00001','洪七公','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (46,NULL,'G00002','郭靖','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (47,NULL,'H00001','岳不群','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);
INSERT INTO `_user` (`id`,`idSequence`,`userId`,`username`,`clearTextPassword`,`password`,`md5Salt`,`userStatus`,`userType`,`config`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (48,NULL,'H00002','令狐冲','123456','38d61d315e62546fe7f1013e31d42f57','Xs4JSZnhiwsR','active',NULL,NULL,'insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role`;
CREATE TABLE `_user_group_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL COMMENT '用户id',
  `groupId` varchar(255) NOT NULL COMMENT '群组Id',
  `roleId` varchar(255) DEFAULT NULL COMMENT '角色Id',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 579 COMMENT = '用户群组角色关联表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user_group_role
# ------------------------------------------------------------

INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (568,'admin','adminGroup','administrator','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (569,'W00001','wudang','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (570,'W00002','wudang','disciple','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (573,'G00001','gaibang','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (574,'G00002','gaibang','disciple','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (577,'H00001','huashan','boss','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role` (`id`,`userId`,`groupId`,`roleId`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (578,'H00002','huashan','disciple','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_page`;
CREATE TABLE `_user_group_role_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `page` varchar(255) DEFAULT NULL COMMENT 'pageId id',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 COMMENT = '用户群组角色 - 页面 映射表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user_group_role_page
# ------------------------------------------------------------

INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login','allow','登陆页面; 开放所有用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','help,manual','allow','工具页; 开放给登陆用户;','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_page` (`id`,`user`,`group`,`role`,`page`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有页面; 开放给登陆用户;','insert',NULL,NULL,NULL);






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_group_role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_group_role_resource`;
CREATE TABLE `_user_group_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `resource` varchar(255) DEFAULT NULL COMMENT 'resourceId 或者 通配符; 通配符: *, !resourceId',
  `allowOrDeny` varchar(255) DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 COMMENT = '用户群组角色 - 请求资源 映射表; 软删除未启用;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: _user_group_role_resource
# ------------------------------------------------------------

INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'*','public','*','login.passwordLogin','allow','登陆resource, 开放给所有用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'*','login','*','allPage.*','allow','工具类resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);
INSERT INTO `_user_group_role_resource` (`id`,`user`,`group`,`role`,`resource`,`allowOrDeny`,`desc`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (3,'*','login','*','*','allow','所有resource, 开放给所有登陆成功的用户','insert',NULL,NULL,NULL);






# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _user_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) DEFAULT NULL COMMENT '用户ip',
  `userIpRegion` varchar(255) DEFAULT NULL COMMENT '用户Ip区域',
  `userAgent` text COMMENT '请求的 agent',
  `deviceId` varchar(255) DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) DEFAULT 'web' COMMENT '设备类型; flutter, web, bot_databot, bot_chatbot, bot_xiaochengxu',
  `socketStatus` varchar(255) DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(255) DEFAULT NULL COMMENT 'auth token',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE,
  KEY `userId_deviceId_index` (`userId`, `deviceId`) USING BTREE,
  KEY `authToken_index` (`authToken`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 COMMENT = '用户session表; deviceId 维度;软删除未启用;';




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: access_control_student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_control_student`;
CREATE TABLE `access_control_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL COMMENT '主键id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名(登陆)',
  `resourceData` varchar(255) DEFAULT NULL COMMENT '明文密码',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_index` (`username`) USING BTREE,
  UNIQUE KEY `userId_index` (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 COMMENT = '学生表的 accessControl 表';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: access_control_student
# ------------------------------------------------------------

INSERT INTO `access_control_student` (`id`,`userId`,`username`,`resourceData`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (50,'G00001','洪七公','{ \"where\":{\"level\": \"02\"} }','insert',NULL,NULL,NULL);
INSERT INTO `access_control_student` (`id`,`userId`,`username`,`resourceData`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (51,'H00001','岳不群','{ \"where\":{\"level\": \"02\"} }','insert',NULL,NULL,NULL);



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` varchar(255) DEFAULT NULL COMMENT '学生ID',
  `name` varchar(255) DEFAULT NULL COMMENT '学生名字',
  `gender` varchar(255) DEFAULT NULL COMMENT '性别',
  `dateOfBirth` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `classId` varchar(255) DEFAULT NULL COMMENT '班级ID',
  `level` varchar(255) DEFAULT NULL COMMENT '年级',
  `bodyHeight` varchar(255) DEFAULT NULL COMMENT '身高',
  `studentStatus` varchar(255) DEFAULT NULL COMMENT '学生状态',
  `remarks` mediumtext COMMENT '备注',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `studentId` (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 176;




# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: web_constant_ui
# ------------------------------------------------------------

DROP TABLE IF EXISTS `web_constant_ui`;
CREATE TABLE `web_constant_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) DEFAULT NULL,
  `constantType` varchar(255) DEFAULT NULL COMMENT '常量类型; object, array',
  `pageId` varchar(255) DEFAULT 'all' COMMENT '页面id',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `en` text COMMENT '常量内容; object, array',
  `zh` text COMMENT '常量内容; object, array',
  `kr` text COMMENT '韩语',
  `yueyu` text COMMENT '粤语',
  `operation` varchar(255) DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pageId_constantKey_unique` (`constantKey`, `pageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 COMMENT = '常量表;';


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: web_constant_ui
# ------------------------------------------------------------

INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (1,'header','object','all',NULL,'{\r\n\t\"logo\": \"/logo.png\",\r\n\t\"menuList\": [{\r\n\t\t\"menuName\": \"首页\",\r\n\t\t\"path\": \"/\"\r\n\t},{\r\n\t\t\"menuName\": \"活动\",\r\n\t\t\"path\": \"/?page_id=33739\"\r\n\t},{\r\n\t\t\"menuName\": \"联系我们\",\r\n\t\t\"path\": \"/?page_id=18070\"\r\n\t},{\r\n\t\t\"menuName\": \"讲道\",\r\n\t\t\"path\": \"/?cat=28\"\r\n\t},{\r\n\t\t\"menuName\": \"祷告\",\r\n\t\t\"path\": \"/?cat=3303\"\r\n\t},{\r\n\t\t\"menuName\": \"查经\",\r\n\t\t\"path\": \"/?page_id=2092\"\r\n\t},{\r\n\t\t\"menuName\": \"课程\",\r\n\t\t\"path\": \"/?page_id=19281\"\r\n\t},{\r\n\t\t\"menuName\": \"事工\",\r\n\t\t\"path\": \"/?page_id=42188\"\r\n\t},{\r\n\t\t\"menuName\": \"见证\",\r\n\t\t\"path\": \"/?cat=50\"\r\n\t},{\r\n\t\t\"menuName\": \"命定书屋\",\r\n\t\t\"path\": \"/?page_id=4190\"\r\n\t},{\r\n\t\t\"menuName\": \"奉献\",\r\n\t\t\"path\": \"/?page_id=5713\"\r\n\t},{\r\n\t\t\"menuName\": \"命定音乐\",\r\n\t\t\"path\": \"/?p=24196\"\r\n\t},{\r\n\t\t\"menuName\": \"命定神学\",\r\n\t\t\"path\": \"/?page_id=18860\"\r\n\t}],\r\n\t\"userAction\": {\r\n\t\t\"isOpen\": true,\r\n\t\t\"admin\": true,\r\n\t\t\"password\": true,\r\n\t\t\"logout\": true\r\n\t}\r\n}','{\"logo\":\"/logo.png\",\"menuList\":[{\"menuName\":\"首页\",\"path\":\"/\"},{\"menuName\":\"活动\",\"path\":\"/?page_id=33739\"},{\"menuName\":\"联系我们\",\"path\":\"/?page_id=18070\"},{\"menuName\":\"讲道\",\"path\":\"/?cat=28\"},{\"menuName\":\"祷告\",\"path\":\"/?cat=3303\"},{\"menuName\":\"查经\",\"path\":\"/?page_id=2092\"},{\"menuName\":\"课程\",\"path\":\"/?page_id=19281\"},{\"menuName\":\"事工\",\"path\":\"/?page_id=42188\"},{\"menuName\":\"见证\",\"path\":\"/?cat=50\"},{\"menuName\":\"命定书屋\",\"path\":\"/?page_id=4190\"},{\"menuName\":\"奉献\",\"path\":\"/?page_id=5713\"},{\"menuName\":\"命定音乐\",\"path\":\"/?p=24196\"},{\"menuName\":\"命定神学\",\"path\":\"/?page_id=18860\"}],\"userAction\":{\"isOpen\":true,\"loginText\":\"登录\",\"logoutText\":\" logout\",\"visitorText\":\"游客\",\"admin\":true,\"password\":true,\"logout\":true}}',NULL,NULL,'jhUpdate','admin','系统管理员','2022-06-30T14:10:46+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (2,'featureArticleList','array','all',NULL,'[ 39163, 39056, 21953, 22075, 21932 ]','[ 39163, 39056, 21953, 22075, 21932, 123 ]',NULL,NULL,'jhUpdate','admin','系统管理员','2022-06-29T17:25:28+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (23,'globalText','object','all',NULL,NULL,'{\"sidebar\":{\"comment\":\" 留言 \",\"attention\":\"大家关注\"},\"comment\":{\"title\":\"发表评论\",\"cancelComment\":\"取消评论\",\"emailNotice\":\"电子邮件地址不会被公开。\",\"comment\":\"评论\",\"name\":\"姓名\",\"email\":\"电子邮件\"}}',NULL,NULL,'jhUpdate','admin','系统管理员','2022-06-30T14:40:34+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (24,'home','object','home',NULL,NULL,'{\"multiLanguage\":{\"isOpen\":false,\"list\":[{\"img\":\"/xuanfeng_mingding_web/public/images/cn.png\",\"link\":\"http://www.mingding.org/\"},{\"img\":\"/xuanfeng_mingding_web/public/images/en.png\",\"link\":\"http://en.mingding.org/\"},{\"img\":\"/xuanfeng_mingding_web/public/images/kr.png\",\"link\":\"http://kr.mingding.org/\"},{\"img\":\"/xuanfeng_mingding_web/public/images/zhyue.png\",\"link\":\"https://yueyu.mingding.org/\"}]},\"witnessTitle\":\"最新见证\",\"articleTitle\":\"最新文章\",\"witness\":{\"isOpen\":true,\"title\":\"最新见证\"}}',NULL,NULL,'jhUpdate','admin','系统管理员','2022-07-02T09:08:50+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (25,'comment','object','all',NULL,NULL,'{\"title\":\"发表评论\",\"cancelComment\":\"取消评论\",\"emailNotice\":\"电子邮件地址不会被公开。\",\"content\":{\"label\":\"评论\",\"required\":\"请填写评论\"},\"name\":{\"label\":\"姓名\",\"required\":\"请填写姓名\"},\"email\":{\"label\":\"电子邮件\",\"required\":\"请填写邮箱\",\"format\":\"邮箱格式错误\"},\"code\":{\"format\":\"验证码错误\",\"list\":{\"1\":\"一\",\"2\":\"二\",\"3\":\"三\",\"4\":\"四\",\"5\":\"五\",\"6\":\"六\",\"7\":\"七\",\"8\":\"八\",\"9\":\"九\"}},\"success\":\"提交成功\",\"reply\":\"回复1\"}',NULL,NULL,'jhUpdate','admin','系统管理员','2022-06-30T15:13:59+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (26,'htmlTest','html','all',NULL,NULL,'script////////////////////////////',NULL,NULL,'jhUpdate','admin','系统管理员','2022-07-01T15:50:46+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (27,'headScript','html','all','脚本',NULL,'<script>\n      var welive_auto = 0; //客服对话窗口自动展开时间(秒), 0表示不自动展开\n      var welive_color_style = 1; //客服小面板配色风格, 1-5可选, 与welive后台设置保持一致\n      var welive_panel_color = new Array(\"#29C7C2\", \"#676767\", \"#e89813\", \"#930093\", \"#798ddd\"); //配色数组\n      welive_panel_color = welive_panel_color[welive_color_style - 1];\n\n      var welive_loaded = 0; //访客面板是否加载过\n      var welive_opened = 0; //是否展开了\n\n      function $_$(id) {\n        return document.getElementById(id);\n      }\n      function welive_stopflash() {\n        try {\n          $_$(\"welive_iframe\")\n            .contentWindow\n            .stopFlashTitle();\n        } catch (e) {}\n      }\n\n      function welive_web() {\n\n        function welive_drag(wraper) {\n          var handler = $_$(\"welive_drag\"),\n            tracker = $_$(\"welive_mouse_tracker\"),\n            o = false,\n            c = 0,\n            u = 0;\n\n          function mousexy(e) {\n            var x,\n              y;\n            var e = e || window.event;\n            return {\n              x: e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft,\n              y: e.clientY + document.body.scrollTop + document.documentElement.scrollTop\n            };\n          }\n\n          function move(dx, dy) {\n            var h = wraper.offsetHeight - dy;\n            var i = wraper.offsetLeft + dx;\n            var mW = document.documentElement.clientWidth - wraper.offsetWidth - 40;\n            var mH = document.documentElement.clientHeight - 30;\n\n            if (h <= 360) \n              h = 360;\n            if (h >= mH) \n              h = mH;\n            \n            if (i <= 30) \n              i = 30;\n            if (i >= mW) \n              i = mW;\n            \n            wraper.style.height = h + \"px\";\n            wraper.style.left = i + \"px\";\n          }\n\n          function f(e) {\n            if (!o) \n              return;\n            if (c != -1) {\n              var x = mousexy(e).x;\n              var y = mousexy(e).y;\n              move(x - c, y - u);\n              c = x;\n              u = y;\n            }\n            e.stopPropagation();\n          }\n\n          function h(e) {\n            o = false;\n            tracker.style.display = \"none\";\n            e.stopPropagation();\n          }\n\n          handler.onmousedown = function (e) {\n            o = true;\n            c = mousexy(e).x;\n            u = mousexy(e).y;\n            tracker.style.display = \"block\";\n          };\n\n          tracker.onmouseup = function (e) {\n            h(e);\n            return false;\n          };\n          tracker.onmousemove = function (e) {\n            f(e);\n            return false;\n          };\n          handler.onmouseup = function (e) {\n            h(e);\n            return false;\n          };\n          handler.onmousemove = function (e) {\n            f(e);\n            return false;\n          };\n        }\n\n        var welive_css = document.createElement(\"link\");\n        welive_css.setAttribute(\"rel\", \"stylesheet\");\n        welive_css.setAttribute(\"href\", \"https://helper2.mingding.org/customer_support_v3/public/fangke/welive.css\");\n        document\n          .getElementsByTagName(\"head\")[0]\n          .appendChild(welive_css);\n\n        var welive_c = \'<div id=\"welive_online\" style=\"background-color:\' + welive_panel_color + \'\"><div id=\"welive_info\"><img src=\"https://helper2.mingding.org/customer_support_v3/public/fangke/img/small_icon.gif\">\' + (\n          true\n          ? \'点击咨询 在线客服 ...\'\n          : \'Click for Online Support ...\') + \'</div><div id=\"welive_tg\"></div></div><div id=\"welive_wrap\" style=\"backgro\' + \'und-color:\' + welive_panel_color + \'\"><div id=\"welive_drag\"></div><div id=\"wel\' + \'ive_mouse_tracker\"></div><div id=\"welive_close\"></div><div id=\"welive_close_bt\' + \'n\"></div><div id=\"welive_iwrap\"><div id=\"welive_iholder\"><iframe id=\"welive_if\' + \'rame\" src=\"\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\"></iframe>\' + \'</div></div></div>\';\n\n        document.write(welive_c);\n\n        var welive_ttt = 0;\n        welive_online = $_$(\"welive_online\");\n        welive_wrap = $_$(\"welive_wrap\");\n        welive_close_btn = $_$(\"welive_close_btn\");\n\n        welive_wrap.onmouseover = function () {\n          welive_close_btn.style.display = \"block\";\n        };\n        welive_wrap.onmouseout = function () {\n          welive_close_btn.style.display = \"none\";\n        };\n\n        welive_online.onclick = function () {\n          if (welive_ttt) \n            clearTimeout(welive_ttt);\n          welive_opened = 1;\n          if (!welive_loaded) {\n            welive_loaded = 1;\n            welive_drag(welive_wrap);\n\n            location.hash = \"\";\n            var url = window.btoa(window.location.href);\n            $_$(\"welive_iframe\").src = \"https://helper2.mingding.org/customer_support_v3/guestFrame?groupId=chinese\";\n\n            document.addEventListener(\"mousedown\", welive_stopflash);\n            document.addEventListener(\"keydown\", welive_stopflash);\n          }\n          welive_wrap.style.display = \"block\";\n          welive_online.style.display = \"none\";\n        };\n\n        welive_close_btn.onclick = function () {\n          welive_opened = 0;\n          welive_wrap.style.display = \"none\";\n          welive_online.style.display = \"block\";\n        };\n\n        if (welive_auto) {\n          welive_ttt = setTimeout(function () {\n            welive_online.click();\n          }, welive_auto * 1000);\n        }\n      }\n\n      function welive_mobile() {\n\n        var welive_css = document.createElement(\"link\");\n        welive_css.setAttribute(\"rel\", \"stylesheet\");\n        welive_css.setAttribute(\"href\", \"https://helper2.mingding.org/customer_support_v3/public/fangke/mobile/welive.css\");\n        document\n          .getElementsByTagName(\"head\")[0]\n          .appendChild(welive_css);\n\n        var welive_content = \'<div id=\"welive_online\" class=\"welive_style\' + welive_color_style + \' welive_animated welive_zoomIn\" style=\"width:100px;height:105px;\"><div id=\"welive_online_tips\">0</div></div>\' + \'<div id=\"welive_wrap\" style=\"display:none;\">\' + \'<div id=\"welive_close\"></div>\' + \'<iframe id=\"welive_iframe\" src=\"\" frameborder=\"0\" scrolling=\"no\" allowTransparency=\"true\"></iframe>\' + \'</div>\';\n\n        document.write(welive_content);\n\n        welive_online_tips = $_$(\"welive_online_tips\");\n        welive_close_btn = $_$(\"welive_close\");\n\n        var welive_ttt = 0,\n          welive_ttt2 = 0,\n          welive_obj = {\n            drag: \'\',\n            wrap: \'\',\n            flag: 0,\n            x: 0,\n            y: 0,\n            dx: 0,\n            dy: 0,\n            w: 0,\n            h: 0,\n            sw: 0,\n            sh: 0\n          };\n\n        welive_obj.drag = $_$(\"welive_online\");\n        welive_obj.wrap = $_$(\"welive_wrap\");\n\n        welive_obj.w = welive_obj.drag.offsetWidth;\n        welive_obj.h = welive_obj.drag.offsetHeight;\n\n        welive_obj\n          .drag\n          .addEventListener(\"touchstart\", function (e) {\n            welive_obj.flag = 1;\n\n            welive_obj.sw = document.documentElement.clientWidth;\n            welive_obj.sh = document.documentElement.clientHeight;\n\n            var touch;\n\n            if (e.targetTouches) {\n              touch = e.targetTouches[0];\n            } else {\n              touch = e;\n            }\n\n            welive_obj.x = touch.clientX;\n            welive_obj.y = touch.clientY;\n            welive_obj.dx = welive_obj.drag.offsetLeft;\n            welive_obj.dy = welive_obj.drag.offsetTop;\n          });\n\n        welive_obj\n          .drag\n          .addEventListener(\"touchmove\", function (e) {\n\n            if (welive_obj.flag) {\n              var touch;\n\n              if (e.targetTouches) {\n                touch = e.targetTouches[0];\n              } else {\n                touch = e;\n              }\n\n              var x = welive_obj.dx + touch.clientX - welive_obj.x;\n              var y = welive_obj.dy + touch.clientY - welive_obj.y;\n\n              if (x > 0 && x < (welive_obj.sw - welive_obj.w)) {\n                welive_obj.drag.style.left = x + \"px\";\n              }\n\n              if (y > 0 && y < (welive_obj.sh - welive_obj.h)) {\n                welive_obj.drag.style.top = y + \"px\";\n              }\n\n              e.stopPropagation();\n              e.preventDefault();\n              return false;\n            }\n\n          });\n\n        welive_obj\n          .drag\n          .addEventListener(\"touchend\", function (e) {\n            welive_obj.flag = 0;\n          });\n\n        //监听横竖屏切换\n        window.addEventListener(\"orientationchange\", function () {\n\n          welive_obj.drag.style.top = \"auto\";\n          welive_obj.drag.style.left = \"auto\";\n          welive_obj.drag.style.right = \"20px\";\n          welive_obj.drag.style.bottom = 0;\n\n          if (welive_opened) {\n            welive_obj.wrap.style.display = \"none\";\n\n            if (welive_ttt2) \n              clearTimeout(welive_ttt2);\n            \n            welive_ttt2 = setTimeout(function () {\n              welive_obj\n                .drag\n                .click();\n\n            }, 300);\n          }\n\n        }, false);\n\n        welive_obj.drag.onclick = function () {\n\n          if (welive_ttt) \n            clearTimeout(welive_ttt);\n          \n          welive_opened = 1;\n\n          //重新获取屏幕大小, 因为可能横竖屏发生了切换\n          var welive_w = document.documentElement.clientWidth;\n          var welive_h = document.documentElement.clientHeight;\n\n          if (!welive_loaded) {\n            welive_loaded = 1;\n            location.hash = \"\";\n            var url = window.btoa(window.location.href);\n            $_$(\"welive_iframe\").src = \"https://helper2.mingding.org/customer_support_v3/guestFrame?groupId=chinese\";\n          }\n\n          //横屏时welive窗口宽度预定为竖屏时窗口的高度\n          if (welive_h < 1) \n            welive_h = 1; //防万一除数为0\n          if ((welive_w / welive_h) > 1) {\n            welive_w = welive_h;\n            if (welive_w < 400) \n              welive_w = 400;\n            }\n          \n          //适配pad\n          if (welive_w > 500) \n            welive_w = 500;\n          if (welive_h > 900) \n            welive_h = 900;\n          \n          welive_obj.wrap.style.width = welive_w - 20 + \"px\";\n          welive_obj.wrap.style.height = welive_h - 10 + \"px\";\n\n          var u = navigator.userAgent;\n          var isiOS = false; //!!u.match(/\\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端\n          if (isiOS) {\n            welive_obj.wrap.style.height = welive_h - 100 + \"px\";\n          }\n\n          welive_obj.wrap.style.display = \"block\";\n\n          welive_obj.wrap.className = \"welive_zoomIn\";\n\n          welive_obj.drag.style.display = \"none\";\n          welive_online_tips.style.display = \"none\";\n          welive_online_tips.innerHTML = \"0\";\n\n          event.stopPropagation();\n          event.preventDefault();\n          return false;\n        };\n\n        welive_close_btn.onclick = function () {\n          welive_obj.drag.style.display = \"block\";\n          welive_opened = 0;\n          welive_obj.wrap.className = \"welive_zoomOut\";\n\n          setTimeout(function () {\n            welive_obj.wrap.style.display = \"none\";\n          }, 200);\n        }\n\n        //自动弹开\n        if (welive_auto) {\n          welive_ttt = setTimeout(function () {\n            welive_obj\n              .drag\n              .click();\n          }, welive_auto * 1000);\n        }\n      }\n\n      var welive_is_mobile = navigator\n        .userAgent\n        .match(/(iPhone|Android|iPod|ios|iPad|Windows ce|Windows mobile|Micromessenger|webOS|Ucweb|UCBrowser|BlackBerry|midp|rv:1.2.3.4)/i);\n\n      if (welive_is_mobile) { //mobile\n        welive_mobile();\n      } else { //web\n        welive_web();\n      }\n    </script>',NULL,NULL,'insert','admin','系统管理员','2022-07-02T08:40:17+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (28,'jhArticleTagSample','object','all',NULL,NULL,'[{\"tag\":\"jh-toggle\",\"label\":\"折叠菜单\",\"content\":\"[jh-toggle title=\\\"新约\\\" state=\\\"open\\\"]\\n[jh-article-query]\\n{\\n\\\"where\\\": \\\"where categoryId = 1621\\\",\\n\\\"queryType\\\": \\\"order\\\",\\n\\\"orderBy\\\": \\\"order by articleTitle asc\\\",\\n\\\"limit\\\": 50\\n}\\n[/jh-article-query]\\n[/jh-toggle]\"},{\"tag\":\"jh-half-right\",\"label\":\"右侧半容器\",\"content\":\"[jh-half-right]\\n[/jh-half-right]\"},{\"tag\":\"jh-half-left\",\"label\":\"右侧半容器\",\"content\":\"[jh-half-left]\\n[/jh-half-left]\"}]',NULL,NULL,'jhUpdate','admin','系统管理员','2022-07-04T16:09:28+08:00');
INSERT INTO `web_constant_ui` (`id`,`constantKey`,`constantType`,`pageId`,`desc`,`en`,`zh`,`kr`,`yueyu`,`operation`,`operationByUserId`,`operationByUser`,`operationAt`) VALUES (36,'header333','all','header','',NULL,NULL,NULL,NULL,'jhUpdate','admin','系统管理员','2022-09-09T11:52:59+08:00');



# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: _view01_user
# ------------------------------------------------------------

CREATE OR REPLACE VIEW `_view01_user` AS
select
  `_user`.`id` AS `id`,
  `_user`.`idSequence` AS `idSequence`,
  `_user`.`userId` AS `userId`,
  `_user`.`username` AS `username`,
  `_user`.`clearTextPassword` AS `clearTextPassword`,
  `_user`.`password` AS `password`,
  `_user`.`md5Salt` AS `md5Salt`,
  `_user`.`userStatus` AS `userStatus`,
  `_user`.`userType` AS `userType`,
  `_user`.`config` AS `config`,
  `_user`.`operation` AS `operation`,
  `_user`.`operationByUserId` AS `operationByUserId`,
  `_user`.`operationByUser` AS `operationByUser`,
  `_user`.`operationAt` AS `operationAt`
from
  `_user`;





