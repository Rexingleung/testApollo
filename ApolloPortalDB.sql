/*
 Navicat Premium Data Transfer

 Source Server         : MySQL57
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : apolloportaldb

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/12/2019 14:02:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES (1, 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `app` VALUES (2, 'test2', 'apollo-server2', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');

-- ----------------------------
-- Table structure for appnamespace
-- ----------------------------
DROP TABLE IF EXISTS `appnamespace`;
CREATE TABLE `appnamespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appnamespace
-- ----------------------------
INSERT INTO `appnamespace` VALUES (1, 'application', 'SampleApp', 'properties', b'0', 'default app namespace', b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `appnamespace` VALUES (2, 'application', 'test2', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES (1, 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放API消费者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumeraudit
-- ----------------------------
DROP TABLE IF EXISTS `consumeraudit`;
CREATE TABLE `consumeraudit`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumerrole
-- ----------------------------
DROP TABLE IF EXISTS `consumerrole`;
CREATE TABLE `consumerrole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consumertoken
-- ----------------------------
DROP TABLE IF EXISTS `consumertoken`;
CREATE TABLE `consumertoken`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'permission表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'CreateCluster', 'SampleApp', b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `permission` VALUES (2, 'CreateNamespace', 'SampleApp', b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `permission` VALUES (3, 'AssignRole', 'SampleApp', b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `permission` VALUES (4, 'ModifyNamespace', 'SampleApp+application', b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `permission` VALUES (5, 'ReleaseNamespace', 'SampleApp+application', b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `permission` VALUES (6, 'CreateApplication', 'SystemRole', b'0', 'apollo', '2019-12-18 12:00:15', 'apollo', '2019-12-18 12:00:15');
INSERT INTO `permission` VALUES (7, 'CreateNamespace', 'test2', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (8, 'AssignRole', 'test2', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (9, 'CreateCluster', 'test2', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (10, 'ManageAppMaster', 'test2', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (11, 'ModifyNamespace', 'test2+application', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (12, 'ReleaseNamespace', 'test2+application', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (13, 'ModifyNamespace', 'test2+application+DEV', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `permission` VALUES (14, 'ReleaseNamespace', 'test2+application+DEV', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Master+SampleApp', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `role` VALUES (2, 'ModifyNamespace+SampleApp+application', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `role` VALUES (3, 'ReleaseNamespace+SampleApp+application', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `role` VALUES (4, 'CreateApplication+SystemRole', b'0', 'apollo', '2019-12-18 12:00:15', 'apollo', '2019-12-18 12:00:15');
INSERT INTO `role` VALUES (5, 'Master+test2', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `role` VALUES (6, 'ManageAppMaster+test2', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `role` VALUES (7, 'ModifyNamespace+test2+application', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `role` VALUES (8, 'ReleaseNamespace+test2+application', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `role` VALUES (9, 'ModifyNamespace+test2+application+DEV', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `role` VALUES (10, 'ReleaseNamespace+test2+application+DEV', b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (1, 1, 1, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `rolepermission` VALUES (2, 1, 2, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `rolepermission` VALUES (3, 1, 3, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `rolepermission` VALUES (4, 2, 4, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `rolepermission` VALUES (5, 3, 5, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `rolepermission` VALUES (6, 4, 6, b'0', 'apollo', '2019-12-18 12:00:15', 'apollo', '2019-12-18 12:00:15');
INSERT INTO `rolepermission` VALUES (7, 5, 7, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (8, 5, 8, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (9, 5, 9, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (10, 6, 10, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (11, 7, 11, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (12, 8, 12, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (13, 9, 13, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `rolepermission` VALUES (14, 10, 14, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `serverconfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `serverconfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `serverconfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `serverconfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `serverconfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `serverconfig` VALUES (7, 'configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) UNSIGNED DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 'apollo', 1, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `userrole` VALUES (2, 'apollo', 2, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `userrole` VALUES (3, 'apollo', 3, b'0', '', '2019-12-18 11:56:19', '', '2019-12-18 11:56:19');
INSERT INTO `userrole` VALUES (4, 'apollo', 5, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `userrole` VALUES (5, 'apollo', 7, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');
INSERT INTO `userrole` VALUES (6, 'apollo', 8, b'0', 'apollo', '2019-12-25 13:57:20', 'apollo', '2019-12-25 13:57:20');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
