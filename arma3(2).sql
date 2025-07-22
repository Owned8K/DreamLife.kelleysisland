-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 22 juil. 2025 à 10:40
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `arma3`
--

DELIMITER $$
--
-- Procédures
--
$$

$$

$$

$$

$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `owner_name` varchar(32) NOT NULL,
  `owner_uid` varchar(17) NOT NULL,
  `bank` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `companies`
--

INSERT INTO `companies` (`id`, `name`, `owner_name`, `owner_uid`, `bank`) VALUES
(3, 'Test', 'Robert Fallange', '76561197991887047', 299000000);

-- --------------------------------------------------------

--
-- Structure de la table `company_employees`
--

CREATE TABLE `company_employees` (
  `company_id` int(11) NOT NULL,
  `player_uid` varchar(17) NOT NULL,
  `player_name` varchar(32) NOT NULL,
  `role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `company_payments`
--

CREATE TABLE `company_payments` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `player_uid` varchar(50) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `company_payments`
--

INSERT INTO `company_payments` (`id`, `company_id`, `player_uid`, `player_name`, `amount`, `payment_date`) VALUES
(1, 3, '76561198135268292', 'Didou Rayz', 700, '2025-07-19 05:35:15'),
(2, 3, '76561198135268292', 'Didou Rayz', 2000, '2025-07-19 07:00:44'),
(3, 3, '76561198135268292', 'Didou Rayz', 2000, '2025-07-19 07:34:25'),
(4, 3, '76561198135268292', 'Didou Rayz', 1500, '2025-07-19 07:34:53'),
(5, 3, '76561198135268292', 'Didou Rayz', 6000, '2025-07-19 14:11:58'),
(6, 3, '76561198135268292', 'Didou Rayz', 10000, '2025-07-19 14:12:06'),
(7, 3, '76561198135268292', 'Didou Rayz', 7000, '2025-07-19 14:12:11'),
(8, 3, '76561198135268292', 'Didou Rayz', 973536, '2025-07-19 14:12:47');

-- --------------------------------------------------------

--
-- Structure de la table `containers`
--

CREATE TABLE `containers` (
  `id` int(11) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(32) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `owned` tinyint(4) NOT NULL DEFAULT 0,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gangs`
--

CREATE TABLE `gangs` (
  `id` int(11) NOT NULL,
  `owner` varchar(17) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text DEFAULT NULL,
  `maxmembers` int(11) DEFAULT 8,
  `bank` int(11) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gangs`
--

INSERT INTO `gangs` (`id`, `owner`, `name`, `members`, `maxmembers`, `bank`, `active`, `insert_time`) VALUES
(1, '76561197991887047', 'Your Gang Name', '\"[`76561197991887047`]\"', 8, 0, 1, '2025-07-16 10:05:05');

-- --------------------------------------------------------

--
-- Structure de la table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(32) DEFAULT NULL,
  `owned` tinyint(4) DEFAULT 0,
  `garage` tinyint(4) NOT NULL DEFAULT 0,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE `players` (
  `uid` int(11) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `cash` int(11) NOT NULL DEFAULT 0,
  `bankacc` int(11) NOT NULL DEFAULT 0,
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `civ_stats` varchar(25) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_stats` varchar(25) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(25) NOT NULL DEFAULT '"[100,100,0]"',
  `arrested` tinyint(4) NOT NULL DEFAULT 0,
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donorlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `blacklist` tinyint(4) NOT NULL DEFAULT 0,
  `civ_alive` tinyint(4) NOT NULL DEFAULT 0,
  `civ_position` varchar(32) NOT NULL DEFAULT '"[]"',
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `players`
--

INSERT INTO `players` (`uid`, `pid`, `name`, `aliases`, `cash`, `bankacc`, `coplevel`, `mediclevel`, `civ_licenses`, `cop_licenses`, `med_licenses`, `civ_gear`, `cop_gear`, `med_gear`, `civ_stats`, `cop_stats`, `med_stats`, `arrested`, `adminlevel`, `donorlevel`, `blacklist`, `civ_alive`, `civ_position`, `playtime`, `insert_time`, `last_seen`) VALUES
(2, '76561197991887047', 'Robert Fallange', '\"[`Robert Fallange`]\"', 132000, 29491050, '0', '0', '\"[[`license_civ_driver`,1],[`license_civ_boat`,1],[`license_civ_pilot`,1],[`license_civ_trucking`,1],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,1],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,0],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_logistician`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[]\"', '\"[]\"', '\"[`U_C_Poloshirt_burgundy`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[]\"', '\"[]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', 0, '5', '0', 0, 1, '\"[967.791,4985.31,0.00143862]\"', '\"[]\"', '2025-07-15 23:52:42', '2025-07-18 19:51:57'),
(3, '76561198135268292', 'Didou Rayz', '\"[`Didou Rayz`]\"', 0, 1000036, '0', '0', '\"[[`license_civ_driver`,1],[`license_civ_boat`,1],[`license_civ_pilot`,1],[`license_civ_trucking`,1],[`license_civ_gun`,0],[`license_civ_dive`,0],[`license_civ_home`,1],[`license_civ_oil`,0],[`license_civ_diamond`,0],[`license_civ_salt`,0],[`license_civ_sand`,0],[`license_civ_iron`,0],[`license_civ_copper`,0],[`license_civ_cement`,0],[`license_civ_medmarijuana`,0],[`license_civ_logistician`,0],[`license_civ_cocaine`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_rebel`,0]]\"', '\"[]\"', '\"[]\"', '\"[`U_C_Poloshirt_tricolour`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``],[]]\"', '\"[]\"', '\"[]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', '\"[100,100,0]\"', 0, '5', '0', 0, 1, '\"[1654.66,1910.83,0.00143909]\"', '\"[]\"', '2025-07-18 10:29:16', '2025-07-19 14:12:47');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `steam_id` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `discord_username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `steam_id`, `password_hash`, `created_at`, `discord_username`) VALUES
(6, 'Owned8K', 'owned8k@gamil.com', '76561197991887047', '$2y$10$jsaJ5hGtaI.EIfsXV80C.eU9cZ/Wuudihlr0LjfFeW6/zBnCpZvy.', '2025-07-15 16:44:47', 'owned8k');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `side` varchar(10) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `alive` tinyint(4) NOT NULL DEFAULT 1,
  `blacklist` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `plate` mediumint(9) NOT NULL,
  `color` int(11) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT 1,
  `damage` varchar(256) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`id`, `pid`, `side`, `classname`, `type`, `alive`, `blacklist`, `active`, `plate`, `color`, `inventory`, `gear`, `fuel`, `damage`, `insert_time`) VALUES
(1, '76561197991887047', 'civ', 'C_SUV_01_F', 'Car', 1, 0, 0, 866506, 2, '\"[[],0]\"', '\"[]\"', 1, '\"[]\"', '2025-07-18 19:32:10'),
(2, '76561198135268292', 'civ', 'C_Kart_01_Red_F', 'Car', 1, 0, 0, 22591, 0, '\"[[],0]\"', '\"[]\"', 1, '\"[]\"', '2025-07-18 19:38:24'),
(3, '76561197991887047', 'civ', 'C_Kart_01_Fuel_F', 'Car', 1, 0, 0, 104384, 0, '\"[[],0]\"', '\"[]\"', 1, '\"[]\"', '2025-07-18 19:41:12'),
(4, '76561197991887047', 'civ', 'C_Kart_01_Vrana_F', 'Car', 1, 0, 0, 780437, 0, '\"[[],0]\"', '\"[]\"', 1, '\"[]\"', '2025-07-18 19:51:57');

-- --------------------------------------------------------

--
-- Structure de la table `wanted`
--

CREATE TABLE `wanted` (
  `wantedID` varchar(17) NOT NULL,
  `wantedName` varchar(32) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `insert_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_company_name` (`name`),
  ADD KEY `idx_owner_uid` (`owner_uid`);

--
-- Index pour la table `company_employees`
--
ALTER TABLE `company_employees`
  ADD PRIMARY KEY (`company_id`,`player_uid`);

--
-- Index pour la table `company_payments`
--
ALTER TABLE `company_payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `containers`
--
ALTER TABLE `containers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_players_containers` (`pid`);

--
-- Index pour la table `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`),
  ADD KEY `fkIdx_players_gangs` (`owner`);

--
-- Index pour la table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_players_houses` (`pid`);

--
-- Index pour la table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `unique_uid` (`uid`),
  ADD KEY `index_name` (`name`),
  ADD KEY `index_blacklist` (`blacklist`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkIdx_players_vehicles` (`pid`),
  ADD KEY `index_side` (`side`),
  ADD KEY `index_type` (`type`);

--
-- Index pour la table `wanted`
--
ALTER TABLE `wanted`
  ADD PRIMARY KEY (`wantedID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `company_payments`
--
ALTER TABLE `company_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `containers`
--
ALTER TABLE `containers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gangs`
--
ALTER TABLE `gangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `players`
--
ALTER TABLE `players`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `company_employees`
--
ALTER TABLE `company_employees`
  ADD CONSTRAINT `company_employees_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Contraintes pour la table `containers`
--
ALTER TABLE `containers`
  ADD CONSTRAINT `FK_players_containers` FOREIGN KEY (`pid`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `gangs`
--
ALTER TABLE `gangs`
  ADD CONSTRAINT `FK_players_gangs` FOREIGN KEY (`owner`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `houses`
--
ALTER TABLE `houses`
  ADD CONSTRAINT `FK_players_houses` FOREIGN KEY (`pid`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `FK_players_vehicles` FOREIGN KEY (`pid`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `wanted`
--
ALTER TABLE `wanted`
  ADD CONSTRAINT `FK_players_wanted` FOREIGN KEY (`wantedID`) REFERENCES `players` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
