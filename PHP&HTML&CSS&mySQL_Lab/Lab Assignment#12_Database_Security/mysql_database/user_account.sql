CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminadmin';
GRANT ALL PRIVILEGES ON `bank`.* TO 'admin'@'localhost';

CREATE USER 'staff'@'localhost' IDENTIFIED BY 'staffstaff';
GRANT SELECT, UPDATE ON `bank`.* TO 'staff'@'localhost';

CREATE USER 'customer'@'localhost' IDENTIFIED BY 'custcust';
GRANT SELECT ON `bank`.* TO 'customer'@'localhost';

USE bank;
SELECT DATABASE();

ALTER TABLE `account` MODIFY COLUMN `No.` VARBINARY(50);
UPDATE `account` SET `No.` = AES_ENCRYPT(`No.`, SHA2('No.', 256));

ALTER TABLE `account` MODIFY COLUMN `Name` VARBINARY(50);
UPDATE `account` SET `Name` = AES_ENCRYPT(`Name`, SHA2('Name', 256));

CREATE VIEW `view_account` AS
SELECT `No.` AS `Account No.`, `Name`, `bal` AS `Balance`
FROM `account`;
SELECT * FROM `view_account`;