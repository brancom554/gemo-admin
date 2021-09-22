-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 12, 2021 at 12:54 PM
-- Server version: 8.0.17
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ussd_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `postal_address` varchar(250) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `postal_address`, `postal_code`, `creation_date`, `updated_date`, `city`, `company_id`, `country_id`, `company_token`, `application_uuid`, `data_version`) VALUES
(1, 'Avenue Steinmetz', '00229', '2021-07-08', NULL, 'Cotonou', 1, 1, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(2, 'Rue de l\'Echangeur de Godomey', '00229', '2021-08-21', NULL, 'Godomey', 2, 1, 'DKO', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `libelle` varchar(200) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `type_category` int(11) DEFAULT NULL,
  `type_category_libelle` varchar(250) DEFAULT NULL,
  `data_version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `libelle`, `creation_date`, `type_category`, `type_category_libelle`, `data_version`) VALUES
(1, 'CREDIT', '2021-07-08 12:30:47', 1, 'SERVICES TELEPHONIQUES', 1),
(2, 'FORFAIT MAXI APPEL', '2021-07-08 12:30:47', 1, 'SERVICES TELEPHONIQUES', 1),
(3, 'DEPOT', '2021-07-08 12:30:47', 2, 'SERVICES FINANCIERS', 1),
(4, 'SOLDE TELEPHONIQUE', '2021-07-16 10:52:50', 1, 'SERVICES TELEPHONIQUES', 1),
(5, 'SOLDE SIM', '2021-07-16 10:52:50', 2, 'SERVICES FINANCIERS', 1),
(6, 'RETRAIT', '2021-07-21 08:54:58', 2, 'SERVICES FINANCIERS', 1),
(7, 'FORFAIT MAXI INTERNET', '2021-08-02 15:55:03', 1, 'SERVICES TELEPHONIQUES', 1),
(8, 'FORFAIT INTERNET', '2021-08-02 15:55:03', 1, 'SERVICES TELEPHONIQUES', 1),
(9, 'PASS BONUS APPEL', '2021-08-26 10:19:32', 1, 'SERVICES TELEPHONIQUES', 3),
(10, 'PASS BONUS INTERNET', '2021-08-26 10:19:32', 1, 'SERVICES TELEPHONIQUES', 3);

-- --------------------------------------------------------

--
-- Table structure for table `category_ussd`
--

CREATE TABLE `category_ussd` (
  `category_ussd_id` int(11) NOT NULL,
  `ussd_code` varchar(150) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `operation_type_id` int(11) NOT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL,
  `network_operator_number` int(11) DEFAULT NULL,
  `network_operator_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_ussd`
--

INSERT INTO `category_ussd` (`category_ussd_id`, `ussd_code`, `category_id`, `operation_type_id`, `company_token`, `application_uuid`, `data_version`, `network_operator_number`, `network_operator_name`) VALUES
(1, '*855*1*1*1*', 3, 1, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4b', '3', 2, 'MOOV'),
(2, '*880*3*1*', 3, 1, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4b', '3', 1, 'MTN'),
(3, '*173*5*1#', 4, 6, NULL, NULL, '3', 2, 'MOOV'),
(4, '*880*2*1*', 6, 2, NULL, NULL, '3', 1, 'MTN'),
(5, '*855*4*1*', 6, 2, NULL, NULL, '3', 2, 'MOOV'),
(6, '*106*10*3*', 7, 7, NULL, NULL, '3', 1, 'MTN'),
(7, '*173*1*', 10, 7, NULL, NULL, '3', 2, 'MOOV'),
(8, '*106*10*1*', 8, 4, NULL, NULL, '3', 1, 'MTN'),
(9, '*123*7*', 8, 4, NULL, NULL, '3', 2, 'MOOV'),
(10, '*106*10*3*', 2, 3, NULL, NULL, '3', 1, 'MTN'),
(11, '*173*1*', 9, 8, NULL, NULL, '3', 2, 'MOOV'),
(12, '*106*', 1, 8, NULL, NULL, '3', 2, 'MOOV'),
(13, '*106*2*', 1, 8, NULL, NULL, '3', 1, 'MTN');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_number` varchar(150) DEFAULT NULL COMMENT 'RCCM',
  `company_name` varchar(100) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `registration_number` varchar(65) DEFAULT NULL COMMENT 'IFU number',
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company_number`, `company_name`, `creation_date`, `company_token`, `registration_number`, `application_uuid`, `data_version`) VALUES
(1, 'RCCM021544', 'TEST0', '2021-07-08 12:24:10', 'TEST0', '1234567888', '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(2, '21082021', 'TEST1', '2021-08-21 15:36:35', 'TEST1', '20218012', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  `country_short_name` varchar(45) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `description`, `country_short_name`, `creation_date`, `data_version`) VALUES
(1, 'BENIN', 'BJ', '2021-07-08 12:21:08', '1'),
(2, 'FRANCE', 'FR', '2021-07-08 12:21:08', '1');

-- --------------------------------------------------------

--
-- Table structure for table `database_version`
--

CREATE TABLE `database_version` (
  `database_version_id` int(11) NOT NULL,
  `current_version` int(11) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `database_version`
--

INSERT INTO `database_version` (`database_version_id`, `current_version`, `last_update_date`) VALUES
(1, 3, '2021-08-13 00:22:42');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `inventory_id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `report_file_url` varchar(155) DEFAULT NULL,
  `is_finished_flag` tinyint(1) DEFAULT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `inventory_name` varchar(105) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_detail`
--

CREATE TABLE `inventory_detail` (
  `inventory_detail_id` int(11) NOT NULL,
  `balance_start` int(11) DEFAULT NULL COMMENT 'solde de début periode',
  `balance_end` int(11) DEFAULT NULL COMMENT 'solde en fin de periode',
  `sales_amount` int(11) DEFAULT NULL COMMENT 'chiffre daffaires',
  `nb_transactions` int(11) DEFAULT NULL COMMENT 'nombre transactions sur la periode',
  `operation_type_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `licences`
--

CREATE TABLE `licences` (
  `licence_id` int(11) NOT NULL,
  `licence_key` varchar(100) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `created_by_email` varchar(100) DEFAULT NULL,
  `licence_file_url` varchar(100) DEFAULT NULL,
  `is_for_equipement_flag` tinyint(1) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL,
  `created_for_company_id` int(11) DEFAULT NULL COMMENT 'Créer pour tel compagnie',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_date` datetime DEFAULT NULL COMMENT 'Date d''activation de la licence',
  `expiration_date` datetime DEFAULT NULL COMMENT 'Date d''expiration',
  `licence_parent_id` int(11) DEFAULT NULL COMMENT 'Détermine si c''est une licence secondaire',
  `licence_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licences`
--

-- --------------------------------------------------------

--
-- Table structure for table `licence_features`
--

CREATE TABLE `licence_features` (
  `licence_feature_id` int(11) NOT NULL,
  `licence_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licence_features`
--

INSERT INTO `licence_features` (`licence_feature_id`, `licence_id`, `service_id`, `company_token`, `application_uuid`, `data_version`) VALUES
(1, 27, 2, NULL, NULL, NULL),
(2, 31, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `licence_types`
--

CREATE TABLE `licence_types` (
  `licence_type_id` int(11) NOT NULL,
  `licence_type_name` varchar(105) DEFAULT NULL,
  `licence_nb_equipment` int(11) DEFAULT NULL COMMENT 'Nombre d''équipement autorisé',
  `licence_nb_transactions_day` int(11) DEFAULT NULL COMMENT 'nombre de transactions par jour',
  `is_active` tinyint(4) DEFAULT '1',
  `data_version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `licence_types`
--

INSERT INTO `licence_types` (`licence_type_id`, `licence_type_name`, `licence_nb_equipment`, `licence_nb_transactions_day`, `is_active`, `data_version`) VALUES
(1, 'ECO', 2, 500, 1, 1),
(2, 'BUSINESS', 15, 15000, 1, 1),
(3, 'TEST', 1, 100, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `operation_id` int(11) NOT NULL,
  `operation_type_id` int(11) NOT NULL,
  `company_token` varchar(45) DEFAULT NULL,
  `libelle` varchar(45) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL,
  `balance_after_operate` int(11) DEFAULT NULL COMMENT 'solde après operation',
  `amount` int(11) DEFAULT NULL,
  `operation_date` datetime DEFAULT NULL,
  `network_operator_name` varchar(45) DEFAULT NULL,
   `statut_operation` varchar(150) DEFAULT NULL,
   `transaction_phone_number` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`operation_id`, `operation_type_id`, `company_token`, `libelle`, `application_uuid`, `data_version`, `balance_after_operate`, `amount`, `operation_date`, `network_operator_name`) VALUES
(1, 3, 'TEST08072021', '200F', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL, NULL, NULL, NULL),
(2, 3, 'TEST08072021', '500F', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL, NULL, NULL, NULL),
(3, 3, 'TEST08072021', '1000F', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL, NULL, NULL, NULL),
(4, 5, 'TEST08072021', 'SOLDE', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL, NULL, NULL, NULL),
(5, 5, 'TEST08072021', 'SOLDE MOMO', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL, NULL, NULL, NULL),
(6, 2, 'TEST08072021', 'RETRAIT NATIONAL', NULL, '1', NULL, NULL, NULL, NULL),
(7, 1, 'TEST08072021', 'Test16082021', '041750ce-e473-462c-af82-99567dc25b4b', '1', 250000, NULL, NULL, NULL),
(8, 5, 'TEST08072021', 'SOLDE MOMO', 'eb2685f511609893', '1', 35000, 200, NULL, NULL),
(9, 2, 'TEST08072021', 'RETRAIT NATIONAL', 'eb2685f511609893', '1', 35000, 200, NULL, NULL),
(10, 3, NULL, 'retrait', 'appUuid', '1', 205000, 52000, '2021-08-15 21:18:20', NULL),
(11, 1, NULL, 'retrait', 'appUuid', '1', 205000, 52000, '2021-08-15 21:24:12', NULL),
(12, 2, NULL, 'depot', 'appUuid', '1', 200000, 5000, '2021-08-15 21:35:29', NULL),
(13, 2, NULL, 'depot', 'appUuid', '1', 200000, 5000, '2021-08-15 22:40:01', NULL),
(14, 2, NULL, 'depot', 'appUuid', '1', 200000, 5000, '2021-08-15 23:43:33', NULL),
(15, 3, NULL, 'credit', 'appUuid', '1', 12000, 250, '2021-08-15 23:58:06', NULL),
(16, 3, NULL, 'forfait', 'appUuid', '1', 8000, 300, '2021-08-16 00:00:39', NULL),
(17, 4, NULL, 'forfait', 'appUuid', '1', 85000, 3000, '2021-08-16 00:06:11', NULL),
(18, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 01:35:41', NULL),
(19, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 09:14:10', NULL),
(20, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 09:56:40', NULL),
(21, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 10:20:10', NULL),
(22, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 10:56:54', NULL),
(23, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 11:07:57', NULL),
(24, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 11:13:26', NULL),
(25, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 11:15:32', NULL),
(26, 5, NULL, 'forfait internet', 'appUuid', '1', 85000, 3000, '2021-08-16 11:19:46', NULL),
(27, 5, 'TEST08072021', 'SOLDE MOMO', 'eb2685f511609893', '1', 35000, 200, NULL, NULL),
(28, 2, 'TEST08072021', 'RETRAIT NATIONAL', 'eb2685f511609893', '1', 35000, 200, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `operation_types`
--

CREATE TABLE `operation_types` (
  `operation_type_id` int(11) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `comments` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operation_types`
--

INSERT INTO `operation_types` (`operation_type_id`, `libelle`, `creation_date`, `comments`, `data_version`) VALUES
(1, 'DEPOT', '2021-07-08 12:29:42', 'DEPOT', '2'),
(2, 'RETRAIT', '2021-07-08 12:29:42', 'RETRAIT', '2'),
(3, 'FORFAIT MAXI APPEL', '2021-07-08 14:42:04', 'forfait maxi appel', '2'),
(4, 'FORFAIT MAXI INTERNET', '2021-07-08 14:42:04', 'forfait maxi internet', '2'),
(5, 'PASS BONUS APPEL', '2021-07-16 10:50:38', 'pass bonus appel', '2'),
(6, 'PASS BONUS INTERNET', '2021-07-16 10:55:12', 'pass bonus internet', '2'),
(7, 'FORFAIT INTERNET', '2021-08-02 14:24:11', 'forfait internet', '2'),
(8, 'CREDIT', '2021-08-02 14:57:06', 'Vente de crédits', '2');

-- --------------------------------------------------------

--
-- Table structure for table `password_histories`
--

CREATE TABLE `password_histories` (
  `history_id` int(11) NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  `login_date` datetime DEFAULT NULL,
  `schedule_reset_date` datetime DEFAULT NULL,
  `effective_reset_date` datetime DEFAULT NULL,
  `next_reset_date` datetime DEFAULT NULL,
  `is_effective` tinyint(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `password_histories`
--


-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  `descriptions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `libelle`, `descriptions`) VALUES
(1, 'Test10', 'Test desciption'),
(2, 'Service 2', 'Test description service 2'),
(3, 'Service 3', 'Test description service 3');

-- --------------------------------------------------------

--
-- Table structure for table `sms_tracker`
--

CREATE TABLE `sms_tracker` (
  `tracker_id` int(11) NOT NULL,
  `from_number` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT 'GEMO',
  `to_phone_number` text,
  `subject` varchar(100) DEFAULT NULL,
  `content` mediumtext,
  `delivery_flag` tinyint(1) NOT NULL DEFAULT '0',
  `user_operation_id` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_attempt_date` datetime DEFAULT NULL,
  `sms_sent_date` datetime DEFAULT NULL,
  `category` varchar(100) NOT NULL DEFAULT 'TRACKING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `encrypted_password` varchar(100) DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `is_active_flag` tinyint(1) DEFAULT NULL,
  `active_date_from` date DEFAULT NULL,
  `active_date_to` date DEFAULT NULL,
  `is_manager` tinyint(1) DEFAULT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL,
  `licence_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `phone_number`, `encrypted_password`, `hash`, `creation_date`, `last_update_date`, `address_id`, `company_id`, `is_active_flag`, `active_date_from`, `active_date_to`, `is_manager`, `company_token`, `application_uuid`, `data_version`, `licence_id`) VALUES
(1, 'AROUNA', 'Hafiz', 'test@test.com', '66152976', '$2y$10$OIEiX7O6f5Sie5i.zDclnexoqJI.W89xPxxOEovStEpcE/U0Wbdpa', '0cbc6611f5540bd0809a388dc95a615b', '2021-08-16 21:21:00', NULL, 1, 2, 1, '2021-08-16', '2021-08-27', 0, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL),
(2, 'BAKARI', 'Mariama So Arouna', '', '0666265571', '$2y$10$/nssyIy7Z7OqAdNFj06K8urvevEk6gB3n0CxgX.kDOsqs..y/1XJi', '0cbc6611f5540bd0809a388dc95a615b', '2021-08-17 18:46:00', NULL, 1, 2, 1, '2021-08-17', '2021-08-20', 2, 'DKO', NULL, '1', NULL)
;

-- --------------------------------------------------------

--
-- Table structure for table `user_connections`
--

CREATE TABLE `user_connections` (
  `connection_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `application_uuid` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connection_date` date DEFAULT NULL,
  `sheduled_deconnection_date` date DEFAULT NULL,
  `deconnection_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_connections`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_has_features`
--

CREATE TABLE `user_has_features` (
  `user_has_licence_id` int(11) NOT NULL,
  `licence_activation_date` varchar(45) DEFAULT NULL,
  `licence_feature_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_token` varchar(105) DEFAULT NULL,
  `active_date_from` date DEFAULT NULL,
  `active_date_to` date DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_features`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_operations`
--

CREATE TABLE `user_operations` (
  `user_operation_id` int(11) NOT NULL,
  `operation_date` datetime DEFAULT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `operation_id` int(11) NOT NULL,
  `company_token` varchar(45) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL,
  `statut_operation` varchar(150) DEFAULT NULL,
  `transaction_phone_number` varchar(150) DEFAULT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_operations`
--

-- --------------------------------------------------------

--
-- Table structure for table `validate_password`
--

CREATE TABLE `validate_password` (
  `validate_id` int(11) NOT NULL,
  `verify_code` varchar(45) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `is_used` tinyint(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `validate_password`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_addresses_companies1_idx` (`company_id`),
  ADD KEY `fk_addresses_countries1_idx` (`country_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_ussd`
--
ALTER TABLE `category_ussd`
  ADD PRIMARY KEY (`category_ussd_id`),
  ADD KEY `fk_category_ussd_categories1_idx` (`category_id`),
  ADD KEY `fk_category_ussd_operation_types1_idx` (`operation_type_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `database_version`
--
ALTER TABLE `database_version`
  ADD PRIMARY KEY (`database_version_id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Indexes for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD PRIMARY KEY (`inventory_detail_id`),
  ADD KEY `operation_type_id` (`operation_type_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `licences`
--
ALTER TABLE `licences`
  ADD PRIMARY KEY (`licence_id`),
  ADD KEY `fk_licences_licence_types1_idx` (`licence_type_id`),
  ADD KEY `fk_licences_user_idx` (`user_id`);

--
-- Indexes for table `licence_features`
--
ALTER TABLE `licence_features`
  ADD PRIMARY KEY (`licence_feature_id`,`licence_id`,`service_id`) USING BTREE,
  ADD KEY `service_id` (`service_id`),
  ADD KEY `fk_licence_features_licences_idx` (`licence_id`);

--
-- Indexes for table `licence_types`
--
ALTER TABLE `licence_types`
  ADD PRIMARY KEY (`licence_type_id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`operation_id`),
  ADD KEY `fk_operations_operation_types1_idx` (`operation_type_id`);

--
-- Indexes for table `operation_types`
--
ALTER TABLE `operation_types`
  ADD PRIMARY KEY (`operation_type_id`);

--
-- Indexes for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `fk_rapport_user_idx` (`user_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `sms_tracker`
--
ALTER TABLE `sms_tracker`
  ADD PRIMARY KEY (`tracker_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_addresses1_idx` (`address_id`),
  ADD KEY `fk_users_companies1_idx` (`company_id`),
  ADD KEY `licence_id` (`licence_id`);

--
-- Indexes for table `user_connections`
--
ALTER TABLE `user_connections`
  ADD PRIMARY KEY (`connection_id`);

--
-- Indexes for table `user_has_features`
--
ALTER TABLE `user_has_features`
  ADD PRIMARY KEY (`user_has_licence_id`),
  ADD KEY `fk_user_has_features_licence_features1_idx` (`licence_feature_id`),
  ADD KEY `fk_user_has_features_users1_idx` (`user_id`);

--
-- Indexes for table `user_operations`
--
ALTER TABLE `user_operations`
  ADD PRIMARY KEY (`user_operation_id`),
  ADD KEY `fk_user_operations_users1_idx` (`created_by_user_id`),
  ADD KEY `fk_user_operations_operations1_idx` (`operation_id`),
  ADD KEY `fk_user_operations_inventories1_idx` (`inventory_id`);

--
-- Indexes for table `validate_password`
--
ALTER TABLE `validate_password`
  ADD PRIMARY KEY (`validate_id`),
  ADD KEY `fk_validate_password_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_ussd`
--
ALTER TABLE `category_ussd`
  MODIFY `category_ussd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `database_version`
--
ALTER TABLE `database_version`
  MODIFY `database_version_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  MODIFY `inventory_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `licences`
--
ALTER TABLE `licences`
  MODIFY `licence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `licence_features`
--
ALTER TABLE `licence_features`
  MODIFY `licence_feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `licence_types`
--
ALTER TABLE `licence_types`
  MODIFY `licence_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `operation_types`
--
ALTER TABLE `operation_types`
  MODIFY `operation_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sms_tracker`
--
ALTER TABLE `sms_tracker`
  MODIFY `tracker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_connections`
--
ALTER TABLE `user_connections`
  MODIFY `connection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_has_features`
--
ALTER TABLE `user_has_features`
  MODIFY `user_has_licence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `user_operations`
--
ALTER TABLE `user_operations`
  MODIFY `user_operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `validate_password`
--
ALTER TABLE `validate_password`
  MODIFY `validate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `fk_addresses_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);

--
-- Constraints for table `category_ussd`
--
ALTER TABLE `category_ussd`
  ADD CONSTRAINT `fk_category_ussd_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_category_ussd_operation_types1` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`);

--
-- Constraints for table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD CONSTRAINT `inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`inventory_id`),
  ADD CONSTRAINT `operation_type_id` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`);

--
-- Constraints for table `licences`
--
ALTER TABLE `licences`
  ADD CONSTRAINT `fk_licences_licence_types1` FOREIGN KEY (`licence_type_id`) REFERENCES `licence_types` (`licence_type_id`);

--
-- Constraints for table `licence_features`
--
ALTER TABLE `licence_features`
  ADD CONSTRAINT `fk_licence_features_licences` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`licence_id`),
  ADD CONSTRAINT `licence_features_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `fk_operations_operation_types1` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`);

--
-- Constraints for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD CONSTRAINT `fk_rapport_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  ADD CONSTRAINT `fk_users_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `licence_id` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`licence_id`);

--
-- Constraints for table `user_operations`
--
ALTER TABLE `user_operations`
  ADD CONSTRAINT `fk_user_operations_inventories1` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`inventory_id`),
  ADD CONSTRAINT `fk_user_operations_operations1` FOREIGN KEY (`operation_id`) REFERENCES `operations` (`operation_id`),
  ADD CONSTRAINT `fk_user_operations_users1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
