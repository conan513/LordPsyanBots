INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1015, 'Command: world chat');

INSERT INTO `rbac_linked_permissions` (`id`,`linkedId`) VALUES
(195, 1015); 
 
CREATE TABLE `hacked` (
 `charname` CHAR( 50) NOT NULL
);

CREATE TABLE `lagreports` (
 `account` CHAR( 50) NOT NULL
);

CREATE TABLE `vipek2` (
 `account` CHAR( 50) NOT NULL
); 
 
