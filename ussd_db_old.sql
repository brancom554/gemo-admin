-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 06 sep. 2021 à 17:28
-- Version du serveur :  8.0.17
-- Version de PHP : 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ussd_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
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
-- Déchargement des données de la table `addresses`
--

INSERT INTO `addresses` (`address_id`, `postal_address`, `postal_code`, `creation_date`, `updated_date`, `city`, `company_id`, `country_id`, `company_token`, `application_uuid`, `data_version`) VALUES
(1, 'Avenue Steinmetz', '00229', '2021-07-08', NULL, 'Cotonou', 1, 1, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(2, 'Rue de l\'Echangeur de Godomey', '00229', '2021-08-21', NULL, 'Godomey', 2, 1, 'DKO', NULL, '1');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
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
-- Déchargement des données de la table `categories`
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
-- Structure de la table `category_ussd`
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
-- Déchargement des données de la table `category_ussd`
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
-- Structure de la table `companies`
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
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`company_id`, `company_number`, `company_name`, `creation_date`, `company_token`, `registration_number`, `application_uuid`, `data_version`) VALUES
(1, 'RCCM021544', 'TEST0', '2021-07-08 12:24:10', 'TEST08072021', '1234567888', '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(2, '21082021', 'TEST1', '2021-08-21 15:36:35', 'DKO', '20218012', NULL, '1');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `description` varchar(105) DEFAULT NULL,
  `country_short_name` varchar(45) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`country_id`, `description`, `country_short_name`, `creation_date`, `data_version`) VALUES
(1, 'BENIN', 'BJ', '2021-07-08 12:21:08', '1'),
(2, 'FRANCE', 'FR', '2021-07-08 12:21:08', '1');

-- --------------------------------------------------------

--
-- Structure de la table `database_version`
--

CREATE TABLE `database_version` (
  `database_version_id` int(11) NOT NULL,
  `current_version` int(11) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `database_version`
--

INSERT INTO `database_version` (`database_version_id`, `current_version`, `last_update_date`) VALUES
(1, 3, '2021-08-13 00:22:42');

-- --------------------------------------------------------

--
-- Structure de la table `inventories`
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
-- Structure de la table `inventory_detail`
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
-- Structure de la table `licences`
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
  `licence_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `licences`
--

INSERT INTO `licences` (`licence_id`, `licence_key`, `creation_date`, `created_by_email`, `licence_file_url`, `is_for_equipement_flag`, `application_uuid`, `data_version`, `created_for_company_id`, `is_active`, `activation_date`, `expiration_date`, `licence_parent_id`, `licence_type_id`) VALUES
(1, '534c0-c4e21-265f5-c2282-54663', '2021-08-06 01:59:00', NULL, NULL, 1, '14455', NULL, 3, 1, '2021-08-11 00:00:00', '2021-08-31 00:00:00', 2, 2),
(2, '986e8-784cc-4622a-980ab-54b77', '2021-08-06 10:45:00', NULL, NULL, 1, NULL, NULL, 1, 0, NULL, '2021-11-17 16:08:23', NULL, 2),
(3, '264a86d7-a256-46e4-8296-83f6588fcdc8', '2021-08-11 18:35:26', 'test@test.com', NULL, 0, NULL, '1', 1, 0, NULL, '2021-09-10 18:37:36', NULL, 2),
(4, '5b51f570-0488-4c2d-90cb-b6df2966a1e4', '2021-08-11 18:35:26', 'test@test.com', NULL, 1, '39f33214-b879-4495-b2b1-94bdb458da59', '1', 1, 1, '2021-08-23 00:00:00', '2021-11-17 16:08:30', 3, 2),
(5, 'abcd-efgh-1234-0000', '2021-08-12 06:57:21', 'test@test.com', NULL, 1, '14455', '1', 1, 1, '2021-08-12 00:00:00', '2021-10-06 06:57:21', 3, 2),
(6, 'dc8782dc-028d-11ec-9a03-0242ac130003', '2021-08-21 15:40:54', NULL, NULL, 0, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '3', 2, 1, '2021-08-24 00:00:00', '2021-12-01 16:08:38', NULL, 2),
(7, '404442ce-028e-11ec-9a03-0242ac130003', '2021-08-21 15:44:05', NULL, NULL, 1, 'ca4a2254-f92d-403e-b843-42483d24eaea', '3', 2, 1, '2021-08-26 00:00:00', '2021-12-09 16:09:02', 6, 2),
(8, '534c0-c4e21-265f5-c2282-54663', '2021-08-06 01:59:00', NULL, NULL, 1, '1', NULL, 1, 1, '2021-08-12 19:23:00', '2021-08-31 00:00:00', NULL, 2),
(9, '986e8-784cc-4622a-980ab-54b77', '2021-08-06 10:45:00', NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, '2021-12-14 16:08:54', NULL, 2),
(10, '43778-4121e-897d7-7bcc3-5e867', '2021-08-09 19:40:00', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, '2021-08-26 00:00:00', NULL, 2),
(11, 'fa149-fd124-e8e75-e9a54-aa4f2', '2021-08-12 14:57:00', NULL, NULL, 1, NULL, NULL, 2, 1, '2021-08-12 15:48:00', '2021-08-11 00:00:00', 1, 2),
(12, '2766b-9324c-25d9a-93c22-46e78', '2021-08-12 15:50:00', NULL, NULL, 1, NULL, NULL, 2, 1, '2021-08-12 15:50:00', '2021-08-16 00:00:00', 0, 2),
(13, '3d0e8-44ec6-e023f-30795-dbd1d', '2021-08-12 19:24:00', NULL, NULL, 1, NULL, NULL, 2, 1, '2021-08-12 19:24:00', '2021-08-19 00:00:00', 0, 2),
(14, '19deb-353f4-79808-a16e9-f40ec', '2021-08-20 17:34:00', 'test@gmail.com', NULL, 0, NULL, '3', 2, 1, '2021-08-20 17:34:00', '2021-08-31 00:00:00', NULL, 2),
(15, '16c96-4e503-ea8ac-466f8-d7918', '2021-08-20 20:38:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-08-20 20:38:00', '2021-08-21 00:00:00', 1, 2),
(16, '9f44c-0e68d-9d074-70fce-28fcf', '2021-09-01 13:25:00', NULL, NULL, NULL, 'test', NULL, 2, 1, '2021-09-01 13:25:00', '2021-09-03 00:00:00', NULL, 2),
(17, '5ce66-61dd5-11828-4d7df-eb934', '2021-09-01 13:39:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 13:39:00', '2021-09-12 00:00:00', 16, NULL),
(18, '38b61-24c0e-7815f-e04b8-6a5ef', '2021-09-01 14:22:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:22:00', '2021-09-13 00:00:00', 16, NULL),
(19, 'c0e55-48c4d-920f2-f8828-e654a', '2021-09-01 14:23:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:23:00', '2021-09-15 00:00:00', 16, NULL),
(20, '874d9-2a886-df2ca-b81fd-38191', '2021-09-01 14:25:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:25:00', '2021-09-20 00:00:00', 16, NULL),
(21, '50194-02479-ca45b-1ef9a-13f1b', '2021-09-01 14:26:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:26:00', '2021-09-14 00:00:00', 16, NULL),
(22, '50194-02479-ca45b-1ef9a-13f1b', '2021-09-01 14:27:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:27:00', '2021-09-14 00:00:00', 16, NULL),
(23, '50194-02479-ca45b-1ef9a-13f1b', '2021-09-01 14:28:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:28:00', '2021-09-14 00:00:00', 16, NULL),
(24, '50194-02479-ca45b-1ef9a-13f1b', '2021-09-01 14:28:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:28:00', '2021-09-14 00:00:00', 16, NULL),
(25, '50194-02479-ca45b-1ef9a-13f1b', '2021-09-01 14:35:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:35:00', '2021-09-14 00:00:00', 16, NULL),
(26, '50194-02479-ca45b-1ef9a-13f1b', '2021-09-01 14:36:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 14:36:00', '2021-09-14 00:00:00', 16, NULL),
(27, 'b73b5-aee69-d48db-db4d0-150e3', '2021-09-01 15:41:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 15:41:00', '2021-09-09 00:00:00', 16, NULL),
(28, '43ac7-65cd9-1798e-e1c36-da79f', '2021-09-01 16:33:00', NULL, NULL, 1, '', NULL, 2, 0, NULL, '2021-09-06 00:00:00', NULL, 2),
(29, 'a2c81-3c2bf-937b1-07dc1-9b630', '2021-09-01 16:54:00', NULL, NULL, NULL, '', NULL, 1, 0, NULL, '2021-09-27 00:00:00', NULL, 2),
(30, '53a33-de3aa-23809-f2ab7-c612b', '2021-09-01 17:00:00', NULL, NULL, 1, '', NULL, 2, 0, NULL, '2021-10-27 00:00:00', NULL, 2),
(31, 'd3400-3400e-2f84b-1f890-72490', '2021-09-01 17:01:00', NULL, NULL, 1, NULL, NULL, NULL, 1, '2021-09-01 17:01:00', '2021-09-21 00:00:00', 30, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `licence_features`
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
-- Déchargement des données de la table `licence_features`
--

INSERT INTO `licence_features` (`licence_feature_id`, `licence_id`, `service_id`, `company_token`, `application_uuid`, `data_version`) VALUES
(1, 27, 2, NULL, NULL, NULL),
(2, 31, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `licence_types`
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
-- Déchargement des données de la table `licence_types`
--

INSERT INTO `licence_types` (`licence_type_id`, `licence_type_name`, `licence_nb_equipment`, `licence_nb_transactions_day`, `is_active`, `data_version`) VALUES
(1, 'CLASSIC', 2, 500, 1, 1),
(2, 'PREMIUM', 15, 15000, 1, 1),
(3, 'LIGHT', 1, 100, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `operations`
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
  `network_operator_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operations`
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
-- Structure de la table `operation_types`
--

CREATE TABLE `operation_types` (
  `operation_type_id` int(11) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `comments` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `operation_types`
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
-- Structure de la table `password_histories`
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
-- Déchargement des données de la table `password_histories`
--

INSERT INTO `password_histories` (`history_id`, `logout_date`, `login_date`, `schedule_reset_date`, `effective_reset_date`, `next_reset_date`, `is_effective`, `user_id`) VALUES
(1, NULL, '2021-08-02 13:22:47', '2021-08-14 13:22:47', NULL, NULL, 0, 1),
(2, NULL, '2021-08-02 13:22:47', '2021-08-14 13:22:47', NULL, NULL, 0, 1),
(3, NULL, '2021-08-02 13:22:47', '2021-08-14 13:22:47', NULL, NULL, 0, 1),
(6, NULL, '2021-08-04 22:47:33', '2021-08-11 22:47:33', NULL, NULL, 0, 2),
(7, NULL, '2021-08-05 14:52:48', '2021-08-12 14:52:48', NULL, NULL, 0, 1),
(8, NULL, '2021-08-05 17:12:44', '2021-08-12 17:12:44', NULL, NULL, 0, 2),
(9, NULL, '2021-08-05 17:26:27', '2021-08-12 17:26:27', NULL, NULL, 0, 2),
(10, NULL, '2021-08-05 18:13:49', '2021-08-12 18:13:49', NULL, NULL, 0, 1),
(11, NULL, '2021-08-07 11:00:14', '2021-08-14 11:00:14', NULL, NULL, 0, 1),
(12, NULL, '2021-08-09 14:19:58', '2021-08-16 14:19:58', NULL, NULL, 0, 2),
(13, NULL, '2021-08-09 13:40:09', '2021-08-16 13:40:09', NULL, NULL, 0, 1),
(14, NULL, '2021-08-11 19:01:29', '2021-08-18 19:01:29', NULL, NULL, 0, 2),
(15, NULL, '2021-08-18 10:53:28', '2021-08-25 10:53:28', NULL, NULL, 0, 2),
(16, NULL, '2021-08-18 16:18:27', '2021-08-25 16:18:27', NULL, NULL, 0, 2),
(17, NULL, '2021-08-20 13:34:25', '2021-08-27 13:34:25', NULL, NULL, 0, 2),
(18, NULL, '2021-08-21 16:39:19', '2021-08-28 16:39:19', NULL, NULL, 0, 3),
(19, NULL, '2021-08-21 19:26:03', '2021-08-28 19:26:03', NULL, NULL, 0, 3),
(20, NULL, '2021-08-22 13:03:24', '2021-08-29 13:03:24', NULL, NULL, 0, 3),
(21, NULL, '2021-08-22 13:24:04', '2021-08-29 13:24:04', NULL, NULL, 0, 3),
(22, NULL, '2021-08-23 12:01:34', '2021-08-30 12:01:34', NULL, NULL, 0, 2),
(23, NULL, '2021-08-23 21:43:18', '2021-08-30 21:43:18', NULL, NULL, 0, 3),
(24, NULL, '2021-08-24 03:43:56', '2021-08-31 03:43:56', NULL, NULL, 0, 3),
(25, NULL, '2021-08-24 14:54:05', '2021-08-31 14:54:05', NULL, NULL, 0, 3),
(26, NULL, '2021-08-26 11:45:42', '2021-09-02 11:45:42', NULL, NULL, 0, 3),
(27, NULL, '2021-08-26 12:27:18', '2021-09-02 12:27:18', NULL, NULL, 0, 3),
(28, NULL, '2021-08-29 18:30:41', '2021-09-05 18:30:41', NULL, NULL, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `libelle` varchar(30) NOT NULL,
  `descriptions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`service_id`, `libelle`, `descriptions`) VALUES
(1, 'Test10', 'Test desciption'),
(2, 'Service 2', 'Test description service 2'),
(3, 'Service 3', 'Test description service 3');

-- --------------------------------------------------------

--
-- Structure de la table `sms_tracker`
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
-- Déchargement des données de la table `sms_tracker`
--

INSERT INTO `sms_tracker` (`tracker_id`, `from_number`, `from_name`, `to_phone_number`, `subject`, `content`, `delivery_flag`, `user_operation_id`, `creation_date`, `last_attempt_date`, `sms_sent_date`, `category`) VALUES
(1, '61292948', 'GEMO', '94570130', 'APPLICATION', 'VOUS ACEZ FAIT UNE OPERATION', 0, NULL, '2021-08-29 08:12:37', NULL, NULL, 'TRACKING'),
(2, '61292948', 'GEMO', '94570130', 'APPLICATION', 'VOUS ACEZ FAIT UNE OPERATION', 0, NULL, '2021-08-29 08:12:37', NULL, NULL, 'TRACKING'),
(3, '61292948', 'GEMO', '94570130', 'APPLICATION', 'VOUS ACEZ FAIT UNE OPERATION', 0, NULL, '2021-08-29 08:12:37', NULL, NULL, 'TRACKING');

-- --------------------------------------------------------

--
-- Structure de la table `users`
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
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `email`, `phone_number`, `encrypted_password`, `hash`, `creation_date`, `last_update_date`, `address_id`, `company_id`, `is_active_flag`, `active_date_from`, `active_date_to`, `is_manager`, `company_token`, `application_uuid`, `data_version`, `licence_id`) VALUES
(1, 'testeur', 'testeuse', 'test@gmail.com', '61292948', '$2y$10$OIEiX7O6f5Sie5i.zDclnexoqJI.W89xPxxOEovStEpcE/U0Wbdpa', '1629212091', '2021-07-14 14:47:57', NULL, 1, 1, 1, '2021-07-01', NULL, 0, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4x', '1', NULL),
(2, 'nuptia', 'M', 'testa@gmail.com', '69126070', '$2y$10$QHwOxHtS8B6qxrnk.7qnGufIrm1IAxPPC9/oQNC1Igt7yQY7xui7G', '1629280371', NULL, NULL, 1, 1, 1, '2021-08-01', NULL, NULL, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4z', NULL, NULL),
(3, 'dko1', 'dko2', 'testdko579@gmail.com', '96209396', '$2y$10$IZryQVV0Fs4NncH.9xbMq..xhC9OTay24CJDGMQFUxr3yYRyPyMZy', '1629560315', '2021-08-21 15:38:16', NULL, 2, 2, 1, '2021-08-16', NULL, NULL, 'DKO', NULL, '3', NULL),
(4, 'AROUNA', 'Hafiz', 'test@test.com', '66152976', '$2y$10$OIEiX7O6f5Sie5i.zDclnexoqJI.W89xPxxOEovStEpcE/U0Wbdpa', '0cbc6611f5540bd0809a388dc95a615b', '2021-08-16 21:21:00', NULL, 1, 2, 1, '2021-08-16', '2021-08-27', 0, 'TEST08072021', '041750ce-e473-462c-af82-99567dc25b4b', '1', NULL),
(5, 'BAKARI', 'Mariama So Arouna', '', '0666265571', '$2y$10$/nssyIy7Z7OqAdNFj06K8urvevEk6gB3n0CxgX.kDOsqs..y/1XJi', '0cbc6611f5540bd0809a388dc95a615b', '2021-08-17 18:46:00', NULL, 1, 2, 1, '2021-08-17', '2021-08-20', 2, 'DKO', NULL, '1', NULL),
(6, 'TESTEUR ', 'test 2', 'test@test.com', '95876741', '$2y$10$OIEiX7O6f5Sie5i.zDclnexoqJI.W89xPxxOEovStEpcE/U0Wbdpa', '0cbc6611f5540bd0809a388dc95a615b', '2021-08-20 17:30:00', NULL, 2, 2, 1, '2021-08-20', '2021-08-31', 1, 'DKO', '041750ce-e473-462c-af82-99567dc25b4c', '1', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_connections`
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
-- Déchargement des données de la table `user_connections`
--

INSERT INTO `user_connections` (`connection_id`, `user_id`, `application_uuid`, `connection_date`, `sheduled_deconnection_date`, `deconnection_date`) VALUES
(1, 1, NULL, '2021-09-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_has_features`
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
-- Déchargement des données de la table `user_has_features`
--

INSERT INTO `user_has_features` (`user_has_licence_id`, `licence_activation_date`, `licence_feature_id`, `user_id`, `company_token`, `active_date_from`, `active_date_to`, `application_uuid`, `data_version`) VALUES
(1, NULL, 7, 2, NULL, '2021-08-10', '2021-08-31', NULL, '1'),
(2, '2021-08-10', 4, 1, NULL, '2021-08-02', '2021-09-21', NULL, '1'),
(3, '2021-08-12 00:00:00', 8, 1, NULL, '2021-08-12', '2021-10-06', '14455', '1'),
(4, '2021-08-12 00:00:00', 9, 1, NULL, '2021-08-12', '2021-10-06', '14455', '1'),
(10, '2021-08-12 00:00:00', 5, 2, NULL, '2021-08-12', NULL, '379b1eef-08bf-42e7-9c7e-d85f5dd005a8', '1'),
(11, '2021-08-12 00:00:00', 6, 2, NULL, '2021-08-12', NULL, '379b1eef-08bf-42e7-9c7e-d85f5dd005a8', '1'),
(12, '2021-08-12 00:00:00', 7, 2, NULL, '2021-08-12', NULL, '379b1eef-08bf-42e7-9c7e-d85f5dd005a8', '1'),
(13, '2021-08-12 00:00:00', 7, 2, NULL, '2021-08-12', NULL, 'ffe7d2ec-d4f0-4dc7-861f-7768897cc446', '1'),
(14, '2021-08-12 00:00:00', 6, 2, NULL, '2021-08-12', NULL, 'ffe7d2ec-d4f0-4dc7-861f-7768897cc446', '1'),
(15, '2021-08-12 00:00:00', 5, 2, NULL, '2021-08-12', NULL, 'ffe7d2ec-d4f0-4dc7-861f-7768897cc446', '1'),
(16, '2021-08-12 00:00:00', 5, 2, NULL, '2021-08-12', NULL, 'a41ea6f7-3011-4c4d-86db-ec5679f083da', '1'),
(17, '2021-08-12 00:00:00', 6, 2, NULL, '2021-08-12', NULL, 'a41ea6f7-3011-4c4d-86db-ec5679f083da', '1'),
(18, '2021-08-12 00:00:00', 7, 2, NULL, '2021-08-12', NULL, 'a41ea6f7-3011-4c4d-86db-ec5679f083da', '1'),
(19, '2021-08-12 00:00:00', 5, 2, NULL, '2021-08-12', NULL, '0d79e2e9-4a9e-48bd-8263-bbaae9a862b6', '1'),
(20, '2021-08-12 00:00:00', 6, 2, NULL, '2021-08-12', NULL, '0d79e2e9-4a9e-48bd-8263-bbaae9a862b6', '1'),
(21, '2021-08-12 00:00:00', 7, 2, NULL, '2021-08-12', NULL, '0d79e2e9-4a9e-48bd-8263-bbaae9a862b6', '1'),
(22, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '984d94e6-72e2-4ae6-ba3f-9f9f0e2d8f1c', '1'),
(23, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '984d94e6-72e2-4ae6-ba3f-9f9f0e2d8f1c', '1'),
(24, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '984d94e6-72e2-4ae6-ba3f-9f9f0e2d8f1c', '1'),
(25, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, 'fd727148-0412-42ae-b3ec-b2b221906577', '1'),
(26, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, 'fd727148-0412-42ae-b3ec-b2b221906577', '1'),
(27, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, 'fd727148-0412-42ae-b3ec-b2b221906577', '1'),
(28, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '9d21b80a-9dfa-4c67-baa4-830fe022200a', '1'),
(29, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '9d21b80a-9dfa-4c67-baa4-830fe022200a', '1'),
(30, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '9d21b80a-9dfa-4c67-baa4-830fe022200a', '1'),
(31, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, 'ef6d5d59-fa3c-4fa5-9654-b79eeb4dfdb0', '1'),
(32, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, 'ef6d5d59-fa3c-4fa5-9654-b79eeb4dfdb0', '1'),
(33, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, 'ef6d5d59-fa3c-4fa5-9654-b79eeb4dfdb0', '1'),
(34, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '5b523c89-3008-47b9-8683-4b4e65c0eb0e', '1'),
(35, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '5b523c89-3008-47b9-8683-4b4e65c0eb0e', '1'),
(36, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '5b523c89-3008-47b9-8683-4b4e65c0eb0e', '1'),
(37, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '9c153585-5bc5-4857-97d4-34c1975146e5', '1'),
(38, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '9c153585-5bc5-4857-97d4-34c1975146e5', '1'),
(39, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '9c153585-5bc5-4857-97d4-34c1975146e5', '1'),
(40, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '8a6f8be5-d992-4add-86e9-a300fd9554fb', '1'),
(41, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '8a6f8be5-d992-4add-86e9-a300fd9554fb', '1'),
(42, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '8a6f8be5-d992-4add-86e9-a300fd9554fb', '1'),
(43, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, 'df975ebd-2150-4cc8-9f74-7927e4c74e4d', '1'),
(44, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, 'df975ebd-2150-4cc8-9f74-7927e4c74e4d', '1'),
(45, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, 'df975ebd-2150-4cc8-9f74-7927e4c74e4d', '1'),
(46, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '6e6f186a-fc04-42b7-9e90-f7ebc17ec7ba', '1'),
(47, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '6e6f186a-fc04-42b7-9e90-f7ebc17ec7ba', '1'),
(48, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '6e6f186a-fc04-42b7-9e90-f7ebc17ec7ba', '1'),
(49, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, 'c82e0f89-ac98-487a-8997-dd88631c25a5', '1'),
(50, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, 'c82e0f89-ac98-487a-8997-dd88631c25a5', '1'),
(51, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, 'c82e0f89-ac98-487a-8997-dd88631c25a5', '1'),
(52, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '9477aac2-798f-4388-bc8c-bf93de99b3d8', '1'),
(53, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '9477aac2-798f-4388-bc8c-bf93de99b3d8', '1'),
(54, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '9477aac2-798f-4388-bc8c-bf93de99b3d8', '1'),
(55, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '8962e96e-c870-41c7-b2aa-0f0b7c81ba2c', '1'),
(56, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '8962e96e-c870-41c7-b2aa-0f0b7c81ba2c', '1'),
(57, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '8962e96e-c870-41c7-b2aa-0f0b7c81ba2c', '1'),
(58, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, '0c556261-37d1-468b-b1a2-794040977487', '1'),
(59, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, '0c556261-37d1-468b-b1a2-794040977487', '1'),
(60, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, '0c556261-37d1-468b-b1a2-794040977487', '1'),
(61, '2021-08-15 00:00:00', 5, 2, NULL, '2021-08-15', NULL, 'eb2685f511609893', '1'),
(62, '2021-08-15 00:00:00', 6, 2, NULL, '2021-08-15', NULL, 'eb2685f511609893', '1'),
(63, '2021-08-15 00:00:00', 7, 2, NULL, '2021-08-15', NULL, 'eb2685f511609893', '1'),
(64, '2021-08-16 00:00:00', 5, 2, NULL, '2021-08-16', NULL, 'eb2685f511609893', '1'),
(65, '2021-08-16 00:00:00', 6, 2, NULL, '2021-08-16', NULL, 'eb2685f511609893', '1'),
(66, '2021-08-16 00:00:00', 7, 2, NULL, '2021-08-16', NULL, 'eb2685f511609893', '1'),
(67, '2021-08-18 00:00:00', 7, 2, NULL, '2021-08-18', NULL, 'eb2685f511609893', '1'),
(68, '2021-08-18 00:00:00', 6, 2, NULL, '2021-08-18', NULL, 'eb2685f511609893', '1'),
(69, '2021-08-18 00:00:00', 5, 2, NULL, '2021-08-18', NULL, 'eb2685f511609893', '1'),
(70, '2021-08-21 00:00:00', 10, 3, NULL, '2021-08-21', NULL, 'f027f12e-dba7-4151-b224-20fff7caaf82', '1'),
(71, '2021-08-21 00:00:00', 11, 3, NULL, '2021-08-21', NULL, 'f027f12e-dba7-4151-b224-20fff7caaf82', '1'),
(72, '2021-08-21 00:00:00', 12, 3, NULL, '2021-08-21', NULL, 'f027f12e-dba7-4151-b224-20fff7caaf82', '1'),
(73, '2021-08-21 00:00:00', 13, 3, NULL, '2021-08-21', NULL, 'f027f12e-dba7-4151-b224-20fff7caaf82', '1'),
(74, '2021-08-21 00:00:00', 14, 3, NULL, '2021-08-21', NULL, 'f027f12e-dba7-4151-b224-20fff7caaf82', '1'),
(75, '2021-08-21 00:00:00', 15, 3, NULL, '2021-08-21', NULL, 'f027f12e-dba7-4151-b224-20fff7caaf82', '1'),
(76, '2021-08-21 00:00:00', 10, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(77, '2021-08-21 00:00:00', 11, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(78, '2021-08-21 00:00:00', 12, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(79, '2021-08-21 00:00:00', 13, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(80, '2021-08-21 00:00:00', 14, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(81, '2021-08-21 00:00:00', 15, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(82, '2021-08-21 00:00:00', 16, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(83, '2021-08-21 00:00:00', 17, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(84, '2021-08-21 00:00:00', 18, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(85, '2021-08-21 00:00:00', 19, 3, NULL, '2021-08-21', NULL, '2b6f478f-0c84-4fb6-8b33-b4157868e75a', '1'),
(86, '2021-08-22 00:00:00', 10, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(87, '2021-08-22 00:00:00', 11, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(88, '2021-08-22 00:00:00', 12, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(89, '2021-08-22 00:00:00', 13, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(90, '2021-08-22 00:00:00', 14, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(91, '2021-08-22 00:00:00', 15, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(92, '2021-08-22 00:00:00', 16, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(93, '2021-08-22 00:00:00', 17, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(94, '2021-08-22 00:00:00', 18, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(95, '2021-08-22 00:00:00', 19, 3, NULL, '2021-08-22', NULL, '6d587cec-20c0-4be6-9907-ea884beb7c18', '1'),
(96, '2021-08-23 00:00:00', 5, 2, NULL, '2021-08-23', NULL, '39f33214-b879-4495-b2b1-94bdb458da59', '1'),
(97, '2021-08-23 00:00:00', 6, 2, NULL, '2021-08-23', NULL, '39f33214-b879-4495-b2b1-94bdb458da59', '1'),
(98, '2021-08-23 00:00:00', 7, 2, NULL, '2021-08-23', NULL, '39f33214-b879-4495-b2b1-94bdb458da59', '1'),
(99, '2021-08-24 00:00:00', 10, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(100, '2021-08-24 00:00:00', 11, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(101, '2021-08-24 00:00:00', 12, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(102, '2021-08-24 00:00:00', 13, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(103, '2021-08-24 00:00:00', 14, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(104, '2021-08-24 00:00:00', 15, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(105, '2021-08-24 00:00:00', 16, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(106, '2021-08-24 00:00:00', 17, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(107, '2021-08-24 00:00:00', 18, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(108, '2021-08-24 00:00:00', 19, 3, NULL, '2021-08-24', NULL, '519d21c3-a2bb-4ab5-8587-6a83bc951779', '1'),
(109, '2021-08-24 00:00:00', 10, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(110, '2021-08-24 00:00:00', 11, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(111, '2021-08-24 00:00:00', 12, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(112, '2021-08-24 00:00:00', 13, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(113, '2021-08-24 00:00:00', 14, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(114, '2021-08-24 00:00:00', 15, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(115, '2021-08-24 00:00:00', 16, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(116, '2021-08-24 00:00:00', 17, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(117, '2021-08-24 00:00:00', 18, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(118, '2021-08-24 00:00:00', 19, 3, NULL, '2021-08-24', NULL, '81197b11-a33c-42d5-bf29-24bff08a9c8c', '1'),
(119, '2021-08-26 00:00:00', 10, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(120, '2021-08-26 00:00:00', 11, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(121, '2021-08-26 00:00:00', 12, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(122, '2021-08-26 00:00:00', 13, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(123, '2021-08-26 00:00:00', 14, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(124, '2021-08-26 00:00:00', 15, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(125, '2021-08-26 00:00:00', 16, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(126, '2021-08-26 00:00:00', 17, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(127, '2021-08-26 00:00:00', 18, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(128, '2021-08-26 00:00:00', 19, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(129, '2021-08-26 00:00:00', 20, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(130, '2021-08-26 00:00:00', 21, 3, NULL, '2021-08-26', NULL, 'f95110ad-0e8f-47da-8bf3-ad2640ab72fe', '1'),
(131, '2021-08-26 00:00:00', 10, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(132, '2021-08-26 00:00:00', 11, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(133, '2021-08-26 00:00:00', 12, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(134, '2021-08-26 00:00:00', 13, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(135, '2021-08-26 00:00:00', 14, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(136, '2021-08-26 00:00:00', 15, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(137, '2021-08-26 00:00:00', 16, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(138, '2021-08-26 00:00:00', 17, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(139, '2021-08-26 00:00:00', 18, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(140, '2021-08-26 00:00:00', 19, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(141, '2021-08-26 00:00:00', 20, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1'),
(142, '2021-08-26 00:00:00', 21, 3, NULL, '2021-08-26', NULL, 'ca4a2254-f92d-403e-b843-42483d24eaea', '1');

-- --------------------------------------------------------

--
-- Structure de la table `user_operations`
--

CREATE TABLE `user_operations` (
  `user_operation_id` int(11) NOT NULL,
  `operation_date` datetime DEFAULT NULL,
  `created_by_user_id` int(11) DEFAULT NULL,
  `operation_id` int(11) NOT NULL,
  `company_token` varchar(45) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  `application_uuid` varchar(105) DEFAULT NULL,
  `data_version` varchar(105) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_operations`
--

INSERT INTO `user_operations` (`user_operation_id`, `operation_date`, `created_by_user_id`, `operation_id`, `company_token`, `inventory_id`, `application_uuid`, `data_version`) VALUES
(1, '2021-07-14 14:47:43', 1, 1, 'TEST08072021', NULL, '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(2, '2021-07-14 14:47:43', 1, 1, 'TEST08072021', NULL, '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(3, '2021-07-14 14:47:43', 1, 1, 'TEST08072021', NULL, '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(4, '2021-07-14 14:47:43', 1, 1, 'TEST08072021', NULL, '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(5, '2021-07-14 14:47:43', 1, 1, 'TEST08072021', NULL, '041750ce-e473-462c-af82-99567dc25b4b', '1'),
(6, '2021-07-14 14:47:43', 1, 1, 'TEST08072021', NULL, '041750ce-e473-462c-af82-99567dc25b4b', '1');

-- --------------------------------------------------------

--
-- Structure de la table `validate_password`
--

CREATE TABLE `validate_password` (
  `validate_id` int(11) NOT NULL,
  `verify_code` varchar(45) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `is_used` tinyint(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `validate_password`
--

INSERT INTO `validate_password` (`validate_id`, `verify_code`, `created_date`, `is_used`, `user_id`) VALUES
(1, 'YPF3UEZnGD', '2021-08-02 14:16:00', 1, 1),
(2, 'yOaXTUOZSc', '2021-08-02 15:29:00', 0, 1),
(3, 'ZWeuPogEYK', '2021-08-02 15:49:00', 0, 1),
(4, 'nmbjot6fuk', '2021-08-02 16:42:00', 0, 2),
(5, 'T8YUB0rB2Q', '2021-08-02 16:46:00', 0, 2),
(6, 'fuGbFJ18EY', '2021-08-02 16:54:00', 0, 2),
(7, 'wBNY5fcy57', '2021-08-02 18:12:00', 0, 2),
(8, '4WX37mGSMa', '2021-08-02 19:52:00', 0, 2),
(9, 'Vbi9sndSHJ', '2021-08-02 20:33:00', 0, 2),
(10, 'ICjpfAYRNl', '2021-08-02 20:53:00', 0, 2),
(11, 'KvTRfuJ4lj', '2021-08-02 23:36:00', 0, 2),
(12, 'PlYvpREsOq', '2021-08-02 23:39:00', 0, 2),
(13, 'd9v84ENcw8', '2021-08-03 00:35:00', 0, 2),
(14, 'Zsca15BxNx', '2021-08-03 00:46:00', 0, 2),
(15, 'sHoyslWsC7', '2021-08-03 01:00:00', 0, 2),
(16, 'xaW8JqTHjT', '2021-08-03 09:03:00', 0, 2),
(17, 'kWzrtYMrFF', '2021-08-03 14:04:00', 0, 2),
(18, 'oH8WvSkNUf', '2021-08-03 15:01:00', 0, 2),
(19, 'PcKxM8bct2', '2021-08-03 15:15:00', 0, 2),
(20, '7DfaQbX5up', '2021-08-03 15:55:00', 0, 2),
(21, '03GhLKe4kL', '2021-08-03 17:26:00', 0, 1),
(22, 'tYzf6hylrG', '2021-08-03 17:34:00', 0, 1),
(23, 'N8KnvrdZnO', '2021-08-03 17:34:00', 0, 1),
(24, 'rFbLQxCr0l', '2021-08-04 19:39:00', 0, 2),
(25, 'wWpxOqhiFs', '2021-08-04 21:45:00', 0, 2),
(26, 'yy7BPUZYb2', '2021-08-05 13:51:00', 0, 1),
(27, '22980', '2021-08-05 14:34:00', 1, 1),
(28, '24480', '2021-08-05 14:58:00', 0, 2),
(29, '20887', '2021-08-05 16:08:00', 0, 2),
(30, '14064', '2021-08-05 16:09:00', 0, 2),
(31, '21598', '2021-08-05 16:12:00', 1, 2),
(32, '16860', '2021-08-05 16:26:00', 1, 2),
(33, '23442', '2021-08-05 17:13:00', 1, 1),
(34, '25174', '2021-08-07 09:52:00', 1, 1),
(35, '13036', '2021-08-09 13:19:00', 1, 2),
(36, '14718', '2021-08-09 16:37:00', 1, 1),
(37, '15771', '2021-08-11 18:01:00', 1, 2),
(38, '18682', '2021-08-12 05:52:00', 0, 1),
(39, '16820', '2021-08-12 06:01:00', 0, 1),
(40, '14550', '2021-08-12 06:08:00', 0, 1),
(41, '14265', '2021-08-13 13:54:00', 0, 2),
(42, '12045', '2021-08-17 14:59:00', 0, 1),
(43, '17319', '2021-08-17 16:08:00', 0, 1),
(44, '23538', '2021-08-18 09:53:00', 1, 2),
(45, '14876', '2021-08-18 15:18:00', 1, 2),
(46, '13437', '2021-08-20 12:34:00', 1, 2),
(47, '21545', '2021-08-21 15:39:00', 1, 3),
(48, '13183', '2021-08-21 18:25:00', 1, 3),
(49, '14569', '2021-08-22 12:03:00', 1, 3),
(50, '24901', '2021-08-22 12:23:00', 1, 3),
(51, '14455', '2021-08-23 11:01:00', 1, 2),
(52, '20710', '2021-08-23 20:43:00', 1, 3),
(53, '10637', '2021-08-24 02:43:00', 1, 3),
(54, '23580', '2021-08-24 13:53:00', 1, 3),
(55, '14126', '2021-08-26 10:29:00', 0, 3),
(56, '14896', '2021-08-26 10:42:00', 0, 3),
(57, '13324', '2021-08-26 10:45:00', 1, 3),
(58, '19472', '2021-08-26 11:27:00', 1, 3),
(59, '19532', '2021-08-29 17:30:00', 1, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_addresses_companies1_idx` (`company_id`),
  ADD KEY `fk_addresses_countries1_idx` (`country_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Index pour la table `category_ussd`
--
ALTER TABLE `category_ussd`
  ADD PRIMARY KEY (`category_ussd_id`),
  ADD KEY `fk_category_ussd_categories1_idx` (`category_id`),
  ADD KEY `fk_category_ussd_operation_types1_idx` (`operation_type_id`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Index pour la table `database_version`
--
ALTER TABLE `database_version`
  ADD PRIMARY KEY (`database_version_id`);

--
-- Index pour la table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`inventory_id`);

--
-- Index pour la table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD PRIMARY KEY (`inventory_detail_id`),
  ADD KEY `operation_type_id` (`operation_type_id`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Index pour la table `licences`
--
ALTER TABLE `licences`
  ADD PRIMARY KEY (`licence_id`),
  ADD KEY `fk_licences_licence_types1_idx` (`licence_type_id`);

--
-- Index pour la table `licence_features`
--
ALTER TABLE `licence_features`
  ADD PRIMARY KEY (`licence_feature_id`,`licence_id`,`service_id`) USING BTREE,
  ADD KEY `service_id` (`service_id`),
  ADD KEY `fk_licence_features_licences_idx` (`licence_id`);

--
-- Index pour la table `licence_types`
--
ALTER TABLE `licence_types`
  ADD PRIMARY KEY (`licence_type_id`);

--
-- Index pour la table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`operation_id`),
  ADD KEY `fk_operations_operation_types1_idx` (`operation_type_id`);

--
-- Index pour la table `operation_types`
--
ALTER TABLE `operation_types`
  ADD PRIMARY KEY (`operation_type_id`);

--
-- Index pour la table `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `fk_rapport_user_idx` (`user_id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Index pour la table `sms_tracker`
--
ALTER TABLE `sms_tracker`
  ADD PRIMARY KEY (`tracker_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_addresses1_idx` (`address_id`),
  ADD KEY `fk_users_companies1_idx` (`company_id`),
  ADD KEY `licence_id` (`licence_id`);

--
-- Index pour la table `user_connections`
--
ALTER TABLE `user_connections`
  ADD PRIMARY KEY (`connection_id`);

--
-- Index pour la table `user_has_features`
--
ALTER TABLE `user_has_features`
  ADD PRIMARY KEY (`user_has_licence_id`),
  ADD KEY `fk_user_has_features_licence_features1_idx` (`licence_feature_id`),
  ADD KEY `fk_user_has_features_users1_idx` (`user_id`);

--
-- Index pour la table `user_operations`
--
ALTER TABLE `user_operations`
  ADD PRIMARY KEY (`user_operation_id`),
  ADD KEY `fk_user_operations_users1_idx` (`created_by_user_id`),
  ADD KEY `fk_user_operations_operations1_idx` (`operation_id`),
  ADD KEY `fk_user_operations_inventories1_idx` (`inventory_id`);

--
-- Index pour la table `validate_password`
--
ALTER TABLE `validate_password`
  ADD PRIMARY KEY (`validate_id`),
  ADD KEY `fk_validate_password_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `category_ussd`
--
ALTER TABLE `category_ussd`
  MODIFY `category_ussd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `database_version`
--
ALTER TABLE `database_version`
  MODIFY `database_version_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  MODIFY `inventory_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `licences`
--
ALTER TABLE `licences`
  MODIFY `licence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `licence_features`
--
ALTER TABLE `licence_features`
  MODIFY `licence_feature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `licence_types`
--
ALTER TABLE `licence_types`
  MODIFY `licence_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `operations`
--
ALTER TABLE `operations`
  MODIFY `operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `operation_types`
--
ALTER TABLE `operation_types`
  MODIFY `operation_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sms_tracker`
--
ALTER TABLE `sms_tracker`
  MODIFY `tracker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user_connections`
--
ALTER TABLE `user_connections`
  MODIFY `connection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user_has_features`
--
ALTER TABLE `user_has_features`
  MODIFY `user_has_licence_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT pour la table `user_operations`
--
ALTER TABLE `user_operations`
  MODIFY `user_operation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `validate_password`
--
ALTER TABLE `validate_password`
  MODIFY `validate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `fk_addresses_countries1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`);

--
-- Contraintes pour la table `category_ussd`
--
ALTER TABLE `category_ussd`
  ADD CONSTRAINT `fk_category_ussd_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `fk_category_ussd_operation_types1` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`);

--
-- Contraintes pour la table `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD CONSTRAINT `inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`inventory_id`),
  ADD CONSTRAINT `operation_type_id` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`);

--
-- Contraintes pour la table `licences`
--
ALTER TABLE `licences`
  ADD CONSTRAINT `fk_licences_licence_types1` FOREIGN KEY (`licence_type_id`) REFERENCES `licence_types` (`licence_type_id`);

--
-- Contraintes pour la table `licence_features`
--
ALTER TABLE `licence_features`
  ADD CONSTRAINT `fk_licence_features_licences` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`licence_id`),
  ADD CONSTRAINT `licence_features_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Contraintes pour la table `operations`
--
ALTER TABLE `operations`
  ADD CONSTRAINT `fk_operations_operation_types1` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`);

--
-- Contraintes pour la table `password_histories`
--
ALTER TABLE `password_histories`
  ADD CONSTRAINT `fk_rapport_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_addresses1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`address_id`),
  ADD CONSTRAINT `fk_users_companies1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `licence_id` FOREIGN KEY (`licence_id`) REFERENCES `licences` (`licence_id`);

--
-- Contraintes pour la table `user_operations`
--
ALTER TABLE `user_operations`
  ADD CONSTRAINT `fk_user_operations_inventories1` FOREIGN KEY (`inventory_id`) REFERENCES `inventories` (`inventory_id`),
  ADD CONSTRAINT `fk_user_operations_operations1` FOREIGN KEY (`operation_id`) REFERENCES `operations` (`operation_id`),
  ADD CONSTRAINT `fk_user_operations_users1` FOREIGN KEY (`created_by_user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
