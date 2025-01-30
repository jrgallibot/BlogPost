/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : blogpost

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 30/01/2025 21:37:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add Token', 6, 'add_token');
INSERT INTO `auth_permission` VALUES (22, 'Can change Token', 6, 'change_token');
INSERT INTO `auth_permission` VALUES (23, 'Can delete Token', 6, 'delete_token');
INSERT INTO `auth_permission` VALUES (24, 'Can view Token', 6, 'view_token');
INSERT INTO `auth_permission` VALUES (25, 'Can add Token', 7, 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES (26, 'Can change Token', 7, 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Token', 7, 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES (28, 'Can view Token', 7, 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES (29, 'Can add auth user', 8, 'add_authuser');
INSERT INTO `auth_permission` VALUES (30, 'Can change auth user', 8, 'change_authuser');
INSERT INTO `auth_permission` VALUES (31, 'Can delete auth user', 8, 'delete_authuser');
INSERT INTO `auth_permission` VALUES (32, 'Can view auth user', 8, 'view_authuser');
INSERT INTO `auth_permission` VALUES (33, 'Can add blog post', 9, 'add_blogpost');
INSERT INTO `auth_permission` VALUES (34, 'Can change blog post', 9, 'change_blogpost');
INSERT INTO `auth_permission` VALUES (35, 'Can delete blog post', 9, 'delete_blogpost');
INSERT INTO `auth_permission` VALUES (36, 'Can view blog post', 9, 'view_blogpost');
INSERT INTO `auth_permission` VALUES (37, 'Can add comment post', 10, 'add_commentpost');
INSERT INTO `auth_permission` VALUES (38, 'Can change comment post', 10, 'change_commentpost');
INSERT INTO `auth_permission` VALUES (39, 'Can delete comment post', 10, 'delete_commentpost');
INSERT INTO `auth_permission` VALUES (40, 'Can view comment post', 10, 'view_commentpost');

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token`  (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------

-- ----------------------------
-- Table structure for blog_blogpost
-- ----------------------------
DROP TABLE IF EXISTS `blog_blogpost`;
CREATE TABLE `blog_blogpost`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `published_date` datetime(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_blogpost_author_id_ffcc150f_fk_auth_user_id`(`author_id`) USING BTREE,
  CONSTRAINT `blog_blogpost_author_id_ffcc150f_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `custom_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_blogpost
-- ----------------------------
INSERT INTO `blog_blogpost` VALUES (1, 'The Future of Artificial Intelligence: What Lies Ahead?', 'Artificial Intelligence (AI) has rapidly evolved from a science fiction concept to a tangible technology that influences multiple industries. As we look ahead, AI promises to revolutionize sectors like healthcare, finance, and transportation. The integration of machine learning and deep learning algorithms will enable systems to predict outcomes more accurately and automate tasks previously done by humans. However, with this progress comes the need for ethical considerations, ensuring that AI is developed and used responsibly. In this post, we explore the future applications of AI, its impact on the job market, and the importance of data security and privacy in an AI-driven world.', '2025-01-30 13:35:55.645205', 1, 1);
INSERT INTO `blog_blogpost` VALUES (2, 'The Rise of Cloud Computing: Why Your Business Should Adopt It', 'Cloud computing has become a game-changer for businesses, providing flexible, scalable, and cost-effective solutions for managing IT resources. By moving to the cloud, organizations can store vast amounts of data, access computing power on demand, and reduce the burden of maintaining on-premise hardware. Whether it\'s adopting Software-as-a-Service (SaaS) for application management or Infrastructure-as-a-Service (IaaS) for hosting systems, cloud platforms offer numerous benefits. In this post, we will examine the types of cloud computing models, discuss the security measures involved, and highlight real-world examples of businesses successfully leveraging the cloud.', '2025-01-30 13:36:26.871491', 1, 1);
INSERT INTO `blog_blogpost` VALUES (3, 'The Evolution of Cybersecurity: Safeguarding the Digital Age', 'In today’s interconnected world, cybersecurity has become more critical than ever. With the rise of cyberattacks and data breaches, businesses and individuals need robust security measures to protect sensitive information. Cybersecurity has evolved from basic firewalls and antivirus software to sophisticated techniques like multi-factor authentication, encryption, and artificial intelligence-based threat detection. This post delves into the key trends shaping the future of cybersecurity, including the importance of a proactive security posture, the role of threat intelligence, and how organizations can implement the latest security protocols to stay ahead of evolving cyber threats.', '2025-01-30 13:36:50.358808', 1, 1);

-- ----------------------------
-- Table structure for blog_commentpost
-- ----------------------------
DROP TABLE IF EXISTS `blog_commentpost`;
CREATE TABLE `blog_commentpost`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `commentby_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_commentpost_commentby_id_4698443a_fk_auth_user_id`(`commentby_id`) USING BTREE,
  INDEX `blog_commentpost_post_id_d30eae77_fk_blog_blogpost_id`(`post_id`) USING BTREE,
  CONSTRAINT `blog_commentpost_commentby_id_4698443a_fk_auth_user_id` FOREIGN KEY (`commentby_id`) REFERENCES `custom_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_commentpost_post_id_d30eae77_fk_blog_blogpost_id` FOREIGN KEY (`post_id`) REFERENCES `blog_blogpost` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_commentpost
-- ----------------------------
INSERT INTO `blog_commentpost` VALUES (1, 'Sample comment!', '2025-01-30 13:36:05.877559', 1, 1);

-- ----------------------------
-- Table structure for custom_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `custom_auth_user`;
CREATE TABLE `custom_auth_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `middle_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_auth_user
-- ----------------------------
INSERT INTO `custom_auth_user` VALUES (1, 'pbkdf2_sha256$600000$6nqUhddkuEmOiNi4MVg8OL$wmrV6CYozfVdO2wdm5dll5ewo8Sij3SUU0MKQa5M0Eg=', '2025-01-30 13:34:38.915558', 1, 'ffgallibot', 'Florussel', 'Gallibot', 'jrgallibot@gmail.com', 1, 1, '2025-01-30 13:32:56.411402', 'Flores');

-- ----------------------------
-- Table structure for custom_auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `custom_auth_user_groups`;
CREATE TABLE `custom_auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `authuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_authuser_id_group_id_278efaa6_uniq`(`authuser_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_authuser_id_69a5b5ad_fk_auth_user_id` FOREIGN KEY (`authuser_id`) REFERENCES `custom_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for custom_auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `custom_auth_user_user_permissions`;
CREATE TABLE `custom_auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `authuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissio_authuser_id_permission_i_48ca0c27_uniq`(`authuser_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_authuser_id_994b4939_fk_auth_user_id` FOREIGN KEY (`authuser_id`) REFERENCES `custom_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (6, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (7, 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES (8, 'blog', 'authuser');
INSERT INTO `django_content_type` VALUES (9, 'blog', 'blogpost');
INSERT INTO `django_content_type` VALUES (10, 'blog', 'commentpost');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-01-30 12:42:55.286218');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-01-30 12:42:55.322150');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2025-01-30 12:42:55.473290');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-01-30 12:42:55.503367');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-01-30 12:42:55.510356');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-01-30 12:42:55.517351');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-01-30 12:42:55.525351');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-01-30 12:42:55.528351');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-01-30 12:42:55.537353');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-01-30 12:42:55.544348');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-01-30 12:42:55.551349');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-01-30 12:42:55.566548');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-01-30 12:42:55.573543');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-01-30 12:42:55.579543');
INSERT INTO `django_migrations` VALUES (15, 'blog', '0001_initial', '2025-01-30 12:42:55.851054');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2025-01-30 12:42:55.942781');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2025-01-30 12:42:55.954779');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-30 12:42:55.967548');
INSERT INTO `django_migrations` VALUES (19, 'authtoken', '0001_initial', '2025-01-30 12:42:56.035309');
INSERT INTO `django_migrations` VALUES (20, 'authtoken', '0002_auto_20160226_1747', '2025-01-30 12:42:56.074305');
INSERT INTO `django_migrations` VALUES (21, 'authtoken', '0003_tokenproxy', '2025-01-30 12:42:56.081307');
INSERT INTO `django_migrations` VALUES (22, 'authtoken', '0004_alter_tokenproxy_options', '2025-01-30 12:42:56.091306');
INSERT INTO `django_migrations` VALUES (23, 'sessions', '0001_initial', '2025-01-30 12:42:56.123113');
INSERT INTO `django_migrations` VALUES (24, 'blog', '0002_alter_authuser_table', '2025-01-30 12:43:49.322189');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('jeesl7z51zqofxeuobu8u5hk4jtunhrk', '.eJxVjkEOwiAQRe_C2jSdQgu6dOHOM5ABhhbFkhRYGe8uTbrQ1ST__f8yb6axlkXXTJsOjl0YsNNvZtA-ad2Be-A6p86mtWzBdHulO2ju7slRvB7dP8GCeWlrktwpdFxyAERFXlgJk8CejxLkaPyZQDngoh-JDClj7DSAFYKcFYPyTVr3_6Ddpl3xRc3q_YwxBpNK4z5sueiD3GLaas4U2ecLejJLhQ:1tdUgo:ZuFbP_bB1etMKmdp_NLyNyxWwRDi2HWXvosCJjmt4Fg', '2025-02-13 13:34:38.918559');

SET FOREIGN_KEY_CHECKS = 1;
