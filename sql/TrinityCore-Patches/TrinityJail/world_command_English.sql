/* World Command English */
DELETE FROM `command` WHERE name IN ('jail player','jail info','jail release','jail reload');
INSERT INTO `command` (name, permission, help) VALUES
('jail player', 1, 'Syntax: .jail player character hours reason\nJailed the \'character\' for \'hours\' with the \'reason\'.'),
('jail info', 0, 'Syntax: .jailinfo\nShows your jail status.'),
('jail release', 1, 'Syntax: .release character\nRealeases the \'character\' out of the jail.'),
('jail reload', 3, 'Syntax: .jailreload\nLoads the jail config new.');
