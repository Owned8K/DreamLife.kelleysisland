-- Script pour créer la table company_payments
-- Cette table stocke l'historique des paiements des employés

CREATE TABLE IF NOT EXISTS `company_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `player_uid` varchar(32) NOT NULL,
  `player_name` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `player_uid` (`player_uid`),
  KEY `payment_date` (`payment_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Ajouter une contrainte de clé étrangère si la table companies existe
-- ALTER TABLE `company_payments` ADD CONSTRAINT `fk_company_payments_company` 
-- FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE; 