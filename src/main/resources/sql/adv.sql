/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : adv

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-09-01 10:49:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_authority
-- ----------------------------
DROP TABLE IF EXISTS `auth_authority`;
CREATE TABLE `auth_authority` (
  `authority_id` varchar(36) NOT NULL,
  `authority_name` varchar(45) DEFAULT '',
  `parent_id` varchar(36) DEFAULT '',
  `menu_url` varchar(255) DEFAULT '',
  `icon_cls` varchar(255) DEFAULT '',
  `data_index` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '1' COMMENT '1表示菜单选项，2表示功能选项。',
  `enabled` int(11) DEFAULT '1',
  `description` varchar(200) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_authority
-- ----------------------------
INSERT INTO `auth_authority` VALUES ('04c1ac9c-f476-4efd-9378-0134da49e042', '删除', '4ea936dd-02a0-4db1-9e01-200079e16ad4', 'deleteTrade', 'ext-icon-note_delete', '4', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('066ec9bc-1592-4849-94d0-262e29f0462f', '编辑', '4ea936dd-02a0-4db1-9e01-200079e16ad4', 'editTrade', 'ext-icon-note_edit', '3', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('10c337fd-e682-41a0-85ec-52f9e842904e', '权限管理', 'e7c32519-88b7-4760-9a25-19e577a1706d', 'page/authority.jsp', 'ext-icon-group_key', '3', '1', '1', '权限管理菜单页');
INSERT INTO `auth_authority` VALUES ('120e2786-c6f5-43f2-bbf7-27d12b76ee69', '添加', '9c92e7f6-e1f6-4136-8eca-8e615a9cf186', 'addTimePackage', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('13e4c879-b015-4540-98f1-1ef658b44277', '删除', '3fcf81f5-3bac-4da4-af6a-42fd27c1be0f', 'deleteRegion', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('19d045d2-ae26-4bbc-8bf4-e48427f72974', '编辑', '4640770d-b48a-4f33-bca5-2cac9d9b08f6', 'editRole', 'ext-icon-note_edit', '1', '2', '1', '修改角色基本信息及其更改该角色权限');
INSERT INTO `auth_authority` VALUES ('2093965d-6fd8-49aa-9a10-fa92142c6f01', '频道分组管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/channel/group.jsp', 'ext-icon-computer', '4', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('283b264e-34dd-4e5f-b217-a139c4357151', '编辑', 'a3963015-a8aa-48b5-834b-37b7f0ceb577', 'editMaterial', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('28c53a96-c43e-482b-8e4a-50d328b9097a', '删除', '94623313-a2bc-45ae-a49c-c45308ed2c85', 'deleteUser', 'ext-icon-note_delete', '2', '2', '1', '删除管理员用户');
INSERT INTO `auth_authority` VALUES ('2b008946-f236-4d89-8acb-ce77f9e0d93e', '编辑', '94623313-a2bc-45ae-a49c-c45308ed2c85', 'editUser', 'ext-icon-note_edit', '1', '2', '1', '修改用户基本信息及其用户对应的角色');
INSERT INTO `auth_authority` VALUES ('2d199084-b489-4b02-a7ee-8ee6f29387e9', '删除', '4640770d-b48a-4f33-bca5-2cac9d9b08f6', 'deleteRole', 'ext-icon-note_delete', '2', '2', '1', '删除角色及其该角色对应的权限');
INSERT INTO `auth_authority` VALUES ('2e6ddfda-38de-4b4c-9025-cb69cc494aeb', '添加', '3e6c8e1d-ee71-481c-b211-c9e80b0eaca3', 'addChannel', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('2fb38070-40c3-4e57-9412-5df43338276d', '编辑', '64ddcde7-36e7-4282-b022-2d850910c167', 'editAdvpackageExample', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('2ff46673-5f27-4564-a423-78df66e6fb77', '添加', 'a3963015-a8aa-48b5-834b-37b7f0ceb577', 'addMaterial', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('3210eee2-59a0-4eb2-a393-3dd2bdad4ad9', '冻结', '94623313-a2bc-45ae-a49c-c45308ed2c85', 'freezeUser', '', '3', '2', '1', '冻结管理员用户，使该账号不能登录');
INSERT INTO `auth_authority` VALUES ('32cead41-f415-40bb-9bfd-517371065503', '编辑', 'd439de84-4783-4b09-801e-d58184b6c037', 'editTimeSpan', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('3758cb2e-c82d-414c-90cf-87a51969a1b7', '编辑', '6f367519-24a3-4b76-8384-97d8e45c72ee', 'editAdvpackage', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('3ae94a43-1294-4e18-8eee-5c09f96c19d1', '添加', '64ddcde7-36e7-4282-b022-2d850910c167', 'addAdvpackageExample', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('3e6c8e1d-ee71-481c-b211-c9e80b0eaca3', '频道管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/channel/channel.jsp', 'ext-icon-computer', '3', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('3fcf81f5-3bac-4da4-af6a-42fd27c1be0f', '区域管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/region/region.jsp', 'ext-icon-computer', '2', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('44823c52-6548-4447-8fdc-6bd675b9d592', '审核管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/audit/audit.jsp', 'ext-icon-computer', '14', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('44c47766-e3b4-45d5-bfc8-c5e61a1a0952', '添加', '2093965d-6fd8-49aa-9a10-fa92142c6f01', 'addGroup', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('456ab8bf-ac30-472a-b837-f7955a06e08d', '添加', '6f367519-24a3-4b76-8384-97d8e45c72ee', 'addAdvpackage', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('4640770d-b48a-4f33-bca5-2cac9d9b08f6', '角色管理', 'e7c32519-88b7-4760-9a25-19e577a1706d', 'page/role.jsp', 'ext-icon-vcard', '2', '1', '1', '系统管理员的角色管理页');
INSERT INTO `auth_authority` VALUES ('47b64dba-e67e-42f2-856f-0c9163ee2350', '广告商管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/customer/customer.jsp', 'ext-icon-computer', '0', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('4992b772-1af4-415d-a5d3-845f71082339', '删除', '9c92e7f6-e1f6-4136-8eca-8e615a9cf186', 'deleteTimePackage', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('4cb6dfec-9d7e-4b6d-89d5-6d46e18a2cb6', '添加', '6b347dee-f73a-4a45-ada8-8f7ebbe0735d', 'addSchedule', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('4ea936dd-02a0-4db1-9e01-200079e16ad4', '广告行业管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/customer/trade.jsp', 'ext-icon-computer', '1', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('50de16ba-8903-49dc-af3e-6001eb17848b', '删除', '3e6c8e1d-ee71-481c-b211-c9e80b0eaca3', 'deleteChannel', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('5833273d-c453-4cce-9d9c-9deab17d4230', '删除', 'e740d8fa-2327-4d9c-98f0-0103ffd1e0fc', 'deleteStbInfo', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('5be180c4-be3b-445e-9a8b-ad48b55d0e4f', '删除', '44823c52-6548-4447-8fdc-6bd675b9d592', 'deleteSchedule', 'ext-icon-note_delete', '2', '2', '0', '');
INSERT INTO `auth_authority` VALUES ('5cd0c3e8-f747-442b-b842-b7f20a33922f', '编辑', '10c337fd-e682-41a0-85ec-52f9e842904e', 'editAuthority', 'ext-icon-note_edit', '1', '2', '1', '修改权限项内容');
INSERT INTO `auth_authority` VALUES ('5ffc0482-3a8c-45f9-bd3b-fd4423f38dde', '添加', 'd439de84-4783-4b09-801e-d58184b6c037', 'addTimeSpan', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('601fd5d5-c281-438c-9387-f904f2550ff7', '解冻', '94623313-a2bc-45ae-a49c-c45308ed2c85', 'cancelFreezeUser', '', '4', '2', '1', '解冻管理员，让该账号能够登录');
INSERT INTO `auth_authority` VALUES ('616ddfa3-4b3f-4b74-80a5-66a66810c4c5', '添加', 'e740d8fa-2327-4d9c-98f0-0103ffd1e0fc', 'addStbInfo', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('64ddcde7-36e7-4282-b022-2d850910c167', '广告实例管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/advpackage/advpackageExample.jsp', 'ext-icon-computer', '12', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('653dc422-09bd-4660-bf00-c664c56d3dee', '添加', '4ea936dd-02a0-4db1-9e01-200079e16ad4', 'addTrade', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('6620e99c-b733-40bd-8e63-6243264fa3d8', '添加', '4640770d-b48a-4f33-bca5-2cac9d9b08f6', 'addRole', 'ext-icon-note_add', '0', '2', '1', '添加角色及其分配该角色拥有的权限');
INSERT INTO `auth_authority` VALUES ('6ab71cab-cecc-4e61-be45-251c59c46f13', '编辑', 'd367b75b-67ba-44a1-8e8f-f8328cd37209', 'editAdvPosition', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('6b347dee-f73a-4a45-ada8-8f7ebbe0735d', '排期管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/schedule/schedule.jsp', 'ext-icon-computer', '13', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('6f367519-24a3-4b76-8384-97d8e45c72ee', '广告包分组管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/advpackage/advpackageGroup.jsp', 'ext-icon-computer', '11', '1', '1', '广告包管理');
INSERT INTO `auth_authority` VALUES ('711ea26e-54d2-4d72-a84d-8f6aa8410ac7', '添加', '3fcf81f5-3bac-4da4-af6a-42fd27c1be0f', 'addRegion', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('76ccd2b4-c101-4ed3-9294-27baeea7749a', '编辑', '47b64dba-e67e-42f2-856f-0c9163ee2350', 'editCustomer', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('7f7902bc-bb0f-41f6-adaa-3e327a99bd9a', '添加', '94623313-a2bc-45ae-a49c-c45308ed2c85', 'addUser', 'ext-icon-note_add', '0', '2', '1', '添加新的管理员用户及其对应的角色');
INSERT INTO `auth_authority` VALUES ('7fc014c6-c3fd-4eda-a417-cc45ee521c34', '添加', '44823c52-6548-4447-8fdc-6bd675b9d592', 'addSchedule', 'ext-icon-note_add', '0', '2', '0', '');
INSERT INTO `auth_authority` VALUES ('85386739-a34a-4c91-8c90-97e8a47f8aec', '编辑', '3fcf81f5-3bac-4da4-af6a-42fd27c1be0f', 'editRegion', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('85b80fec-2155-417e-bc16-66e7d6ff6c0e', '添加', '47b64dba-e67e-42f2-856f-0c9163ee2350', 'addCustomer', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('89bb2d3f-d9f3-46c3-a194-7b7f9380c76e', '删除', '6b347dee-f73a-4a45-ada8-8f7ebbe0735d', 'deleteSchedule', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('8d0089c5-e70e-41fb-aa85-76750278035c', '上移', '10c337fd-e682-41a0-85ec-52f9e842904e', 'upAuthority', 'ext-icon-up', '3', '2', '1', '权限项向上排序');
INSERT INTO `auth_authority` VALUES ('94623313-a2bc-45ae-a49c-c45308ed2c85', '用户管理', 'e7c32519-88b7-4760-9a25-19e577a1706d', 'page/user.jsp', 'ext-icon-user', '1', '1', '1', '管理员用户管理菜单页');
INSERT INTO `auth_authority` VALUES ('9c92e7f6-e1f6-4136-8eca-8e615a9cf186', '时间包管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/timepackage/timepackage.jsp', 'ext-icon-computer', '8', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('9e446412-98c5-4c23-9956-7b4798ca4eb0', '编辑', '6b347dee-f73a-4a45-ada8-8f7ebbe0735d', 'editSchedule', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('a3963015-a8aa-48b5-834b-37b7f0ceb577', '素材管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/material/material.jsp', 'ext-icon-computer', '7', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('a4903290-8014-468e-a830-50e3c89ff114', '下移', '10c337fd-e682-41a0-85ec-52f9e842904e', 'downAuthority', 'ext-icon-note_down', '4', '2', '1', '权限项下移动');
INSERT INTO `auth_authority` VALUES ('aac27826-9759-42fe-88fc-e457252d30ac', '添加', 'd367b75b-67ba-44a1-8e8f-f8328cd37209', 'addAdvPosition', 'ext-icon-note_add', '0', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('b6b60a9d-c237-409d-84d2-fe6e4588e326', '编辑', '3e6c8e1d-ee71-481c-b211-c9e80b0eaca3', 'editChannel', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('cbc6abf4-ef43-4f24-8ebb-9f2586ce8d2a', '删除', '6f367519-24a3-4b76-8384-97d8e45c72ee', 'deleteAdvpackage', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('cc7cf567-7172-4b2c-bb4f-0b76daf4b55d', '添加', '10c337fd-e682-41a0-85ec-52f9e842904e', 'addAuthority', 'ext-icon-note_add', '0', '2', '1', '添加权限项');
INSERT INTO `auth_authority` VALUES ('ce583e32-82bd-4a95-80d7-b608a6be8faa', '删除', 'd439de84-4783-4b09-801e-d58184b6c037', 'deleteTimeSpan', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('d0160ec4-c26d-42cc-884b-47a4ccd4bb9a', '删除', '2093965d-6fd8-49aa-9a10-fa92142c6f01', 'deleteGroup', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('d12ce34f-724b-4162-884e-4210646c45d5', '编辑', '2093965d-6fd8-49aa-9a10-fa92142c6f01', 'editGroup', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('d367b75b-67ba-44a1-8e8f-f8328cd37209', '广告位管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/position/position.jsp', 'ext-icon-computer', '6', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('d439de84-4783-4b09-801e-d58184b6c037', '时间段管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/timepackage/timespan.jsp', 'ext-icon-computer', '9', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('dc14de5d-3ea9-40dd-808c-a6561fcc5456', '编辑', '9c92e7f6-e1f6-4136-8eca-8e615a9cf186', 'editTimePackage', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('dcfa00ec-53e2-41e4-b9a0-9cc6cd41ae65', '编辑', '44823c52-6548-4447-8fdc-6bd675b9d592', 'editSchedule', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('e16c0e1a-415f-495c-8cb7-ffc9bfd0fd6f', '删除', 'd367b75b-67ba-44a1-8e8f-f8328cd37209', 'deleteAdvPosition', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '双向广告', '', '', 'ext-icon-computer', '8', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('e3608171-a110-4955-acc0-dd30fdb2e2a4', '删除', '10c337fd-e682-41a0-85ec-52f9e842904e', 'deleteAuthority', 'ext-icon-note_delete', '2', '2', '1', '删除权限项内容');
INSERT INTO `auth_authority` VALUES ('e48fe15b-351e-4de5-8208-eadf8e8acecc', '广告包素材绑定管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/exampleMaterial/examplematerial.jsp', 'ext-icon-computer', '10', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('e59e384b-7961-4ead-90b2-c24631838b8a', '编辑', 'e740d8fa-2327-4d9c-98f0-0103ffd1e0fc', 'editStbInfo', 'ext-icon-note_edit', '1', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('e740d8fa-2327-4d9c-98f0-0103ffd1e0fc', '用户管理', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2', '/page/stb/stbInfo.jsp', 'ext-icon-computer', '5', '1', '1', '');
INSERT INTO `auth_authority` VALUES ('e7c32519-88b7-4760-9a25-19e577a1706d', '系统管理', '', '', 'ext-icon-cog', '0', '1', '1', '一级节点  主要是配置系统的 用户 角色 权限 各项数据字典的菜单及其功能');
INSERT INTO `auth_authority` VALUES ('ed70a871-27de-4b90-9ab7-3884781e6250', '删除', '64ddcde7-36e7-4282-b022-2d850910c167', 'deleteAdvpackageExample', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('eff79a0a-f773-4636-be29-0db1c5293ecd', '删除', '47b64dba-e67e-42f2-856f-0c9163ee2350', 'deleteCustomer', 'ext-icon-note_delete', '2', '2', '1', '');
INSERT INTO `auth_authority` VALUES ('f3d7293b-252e-441c-941b-43d66fdaf43b', '删除', 'a3963015-a8aa-48b5-834b-37b7f0ceb577', 'deleteMaterial', 'ext-icon-note_delete', '2', '2', '1', '');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `role_id` varchar(45) NOT NULL,
  `role_name` varchar(45) DEFAULT '',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '测试角色', '2015-11-03 19:13:05', '测试角色');
INSERT INTO `auth_role` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '超级管理员', '2015-10-27 00:00:00', '超级管理员');

-- ----------------------------
-- Table structure for auth_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_authority`;
CREATE TABLE `auth_role_authority` (
  `role_id` varchar(45) NOT NULL,
  `authority_id` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`,`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_authority
-- ----------------------------
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '10c337fd-e682-41a0-85ec-52f9e842904e');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '19d045d2-ae26-4bbc-8bf4-e48427f72974');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '2093965d-6fd8-49aa-9a10-fa92142c6f01');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '28c53a96-c43e-482b-8e4a-50d328b9097a');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '2b008946-f236-4d89-8acb-ce77f9e0d93e');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '2d199084-b489-4b02-a7ee-8ee6f29387e9');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '3210eee2-59a0-4eb2-a393-3dd2bdad4ad9');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '32cead41-f415-40bb-9bfd-517371065503');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '44c47766-e3b4-45d5-bfc8-c5e61a1a0952');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '4640770d-b48a-4f33-bca5-2cac9d9b08f6');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '47b64dba-e67e-42f2-856f-0c9163ee2350');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '5cd0c3e8-f747-442b-b842-b7f20a33922f');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '5ffc0482-3a8c-45f9-bd3b-fd4423f38dde');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '601fd5d5-c281-438c-9387-f904f2550ff7');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '6620e99c-b733-40bd-8e63-6243264fa3d8');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '6ab71cab-cecc-4e61-be45-251c59c46f13');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '76ccd2b4-c101-4ed3-9294-27baeea7749a');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '7f7902bc-bb0f-41f6-adaa-3e327a99bd9a');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '85b80fec-2155-417e-bc16-66e7d6ff6c0e');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '8d0089c5-e70e-41fb-aa85-76750278035c');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', '94623313-a2bc-45ae-a49c-c45308ed2c85');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'a4903290-8014-468e-a830-50e3c89ff114');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'aac27826-9759-42fe-88fc-e457252d30ac');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'cc7cf567-7172-4b2c-bb4f-0b76daf4b55d');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'ce583e32-82bd-4a95-80d7-b608a6be8faa');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'd0160ec4-c26d-42cc-884b-47a4ccd4bb9a');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'd12ce34f-724b-4162-884e-4210646c45d5');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'd367b75b-67ba-44a1-8e8f-f8328cd37209');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'd439de84-4783-4b09-801e-d58184b6c037');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'e16c0e1a-415f-495c-8cb7-ffc9bfd0fd6f');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'e3608171-a110-4955-acc0-dd30fdb2e2a4');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'e7c32519-88b7-4760-9a25-19e577a1706d');
INSERT INTO `auth_role_authority` VALUES ('41e24540-bf45-4901-a1c1-adaeb52a781a', 'eff79a0a-f773-4636-be29-0db1c5293ecd');
INSERT INTO `auth_role_authority` VALUES ('a4a5a124-0d74-4c96-a0fd-136600001dce', '2ab503ce-4c84-4850-a0d8-081c65a43aca');
INSERT INTO `auth_role_authority` VALUES ('add2ed1a-68ad-40bd-a010-dfc54e091e9d', '20fb6215-6034-4958-95ee-d69970c4f233');
INSERT INTO `auth_role_authority` VALUES ('add2ed1a-68ad-40bd-a010-dfc54e091e9d', '2ab503ce-4c84-4850-a0d8-081c65a43aca');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '04c1ac9c-f476-4efd-9378-0134da49e042');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '066ec9bc-1592-4849-94d0-262e29f0462f');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '10c337fd-e682-41a0-85ec-52f9e842904e');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '120e2786-c6f5-43f2-bbf7-27d12b76ee69');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '13e4c879-b015-4540-98f1-1ef658b44277');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '19d045d2-ae26-4bbc-8bf4-e48427f72974');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '2093965d-6fd8-49aa-9a10-fa92142c6f01');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '283b264e-34dd-4e5f-b217-a139c4357151');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '28c53a96-c43e-482b-8e4a-50d328b9097a');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '2b008946-f236-4d89-8acb-ce77f9e0d93e');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '2d199084-b489-4b02-a7ee-8ee6f29387e9');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '2e6ddfda-38de-4b4c-9025-cb69cc494aeb');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '2fb38070-40c3-4e57-9412-5df43338276d');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '2ff46673-5f27-4564-a423-78df66e6fb77');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '3210eee2-59a0-4eb2-a393-3dd2bdad4ad9');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '32cead41-f415-40bb-9bfd-517371065503');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '3758cb2e-c82d-414c-90cf-87a51969a1b7');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '3ae94a43-1294-4e18-8eee-5c09f96c19d1');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '3e6c8e1d-ee71-481c-b211-c9e80b0eaca3');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '3fcf81f5-3bac-4da4-af6a-42fd27c1be0f');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '44823c52-6548-4447-8fdc-6bd675b9d592');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '44c47766-e3b4-45d5-bfc8-c5e61a1a0952');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '456ab8bf-ac30-472a-b837-f7955a06e08d');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '4640770d-b48a-4f33-bca5-2cac9d9b08f6');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '47b64dba-e67e-42f2-856f-0c9163ee2350');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '4992b772-1af4-415d-a5d3-845f71082339');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '4cb6dfec-9d7e-4b6d-89d5-6d46e18a2cb6');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '4ea936dd-02a0-4db1-9e01-200079e16ad4');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '50de16ba-8903-49dc-af3e-6001eb17848b');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '5833273d-c453-4cce-9d9c-9deab17d4230');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '5cd0c3e8-f747-442b-b842-b7f20a33922f');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '5ffc0482-3a8c-45f9-bd3b-fd4423f38dde');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '601fd5d5-c281-438c-9387-f904f2550ff7');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '616ddfa3-4b3f-4b74-80a5-66a66810c4c5');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '64ddcde7-36e7-4282-b022-2d850910c167');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '653dc422-09bd-4660-bf00-c664c56d3dee');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '6620e99c-b733-40bd-8e63-6243264fa3d8');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '6ab71cab-cecc-4e61-be45-251c59c46f13');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '6b347dee-f73a-4a45-ada8-8f7ebbe0735d');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '6f367519-24a3-4b76-8384-97d8e45c72ee');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '711ea26e-54d2-4d72-a84d-8f6aa8410ac7');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '76ccd2b4-c101-4ed3-9294-27baeea7749a');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '7f7902bc-bb0f-41f6-adaa-3e327a99bd9a');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '85386739-a34a-4c91-8c90-97e8a47f8aec');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '85b80fec-2155-417e-bc16-66e7d6ff6c0e');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '89bb2d3f-d9f3-46c3-a194-7b7f9380c76e');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '8d0089c5-e70e-41fb-aa85-76750278035c');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '94623313-a2bc-45ae-a49c-c45308ed2c85');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '9c92e7f6-e1f6-4136-8eca-8e615a9cf186');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', '9e446412-98c5-4c23-9956-7b4798ca4eb0');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'a3963015-a8aa-48b5-834b-37b7f0ceb577');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'a4903290-8014-468e-a830-50e3c89ff114');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'aac27826-9759-42fe-88fc-e457252d30ac');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'b6b60a9d-c237-409d-84d2-fe6e4588e326');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'cbc6abf4-ef43-4f24-8ebb-9f2586ce8d2a');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'cc7cf567-7172-4b2c-bb4f-0b76daf4b55d');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'ce583e32-82bd-4a95-80d7-b608a6be8faa');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'd0160ec4-c26d-42cc-884b-47a4ccd4bb9a');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'd12ce34f-724b-4162-884e-4210646c45d5');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'd367b75b-67ba-44a1-8e8f-f8328cd37209');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'd439de84-4783-4b09-801e-d58184b6c037');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'dc14de5d-3ea9-40dd-808c-a6561fcc5456');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'dcfa00ec-53e2-41e4-b9a0-9cc6cd41ae65');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e16c0e1a-415f-495c-8cb7-ffc9bfd0fd6f');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e33a126d-3182-4c69-a63d-c3ea9ebd1ca2');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e3608171-a110-4955-acc0-dd30fdb2e2a4');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e48fe15b-351e-4de5-8208-eadf8e8acecc');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e59e384b-7961-4ead-90b2-c24631838b8a');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e740d8fa-2327-4d9c-98f0-0103ffd1e0fc');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'e7c32519-88b7-4760-9a25-19e577a1706d');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'ed70a871-27de-4b90-9ab7-3884781e6250');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'eff79a0a-f773-4636-be29-0db1c5293ecd');
INSERT INTO `auth_role_authority` VALUES ('b6d7ae00-661c-4695-af4c-f3ba01cd783a', 'f3d7293b-252e-441c-941b-43d66fdaf43b');
INSERT INTO `auth_role_authority` VALUES ('fba7f79c-0d49-45ba-8d45-3b3c36fb5b0a', '20fb6215-6034-4958-95ee-d69970c4f233');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `user_id` varchar(36) NOT NULL COMMENT '用户注册时填写的名称，由字母数字下划线组成。',
  `real_name` varchar(45) DEFAULT '' COMMENT '用户的姓名',
  `password` varchar(100) DEFAULT '',
  `enable` int(11) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('admin', 'admin', '42857cfddb33f3fddb27fff9773683f3', '1', '2015-10-27 00:00:00', '');
INSERT INTO `auth_user` VALUES ('as', 'as', 'as', '1', '2015-11-05 18:44:36', '');
INSERT INTO `auth_user` VALUES ('cr', '丛锐1', '42857cfddb33f3fddb27fff9773683f3', '1', '2015-11-06 13:34:40', '默认密码为123456a?');
INSERT INTO `auth_user` VALUES ('lipeipei', '李培培', '42857cfddb33f3fddb27fff9773683f3', '1', '2015-11-06 09:05:03', '默认密码');
INSERT INTO `auth_user` VALUES ('ruiming', '芮明', '42857cfddb33f3fddb27fff9773683f3', '1', '2015-11-05 18:44:36', '默认密码为123456a?');
INSERT INTO `auth_user` VALUES ('wq', 'wq', 'wq', '1', '2015-11-05 18:44:36', '');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role` (
  `user_id` varchar(45) NOT NULL,
  `role_id` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES ('admin', 'b6d7ae00-661c-4695-af4c-f3ba01cd783a');
INSERT INTO `auth_user_role` VALUES ('cr', 'b6d7ae00-661c-4695-af4c-f3ba01cd783a');
INSERT INTO `auth_user_role` VALUES ('lipeipei', 'b6d7ae00-661c-4695-af4c-f3ba01cd783a');
INSERT INTO `auth_user_role` VALUES ('ruiming', 'b6d7ae00-661c-4695-af4c-f3ba01cd783a');
