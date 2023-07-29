-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 29, 2023 lúc 08:26 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db.shop_management`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$1KmRq3YxY79Vjw5g1c59O3$un4F2vIwecr521r2h6dOiuMx4O0iwExsXlMVKTbUmQM=', '2023-07-29 05:36:29.161039', 1, 'ngodatq26', '', '', 'ngodatq26@gmail.com', 1, 1, '2023-07-22 15:56:02.595801');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-07-22 16:02:16.838976', '1', 'Category object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-07-22 16:02:23.424821', '1', 'Category object (1)', 3, '', 7, 1),
(3, '2023-07-22 16:02:27.400950', '2', 'Category object (2)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-07-22 16:02:50.939096', '3', 'Category object (3)', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-07-22 16:57:34.971647', '3', 'Category object (3)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(6, '2023-07-22 16:57:38.485062', '3', 'Category object (3)', 2, '[]', 7, 1),
(7, '2023-07-22 21:20:26.770328', '1', 'Product object (1)', 1, '[{\"added\": {}}]', 8, 1),
(8, '2023-07-23 12:47:19.162157', '2', 'Product object (2)', 1, '[{\"added\": {}}]', 8, 1),
(9, '2023-07-23 18:46:56.862154', '3', 'Product object (3)', 1, '[{\"added\": {}}]', 8, 1),
(10, '2023-07-23 21:09:03.033863', '1', 'shirt', 1, '[{\"added\": {}}]', 7, 1),
(11, '2023-07-23 21:09:20.652447', '2', 'trousers', 1, '[{\"added\": {}}]', 7, 1),
(12, '2023-07-23 21:09:35.035370', '3', 'underwear', 1, '[{\"added\": {}}]', 7, 1),
(13, '2023-07-23 21:10:30.245838', '1', 'Product object (1)', 1, '[{\"added\": {}}]', 8, 1),
(14, '2023-07-23 21:11:36.535798', '2', 'Product object (2)', 1, '[{\"added\": {}}]', 8, 1),
(15, '2023-07-23 21:26:58.469100', '2', 'Product object (2)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(16, '2023-07-23 21:27:04.659305', '1', 'Product object (1)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(17, '2023-07-26 07:13:33.294315', '10', 'Product object (10)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(18, '2023-07-26 07:28:02.701688', '3', 'underwear', 2, '[]', 7, 1),
(19, '2023-07-26 07:28:10.311312', '1', 'shirt', 2, '[{\"changed\": {\"fields\": [\"Parent category\"]}}]', 7, 1),
(20, '2023-07-26 07:30:08.726492', '4', '日本語', 1, '[{\"added\": {}}]', 7, 1),
(21, '2023-07-26 07:30:31.617052', '5', 'dress', 1, '[{\"added\": {}}]', 7, 1),
(22, '2023-07-26 07:30:41.922478', '6', 'shoe', 1, '[{\"added\": {}}]', 7, 1),
(23, '2023-07-26 08:56:40.282773', '11', 'Product object (11)', 2, '[{\"changed\": {\"fields\": [\"Quantity\"]}}]', 8, 1),
(24, '2023-07-26 09:39:02.593820', '6', 'shoe', 2, '[{\"changed\": {\"fields\": [\"Parent category\"]}}]', 7, 1),
(25, '2023-07-26 09:39:13.402494', '6', 'shoe', 2, '[{\"changed\": {\"fields\": [\"Parent category\"]}}]', 7, 1),
(26, '2023-07-27 07:35:17.005533', '7', 'top', 1, '[{\"added\": {}}]', 7, 1),
(27, '2023-07-27 07:46:26.378471', '12', 'Product object (12)', 1, '[{\"added\": {}}]', 8, 1),
(28, '2023-07-27 15:09:15.373921', '13', 'Product object (13)', 1, '[{\"added\": {}}]', 8, 1),
(29, '2023-07-27 15:12:40.148953', '13', 'Product object (13)', 3, '', 8, 1),
(30, '2023-07-27 15:12:40.152287', '12', 'Product object (12)', 3, '', 8, 1),
(31, '2023-07-27 15:12:40.155449', '11', 'Product object (11)', 3, '', 8, 1),
(32, '2023-07-27 15:12:40.157971', '10', 'Product object (10)', 3, '', 8, 1),
(33, '2023-07-27 15:12:40.165502', '9', 'Product object (9)', 3, '', 8, 1),
(34, '2023-07-27 15:12:47.977338', '8', 'Product object (8)', 3, '', 8, 1),
(35, '2023-07-27 15:12:47.980656', '7', 'Product object (7)', 3, '', 8, 1),
(36, '2023-07-27 15:12:47.983755', '6', 'Product object (6)', 3, '', 8, 1),
(37, '2023-07-27 15:12:47.986197', '5', 'Product object (5)', 3, '', 8, 1),
(38, '2023-07-27 15:12:47.989208', '4', 'Product object (4)', 3, '', 8, 1),
(39, '2023-07-27 15:12:52.823764', '3', 'Product object (3)', 3, '', 8, 1),
(40, '2023-07-27 15:12:52.827447', '2', 'Product object (2)', 3, '', 8, 1),
(41, '2023-07-27 15:12:52.830666', '1', 'Product object (1)', 3, '', 8, 1),
(42, '2023-07-27 15:13:23.777236', '14', 'Product object (14)', 1, '[{\"added\": {}}]', 8, 1),
(43, '2023-07-27 15:13:53.418745', '15', 'Product object (15)', 1, '[{\"added\": {}}]', 8, 1),
(44, '2023-07-27 15:13:55.423964', '15', 'Product object (15)', 2, '[]', 8, 1),
(45, '2023-07-27 15:13:56.145012', '15', 'Product object (15)', 2, '[]', 8, 1),
(46, '2023-07-27 15:13:56.608983', '15', 'Product object (15)', 2, '[]', 8, 1),
(47, '2023-07-27 15:13:57.244163', '15', 'Product object (15)', 2, '[]', 8, 1),
(48, '2023-07-27 15:13:57.662680', '15', 'Product object (15)', 2, '[]', 8, 1),
(49, '2023-07-27 15:13:58.005622', '15', 'Product object (15)', 2, '[]', 8, 1),
(50, '2023-07-27 15:13:58.335791', '15', 'Product object (15)', 2, '[]', 8, 1),
(51, '2023-07-27 15:13:58.709154', '15', 'Product object (15)', 2, '[]', 8, 1),
(52, '2023-07-27 15:13:59.076657', '15', 'Product object (15)', 2, '[]', 8, 1),
(53, '2023-07-27 15:13:59.618954', '15', 'Product object (15)', 2, '[]', 8, 1),
(54, '2023-07-27 15:14:00.171845', '15', 'Product object (15)', 2, '[]', 8, 1),
(55, '2023-07-27 15:14:00.744279', '15', 'Product object (15)', 2, '[]', 8, 1),
(56, '2023-07-27 15:14:01.087470', '15', 'Product object (15)', 2, '[]', 8, 1),
(57, '2023-07-27 15:14:01.507656', '15', 'Product object (15)', 2, '[]', 8, 1),
(58, '2023-07-27 15:14:02.364224', '15', 'Product object (15)', 2, '[]', 8, 1),
(59, '2023-07-27 15:20:40.929217', '16', 'Product object (16)', 1, '[{\"added\": {}}]', 8, 1),
(60, '2023-07-27 15:21:51.645425', '17', 'Product object (17)', 1, '[{\"added\": {}}]', 8, 1),
(61, '2023-07-27 15:23:08.558510', '18', 'Product object (18)', 1, '[{\"added\": {}}]', 8, 1),
(62, '2023-07-27 15:32:15.352641', '18', 'Product object (18)', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 8, 1),
(63, '2023-07-27 15:32:48.254903', '18', 'Product object (18)', 3, '', 8, 1),
(64, '2023-07-27 15:32:48.259259', '17', 'Product object (17)', 3, '', 8, 1),
(65, '2023-07-27 15:32:48.264930', '16', 'Product object (16)', 3, '', 8, 1),
(66, '2023-07-27 15:32:48.268287', '15', 'Product object (15)', 3, '', 8, 1),
(67, '2023-07-27 15:32:48.273271', '14', 'Product object (14)', 3, '', 8, 1),
(68, '2023-07-27 15:35:02.759910', '19', 'Product object (19)', 1, '[{\"added\": {}}]', 8, 1),
(69, '2023-07-27 15:35:30.148756', '20', 'Product object (20)', 1, '[{\"added\": {}}]', 8, 1),
(70, '2023-07-27 15:54:59.354771', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(71, '2023-07-27 15:55:09.509900', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(72, '2023-07-27 19:01:02.829335', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(73, '2023-07-27 19:01:11.187737', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(74, '2023-07-28 09:53:14.884160', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(75, '2023-07-28 09:53:30.370895', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(76, '2023-07-28 19:11:03.594933', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 8, 1),
(77, '2023-07-28 19:23:26.718989', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 1),
(78, '2023-07-28 19:28:26.754024', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'shop', 'category'),
(8, 'shop', 'product');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-22 15:55:05.286752'),
(2, 'auth', '0001_initial', '2023-07-22 15:55:06.265902'),
(3, 'admin', '0001_initial', '2023-07-22 15:55:06.452030'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-22 15:55:06.462156'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-22 15:55:06.475741'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-22 15:55:06.571239'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-22 15:55:06.645291'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-22 15:55:06.678462'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-22 15:55:06.693796'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-22 15:55:06.758928'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-22 15:55:06.764450'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-22 15:55:06.775034'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-22 15:55:06.804802'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-22 15:55:06.832349'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-22 15:55:06.863096'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-22 15:55:06.876720'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-22 15:55:06.906507'),
(18, 'sessions', '0001_initial', '2023-07-22 15:55:06.968264'),
(19, 'shop', '0001_initial', '2023-07-22 15:55:07.182170'),
(20, 'shop', '0002_alter_category_parent_category', '2023-07-22 15:59:08.582851'),
(21, 'shop', '0003_alter_category_parent_category', '2023-07-22 16:02:07.249347'),
(22, 'shop', '0002_remove_product_category_delete_category_and_more', '2023-07-23 19:34:22.049103'),
(23, 'shop', '0003_initial', '2023-07-23 21:01:50.322711');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('05kvmja13o27rkjsz8u8jtgi3kg6ciep', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPHjq:QpI1H5xrRAQ9k2bKjqcqp2kON5OvgQaUcWNzT0yaQMg', '2023-08-11 07:18:14.218869'),
('5z6yig85nlln89qgnbv91t1am3xr5p88', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPI2h:To19c442g37tW2BUbhJI56PNDkNISrFu8NZMJt9VRV8', '2023-08-11 07:37:43.343875'),
('741v1dnaweybbk11qb8uwyyy415nhme6', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qOVMP:9OmhnMzLrUOsjP4eeNnqHUFdbTeu4Be0P5fOiqJ44sY', '2023-08-09 03:38:49.227711'),
('8uijdjel8bbc0j7xjmskqvcb6wri1jhg', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPSlf:NORSG4LEwvuXWAvlJQ_GEWi28gpjnppuSCbx6hzorYg', '2023-08-11 19:04:51.107437'),
('cq17dai1gvamj0orqxsggcz6pmgfphz1', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qOJPw:TWPO5aK3-CcT5tJ7CXonZYolI53oexHYeMei1awLJNc', '2023-08-08 14:53:40.992107'),
('euec830ig1op3rxgdccfpg75prv27yvw', '.eJxVjDEOwjAMRe-SGUUlTtKYkZ0zVHbskgJqpaadEHdHkTrA-t97_20G2rcy7FXXYRJzMWdz-t2Y8lPnBuRB832xeZm3dWLbFHvQam-L6Ot6uH8HhWppde_BO98Riu_YMaM69Cwx0wgYVTgmVQg8QgoBHPuAGIEREoVekvl8AeREN7o:1qNFm0:Tx4a4fEQKvmnacLX9JkNDwH1pImt4dBif0rRPCpoz5U', '2023-08-05 16:48:04.449793'),
('g0589wfu916hn0hrs8tmqc7icqs4deoq', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPI1c:BhHcYaFP_ZEaNtaqZbZP6YGo8yk-4i57r6KlWL54EXI', '2023-08-11 07:36:36.766540'),
('sc7k7khw184q12ryxi1ptgmmcrdowzb5', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qNwja:fTEfWsbJ9VsdkZC-F_Ix9kXKlliPig5zOUijrHJIpB8', '2023-08-07 14:40:26.125543'),
('svk8jk0pxjbhzbouggtugppmhvjsp0xc', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPHp2:m1nly4wOQwg9KKiu6NYVNhnbs_Ngmj_5Kq2SYRIT484', '2023-08-11 07:23:36.522594'),
('tw6x4cqkpwrtl4nt4lrke0y6ln5n9ct0', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPSq9:_FjQKCTN4X-vdNloC6xQtSHfz6bGJWYGZHWLukEZ1vU', '2023-08-11 19:09:29.985713'),
('ucnmdn8fvs3wp582l365423h1f0z3ojq', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qP6tM:3BuOMKQaisYF8i7KXNGaOrxxsR5l2iDLo0x9KprRv3Q', '2023-08-10 19:43:20.714314'),
('uxl70o1jk0yt2b5xe99heia13hm5ckmj', '.eJxVjEEOwiAQRe_C2hCY2im4dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLsur0u0VKD6k74DvV26zTXNdlinpX9EGbHmeW5_Vw_w4KtfKtE5oeQcDaXkg8DYaQ2Plz5thxgg4kY2ZEB0PEHMEalg4tOE_QJ6_eH-v9OAA:1qPI85:UvonGqhzYCqQkmupIFxGHrziHPxcUOtSa2wPDCLgAaY', '2023-08-11 07:43:17.634038');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_category`
--

CREATE TABLE `shop_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shop_category`
--

INSERT INTO `shop_category` (`id`, `name`, `parent_category_id`) VALUES
(1, 'shirt', 3),
(2, 'trousers', NULL),
(3, 'underwear', NULL),
(4, '日本語', NULL),
(5, 'dress', 4),
(6, 'shoe', 3),
(7, 'top', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_product`
--

CREATE TABLE `shop_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shop_product`
--

INSERT INTO `shop_product` (`id`, `name`, `price`, `quantity`, `image`, `category_id`) VALUES
(19, 'shirt', 20000, 14, 'images/download.jpg', 1),
(20, 'shirt 2', 4, 25, 'images/ダウンロード_Or2ue6b.jpeg', 1),
(21, 'test', 122.1, 1, 'images/download_ovdvE48.jpg', 5);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_category_parent_category_id_e5bd4156_fk_shop_category_id` (`parent_category_id`);

--
-- Chỉ mục cho bảng `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_category_id_14d7eea8_fk_shop_category_id` (`category_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `shop_category`
--
ALTER TABLE `shop_category`
  ADD CONSTRAINT `shop_category_parent_category_id_e5bd4156_fk_shop_category_id` FOREIGN KEY (`parent_category_id`) REFERENCES `shop_category` (`id`);

--
-- Các ràng buộc cho bảng `shop_product`
--
ALTER TABLE `shop_product`
  ADD CONSTRAINT `shop_product_category_id_14d7eea8_fk_shop_category_id` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
