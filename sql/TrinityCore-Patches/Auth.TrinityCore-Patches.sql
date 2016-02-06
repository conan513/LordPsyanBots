/* 
* auth.jail.sql 
*/ 
DELETE FROM `rbac_permissions` WHERE `id` IN (901,902,903,904);
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(901, 'Command: jail player'),
(902, 'Command: jail info'),
(903, 'Command: jail release'),
(904, 'Command: jail reload');

DELETE FROM `rbac_linked_permissions` WHERE `linkedid` IN (901,902,903,904);
INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(193, 901),
(195, 902),
(193, 903),
(193, 904); 
 
/* 
* auth.worldchat.sql 
*/ 
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1015, 'Command: world chat');

INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(195, 1015); 
 
/* 
* auth_AIO.sql 
*/ 
CREATE TABLE `hacked` (
 `charname` CHAR( 50) NOT NULL
);

CREATE TABLE `lagreports` (
 `account` CHAR( 50) NOT NULL
);

CREATE TABLE `vipek2` (
 `account` CHAR( 50) NOT NULL
); 
 
