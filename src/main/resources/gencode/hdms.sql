/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : hdms

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-05-23 11:23:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `auth_menu`;
CREATE TABLE `auth_menu` (
  `MENUID` varchar(32) NOT NULL COMMENT '菜单编号',
  `NAME` varchar(64) DEFAULT NULL COMMENT '菜单名称',
  `MENU_POS` varchar(20) DEFAULT NULL COMMENT '菜单位置',
  `HREF` varchar(512) DEFAULT NULL COMMENT '链接地址',
  `ICON_CLS` varchar(512) DEFAULT NULL COMMENT '菜单图标',
  `DISPLAY` varchar(3) DEFAULT NULL COMMENT '是否显示',
  `ORDER_NUM` varchar(11) DEFAULT NULL COMMENT '序号',
  `PID` varchar(32) DEFAULT NULL COMMENT '父菜单编号',
  `LEVEL_TYPE` varchar(30) DEFAULT NULL COMMENT '菜单类别',
  PRIMARY KEY (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of auth_menu
-- ----------------------------
INSERT INTO `auth_menu` VALUES ('4758592868910319', '互联网综合服务平台', '0', '/', '', 'on', '1', '0', 'application');
INSERT INTO `auth_menu` VALUES ('4900335617310710', '系统设置', 'top', '/', 'icon-user', 'on', '1', '4758592868910319', 'application');
INSERT INTO `auth_menu` VALUES ('4900346948510727', '系统管理', 'left', '/', 'icon-sys', 'on', '1', '4900335617310710', 'application');
INSERT INTO `auth_menu` VALUES ('4929825908611119', '用户管理', 'left', '/platform/user/list', 'icon-users', 'on', '1', '4900346948510727', 'application');
INSERT INTO `auth_menu` VALUES ('4929831830711125', '角色管理', 'left', '/platform/role/list', 'icon-role', 'on', '2', '4900346948510727', 'application');
INSERT INTO `auth_menu` VALUES ('4929836951411131', '开发人员工具', 'left', '/', 'icon-sys', 'on', '3', '4900335617310710', 'system');
INSERT INTO `auth_menu` VALUES ('4929960509311144', '菜单管理', 'left', '/platform/menu/list', 'icon-menu', 'on', '1', '4929836951411131', 'system');
INSERT INTO `auth_menu` VALUES ('4929974605311158', '代码生成', 'left', '/platform/tables/list', 'icon-setting', 'on', '2', '4929836951411131', 'system');
INSERT INTO `auth_menu` VALUES ('4930013831011165', '自定义ComboBox', 'left', '/platform/box/list', 'icon-nav', 'on', '12', '4929836951411131', 'system');
INSERT INTO `auth_menu` VALUES ('4930017459411175', '测试管理', 'left', '/platform/test/list', 'icon-test', 'on', '3', '4929836951411131', 'system');
INSERT INTO `auth_menu` VALUES ('4937759643010612', '积分管理', 'top', '/', 'code', 'on', '2', '4758592868910319', 'application');
INSERT INTO `auth_menu` VALUES ('4937764214310622', '积分规则管理', 'left', '/', 'icon-sys', 'on', '2', '4937759643010612', 'application');
INSERT INTO `auth_menu` VALUES ('4937771630310636', '业务积分规则', 'left', '/', 'icon-rule', 'on', '2', '4937764214310622', 'application');
INSERT INTO `auth_menu` VALUES ('4937775511610643', '行为积分规则', 'left', '/', 'icon-rule', 'on', '2', '4937764214310622', 'application');
INSERT INTO `auth_menu` VALUES ('4937787503210655', '客户信息管理', 'top', '/', 'icon-user', 'on', '3', '4758592868910319', 'application');
INSERT INTO `auth_menu` VALUES ('4937795396310665', '积分数据统计', 'left', '/', 'icon-sys', 'on', '2', '4937759643010612', 'application');
INSERT INTO `auth_menu` VALUES ('4937800330210676', '客户积分查询', 'left', '/', 'icon-user', 'on', '1', '4937795396310665', 'application');
INSERT INTO `auth_menu` VALUES ('4937805643610681', '客户信息统计', 'left', '/', 'icon-sys', 'on', '3', '4937787503210655', 'application');
INSERT INTO `auth_menu` VALUES ('4937813894610697', '机构客户信息统计', 'left', '/', 'icon-count', 'on', '2', '4937805643610681', 'application');
INSERT INTO `auth_menu` VALUES ('50150286365114', '字典管理', 'left', '/platform/dict/list', 'icon-nav', 'on', '1', '4929836951411131', 'system');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `ROLEID` varchar(32) NOT NULL COMMENT '角色编号',
  `NAME` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `TYPE` varchar(64) DEFAULT NULL COMMENT '角色类型',
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('50642806128136', '系统管理员', 'system');
INSERT INTO `auth_role` VALUES ('50675519372117', '测试人员', 'application');

-- ----------------------------
-- Table structure for auth_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menu`;
CREATE TABLE `auth_role_menu` (
  `ROLE_MENU_ID` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `MENU_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ROLE_MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_menu
-- ----------------------------
INSERT INTO `auth_role_menu` VALUES ('51637448076117', '50675519372117', '4900335617310710');
INSERT INTO `auth_role_menu` VALUES ('51637448080129', '50675519372117', '4900346948510727');
INSERT INTO `auth_role_menu` VALUES ('51637448082134', '50675519372117', '4929825908611119');
INSERT INTO `auth_role_menu` VALUES ('51637448083140', '50675519372117', '4929831830711125');
INSERT INTO `auth_role_menu` VALUES ('51637448084156', '50675519372117', '4937759643010612');
INSERT INTO `auth_role_menu` VALUES ('51637448085166', '50675519372117', '4937764214310622');
INSERT INTO `auth_role_menu` VALUES ('51637448086174', '50675519372117', '4937775511610643');
INSERT INTO `auth_role_menu` VALUES ('51637448087181', '50675519372117', '4937795396310665');
INSERT INTO `auth_role_menu` VALUES ('51637448088193', '50675519372117', '4937800330210676');
INSERT INTO `auth_role_menu` VALUES ('51637451417120', '50642806128136', '4900335617310710');
INSERT INTO `auth_role_menu` VALUES ('51637451419138', '50642806128136', '4900346948510727');
INSERT INTO `auth_role_menu` VALUES ('51637451420142', '50642806128136', '4929825908611119');
INSERT INTO `auth_role_menu` VALUES ('51637451421155', '50642806128136', '4929831830711125');
INSERT INTO `auth_role_menu` VALUES ('51637451422165', '50642806128136', '4929836951411131');
INSERT INTO `auth_role_menu` VALUES ('51637451423172', '50642806128136', '4929960509311144');
INSERT INTO `auth_role_menu` VALUES ('51637451424184', '50642806128136', '4929974605311158');
INSERT INTO `auth_role_menu` VALUES ('51637451426197', '50642806128136', '4930013831011165');
INSERT INTO `auth_role_menu` VALUES ('51637451428128', '50642806128136', '4930017459411175');
INSERT INTO `auth_role_menu` VALUES ('51637451430139', '50642806128136', '50150286365114');
INSERT INTO `auth_role_menu` VALUES ('51637451431141', '50642806128136', '4937759643010612');
INSERT INTO `auth_role_menu` VALUES ('51637451432151', '50642806128136', '4937764214310622');
INSERT INTO `auth_role_menu` VALUES ('51637451433162', '50642806128136', '4937771630310636');
INSERT INTO `auth_role_menu` VALUES ('51637451434170', '50642806128136', '4937775511610643');
INSERT INTO `auth_role_menu` VALUES ('51637451435184', '50642806128136', '4937795396310665');
INSERT INTO `auth_role_menu` VALUES ('51637451436197', '50642806128136', '4937800330210676');
INSERT INTO `auth_role_menu` VALUES ('51637451437129', '50642806128136', '4937787503210655');
INSERT INTO `auth_role_menu` VALUES ('51637451438131', '50642806128136', '4937805643610681');
INSERT INTO `auth_role_menu` VALUES ('51637451439146', '50642806128136', '4937813894610697');

-- ----------------------------
-- Table structure for auth_test
-- ----------------------------
DROP TABLE IF EXISTS `auth_test`;
CREATE TABLE `auth_test` (
  `TESTID` varchar(32) NOT NULL COMMENT '测试编号',
  `GROUP_ID` varchar(32) DEFAULT NULL COMMENT '组编号',
  `TESTNAME` varchar(64) DEFAULT NULL COMMENT '测试名称',
  PRIMARY KEY (`TESTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表';

-- ----------------------------
-- Records of auth_test
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `USERID` varchar(32) NOT NULL COMMENT '用户编号',
  `USERNAME` varchar(32) NOT NULL COMMENT '登录用户账号',
  `OPERATORNAME` varchar(40) NOT NULL COMMENT '操作员名称',
  `PASSWORD` varchar(50) DEFAULT NULL COMMENT '操作员密码',
  `CREATETIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `ALTERTIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '用户状态',
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作员信息';

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('49571524401117', 'sysadmin', '系统管理员', 'e19d5cd5af0378da05f63f891c7467af', '2017-03-30 22:50:04', '2017-03-30 22:50:04', 'T');
INSERT INTO `auth_user` VALUES ('5144347193411917', 'zhangshan', '张三', 'b59c67bf196a4758191e42f76670ceba', '2017-04-21 14:49:11', '2017-04-21 14:49:11', 'T');
INSERT INTO `auth_user` VALUES ('5144350672711926', 'lishi', '李四', '81dc9bdb52d04dc20036dbd8313ed055', '2017-04-21 14:49:46', '2017-04-21 14:49:46', 'T');
INSERT INTO `auth_user` VALUES ('5144353077811933', 'wangwu', '王五', '96e79218965eb72c92a549dd5a330112', '2017-04-21 14:50:10', '2017-04-21 14:50:10', 'T');
INSERT INTO `auth_user` VALUES ('5144355337711940', 'zhaoliu', '赵六', '81dc9bdb52d04dc20036dbd8313ed055', '2017-04-21 14:50:33', '2017-04-21 14:50:33', 'T');
INSERT INTO `auth_user` VALUES ('5144358056811959', 'lixing', '李想', 'e10adc3949ba59abbe56e057f20f883e', '2017-04-21 14:51:00', '2017-04-21 14:51:00', 'T');
INSERT INTO `auth_user` VALUES ('51635495518180', 'zhangwu', '张武', '2eee9635947c6da9babef9fbff9702e0', '2017-04-23 20:09:35', '2017-04-23 20:09:35', 'T');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `USER_ROLE_ID` varchar(32) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('1', '49571524401117', '50642806128136');
INSERT INTO `auth_user_role` VALUES ('51635509117199', '51635495518180', '50675519372117');

-- ----------------------------
-- Table structure for sys_columns
-- ----------------------------
DROP TABLE IF EXISTS `sys_columns`;
CREATE TABLE `sys_columns` (
  `COLNO` smallint(6) DEFAULT NULL COMMENT '字段序号',
  `COLUMN_NAME` varchar(128) NOT NULL COMMENT '字段名称',
  `TBNAME` varchar(128) NOT NULL COMMENT '表名称',
  `TBCREATOR` varchar(128) NOT NULL COMMENT '创建用户',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  `COLTYPE` varchar(20) DEFAULT NULL COMMENT '字段类型',
  `PROPERTY_LENGTH` smallint(6) DEFAULT NULL COMMENT '字段长度',
  `NULLS` varchar(20) DEFAULT NULL COMMENT '是否为空',
  `PROPERTY_NAME` varchar(30) DEFAULT NULL COMMENT '属性名',
  `PROPERTY_TYPE` varchar(40) DEFAULT NULL COMMENT '属性类型',
  `PROPERTY_TITLE` varchar(40) DEFAULT NULL COMMENT '属性标题',
  `ISPRIMARY` char(1) DEFAULT NULL COMMENT '是否为主键',
  `ISSELECT` char(1) DEFAULT NULL COMMENT '精确查询',
  `ISLIKE` char(1) DEFAULT NULL COMMENT '模糊查询',
  `ISDISPLAY` char(1) DEFAULT NULL COMMENT '表格中显示',
  `ISADD` char(1) DEFAULT NULL COMMENT '添加时显示',
  `ISUPDATE` char(1) DEFAULT NULL COMMENT '修改时显示',
  `WIDTH` smallint(6) DEFAULT NULL COMMENT '宽度',
  `SORTABLE` char(1) DEFAULT NULL COMMENT '允许排序',
  `COMPONENT` varchar(60) DEFAULT NULL COMMENT 'easyui控件',
  `DATA_OPTIONS` varchar(255) DEFAULT NULL COMMENT 'data-options',
  `FORMATTER` varchar(255) DEFAULT NULL COMMENT '格式化',
  `COMBOID` varchar(32) DEFAULT NULL COMMENT '字典编号',
  PRIMARY KEY (`COLUMN_NAME`,`TBNAME`,`TBCREATOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表字段信息';

-- ----------------------------
-- Records of sys_columns
-- ----------------------------
INSERT INTO `sys_columns` VALUES ('6', 'ALTERTIME', 'auth_user', 'hdms', '更新时间', 'timestamp', null, 'YES', 'altertime', 'Date', '更新时间', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.altertime;}', null);
INSERT INTO `sys_columns` VALUES ('13', 'BUSINESS_NAME', 'sys_tables', 'hdms', '业务包名称', 'varchar', '20', 'YES', 'businessName', 'String', '业务包名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,20]\']', 'function(value,row,index){return row.businessName;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'COLNO', 'sys_columns', 'hdms', '字段序号', 'smallint', null, 'YES', 'colno', 'Short', '字段序号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.colno;}', null);
INSERT INTO `sys_columns` VALUES ('6', 'COLTYPE', 'sys_columns', 'hdms', '字段类型', 'varchar', '20', 'YES', 'coltype', 'String', '字段类型', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,20]\']', 'function(value,row,index){return row.coltype;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'COLUMN_NAME', 'sys_columns', 'hdms', '字段名称', 'varchar', '128', 'NO', 'columnName', 'String', '字段名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.columnName;}', null);
INSERT INTO `sys_columns` VALUES ('23', 'COMBOID', 'sys_columns', 'hdms', '字典编号', 'varchar', '32', 'YES', 'comboid', 'String', '字典编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.comboid;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'COMBOID', 'sys_combo_box', 'hdms', '字典编号', 'varchar', '64', 'NO', 'comboid', 'String', '字典编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.comboid;}', null);
INSERT INTO `sys_columns` VALUES ('20', 'COMPONENT', 'sys_columns', 'hdms', 'easyui控件', 'varchar', '60', 'YES', 'component', 'String', 'easyui控件', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.component;}', null);
INSERT INTO `sys_columns` VALUES ('19', 'CONTROLLER_TARGET_PACKAGE', 'sys_tables', 'hdms', 'CONTROLLER包路径', 'varchar', '60', 'YES', 'controllerTargetPackage', 'String', 'CONTROLLER包路径', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.controllerTargetPackage;}', null);
INSERT INTO `sys_columns` VALUES ('5', 'CREATETIME', 'auth_user', 'hdms', '创建时间', 'timestamp', null, 'YES', 'createtime', 'Date', '创建时间', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.createtime;}', null);
INSERT INTO `sys_columns` VALUES ('6', 'CTIME', 'sys_tables', 'hdms', '创建时间', 'timestamp', null, 'YES', 'ctime', 'Date', '创建时间', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.ctime;}', null);
INSERT INTO `sys_columns` VALUES ('21', 'DATA_OPTIONS', 'sys_columns', 'hdms', 'data-options', 'varchar', '255', 'YES', 'dataOptions', 'String', 'data-options', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.dataOptions;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'DICTID', 'sys_dict_entry', 'hdms', '字典项编号', 'varchar', '128', 'NO', 'dictid', 'String', '字典项编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.dictid;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'DICTNAME', 'sys_dict_entry', 'hdms', '字典项名称', 'varchar', '255', 'YES', 'dictname', 'String', '字典项名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.dictname;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'DICTTYPEID', 'sys_dict_entry', 'hdms', '字典编号', 'varchar', '128', 'NO', 'dicttypeid', 'String', '字典编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.dicttypeid;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'DICTTYPEID', 'sys_dict_type', 'hdms', '字典编号', 'varchar', '128', 'NO', 'dicttypeid', 'String', '字典编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.dicttypeid;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'DICTTYPENAME', 'sys_dict_type', 'hdms', '字典名称', 'varchar', '255', 'YES', 'dicttypename', 'String', '字典名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.dicttypename;}', null);
INSERT INTO `sys_columns` VALUES ('6', 'DISPLAY', 'auth_menu', 'hdms', '是否显示', 'varchar', '3', 'YES', 'display', 'String', '是否显示', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,3]\']', 'function(value,row,index){return row.display;}', null);
INSERT INTO `sys_columns` VALUES ('14', 'DOMAIN_OBJECT_NAME', 'sys_tables', 'hdms', '类名称', 'varchar', '40', 'YES', 'domainObjectName', 'String', '类名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,40]\']', 'function(value,row,index){return row.domainObjectName;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'FID', 'sys_tables', 'hdms', '表序号', 'smallint', null, 'YES', 'fid', 'Short', '表序号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.fid;}', null);
INSERT INTO `sys_columns` VALUES ('22', 'FORMATTER', 'sys_columns', 'hdms', '格式化', 'varchar', '255', 'YES', 'formatter', 'String', '格式化', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.formatter;}', null);
INSERT INTO `sys_columns` VALUES ('8', 'GENERATE', 'sys_tables', 'hdms', '是否生成代码', 'char', '1', 'YES', 'generate', 'String', '是否生成代码', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.generate;}', null);
INSERT INTO `sys_columns` VALUES ('9', 'GENTYPE', 'sys_tables', 'hdms', '生成类型', 'varchar', '32', 'YES', 'gentype', 'String', '生成类型', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.gentype;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'GROUP_ID', 'auth_test', 'hdms', '组编号', 'varchar', '32', 'YES', 'groupId', 'String', '组编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.groupId;}', null);
INSERT INTO `sys_columns` VALUES ('10', 'GTIME', 'sys_tables', 'hdms', '生成代码时间', 'timestamp', null, 'YES', 'gtime', 'Date', '生成代码时间', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.gtime;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'HREF', 'auth_menu', 'hdms', '链接地址', 'varchar', '512', 'YES', 'href', 'String', '链接地址', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,512]\']', 'function(value,row,index){return row.href;}', null);
INSERT INTO `sys_columns` VALUES ('5', 'ICON_CLS', 'auth_menu', 'hdms', '菜单图标', 'varchar', '512', 'YES', 'iconCls', 'String', '菜单图标', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,512]\']', 'function(value,row,index){return row.iconCls;}', null);
INSERT INTO `sys_columns` VALUES ('23', 'ID_FIELD', 'sys_tables', 'hdms', '主键字段', 'varchar', '60', 'YES', 'idField', 'String', '主键字段', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.idField;}', null);
INSERT INTO `sys_columns` VALUES ('16', 'ISADD', 'sys_columns', 'hdms', '添加时显示', 'char', '1', 'YES', 'isadd', 'String', '添加时显示', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isadd;}', null);
INSERT INTO `sys_columns` VALUES ('20', 'ISADD', 'sys_tables', 'hdms', '是否可以添加', 'char', '1', 'YES', 'isadd', 'String', '是否可以添加', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isadd;}', null);
INSERT INTO `sys_columns` VALUES ('22', 'ISDELETE', 'sys_tables', 'hdms', '是否可以删除', 'char', '1', 'YES', 'isdelete', 'String', '是否可以删除', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isdelete;}', null);
INSERT INTO `sys_columns` VALUES ('15', 'ISDISPLAY', 'sys_columns', 'hdms', '表格中显示', 'char', '1', 'YES', 'isdisplay', 'String', '表格中显示', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isdisplay;}', null);
INSERT INTO `sys_columns` VALUES ('14', 'ISLIKE', 'sys_columns', 'hdms', '模糊查询', 'char', '1', 'YES', 'islike', 'String', '模糊查询', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.islike;}', null);
INSERT INTO `sys_columns` VALUES ('12', 'ISPRIMARY', 'sys_columns', 'hdms', '是否为主键', 'char', '1', 'YES', 'isprimary', 'String', '是否为主键', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isprimary;}', null);
INSERT INTO `sys_columns` VALUES ('13', 'ISSELECT', 'sys_columns', 'hdms', '精确查询', 'char', '1', 'YES', 'isselect', 'String', '精确查询', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isselect;}', null);
INSERT INTO `sys_columns` VALUES ('17', 'ISUPDATE', 'sys_columns', 'hdms', '修改时显示', 'char', '1', 'YES', 'isupdate', 'String', '修改时显示', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isupdate;}', null);
INSERT INTO `sys_columns` VALUES ('21', 'ISUPDATE', 'sys_tables', 'hdms', '是否可以修改', 'char', '1', 'YES', 'isupdate', 'String', '是否可以修改', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.isupdate;}', null);
INSERT INTO `sys_columns` VALUES ('5', 'KEYCOLUMNS', 'sys_tables', 'hdms', '主键列数量', 'smallint', null, 'YES', 'keycolumns', 'Short', '主键列数量', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.keycolumns;}', null);
INSERT INTO `sys_columns` VALUES ('9', 'LEVEL_TYPE', 'auth_menu', 'hdms', '菜单类别', 'varchar', '30', 'YES', 'levelType', 'String', '菜单类别', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,30]\']', 'function(value,row,index){return row.levelType;}', null);
INSERT INTO `sys_columns` VALUES ('17', 'MAPPER_TARGET_PACKAGE', 'sys_tables', 'hdms', 'MAPPER包路径', 'varchar', '60', 'YES', 'mapperTargetPackage', 'String', 'MAPPER包路径', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.mapperTargetPackage;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'MENUID', 'auth_menu', 'hdms', '菜单编号', 'varchar', '32', 'NO', 'menuid', 'String', '菜单编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.menuid;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'MENU_ID', 'auth_role_menu', 'hdms', '', 'varchar', '32', 'YES', 'menuId', 'String', 'MENU_ID', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.menuId;}', null);
INSERT INTO `sys_columns` VALUES ('12', 'MENU_NAME', 'sys_tables', 'hdms', '菜单名称', 'varchar', '60', 'YES', 'menuName', 'String', '菜单名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.menuName;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'MENU_POS', 'auth_menu', 'hdms', '菜单位置', 'varchar', '20', 'YES', 'menuPos', 'String', '菜单位置', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,20]\']', 'function(value,row,index){return row.menuPos;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'NAME', 'auth_menu', 'hdms', '菜单名称', 'varchar', '64', 'YES', 'name', 'String', '菜单名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.name;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'NAME', 'auth_role', 'hdms', '角色名称', 'varchar', '64', 'YES', 'name', 'String', '角色名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.name;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'NAME', 'sys_combo_box', 'hdms', '字典名称', 'varchar', '64', 'YES', 'name', 'String', '字典名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.name;}', null);
INSERT INTO `sys_columns` VALUES ('8', 'NULLS', 'sys_columns', 'hdms', '是否为空', 'varchar', '20', 'YES', 'nulls', 'String', '是否为空', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,20]\']', 'function(value,row,index){return row.nulls;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'OPERATORNAME', 'auth_user', 'hdms', '操作员名称', 'varchar', '40', 'NO', 'operatorname', 'String', '操作员名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,40]\']', 'function(value,row,index){return row.operatorname;}', null);
INSERT INTO `sys_columns` VALUES ('7', 'ORDER_NUM', 'auth_menu', 'hdms', '序号', 'varchar', '11', 'YES', 'orderNum', 'String', '序号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,11]\']', 'function(value,row,index){return row.orderNum;}', null);
INSERT INTO `sys_columns` VALUES ('7', 'PARENTID', 'sys_dict_entry', 'hdms', '上级编号', 'varchar', '255', 'YES', 'parentid', 'String', '上级编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.parentid;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'PARENTID', 'sys_dict_type', 'hdms', '上级编号', 'varchar', '255', 'YES', 'parentid', 'String', '上级编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.parentid;}', null);
INSERT INTO `sys_columns` VALUES ('7', 'PARENT_FIELD', 'sys_combo_box', 'hdms', 'parentField', 'varchar', '128', 'YES', 'parentField', 'String', 'parentField', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.parentField;}', null);
INSERT INTO `sys_columns` VALUES ('24', 'PARENT_FIELD', 'sys_tables', 'hdms', '父类字段', 'varchar', '60', 'YES', 'parentField', 'String', '父类字段', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.parentField;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'PASSWORD', 'auth_user', 'hdms', '操作员密码', 'varchar', '50', 'YES', 'password', 'String', '操作员密码', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,50]\']', 'function(value,row,index){return row.password;}', null);
INSERT INTO `sys_columns` VALUES ('11', 'PATH', 'sys_tables', 'hdms', '访问路径', 'varchar', '32', 'YES', 'path', 'String', '访问路径', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.path;}', null);
INSERT INTO `sys_columns` VALUES ('8', 'PID', 'auth_menu', 'hdms', '父菜单编号', 'varchar', '32', 'YES', 'pid', 'String', '父菜单编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.pid;}', null);
INSERT INTO `sys_columns` VALUES ('16', 'POJO_TARGET_PACKAGE', 'sys_tables', 'hdms', 'POJO包路径', 'varchar', '60', 'YES', 'pojoTargetPackage', 'String', 'POJO包路径', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.pojoTargetPackage;}', null);
INSERT INTO `sys_columns` VALUES ('7', 'PROPERTY_LENGTH', 'sys_columns', 'hdms', '字段长度', 'smallint', null, 'YES', 'propertyLength', 'Short', '字段长度', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.propertyLength;}', null);
INSERT INTO `sys_columns` VALUES ('9', 'PROPERTY_NAME', 'sys_columns', 'hdms', '属性名', 'varchar', '30', 'YES', 'propertyName', 'String', '属性名', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,30]\']', 'function(value,row,index){return row.propertyName;}', null);
INSERT INTO `sys_columns` VALUES ('11', 'PROPERTY_TITLE', 'sys_columns', 'hdms', '属性标题', 'varchar', '40', 'YES', 'propertyTitle', 'String', '属性标题', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,40]\']', 'function(value,row,index){return row.propertyTitle;}', null);
INSERT INTO `sys_columns` VALUES ('10', 'PROPERTY_TYPE', 'sys_columns', 'hdms', '属性类型', 'varchar', '40', 'YES', 'propertyType', 'String', '属性类型', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,40]\']', 'function(value,row,index){return row.propertyType;}', null);
INSERT INTO `sys_columns` VALUES ('6', 'RANK', 'sys_dict_entry', 'hdms', '字典等级', 'char', '1', 'YES', 'rank', 'String', '字典等级', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.rank;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'RANK', 'sys_dict_type', 'hdms', '字典等级', 'char', '1', 'YES', 'rank', 'String', '字典等级', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.rank;}', null);
INSERT INTO `sys_columns` VALUES ('5', 'REMARKS', 'sys_columns', 'hdms', '备注', 'varchar', '255', 'YES', 'remarks', 'String', '备注', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.remarks;}', null);
INSERT INTO `sys_columns` VALUES ('7', 'REMARKS', 'sys_tables', 'hdms', '备注', 'varchar', '255', 'YES', 'remarks', 'String', '备注', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,255]\']', 'function(value,row,index){return row.remarks;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'ROLEID', 'auth_role', 'hdms', '角色编号', 'varchar', '32', 'NO', 'roleid', 'String', '角色编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.roleid;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'ROLE_ID', 'auth_role_menu', 'hdms', '', 'varchar', '32', 'YES', 'roleId', 'String', 'ROLE_ID', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.roleId;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'ROLE_ID', 'auth_user_role', 'hdms', '', 'varchar', '32', 'YES', 'roleId', 'String', 'ROLE_ID', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.roleId;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'ROLE_MENU_ID', 'auth_role_menu', 'hdms', '', 'varchar', '32', 'NO', 'roleMenuId', 'String', 'ROLE_MENU_ID', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.roleMenuId;}', null);
INSERT INTO `sys_columns` VALUES ('8', 'ROOT_VALUE', 'sys_combo_box', 'hdms', '根节点值', 'varchar', '128', 'YES', 'rootValue', 'String', '根节点值', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.rootValue;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'SCHEMA_NAME', 'sys_tables', 'hdms', 'SCHEMA', 'varchar', '128', 'NO', 'schemaName', 'String', 'SCHEMA', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.schemaName;}', null);
INSERT INTO `sys_columns` VALUES ('18', 'SERVICE_TARGET_PACKAGE', 'sys_tables', 'hdms', 'SERVICE包路径', 'varchar', '60', 'YES', 'serviceTargetPackage', 'String', 'SERVICE包路径', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.serviceTargetPackage;}', null);
INSERT INTO `sys_columns` VALUES ('19', 'SORTABLE', 'sys_columns', 'hdms', '允许排序', 'char', '1', 'YES', 'sortable', 'String', '允许排序', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.sortable;}', null);
INSERT INTO `sys_columns` VALUES ('5', 'SORTNO', 'sys_dict_entry', 'hdms', '序号', 'int', null, 'YES', 'sortno', 'Integer', '序号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.sortno;}', null);
INSERT INTO `sys_columns` VALUES ('7', 'STATUS', 'auth_user', 'hdms', '用户状态', 'varchar', '20', 'YES', 'status', 'String', '用户状态', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,20]\']', 'function(value,row,index){return row.status;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'STATUS', 'sys_dict_entry', 'hdms', '状态', 'varchar', '3', 'YES', 'status', 'String', '状态', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,3]\']', 'function(value,row,index){return row.status;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'TABLE_NAME', 'sys_combo_box', 'hdms', '查询表', 'varchar', '128', 'YES', 'tableName', 'String', '查询表', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.tableName;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'TABLE_NAME', 'sys_tables', 'hdms', '表名', 'varchar', '128', 'NO', 'tableName', 'String', '表名', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.tableName;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'TBCREATOR', 'sys_columns', 'hdms', '创建用户', 'varchar', '128', 'NO', 'tbcreator', 'String', '创建用户', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.tbcreator;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'TBNAME', 'sys_columns', 'hdms', '表名称', 'varchar', '128', 'NO', 'tbname', 'String', '表名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.tbname;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'TESTID', 'auth_test', 'hdms', '测试编号', 'varchar', '32', 'NO', 'testid', 'String', '测试编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.testid;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'TESTNAME', 'auth_test', 'hdms', '测试名称', 'varchar', '64', 'YES', 'testname', 'String', '测试名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.testname;}', null);
INSERT INTO `sys_columns` VALUES ('5', 'TEXT_FIELD', 'sys_combo_box', 'hdms', 'textField', 'varchar', '128', 'YES', 'textField', 'String', 'textField', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.textField;}', null);
INSERT INTO `sys_columns` VALUES ('25', 'TREE_FIELD', 'sys_tables', 'hdms', 'treefield', 'varchar', '60', 'YES', 'treeField', 'String', 'treefield', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,60]\']', 'function(value,row,index){return row.treeField;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'TYPE', 'auth_role', 'hdms', '角色类型', 'varchar', '64', 'YES', 'type', 'String', '角色类型', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.type;}', null);
INSERT INTO `sys_columns` VALUES ('3', 'TYPE', 'sys_tables', 'hdms', '类型', 'char', '1', 'NO', 'type', 'String', '类型', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,1]\']', 'function(value,row,index){return row.type;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'USERID', 'auth_user', 'hdms', '用户编号', 'varchar', '32', 'NO', 'userid', 'String', '用户编号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.userid;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'USERNAME', 'auth_user', 'hdms', '登录用户账号', 'varchar', '32', 'NO', 'username', 'String', '登录用户账号', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.username;}', null);
INSERT INTO `sys_columns` VALUES ('2', 'USER_ID', 'auth_user_role', 'hdms', '', 'varchar', '32', 'YES', 'userId', 'String', 'USER_ID', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.userId;}', null);
INSERT INTO `sys_columns` VALUES ('1', 'USER_ROLE_ID', 'auth_user_role', 'hdms', '', 'varchar', '32', 'NO', 'userRoleId', 'String', 'USER_ROLE_ID', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,32]\']', 'function(value,row,index){return row.userRoleId;}', null);
INSERT INTO `sys_columns` VALUES ('4', 'VALUE_FIELD', 'sys_combo_box', 'hdms', 'valueField', 'varchar', '128', 'YES', 'valueField', 'String', 'valueField', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,64]\']', 'function(value,row,index){return row.valueField;}', null);
INSERT INTO `sys_columns` VALUES ('15', 'VARIABLE_NAME', 'sys_tables', 'hdms', '类对象名称', 'varchar', '40', 'YES', 'variableName', 'String', '类对象名称', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,40]\']', 'function(value,row,index){return row.variableName;}', null);
INSERT INTO `sys_columns` VALUES ('6', 'WHERE_CONDITION', 'sys_combo_box', 'hdms', '查询条件(key:value)', 'varchar', '128', 'YES', 'whereCondition', 'String', '查询条件(key:value)', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,128]\']', 'function(value,row,index){return row.whereCondition;}', null);
INSERT INTO `sys_columns` VALUES ('18', 'WIDTH', 'sys_columns', 'hdms', '宽度', 'smallint', null, 'YES', 'width', 'Short', '宽度', 'F', 'F', 'F', 'T', 'T', 'T', '100', 'F', 'easyui-validatebox', 'required:true,validType:[\'length[0,null]\']', 'function(value,row,index){return row.width;}', null);

-- ----------------------------
-- Table structure for sys_combo_box
-- ----------------------------
DROP TABLE IF EXISTS `sys_combo_box`;
CREATE TABLE `sys_combo_box` (
  `COMBOID` varchar(64) NOT NULL COMMENT '字典编号',
  `NAME` varchar(64) DEFAULT NULL COMMENT '字典名称',
  `TABLE_NAME` varchar(128) DEFAULT NULL COMMENT '查询表',
  `VALUE_FIELD` varchar(128) DEFAULT NULL COMMENT 'valueField',
  `TEXT_FIELD` varchar(128) DEFAULT NULL COMMENT 'textField',
  `WHERE_CONDITION` varchar(128) DEFAULT NULL COMMENT '查询条件(key:value)',
  `PARENT_FIELD` varchar(128) DEFAULT NULL COMMENT 'parentField',
  `ROOT_VALUE` varchar(128) DEFAULT NULL COMMENT '根节点值',
  PRIMARY KEY (`COMBOID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成代码字典';

-- ----------------------------
-- Records of sys_combo_box
-- ----------------------------
INSERT INTO `sys_combo_box` VALUES ('4885635448210517', '菜单表', 'AUTH_MENU', 'menuid', 'name', '', 'pid', '0');
INSERT INTO `sys_combo_box` VALUES ('4894876433811319', '字典列表', 'SYS_COMBO_BOX', 'comboid', 'name', '', '', '');

-- ----------------------------
-- Table structure for sys_dict_entry
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_entry`;
CREATE TABLE `sys_dict_entry` (
  `DICTTYPEID` varchar(128) NOT NULL COMMENT '字典编号',
  `DICTID` varchar(128) NOT NULL COMMENT '字典项编号',
  `DICTNAME` varchar(255) DEFAULT NULL COMMENT '字典项名称',
  `STATUS` varchar(3) DEFAULT NULL COMMENT '状态',
  `SORTNO` int(11) DEFAULT NULL COMMENT '序号',
  `RANK` char(1) DEFAULT NULL COMMENT '字典等级',
  `PARENTID` varchar(255) DEFAULT NULL COMMENT '上级编号',
  PRIMARY KEY (`DICTTYPEID`,`DICTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict_entry
-- ----------------------------
INSERT INTO `sys_dict_entry` VALUES ('50596844418116', 'application', '应用级', 'on', '1', '', '');
INSERT INTO `sys_dict_entry` VALUES ('50596844418116', 'system', '系统级', 'on', '2', '', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `DICTTYPEID` varchar(128) NOT NULL COMMENT '字典编号',
  `DICTTYPENAME` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `RANK` char(1) DEFAULT NULL COMMENT '字典等级',
  `PARENTID` varchar(255) DEFAULT NULL COMMENT '上级编号',
  PRIMARY KEY (`DICTTYPEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典组';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('50596844418116', '角色类别', '', '');
INSERT INTO `sys_dict_type` VALUES ('50762501817113', '', '', '');

-- ----------------------------
-- Table structure for sys_tables
-- ----------------------------
DROP TABLE IF EXISTS `sys_tables`;
CREATE TABLE `sys_tables` (
  `TABLE_NAME` varchar(128) NOT NULL COMMENT '表名',
  `SCHEMA_NAME` varchar(128) NOT NULL COMMENT 'SCHEMA',
  `TYPE` char(1) NOT NULL COMMENT '类型',
  `FID` smallint(6) DEFAULT NULL COMMENT '表序号',
  `KEYCOLUMNS` smallint(6) DEFAULT NULL COMMENT '主键列数量',
  `CTIME` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  `GENERATE` char(1) DEFAULT NULL COMMENT '是否生成代码',
  `GENTYPE` varchar(32) DEFAULT NULL COMMENT '生成类型',
  `GTIME` timestamp NULL DEFAULT NULL COMMENT '生成代码时间',
  `PATH` varchar(32) DEFAULT NULL COMMENT '访问路径',
  `MENU_NAME` varchar(60) DEFAULT NULL COMMENT '菜单名称',
  `BUSINESS_NAME` varchar(20) DEFAULT NULL COMMENT '业务包名称',
  `DOMAIN_OBJECT_NAME` varchar(40) DEFAULT NULL COMMENT '类名称',
  `VARIABLE_NAME` varchar(40) DEFAULT NULL COMMENT '类对象名称',
  `POJO_TARGET_PACKAGE` varchar(60) DEFAULT NULL COMMENT 'POJO包路径',
  `MAPPER_TARGET_PACKAGE` varchar(60) DEFAULT NULL COMMENT 'MAPPER包路径',
  `SERVICE_TARGET_PACKAGE` varchar(60) DEFAULT NULL COMMENT 'SERVICE包路径',
  `CONTROLLER_TARGET_PACKAGE` varchar(60) DEFAULT NULL COMMENT 'CONTROLLER包路径',
  `ISADD` char(1) DEFAULT NULL COMMENT '是否可以添加',
  `ISUPDATE` char(1) DEFAULT NULL COMMENT '是否可以修改',
  `ISDELETE` char(1) DEFAULT NULL COMMENT '是否可以删除',
  `ID_FIELD` varchar(60) DEFAULT NULL COMMENT '主键字段',
  `PARENT_FIELD` varchar(60) DEFAULT NULL COMMENT '父类字段',
  `TREE_FIELD` varchar(60) DEFAULT NULL COMMENT 'treefield',
  PRIMARY KEY (`TABLE_NAME`,`SCHEMA_NAME`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表信息';

-- ----------------------------
-- Records of sys_tables
-- ----------------------------
INSERT INTO `sys_tables` VALUES ('auth_menu', 'hdms', 'T', null, '9', '2017-05-18 10:07:51', '菜单表', 'F', 'DataGrid', null, 'menu', '菜单表', 'platform', 'AuthMenu', 'authMenu', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('auth_role', 'hdms', 'T', null, '3', '2017-05-18 10:07:51', '角色表', 'F', 'DataGrid', null, 'role', '角色表', 'platform', 'AuthRole', 'authRole', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('auth_role_menu', 'hdms', 'T', null, '3', '2017-05-18 10:07:51', '', 'F', 'DataGrid', null, 'menu', 'auth_role_menu', 'platform', 'AuthRoleMenu', 'authRoleMenu', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('auth_test', 'hdms', 'T', null, '3', '2017-05-18 10:07:52', '测试表', 'F', 'DataGrid', null, 'test', '测试表', 'platform', 'AuthTest', 'authTest', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('auth_user', 'hdms', 'T', null, '7', '2017-05-18 10:07:52', '操作员信息', 'F', 'DataGrid', null, 'user', '操作员信息', 'platform', 'AuthUser', 'authUser', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('auth_user_role', 'hdms', 'T', null, '3', '2017-05-18 10:07:52', '', 'F', 'DataGrid', null, 'role', 'auth_user_role', 'platform', 'AuthUserRole', 'authUserRole', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('sys_columns', 'hdms', 'T', null, '23', '2017-05-18 10:07:52', '表字段信息', 'F', 'DataGrid', null, 'columns', '表字段信息', 'platform', 'SysColumns', 'sysColumns', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('sys_combo_box', 'hdms', 'T', null, '8', '2017-05-18 10:07:52', '生成代码字典', 'F', 'DataGrid', null, 'box', '生成代码字典', 'platform', 'SysComboBox', 'sysComboBox', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('sys_dict_entry', 'hdms', 'T', null, '7', '2017-05-18 10:07:53', '数据字典', 'F', 'DataGrid', null, 'entry', '数据字典', 'platform', 'SysDictEntry', 'sysDictEntry', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('sys_dict_type', 'hdms', 'T', null, '4', '2017-05-18 10:07:53', '字典组', 'F', 'DataGrid', null, 'type', '字典组', 'platform', 'SysDictType', 'sysDictType', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
INSERT INTO `sys_tables` VALUES ('sys_tables', 'hdms', 'T', null, '25', '2017-05-18 10:07:53', '表信息', 'F', 'DataGrid', null, 'tables', '表信息', 'platform', 'SysTables', 'sysTables', 'com.team.platform.pojo', 'com.team.platform.mapper', 'com.team.platform.service', 'com.team.platform.controller', 'T', 'T', 'T', null, null, null);
