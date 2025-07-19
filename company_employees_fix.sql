-- Script pour vérifier et corriger la table company_employees
-- Cette table stocke les employés des entreprises

-- Vérifier si la table existe, sinon la créer
CREATE TABLE IF NOT EXISTS `company_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `player_uid` varchar(32) NOT NULL,
  `player_name` varchar(64) NOT NULL,
  `role` varchar(32) NOT NULL DEFAULT 'employee',
  `hire_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_employee` (`company_id`, `player_uid`),
  KEY `company_id` (`company_id`),
  KEY `player_uid` (`player_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Vérifier si la colonne role existe, sinon l'ajouter
SET @sql = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
   WHERE TABLE_SCHEMA = DATABASE() 
   AND TABLE_NAME = 'company_employees' 
   AND COLUMN_NAME = 'role') > 0,
  'SELECT "Column role already exists"',
  'ALTER TABLE company_employees ADD COLUMN role varchar(32) NOT NULL DEFAULT "employee"'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Vérifier si la colonne hire_date existe, sinon l'ajouter
SET @sql = (SELECT IF(
  (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS 
   WHERE TABLE_SCHEMA = DATABASE() 
   AND TABLE_NAME = 'company_employees' 
   AND COLUMN_NAME = 'hire_date') > 0,
  'SELECT "Column hire_date already exists"',
  'ALTER TABLE company_employees ADD COLUMN hire_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP'
));
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt; 