/* 
* world-beastmaster.sql 
*/ 
DROP TABLE IF EXISTS `beastmaster`;

CREATE TABLE `beastmaster` (
  `entry` INT(5) NOT NULL DEFAULT '0' COMMENT 'Pet entry number',
  `cat_number` INT(5) NOT NULL DEFAULT '0' COMMENT '0-normal pet 1-exotic pet 2-pet spell',
  `tokenOrGold` TINYINT(1) DEFAULT '0' COMMENT '0 = gold 1 = token',
  `cost` INT(10) NOT NULL DEFAULT '0' COMMENT 'Amount in copper if tokenOrGold is 0 else number of tokens',
  `token` INT(10) NOT NULL DEFAULT '0' COMMENT 'Token entry number (item_template.entry)',
  `name` VARCHAR(255) DEFAULT NULL COMMENT 'Name of pet or name of pet spell',
  `spell` INT(10) NOT NULL DEFAULT '0' COMMENT 'Spell entry number.',
  PRIMARY KEY (`entry`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='Beastmaster System by LordPsyan';

/*Data for the table `beastmaster` */

INSERT INTO `beastmaster` (`entry`, `cat_number`, `tokenOrGold`, `cost`, `token`, `name`, `spell`) VALUES
('1','0','1','1000','0','Spider','2349'),
('2','0','0','1000','0','Bat','28233'),
('3','0','0','1000','0','Bear','29319'),
('4','0','0','1000','0','Boar','29996'),
('5','0','0','1000','0','Cat','28097'),
('6','0','0','1000','0','Carrion Bird','26838'),
('7','0','0','1000','0','Crab','24478'),
('8','0','0','1000','0','Crocolisk','1417'),
('9','0','0','1000','0','Dragonhawk','27946'),
('10','0','0','1000','0','Gorilla','28213'),
('11','0','0','1000','0','Hyena','13036'),
('12','0','0','1000','0','Moth','27421'),
('13','0','0','1000','0','Owl','23136'),
('14','0','0','1000','0','Raveger','17199'),
('15','0','0','1000','0','Raptor','14821'),
('16','0','0','1000','0','Serpent','28358'),
('17','0','0','1000','0','Bug','28085'),
('18','0','0','1000','0','Strider','22807'),
('19','0','0','1000','0','Scorpid','9698'),
('20','1','0','1000','0','Chimaera','21879'),
('21','1','0','1000','0','Core Hound','21108'),
('22','1','0','1000','0','Devilsaur','20931'),
('23','1','0','1000','0','Rhino','30445'),
('24','1','0','1000','0','Silithid','5460'),
('25','1','0','1000','0','Worm','30148'),
('26','1','0','1000','0','Loque\'nahak','32517'),
('27','1','0','1000','0','Skoll','35189'),
('28','1','0','1000','0','Gondria','33776'),
('29','2','1','1000','0','Feed Pet','6991'),
('30','2','0','1000','0','Call Pet','883'),
('31','2','0','1000','0','Dismiss Pet','2641'),
('32','2','0','1000','0','Mend Pet','136'),
('33','2','0','1000','0','Revive Pet','982');

-- Beastmaster NPC

DELETE FROM `creature_template` WHERE `entry` = 99990;

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('99990','0','0','0','0','0','26789','0','0','0','LordPsyan','Beastmaster Service','','0','80','80','0','35','129','1','1.14286','0.75','1','0','1500','0','1','1','1','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','1','0','0','1','0','0','Npc_Beastmaster','0');

-- Sample npc vendor data for beastmaster

DELETE FROM `npc_vendor` WHERE `entry` = 99990;

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES
('99990','0','4540','0','0','0'),
('99990','0','4541','0','0','0'),
('99990','0','4542','0','0','0');
 
 
/* 
* world.bloodmoneyduel.sql 
*/ 
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RegenHealth`, `flags_extra`, `ScriptName`) VALUES (100001, 26502, 'Duel Master', 83, 83, 35, 1, 1, 1.14286, 2, 1, 1, 1, 1, 2, 2048, 3, 1, 1, 1, 1, 1, 1, 1, 2, 'npc_blood_money'); 
 
/* 
* world.BountyHunter.sql 
*/ 
-- Bounty Hunter NPC

DELETE FROM `creature_template` WHERE (`entry`=99014);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
('99014','0','0','0','0','0','24818','3422','24819','24821','George','Bounty Hunter','','0','80','80','0','35','1','1','1.14286','1','0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','5','1','1','1','1','0','0','1','0','0','BountyHunter','1');
 
 
/* 
* world.enchant.sql 
*/ 
-- Creature template. Young woman enchantress
DELETE FROM `creature_template` WHERE `entry` = 100067;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('100067','0','0','0','0','0','2591','0','0','0','Young Woman','You need it, I got it.','','0','80','80','0','35','1','1','1.14286','1','1','0','1500','0','1','1','1','0','2048','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','EventAI','0','3','1','1','1','1','1','1','0','0','1','0','0','npc_enchantment','0');
 
 
/* 
* world.levelnpc.sql 
*/ 
-- Creature_template entry. Make sure entry number does not conflict.
DELETE FROM `creature_template` WHERE `entry` = 60003;

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('60003','0','0','0','0','0','2591','0','0','0','Lucy','Level NPC','','0','80','80','0','35','1','1','1.14286','1','1','0','1500','0','1','1','1','0','2048','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','EventAI','0','3','1','1','1','1','1','1','0','0','1','0','0','levelnpc','0'); 
 
/* 
* world.lottery.sql 
*/ 
DELETE FROM `trinity_string` where `entry` IN ('11010', '11011', '11012');
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES ('11010', '|cffff0000[Lottery]: The contest is over! Total bets involved: %u. The winning numbers: %s. The Jackpot contains %u gold and was not paid.|r');
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES ('11011', '|cffff0000[Lottery]: The contest is over! Total bets involved: %u. The winning numbers: %s.  %s hit the Jackpot and wins %u gold! Congratulations!|r');
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES ('11012', '|cffff0000[Lottery]: The contest is over! Total bets involved: %u. The winning numbers: %s.  %u players hit the Jackpot and everyone wins %u gold. Congratulations!|r');

DROP TABLE IF EXISTS `lottery_winners`;
CREATE TABLE `lottery_winners` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(12) NOT NULL,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `bet` longtext NOT NULL,
  `betPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lottery_bets`;
CREATE TABLE `lottery_bets` (
  `id` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(12) NOT NULL,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `bet` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numbers` longtext NOT NULL,
  `jackpot` int(10) unsigned NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


REPLACE INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`, `announce`) VALUES
(132, '2013-08-21 20:00:00', '2020-12-31 06:00:00', 1440, 1, 0, 'Lottery', 0, 2);


DELETE FROM `creature_template` WHERE (`entry`=99013);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
('99013', '0', '0', '0', '0', '0', '7993', '0', '0', '0', '"Lucky" Bob', '', NULL, '0', '80', '80', '0', '35', '1', '1', '1.14286', '0.75', '0', '0', '1400', '1900', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', 'npc_lottery', '12340');
 
 
/* 
* world.npc_teleport.sql 
*/ 
DROP TABLE IF EXISTS `custom_npc_tele_category`;
CREATE TABLE `custom_npc_tele_category` (
  `id` int(6) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `flag` tinyint(3) unsigned NOT NULL default '0',
  `data0` bigint(20) unsigned NOT NULL default '0',
  `data1` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_destination`;
CREATE TABLE `custom_npc_tele_destination` (
  `id` int(6) unsigned NOT NULL auto_increment,
  `name` char(100) NOT NULL default '',
  `pos_X` float NOT NULL default '0',
  `pos_Y` float NOT NULL default '0',
  `pos_Z` float NOT NULL default '0',
  `map` smallint(5) unsigned NOT NULL default '0',
  `orientation` float NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `cost` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_npc_tele_association`;
CREATE TABLE `custom_npc_tele_association` (
  `cat_id` int(6) unsigned NOT NULL default '0',
  `dest_id` int(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`, `dest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

TRUNCATE `custom_npc_tele_category`;
INSERT INTO `custom_npc_tele_category`
   (`id`, `name`, `flag`, `data0`, `data1`)
VALUES
   (1, 'Cities', 0, 1, 0),
   (2, 'Cities', 0, 2, 0),
   (3, 'Battlegrounds', 0, 1, 0),
   (4, 'Battlegrounds', 0, 2, 0),
   (5, 'Arenas', 0, 0, 0),
   (6, '[Instances Lvl 1-60]', 0, 0, 0),
   (7, '[Instances Lvl 60+]', 5, 60, 0),
   (8, '[Instances Lvl 70+]', 5, 70, 0),
   (9, 'Destinations MJ', 3, 0, 0);

TRUNCATE `custom_npc_tele_destination`;
INSERT INTO `custom_npc_tele_destination`
   (`id`, `name`, `pos_X`, `pos_Y`, `pos_Z`, `map`, `orientation`, `level`, `cost`)
VALUES
   (1, 'Alterac Valley', 883.187, -489.375, 96.7618, 30, 3.06932, 0, 0),
   (2, 'Alterac Valley', -818.155, -623.043, 54.0884, 30, 2.1, 0, 0),
   (3, 'Arathi Basin', 686.053, 683.165, -12.9149, 529, 0.18, 0, 0),
   (4, 'Arathi Basin', 1308.68, 1306.03, -9.0107, 529, 3.91285, 0, 0),
   (5, 'Black Temple', -3610.72, 324.988, 37.4, 530, 3.28298, 0, 0),
   (6, 'Blackfathom Deeps', 4254.58, 664.74, -29.04, 1, 1.97, 0, 0),
   (7, 'Blackrock Depths', -7301.03, -913.19, 165.37, 0, 0.08, 0, 0),
   (8, 'Blackrock Spire', -7535.43, -1212.04, 285.45, 0, 5.29, 0, 0),
   (9, 'Blackwing Lair', -7665.55, -1102.49, 400.679, 469, 0, 0, 0),
   (10, 'Caverns of Time', -8173.66, -4746.36, 33.8423, 1, 4.93989, 0, 0),
   (11, 'Circle of Blood', 2839.44, 5930.17, 11.1002, 530, 3.16284, 0, 0),
   (12, 'Coilfang Reservoir', 517.288, 6976.28, 32.0072, 530, 0, 0, 0),
   (13, 'Darnassus', 9947.52, 2482.73, 1316.21, 1, 0, 0, 0),
   (14, 'Dire Maul', -3982.47, 1127.79, 161.02, 1, 0.05, 0, 0),
   (15, 'Exodar', -4073.03, -12020.4, -1.47, 530, 0, 0, 0),
   (16, 'Eye of the Storm', 2487.72, 1609.12, 1224.64, 566, 3.35671, 0, 0),
   (17, 'Eye of the Storm', 1843.73, 1529.77, 1224.43, 566, 0.297579, 0, 0),
   (18, 'Goldshire', -9464, 62, 56, 0, 0, 0, 0),
   (19, 'Gruul\'s Lair', 3539.01, 5082.36, 1.69107, 530, 0, 0, 0),
   (20, 'Gurubashi', -13261.3, 168.294, 35.0792, 0, 1.00688, 0, 0),
   (21, 'Hellfire Citadel', -305.816, 3056.4, -2.47318, 530, 2.01, 0, 0),
   (22, 'Ironforge', -4924.07, -951.95, 501.55, 0, 5.4, 0, 0),
   (23, 'Isle Of Quel\'Danas', 12947.4, -6893.31, 5.68398, 530, 3.09154, 0, 0),
   (24, 'Karazhan', -11118.8, -2010.84, 47.0807, 0, 0, 0, 0),
   (25, 'Maraudon', -1433.33, 2955.34, 96.21, 1, 4.82, 0, 0),
   (26, 'Molten Core', 1121.45, -454.317, -101.33, 230, 3.5, 0, 0),
   (27, 'Naxxramas', 3125.18, -3748.02, 136.049, 0, 0, 0, 0),
   (28, 'Onyxia\'s Lair', -4707.44, -3726.82, 54.6723, 1, 3.8, 0, 0),
   (29, 'Orgrimmar', 1552.5, -4420.66, 8.94802, 1, 0, 0, 0),
   (30, 'Razor Hill', 315.721, -4743.4, 10.4867, 1, 0, 0, 0),
   (31, 'Razorfen Downs', -4645.08, -2470.85, 85.53, 1, 4.39, 0, 0),
   (32, 'Razorfen Kraul', -4484.04, -1739.4, 86.47, 1, 1.23, 0, 0),
   (33, 'Ring of Trials', -1999.94, 6581.71, 11.32, 530, 2.3, 0, 0),
   (34, 'Ruins of Ahn\'Qiraj', -8409.03, 1498.83, 27.3615, 1, 2.49757, 0, 0),
   (35, 'Scholomance', 1219.01, -2604.66, 85.61, 0, 0.5, 0, 0),
   (36, 'Shadowfang Keep', -254.47, 1524.68, 76.89, 0, 1.56, 0, 0),
   (37, 'Shattrath City', -1850.21, 5435.82, -10.9614, 530, 3.40391, 0, 0),
   (38, 'Silvermoon', 9338.74, -7277.27, 13.7895, 530, 0, 0, 0),
   (39, 'Stormwind', -8960.14, 516.266, 96.3568, 0, 0, 0, 0),
   (40, 'Stratholme', 3263.54, -3379.46, 143.59, 0, 0, 0, 0),
   (41, 'Tempest Keep', 3089.58, 1399.05, 187.653, 530, 4.79407, 0, 0),
   (42, 'Temple of Ahn\'Qiraj', -8245.84, 1983.74, 129.072, 1, 0.936195, 0, 0),
   (43, 'The Deadmines', -11212, 1658.58, 25.67, 0, 1.45, 0, 0),
   (44, 'The Maul', -3761.49, 1133.43, 132.083, 1, 4.57259, 0, 0),
   (45, 'The Scarlet Monastery', 2843.89, -693.74, 139.32, 0, 5.11, 0, 0),
   (46, 'The Sunken Temple', -10346.9, -3851.9, -43.41, 0, 6.09, 0, 0),
   (47, 'The Wailing Caverns', -722.53, -2226.3, 16.94, 1, 2.71, 0, 0),
   (48, 'Thunder Bluff', -1290, 147.034, 129.682, 1, 4.919, 0, 0),
   (49, 'Uldaman', -6119.7, -2957.3, 204.11, 0, 0.03, 0, 0),
   (50, 'Undercity', 1819.71, 238.79, 60.5321, 0, 0, 0, 0),
   (51, 'Warsong Gulch', 930.851, 1431.57, 345.537, 489, 0.015704, 0, 0),
   (52, 'Warsong Gulch', 1525.95, 1481.66, 352.001, 489, 3.20756, 0, 0),
   (53, 'Zul\'Aman', 6846.95, -7954.5, 170.028, 530, 4.61501, 0, 0),
   (54, 'Zul\'Farrak', -6839.39, -2911.03, 8.87, 1, 0.41, 0, 0),
   (55, 'Zul\'Gurub', -11916.7, -1212.82, 92.2868, 0, 4.6095, 0, 0),
   (56, 'Ile des MJ', 16254, 16276.9, 14.5082, 1, 1.70269, 0, 0);

TRUNCATE `custom_npc_tele_association`;
INSERT INTO `custom_npc_tele_association`
  (`cat_id`, `dest_id`)
VALUES
  (1, 13), (1, 15), (1, 18), (1, 22), (1, 23), (1, 37), (1, 39), (2, 23), (2, 29), (2, 30), (2, 37), (2, 38), (2, 48), (2, 50), (3, 1), (3, 4), (3, 16), (3, 52), (4, 2), (4, 3), (4, 17), (4, 51), (5, 11), (5, 20), (5, 33), (5, 44), (6, 6), (6, 7), (6, 8), (6, 14), (6, 25), (6, 31), (6, 32), (6, 35), (6, 36), (6, 40), (6, 43), (6, 45), (6, 46), (6, 47), (6, 49), (6, 54), (7, 9), (7, 26), (7, 27), (7, 28), (7, 34), (7, 42), (7, 55), (8, 5), (8, 10), (8, 12), (8, 19), (8, 21), (8, 24), (8, 41), (8, 53), (9, 56);

-- `npc_text`
REPLACE INTO `npc_text` (`ID`, `text0_0`) VALUES
   (100000, 'Choose your Category.'),
   (100001, 'Choose your Destination.');

-- `creature_template`
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RegenHealth`, `flags_extra`, `ScriptName`) VALUES (100000, 26502, 'TeleNPC2', 83, 83, 35, 1, 1, 1.14286, 2, 1, 1, 1, 1, 2, 2048, 3, 1, 1, 1, 1, 1, 1, 1, 2, 'npc_teleport');
 
 
/* 
* world.summonnpc-item.sql 
*/ 
-- Example item:
DELETE FROM `item_template` WHERE `entry` = 100000;
insert into `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) values
('100000','15','0','-1','Icerune','46787','4','72','0','1','0','0','0','-1','-1','1','1','0','0','0','0','0','0','6','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','18282','0','0','0','8000','0','-1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','|cff00FF00Use: Summons Lithathrad Teleporter.|r','0','0','0','0','0','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','-1','0','0','0','0','summon','0','0','0','0','0','-4');
 
 
/* 
* world.vote-npc.sql 
*/ 
DELETE FROM `creature_template` WHERE `entry` = 60005;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('60005','0','0','0','0','0','18','0','18','0','George','Vote Rewards','','0','59','61','0','35','1','1.48','1.14286','0','0','0','1500','1900','1','1','1','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','1','1','1','1','1','1','0','0','1','0','0','npc_vote_rewarder','1'); 
 
/* 
* WorldDB.sql 
*/ 

/*Data for the table `creature` */

DELETE FROM `creature` WHERE `guid` IN (1112144, 1112145, 1112146, 1112148, 1112149, 1112150, 1112151, 1112152, 1112153, 1112155, 1112156, 1112157, 1112158, 1112159, 1112160, 1112161, 1112162, 1112163, 1112164, 1112165, 1112166, 1118308);

INSERT INTO `creature`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`PhaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`,`VerifiedBuild`) VALUES
(1118308,908001,1,0,0,1,1,0,0,-7207.9,1056.01,327.532,4.59111,300,0,0,108000,0,2,0,0,0,0),
(1112166,25266,1,0,0,1,1,0,0,-7272.97,986.543,306.361,6.18204,300,0,0,42,0,2,0,0,0,0),
(1112165,25266,1,0,0,1,1,0,0,-7272,994.955,306.361,6.18204,300,0,0,42,0,2,0,0,0,0),
(1112163,25266,1,0,0,1,1,0,0,-7162.96,966.158,307.122,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112164,25266,1,0,0,1,1,0,0,-7273.19,989.977,306.361,6.18204,300,0,0,42,0,2,0,0,0,0),
(1112162,25266,1,0,0,1,1,0,0,-7160.46,971.542,308.005,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112160,25266,1,0,0,1,1,0,0,-7166.61,968.537,306.36,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112161,25266,1,0,0,1,1,0,0,-7165.4,978.728,306.36,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112159,25266,1,0,0,1,1,0,0,-7166.34,970.852,306.36,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112158,25266,1,0,0,1,1,0,0,-7165.9,974.529,306.36,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112157,25266,1,0,0,1,1,0,0,-7162.03,975.112,306.944,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112145,25266,1,0,0,1,1,0,0,-7277.48,986.356,307.508,6.11808,300,0,0,42,0,2,0,0,0,0),
(1112146,25266,1,0,0,1,1,0,0,-7277.03,989.028,307.5,6.11808,300,0,0,42,0,2,0,0,0,0),
(1112156,25266,1,0,0,1,1,0,0,-7161.6,978.72,306.836,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112155,25266,1,0,0,1,1,0,0,-7159.16,978.43,308.144,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112152,25266,1,0,0,1,1,0,0,-7160.59,981.296,307.276,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112153,25266,1,0,0,1,1,0,0,-7158.82,981.086,308.239,3.02317,300,0,0,42,0,2,0,0,0,0),
(1112150,25266,1,0,0,1,1,0,0,-7276.97,995.476,307.962,6.11808,300,0,0,42,0,2,0,0,0,0),
(1112151,25266,1,0,0,1,1,0,0,-7275.67,995.258,307.121,6.11808,300,0,0,42,0,2,0,0,0,0),
(1112149,25266,1,0,0,1,1,0,0,-7277.57,991.893,307.982,6.11808,300,0,0,42,0,2,0,0,0,0),
(1112148,25266,1,0,0,1,1,0,0,-7275.89,991.613,307.009,6.11808,300,0,0,42,0,2,0,0,0,0),
(1112144,25266,1,0,0,1,1,0,0,-7277.83,984.264,307.587,6.11808,300,0,0,42,0,2,0,0,0,0);

/*Data for the table `creature_template` */

DELETE FROM `creature_template` WHERE `entry` = 25266;

INSERT INTO `creature_template`(`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`dmgschool`,`BaseAttackTime`,`RangeAttackTime`,`BaseVariance`,`RangeVariance`,`unit_class`,`unit_flags`,`unit_flags2`,`dynamicflags`,`family`,`trainer_type`,`trainer_class`,`trainer_race`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`HoverHeight`,`HealthModifier`,`ManaModifier`,`ArmorModifier`,`DamageModifier`,`ExperienceModifier`,`RacialLeader`,`movementId`,`RegenHealth`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`VerifiedBuild`) VALUES
(25266,0,0,0,0,0,24818,3422,24819,24821,'Arena Gambler','','',0,255,255,0,35,1,1,1.14286,1,0,0,0,0,1,1,1,0,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,5,1,1,1,1,0,0,1,0,0,'duel_systems',1);

/*Data for the table `gameobject` */

DELETE FROM `gameobject` WHERE `guid` IN (60046, 67903, 67906, 67907, 67908, 67909, 67918, 67919, 67920, 67921, 72037, 72043, 72058, 73361, 223623, 239644, 239650, 239651, 239653, 239655, 239656, 239657, 239658, 239659, 239660, 239661, 239669, 239670, 239671, 239672, 239673, 239674, 239675, 239886, 239888, 239889, 239891, 239893, 239894, 239895, 239896, 239897, 239903, 239906, 239913, 239922, 239923, 239933, 239934, 239941, 239944, 239946, 239948, 239949, 239950, 239951, 239952, 239954, 239955, 239957, 239958, 239959, 239960, 239961, 239962, 239966, 239968, 239970, 239971, 239972, 239973, 239974, 239975, 239976, 239977, 239985, 239992, 239994, 239997, 240003, 240004, 240005, 240008, 240010, 240015, 240016, 240017, 240019, 240020, 240021, 240023, 240024, 240026, 240027, 240028, 240063, 240064, 240065, 240066, 240067, 240068, 240069, 240072, 240073, 240074, 240075, 240076, 240077, 240080, 240085, 240086, 240087, 240088, 240089, 240090, 240091, 240092, 240093, 240094, 240095, 240096, 240097, 240098, 240099, 240100, 240109, 240118, 240119, 240120, 240121, 240122, 240123, 240124, 240125, 240126, 240127, 240128, 240133, 240136, 240137, 240141, 240144, 240147, 240149, 240150, 240152, 240153, 240155, 240160, 240164, 240166, 240167, 240168, 240169, 240170, 240171, 240172, 240174, 240175, 240176, 240177, 240178, 240179, 240180, 240181, 240182, 240183, 240184, 240193, 240194, 240195, 240196, 240197, 240198, 240199, 240200, 240202, 240203, 240204, 240205, 240206, 240207, 240208, 240209, 240210, 240211, 240212, 240213, 240214, 240215, 240216, 240217, 240218, 240219, 240220, 240221, 240222, 240223, 240224, 240225, 240226, 240227, 240228, 240229, 240230, 240231, 240232, 9044951, 9044969, 9044974, 9044976, 9044977, 9044978, 9044979, 9044980, 9044981, 9044982, 9045336, 9046953, 9046955, 9051186, 9055707, 9092464, 9092906, 9109862, 9109906, 9119083, 9119088, 9180717, 9180720, 9180728, 9330402, 9330403, 9347465, 9347468, 9365139, 9365229, 9365230, 9365232, 9365244, 9365245, 9365246, 9365247);

INSERT INTO `gameobject`(`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`PhaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`) VALUES
(9045336,8021000,1,0,0,1,1,-7217.97,1054.25,331.856,5.24803,0,0,0.494776,-0.86902,300,0,1,0),
(239650,8010000,1,0,0,1,1,-7218.95,982.451,299.273,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239651,8010001,1,0,0,1,1,-7218.95,982.451,299.273,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239644,8010002,0,0,0,1,1,-8942.42,-4009.48,331.64,0.943155,0,0,0.454292,0.890853,25,0,1,0),
(239653,8010003,1,0,0,1,1,-7218.95,982.451,299.273,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(9044977,8007862,1,0,0,1,1,-7224.76,1021.03,303.523,1.40272,0,0,0.645258,0.763965,300,0,1,0),
(9044978,8007862,1,0,0,1,1,-7201.21,1017.04,303.523,1.40272,0,0,0.645258,0.763965,300,0,1,0),
(9044951,8007658,1,0,0,1,1,-7207.87,1056.14,327.535,4.52314,0,0,0.770754,-0.637133,300,0,1,0),
(9046955,800342,1,0,0,1,1,-7212.74,1056.6,335.527,4.59111,0,0,0.748659,-0.662955,300,0,1,0),
(9046953,800342,1,0,0,1,1,-7202.82,1055.39,335.527,4.59111,0,0,0.748659,-0.662955,300,0,1,0),
(9044976,8008124,1,0,0,1,1,-7207.83,1055.98,342.182,1.41429,0,0,0.649667,0.760219,300,0,1,0),
(9055707,8008054,1,0,0,1,1,-7137.07,970.488,329.703,1.51134,0,0,0.685777,0.727812,300,0,1,0),
(9044974,8008054,1,0,0,1,1,-7302.17,994.336,328.471,4.55182,0,0,0.761539,-0.648119,300,0,1,0),
(9044969,8008054,1,0,0,1,1,-7232.73,900.85,329.059,6.09277,0,0,0.0950627,-0.995471,300,0,1,0),
(9044979,8004714,1,0,0,1,1,-7280.03,1002.39,303.523,6.13,0,0,0.0765184,-0.997068,300,0,1,0),
(9044980,8004714,1,0,0,1,1,-7283.71,978.588,303.523,6.13,0,0,0.0765184,-0.997068,300,0,1,0),
(9044981,8004714,1,0,0,1,1,-7155.47,985.314,303.524,6.13,0,0,0.0765184,-0.997068,300,0,1,0),
(9044982,8004714,1,0,0,1,1,-7158.91,962.114,303.524,6.13,0,0,0.0765184,-0.997068,300,0,1,0),
(240164,70264,1,0,0,1,1,-7211.89,921.652,307.653,3.01201,0,0,0.997902,0.0647469,25,0,1,0),
(240166,70264,1,0,0,1,1,-7211.89,921.652,303.524,3.01201,0,0,0.997902,0.0647469,25,0,1,0),
(240167,70264,1,0,0,1,1,-7211.64,923.561,304.714,3.01201,0,0,0.997902,0.0647469,25,0,1,0),
(240168,70264,1,0,0,1,1,-7210.66,920.395,305.123,3.10238,0,0,0.999808,0.0196051,25,0,1,0),
(240169,70264,1,0,0,1,1,-7210,922.433,304.547,3.52728,0,0,0.981463,-0.191651,25,0,1,0),
(240170,70264,1,0,0,1,1,-7211.74,925.442,305.599,3.55012,0,0,0.97921,-0.202848,25,0,1,0),
(240171,70264,1,0,0,1,1,-7211.08,927.887,303.524,2.53696,0,0,0.954649,0.297734,25,0,1,0),
(240172,70264,1,0,0,1,1,-7210.16,925.499,303.523,0.171338,0,0,0.0855642,0.996333,25,0,1,0),
(240174,70264,1,0,0,1,1,-7212.64,918.485,307.331,2.88561,0,0,0.99182,0.127644,25,0,1,0),
(240175,70264,1,0,0,1,1,-7213.07,916.643,307.346,4.4564,0,0,0.791581,-0.611065,25,0,1,0),
(240176,70264,1,0,0,1,1,-7213.5,915.324,306.69,4.4564,0,0,0.791581,-0.611065,25,0,1,0),
(240177,70264,1,0,0,1,1,-7213.94,913.631,308.328,2.57459,0,0,0.960082,0.27972,25,0,1,0),
(240178,70264,1,0,0,1,1,-7210.59,918.498,303.524,2.23965,0,0,0.900025,0.435839,25,0,1,0),
(240179,70264,1,0,0,1,1,-7211,916.593,304.705,2.5813,0,0,0.961015,0.276496,25,0,1,0),
(240180,70264,1,0,0,1,1,-7211.58,914.537,304.612,5.18568,0,0,0.521622,-0.853176,25,0,1,0),
(240181,70264,1,0,0,1,1,-7214.78,911.262,309.84,2.45752,0,0,0.942074,0.335406,25,0,1,0),
(240182,70264,1,0,0,1,1,-7216.24,912.227,306.76,5.43418,0,0,0.411866,-0.911244,25,0,1,0),
(240183,70264,1,0,0,1,1,-7212.83,912.539,307.181,2.37505,0,0,0.927447,0.373954,25,0,1,0),
(240184,70264,1,0,0,1,1,-7213.46,909.984,307.23,0.549789,0,0,0.271445,0.962454,25,0,1,0),
(240194,70264,1,0,0,1,1,-7209.58,914.14,303.524,3.51295,0,0,0.982811,-0.184616,25,0,1,0),
(240195,70264,1,0,0,1,1,-7208.91,916.507,303.523,3.29697,0,0,0.996984,-0.0776098,25,0,1,0),
(240196,70264,1,0,0,1,1,-7208.91,920.253,303.524,3.50117,0,0,0.983881,-0.178823,25,0,1,0),
(240197,70264,1,0,0,1,1,-7211.93,910.935,303.523,2.14636,0,0,0.878724,0.477331,25,0,1,0),
(240198,70264,1,0,0,1,1,-7211.66,909.391,304.125,3.06528,0,0,0.999272,0.0381473,25,0,1,0),
(240199,70264,1,0,0,1,1,-7243.47,918.183,306.827,2.88084,0,0,0.991513,0.130006,25,0,1,0),
(240200,70264,1,0,0,1,1,-7242.56,920.043,306.432,6.18659,0,0,0.0482802,-0.998834,25,0,1,0),
(240202,70264,1,0,0,1,1,-7242.34,922.252,307.37,4.61579,0,0,0.740422,-0.672143,25,0,1,0),
(240203,70264,1,0,0,1,1,-7241.58,918.298,307.496,5.83709,0,0,0.221202,-0.975228,25,0,1,0),
(240204,70264,1,0,0,1,1,-7242.13,920.107,308.89,6.18659,0,0,0.0482802,-0.998834,25,0,1,0),
(240205,70264,1,0,0,1,1,-7240.56,920.002,306.682,3.3923,0,0,0.992153,-0.125027,25,0,1,0),
(240206,70264,1,0,0,1,1,-7243.02,924.059,309.946,6.17654,0,0,0.0532979,-0.998579,25,0,1,0),
(240207,70264,1,0,0,1,1,-7243.01,924.088,305.274,6.17654,0,0,0.0532979,-0.998579,25,0,1,0),
(240208,70264,1,0,0,1,1,-7243.04,924.253,303.523,6.17654,0,0,0.0532979,-0.998579,25,0,1,0),
(240209,70264,1,0,0,1,1,-7241.35,924.009,307.062,1.96681,0,0,0.83239,0.55419,25,0,1,0),
(240210,70264,1,0,0,1,1,-7241.94,925.8,305.81,5.47362,0,0,0.393821,-0.919187,25,0,1,0),
(240211,70264,1,0,0,1,1,-7241.6,928.466,303.523,6.04382,0,0,0.119399,-0.992846,25,0,1,0),
(240212,70264,1,0,0,1,1,-7241.24,930.286,305.206,3.14491,0,0,0.999999,-0.00165872,25,0,1,0),
(240213,70264,1,0,0,1,1,-7243.68,926.66,303.523,5.75479,0,0,0.261137,-0.965302,25,0,1,0),
(240214,70264,1,0,0,1,1,-7242.97,929.298,303.523,5.94014,0,0,0.170683,-0.985326,25,0,1,0),
(240215,70264,1,0,0,1,1,-7242.62,931.894,303.523,0.27742,0,0,0.138265,0.990395,25,0,1,0),
(240216,70264,1,0,0,1,1,-7240.76,933.186,304.251,4.5225,0,0,0.770957,-0.636887,25,0,1,0),
(240217,70264,1,0,0,1,1,-7240.6,934.86,303.523,1.03381,0,0,0.494194,0.869352,25,0,1,0),
(240218,70264,1,0,0,1,1,-7240.63,927.437,308.706,3.04601,0,0,0.998858,0.0477748,25,0,1,0),
(240219,70264,1,0,0,1,1,-7239.85,928.99,306.613,4.15651,0,0,0.873982,-0.485958,25,0,1,0),
(240220,70264,1,0,0,1,1,-7239.49,930.882,305.622,0.293923,0,0,0.146433,0.989221,25,0,1,0),
(240221,70264,1,0,0,1,1,-7243.6,927.232,307.087,2.75142,0,0,0.981031,0.19385,25,0,1,0),
(240222,70264,1,0,0,1,1,-7243.98,921.131,303.523,0.378774,0,0,0.188257,0.98212,25,0,1,0),
(240223,70264,1,0,0,1,1,-7245.03,918.867,303.523,5.00398,0,0,0.596875,-0.802334,25,0,1,0),
(240224,70264,1,0,0,1,1,-7243.15,916.057,303.523,0.849226,0,0,0.411968,0.911198,25,0,1,0),
(240225,70264,1,0,0,1,1,-7240.85,916.565,303.523,2.12943,0,0,0.87465,0.484755,25,0,1,0),
(240226,70264,1,0,0,1,1,-7245.19,916.681,303.523,0.8453,0,0,0.410179,0.912005,25,0,1,0),
(240141,8009248,1,0,0,1,1,-7226.12,929.725,303.755,0.169878,0,0,0.0848367,0.996395,25,0,1,0),
(9119088,8009248,1,0,0,1,1,-1823.82,-4584.27,-109.975,5.70834,0,0,0.283482,-0.958978,300,0,1,0),
(240149,8009248,1,0,0,1,1,-7227.33,920.772,306.682,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240147,8009248,1,0,0,1,1,-7226.91,923.893,305.622,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240144,8009248,1,0,0,1,1,-7226.49,926.943,304.55,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(9119083,8009248,1,0,0,1,1,-1823.47,-4583.57,-110.052,4.20586,0,0,0.861725,-0.507375,300,0,1,0),
(9347465,8009248,1,0,0,1,1,6459.17,-4273.97,667.048,3.94114,0,0,0.921148,-0.389212,300,0,1,0),
(9347468,8009248,1,0,0,1,1,6474.25,-4258.45,665.93,3.94114,0,0,0.921148,-0.389212,300,0,1,0),
(240150,181640,1,0,0,1,1,-7228.43,912.741,306.682,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240152,181640,1,0,0,1,1,-7235.39,917.648,306.682,0.438242,0,0,0.217372,0.976089,25,0,1,0),
(240153,181640,1,0,0,1,1,-7220.81,916.125,306.681,2.44007,0,0,0.939112,0.343611,25,0,1,0),
(240155,181640,1,0,0,1,1,-7218.34,922.78,306.683,2.96331,0,0,0.99603,0.0890233,25,0,1,0),
(240160,181640,1,0,0,1,1,-7236.27,924.809,306.682,6.1303,0,0,0.0763687,-0.99708,25,0,1,0),
(9365229,186393,1,0,0,1,1,-3067.83,2199.85,43.8142,1.85265,0,0,0.799417,0.600776,300,0,1,0),
(9365139,186393,1,0,0,1,1,-2789.46,2291.79,53.9035,2.34029,0,0,0.920808,0.390016,300,0,1,0),
(240010,186393,1,0,0,1,1,-7162.65,959.809,303.523,4.58374,0,0,0.751097,-0.660192,25,0,1,0),
(240008,186393,1,0,0,1,1,-7158.73,989.066,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239922,186393,1,0,0,1,1,-7279.56,975.823,303.523,4.57633,0,0,0.753539,-0.657403,25,0,1,0),
(239997,186393,1,0,0,1,1,-7159.63,980.321,306.361,3.00559,0,0,0.997689,0.0679491,25,0,1,0),
(239913,186393,1,0,0,1,1,-7275.58,1004.97,303.523,1.43885,0,0,0.658953,0.752184,25,0,1,0),
(239923,186393,1,0,0,1,1,-7277.64,990.373,306.361,6.1613,0,0,0.0609072,-0.998143,25,0,1,0),
(239933,186393,1,0,0,1,1,-7278.38,984.389,306.36,6.1613,0,0,0.0609072,-0.998143,25,0,1,0),
(239934,186393,1,0,0,1,1,-7276.92,996.3,306.36,6.1613,0,0,0.0609072,-0.998143,25,0,1,0),
(240065,186393,1,0,0,1,1,-7248.77,1032.2,306.361,3.77837,0,0,0.949741,-0.313037,25,0,1,0),
(240080,186393,1,0,0,1,1,-7174.38,1012.29,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240064,186393,1,0,0,1,1,-7259.13,1024.25,306.361,0.640679,0,0,0.314889,0.949129,25,0,1,0),
(240100,186393,1,0,0,1,1,-7262.34,949.284,303.524,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240128,186393,1,0,0,1,1,-7187.33,939.703,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240024,186393,1,0,0,1,1,-7252.32,1026.1,303.524,5.3627,0,0,0.444166,-0.895945,25,0,1,0),
(239992,186393,1,0,0,1,1,-7160.45,974.339,306.361,3.00559,0,0,0.997689,0.0679491,25,0,1,0),
(239994,186393,1,0,0,1,1,-7161.27,968.374,306.362,3.00559,0,0,0.997689,0.0679491,25,0,1,0),
(240227,186393,1,0,0,1,1,-7176.13,1019.19,306.361,5.36606,0,0,0.442661,-0.896689,25,0,1,0),
(240228,186393,1,0,0,1,1,-7168.2,1008.91,306.36,2.24018,0,0,0.900139,0.435603,25,0,1,0),
(240229,186393,1,0,0,1,1,-7260.57,942.307,306.36,2.22945,0,0,0.89779,0.440424,25,0,1,0),
(240230,186393,1,0,0,1,1,-7268.58,952.669,306.36,5.36319,0,0,0.443945,-0.896054,25,0,1,0),
(240231,186393,1,0,0,1,1,-7180.39,941.411,306.36,3.79612,0,0,0.946925,-0.321454,25,0,1,0),
(240232,186393,1,0,0,1,1,-7190.67,933.47,306.36,0.654529,0,0,0.321454,0.946925,25,0,1,0),
(9365230,186393,1,0,0,1,1,-3077.56,2197.23,42.7844,1.83087,0,0,0.792826,0.609448,300,0,1,0),
(9365232,186393,1,0,0,1,1,-3504.66,2071.59,42.6084,1.13352,0,0,0.536904,0.843644,300,0,1,0),
(9365244,186393,1,0,0,1,1,-4759.7,1584.99,84.6154,0.124395,0,0,0.0621572,0.998066,300,0,1,0),
(9365245,186393,1,0,0,1,1,-4758.94,1578.86,85.7949,0.124395,0,0,0.0621572,0.998066,300,0,1,0),
(9365246,186393,1,0,0,1,1,-4758.17,1572.71,87.2961,0.124395,0,0,0.0621572,0.998066,300,0,1,0),
(9365247,186393,1,0,0,1,1,-4757.39,1566.47,87.6473,0.124395,0,0,0.0621572,0.998066,300,0,1,0),
(60046,188596,571,0,0,1,1,3404.73,-5394.46,267.362,1.18682,0,0,0,1,300,100,0,0),
(239948,188596,1,0,0,1,1,-7164.57,975.06,303.523,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239950,188596,1,0,0,1,1,-7163.66,981.741,303.523,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240026,188596,1,0,0,1,1,-7257.12,1032.41,303.524,5.3627,0,0,0.444166,-0.895945,25,0,1,0),
(240090,188596,1,0,0,1,1,-7268.73,944.317,303.523,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240015,188596,1,0,0,1,1,-7255.01,1029.64,303.524,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240091,188596,1,0,0,1,1,-7270.72,946.901,303.523,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(239658,188596,1,0,0,1,1,-7276.42,1000.47,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239657,188596,1,0,0,1,1,-7276.87,997.127,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239656,188596,1,0,0,1,1,-7277.33,993.788,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239655,188596,1,0,0,1,1,-7277.78,990.448,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239669,188596,1,0,0,1,1,-7273.63,989.883,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239661,188596,1,0,0,1,1,-7279.1,980.338,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239670,188596,1,0,0,1,1,-7273.17,993.224,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239672,188596,1,0,0,1,1,-7272.26,999.903,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239659,188596,1,0,0,1,1,-7278.22,987.078,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239660,188596,1,0,0,1,1,-7278.66,983.707,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239671,188596,1,0,0,1,1,-7272.72,996.564,303.523,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239673,188596,1,0,0,1,1,-7274.08,986.518,303.524,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239674,188596,1,0,0,1,1,-7274.54,983.151,303.524,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239675,188596,1,0,0,1,1,-7275,979.786,303.524,1.43571,0,0,0.65777,0.753219,25,0,1,0),
(239949,188596,1,0,0,1,1,-7164.12,978.4,303.523,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240077,188596,1,0,0,1,1,-7166.01,1014.58,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(239960,188596,1,0,0,1,1,-7160.4,974.416,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239951,188596,1,0,0,1,1,-7163.21,985.081,303.523,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240028,188596,1,0,0,1,1,-7259.67,1030.47,303.523,5.3627,0,0,0.444166,-0.895945,25,0,1,0),
(239958,188596,1,0,0,1,1,-7161.31,967.734,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240068,188596,1,0,0,1,1,-7168.78,1012.46,303.524,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240069,188596,1,0,0,1,1,-7174.66,1020.19,303.524,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240072,188596,1,0,0,1,1,-7166.81,1009.87,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240067,188596,1,0,0,1,1,-7170.75,1015.05,303.524,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240066,188596,1,0,0,1,1,-7172.72,1017.64,303.524,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(239961,188596,1,0,0,1,1,-7159.95,977.758,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239955,188596,1,0,0,1,1,-7165.94,964.962,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239957,188596,1,0,0,1,1,-7161.76,964.393,303.523,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240027,188596,1,0,0,1,1,-7254.53,1034.39,303.524,5.3627,0,0,0.444166,-0.895945,25,0,1,0),
(240075,188596,1,0,0,1,1,-7169.95,1019.76,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(239966,188596,1,0,0,1,1,-7159.03,984.508,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239962,188596,1,0,0,1,1,-7159.49,981.1,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239952,188596,1,0,0,1,1,-7165.03,971.695,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239959,188596,1,0,0,1,1,-7160.85,971.074,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(239954,188596,1,0,0,1,1,-7165.49,968.329,303.524,1.43571,0,0,0.657771,0.753218,25,0,1,0),
(240124,188596,1,0,0,1,1,-7179.38,939.825,303.523,1.78622,0,0,0.779027,0.626991,25,0,1,0),
(240125,188596,1,0,0,1,1,-7189.66,932.069,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240092,188596,1,0,0,1,1,-7267.97,949.005,303.523,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240098,188596,1,0,0,1,1,-7262.1,941.384,303.524,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240099,188596,1,0,0,1,1,-7259.35,943.486,303.524,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240096,188596,1,0,0,1,1,-7266.02,946.459,303.524,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240097,188596,1,0,0,1,1,-7264.05,943.929,303.524,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240095,188596,1,0,0,1,1,-7266.78,941.771,303.524,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240094,188596,1,0,0,1,1,-7267.21,953.693,303.523,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240121,188596,1,0,0,1,1,-7187.05,934.013,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240093,188596,1,0,0,1,1,-7269.95,951.589,303.523,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240127,188596,1,0,0,1,1,-7181.46,942.585,303.523,2.57948,0,0,0.960763,0.27737,25,0,1,0),
(240120,188596,1,0,0,1,1,-7184.97,931.254,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240119,188596,1,0,0,1,1,-7179.81,935.147,303.524,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240123,188596,1,0,0,1,1,-7181.94,937.892,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240126,188596,1,0,0,1,1,-7191.74,934.827,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240118,188596,1,0,0,1,1,-7182.37,933.215,303.524,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240122,188596,1,0,0,1,1,-7184.5,935.96,303.523,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(240076,188596,1,0,0,1,1,-7167.98,1017.17,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240017,188596,1,0,0,1,1,-7260.11,1025.76,303.524,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240021,188596,1,0,0,1,1,-7247.73,1030.83,303.524,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240020,188596,1,0,0,1,1,-7249.82,1033.58,303.524,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240019,188596,1,0,0,1,1,-7252.42,1031.61,303.524,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240023,188596,1,0,0,1,1,-7258.02,1023.01,303.523,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240016,188596,1,0,0,1,1,-7257.56,1027.7,303.524,5.3627,0,0,0.444165,-0.895945,25,0,1,0),
(240073,188596,1,0,0,1,1,-7169.55,1007.76,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240074,188596,1,0,0,1,1,-7177.41,1018.09,303.523,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240193,70264,1,0,0,1,1,-7210.52,912.412,304.893,2.5155,0,0,0.9514,0.307959,25,0,1,0),
(239891,178764,1,0,0,1,1,-7272.6,985.626,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239897,178764,1,0,0,1,1,-7270.77,999.019,306.36,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239896,178764,1,0,0,1,1,-7271.12,996.481,306.36,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239893,178764,1,0,0,1,1,-7272.26,988.172,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239895,178764,1,0,0,1,1,-7271.48,993.817,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239894,178764,1,0,0,1,1,-7271.88,990.953,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239888,178764,1,0,0,1,1,-7273.33,980.292,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239889,178764,1,0,0,1,1,-7272.95,983.06,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239886,178764,1,0,0,1,1,-7273.7,977.636,306.361,6.1481,0,0,0.0674923,-0.99772,25,0,1,0),
(239906,178764,1,0,0,1,1,-7276.49,978.036,306.361,4.59361,0,0,0.747829,-0.663891,25,0,1,0),
(239903,178764,1,0,0,1,1,-7270.44,1001.47,306.36,1.43885,0,0,0.658953,0.752184,25,0,1,0),
(239946,178764,1,0,0,1,1,-7281.08,978.658,306.36,6.14417,0,0,0.0694537,-0.997585,25,0,1,0),
(239968,178764,1,0,0,1,1,-7164.82,986.986,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239972,178764,1,0,0,1,1,-7165.9,978.853,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239977,178764,1,0,0,1,1,-7167.68,965.418,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239975,178764,1,0,0,1,1,-7166.97,970.755,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(9051186,178764,1,0,0,1,1,-7168,963.017,306.36,4.61838,0,0,0.739552,-0.6731,300,0,1,0),
(239973,178764,1,0,0,1,1,-7166.25,976.209,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239971,178764,1,0,0,1,1,-7165.54,981.532,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239974,178764,1,0,0,1,1,-7166.62,973.406,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239970,178764,1,0,0,1,1,-7165.18,984.315,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(239985,178764,1,0,0,1,1,-7161.79,986.521,306.361,1.42079,0,0,0.652132,0.758105,25,0,1,0),
(239976,178764,1,0,0,1,1,-7167.32,968.097,306.36,3.01043,0,0,0.99785,0.0655325,25,0,1,0),
(67907,194593,571,0,0,1,1,8460.36,927.153,544.916,3.14159,0,0,0,1,180,255,1,0),
(239944,194593,1,0,0,1,1,-7278.25,996.463,308.409,6.1613,0,0,0.0609072,-0.998143,25,0,1,0),
(67909,194595,571,0,0,1,1,8459.95,992.174,544.922,-2.94959,0,0,0,1,180,255,1,0),
(239941,194595,1,0,0,1,1,-7279.28,990.573,308.462,6.1613,0,0,0.0609072,-0.998143,25,0,1,0),
(67903,194589,571,0,0,1,1,8439.42,1010.37,544.698,-1.50971,0,0,0,1,180,255,1,0),
(73361,194589,571,0,0,1,1,8439.42,1010.37,544.698,-1.50971,0,0,0,0,0,0,1,0),
(9180728,194589,1,0,0,1,1,-7279.68,984.602,308.397,6.1613,0,0,0.0609048,-0.998144,300,0,1,0),
(223623,170592,1,0,0,1,1,-1824.72,-4583.54,-115.128,4.53332,0,0,0.767499,-0.64105,25,0,1,0),
(240063,170592,1,0,0,1,1,-7256.76,1032,307.052,5.3627,0,0,0.444166,-0.895945,25,0,1,0),
(240085,170592,1,0,0,1,1,-7168.76,1016.56,306.909,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240109,170592,1,0,0,1,1,-7268.44,944.602,307.092,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240133,170592,1,0,0,1,1,-7182.67,933.532,306.979,2.21718,0,0,0.895071,0.445923,25,0,1,0),
(9092906,170592,1,0,0,1,1,-9781.68,-2860.63,119.206,0.279273,0,0,0.139183,0.990267,300,0,1,0),
(9092464,170592,1,0,0,1,1,-7310.55,2233.88,72.4531,0.480897,0,0,0.238138,0.971231,300,0,1,0),
(9109862,170592,1,0,0,1,1,5855.94,-1995.04,689.745,5.42784,0,0,0.414754,-0.909934,300,0,1,0),
(9109906,170592,1,0,0,1,1,5871.12,-2012.51,689.701,2.28655,0,0,0.909997,0.414615,300,0,1,0),
(9330403,170592,1,0,0,1,1,-5082.57,-1103.69,87.1186,0.534018,0,0,0.263848,0.964564,300,0,1,0),
(9330402,170592,1,0,0,1,1,-5060.65,-1089.75,86.936,3.74954,0,0,0.954155,-0.299314,300,0,1,0),
(67920,194606,571,0,0,1,1,8307.43,705.927,553.644,0.253072,0,0,0,1,180,255,1,0),
(240136,194606,1,0,0,1,1,-7272.44,946.637,306.36,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(240137,194606,1,0,0,1,1,-7267.45,940.127,306.361,0.654239,0,0,0.321317,0.946972,25,0,1,0),
(67908,194594,571,0,0,1,1,8460.08,950.043,545.051,-3.09792,0,0,0,1,180,255,1,0),
(9180720,194594,1,0,0,1,1,-7184.78,929.577,306.361,2.21718,0,0,0.895071,0.445924,300,0,1,0),
(9180717,194594,1,0,0,1,1,-7178.15,934.61,306.362,2.24088,0,0,0.900292,0.435286,300,0,1,0),
(67921,194607,571,0,0,1,1,8338.74,687.096,553.701,1.59698,0,0,0,1,180,255,1,0),
(240004,194607,1,0,0,1,1,-7159.92,968.19,308.414,3.00559,0,0,0.997689,0.0679491,25,0,1,0),
(67919,194605,571,0,0,1,1,8319.33,744.352,553.701,-0.98611,0,0,0,1,180,255,1,0),
(240003,194605,1,0,0,1,1,-7158.89,974.126,308.49,3.00559,0,0,0.997689,0.0679491,25,0,1,0),
(67918,194604,571,0,0,1,1,8357.72,744.694,553.627,-2.30383,0,0,0,1,180,255,1,0),
(240005,194604,1,0,0,1,1,-7158.29,979.98,308.413,3.00559,0,0,0.997689,0.0679491,25,0,1,0),
(72058,194592,571,0,0,1,1,8458.11,905.744,546.489,2.82392,0,0,0.987412,0.158169,30,0,1,0),
(72043,194592,571,0,0,1,1,8670.57,692.054,547.522,1.89567,0,0,0.812154,0.583443,30,0,1,0),
(67906,194592,571,0,0,1,1,8459.21,905.564,545.516,2.75761,0,0,0,1,180,255,1,0),
(240088,194592,1,0,0,1,1,-7164.78,1014.48,306.361,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(240089,194592,1,0,0,1,1,-7169.75,1021,306.36,3.79203,0,0,0.94758,-0.319518,25,0,1,0),
(72037,194608,571,0,0,1,1,8368.94,708.93,553.772,2.93164,0,0,0.994495,0.104784,30,0,1,0),
(240087,194608,1,0,0,1,1,-7254.69,1036.01,306.361,5.3627,0,0,0.444166,-0.895945,25,0,1,0),
(240086,194608,1,0,0,1,1,-7261.24,1031,306.36,5.3627,0,0,0.444166,-0.895945,25,0,1,0);

/*Data for the table `gameobject_template` */

DELETE FROM `gameobject_template` WHERE `entry` IN (8021000, 8010000, 8010001, 8010002, 8010003, 8007862, 8007658, 800342, 8008124, 8008054, 8004714, 8009248, 181640, 186393, 188596, 70264, 178764, 194593, 194595, 194589, 170592, 194606, 194594, 194607, 194605, 194604, 194592, 194608);

INSERT INTO `gameobject_template`(`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`faction`,`flags`,`size`,`data0`,`data1`,`data2`,`data3`,`data4`,`data5`,`data6`,`data7`,`data8`,`data9`,`data10`,`data11`,`data12`,`data13`,`data14`,`data15`,`data16`,`data17`,`data18`,`data19`,`data20`,`data21`,`data22`,`data23`,`AIName`,`ScriptName`,`VerifiedBuild`) VALUES
(8021000,10,8520,'Arena Records','','','',0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','duel_records_system',1),
(8010000,33,9276,'Arena 0','','','',0,0,1.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8010001,33,9256,'Arena 1','','','',0,0,1.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8010002,33,9257,'Arena 2','','','',0,0,1.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8010003,33,9258,'Arena 3','','','',0,0,1.4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8007862,5,7862,'Arena Bonfire','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8007658,5,7658,'Arena Earth Rune','','','',0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(800342,5,342,'Arena Wall Rune','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8008124,5,8124,'Arena Eye of Acherus','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8008054,5,8054,'Arena Skull of Acherus','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8004714,5,4714,'Arena Light Powersource','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(8009248,5,9248,'Arena Flat Steel','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(181640,7,6690,'Arena Throne','','','',0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(186393,5,6725,'Arena Bleachers','','','',0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(188596,5,7812,'Arena Pedestal','','','',0,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(70264,5,6752,'Arena Ice Block','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(178764,5,5453,'Arena Rope Line','','','',0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194593,5,8620,'Ironforge Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194595,5,8616,'Darnassus Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194589,5,8617,'Exodar Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(170592,7,2810,'Arena Throne','','','',0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194606,5,8615,'Horde Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194594,5,8623,'Alliance Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194607,5,8621,'Orgrimmar Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194605,5,8622,'Silvermoon City Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194604,5,8624,'Thunder Bluff Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194592,5,8619,'Gnomeregan Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1),
(194608,5,8618,'Undercity Banner','','','',0,0,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',1);
 
 
/* 
* world_AIO.sql 
*/ 
-- Updates
-- WARNING! It's changes official blizz data!
UPDATE `creature_template` SET `faction`=35 WHERE `entry` IN(28474, 914, 23128, 17204, 5115, 4584, 16655, 28958, 4090, 23534);

-- Inserts
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80000, 'Sorry, you are not VIP member.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80001, 'Welcome Dear VIP.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80006, 'Your skills are set to max.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80007, 'It\'s Time To choose!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80010, 'Donation help text', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80011, 'Normal help text', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);
REPLACE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80012, 'Ingame help text', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);

INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80013, 'You Don\'t have resurrection sickness!', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80014, 'You Don\'t have a pet!', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`) VALUES (80016, 'Welcome! My Name is AIO. What can I help for you?', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (998, '|cffff0000<Announcer>: Join Warsong Guilch!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (999, '|cffff0000<Announcer>: Join Wintergrasp!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (997, '|cffff0000<Announcer>: Join Arathi Basin!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (996, '|cffff0000<Announcer>: Join Eye of the Storm!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (995, '|cffff0000<Announcer>: Join Random Battleground!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (994, '|cffff0000<Announcer>: Join Arena 2v2!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (993, '|cffff0000<Announcer>: Join Arena 3v3!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (992, '|cffff0000<Announcer>: Join Arena 5v5!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (991, '|cffff0000<Announcer>: Join Alterac Valley!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (990, '|cffff0000<Announcer>: Join Strand of the Ancients!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Creature_template entry. Make sure entry number does not conflict.
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('80000','0','0','0','0','0','2591','0','0','0','Young Woman','You need it, I got it.','','0','80','80','0','35','1','1','1.14286','1','1','0','1500','0','1','1','1','0','2048','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','EventAI','0','3','1','1','1','1','1','1','0','0','1','0','0','npc_all','0');
-- end
 
 
/* 
* world_guildhouses.sql 
*/ 
-- ----------------------------
-- Table structure for guildhouses
-- ----------------------------

DROP TABLE IF EXISTS `guildhouses`;

CREATE TABLE `guildhouses` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `guildId` bigint(20) NOT NULL default '0',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `map` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `guildhouses` VALUES
('1', '0', '16222', '16266', '14.2', '1', 'GM Island'),
('2', '0', '-10711', '2483', '8', '1', 'Tauren village at Veiled Sea (Silithus)'),
('3', '0', '-8323', '-343', '146', '0', 'Fishing outside an Northshire Abbey (Elwynn Forest'),
('4', '0', '7368', '-1560', '163', '1', 'Troll Village in mountains (Darkshore)'),
('5', '0', '-4151', '-1400', '198', '0', 'Dwarven village outside Ironforge (Wetlands)'),
('6', '0', '-1840', '-4233', '2.14', '0', 'Dwarven village (Arathi Highlands, Forbidding Sea)'),
('8', '0', '-723', '-1076', '179', '1', 'Tauren camp (Mulgore, Red Rock)'),
('9', '0', '-206', '1666', '80', '0', 'Shadowfang Keep an outside instance (Silverpine Forest)'),
('10', '0', '-6374', '1262', '7', '0', 'Harbor house outside Stormwind (Elwynn Forest)'),
('11', '0', '-8640', '580', '96', '0', 'Empty jail between canals (Stormwind)'),
('12', '0', '-4844', '-1066', '502', '0', 'Old Ironforge'),
('13', '0', '-4863', '-1658', '503.5', '0', 'Ironforge Airport'),
('14', '0', '1146', '-165', '313', '37', 'Azshara Crater instance (Alliance entrance)'),
('15', '0', '-123', '858', '298', '37', 'Azshara Crater instance (Horde entrance)'),
('16', '0', '4303', '-2760', '16.8', '0', 'Quel\'Thalas Tower'),
('17', '0', '-6161', '-790', '423', '0', 'Crashed gnome airplane (between Dun Morogh and Searing Gorge)'),
('18', '0', '-11790', '-1640', '54.7', '0', 'Zul\'Gurub an outside instance (Stranglethorn Vale)'),
('19', '0', '-11805', '-4754', '6', '1', 'Goblin village (Tanaris, South Seas)'),
('20', '0', '-9296', '670', '132', '0', 'Villains camp outside an Stormwind (Elwynn Forest)'),
('21', '0', '3414', '-3380', '142.2', '0', 'Stratholm an outside instance'),
('22', '0', '4654', '-3772', '944', '1', 'Kalimdor Hyjal (Aka World Tree)'),
('23', '0', '2176', '-4766', '55', '1', 'The Ring of Valor (Aka. Orgrimmar Arena)'),
('24', '0', '1951.512085', '1530.475586', '247.288147', '1', 'Stonetalon Logging Camp'),
('25', '0', '2813.660645', '2248.552979', '215.524643', '1', 'Stonetalon Ruins'),
('28', '0', '9725.27', '-21.43', '20.03', '1', 'Teldrassil Furbold camp'),
('29', '0', '-3855', '-3479', '579', '0', 'Wetlands mountain camp'),
('30', '0', '-5362', '-2540', '485', '0', 'Ortell\'s Hideout'),
('31', '0', '-12865', '-1396', '115', '0', 'Stranglethorn Secret Cave'),
('32', '0', '-11073', '-1956', '39', '0', 'Karazhan Smiley'),
('33', '0', '-11084', '-1801', '53', '0', 'Well of the Forgotten (Aka. Karazhan Crypt or Lower Karazhan)'),
('34', '0', '1683.235474', '286.458801', '-45.451775', '0', 'Undercity Top Tier'),
('35', '0', '-8521.3', '599.5', '101.399338', '0', 'Stormwind Cut-Throat Alley'),
('36', '0', '-5933', '452', '509', '0', 'Forgotten gnome camp'),
('37', '0', '-920.231323', '7096.489258', '170.35289', '530', 'Outland Nagrand : Newton\'s Remains'),
('38', '0', '-2140.501953', '9142.6875', '137.041855', '530', 'Outland Nagrand : Tomb'),
('39', '0', '-483.401794', '7461.944824', '186.120987', '530', 'Outland Nagrand: Challe\'s Home for Little Tykes'),
('40', '0', '2387.753906', '3191.757324', '152.669388', '530', 'Outland Netherstorm: Nova\'s Shrine');

-- *************************
-- * NPC Guildhouse Keeper *
-- *************************

DELETE FROM creature_template WHERE `entry`=13;

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('13','0','0','0','0','0','26789','0','0','0','Beltez','Guildhouse Keeper',NULL,'0','80','80','0','35','1','1','1.14286','0.75','0','0','1400','1900','1','1','1','0','0','8','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','1','1','1','1','1','1','0','0','1','0','0','guildmaster','12340'); 
 
/* 
* world_lordpsyanbots.sql 
*/ 
-- GENERAL --

SET @BOT_START = 70001;
SET @BOT_END   = 71000;

delete from `creature_template` where entry between @BOT_START and @BOT_END;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (70001,0,0,0,0,0,5001,0,5001,0,'Khelden','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70002,0,0,0,0,0,1294,0,1294,0,'Zaldimar','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70003,0,0,0,0,0,1484,0,1484,0,'Maginor','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70004,0,0,0,0,0,3344,0,3344,0,'Anetta','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70005,0,0,0,0,0,1495,0,1495,0,'Laurena','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70006,0,0,0,0,0,1295,0,1295,0,'Josetta','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70007,0,0,0,0,0,3345,0,3345,0,'Drusilla','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70008,0,0,0,0,0,1930,0,1930,0,'Alamar','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70009,0,0,0,0,0,1469,0,1469,0,'Demisette','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70010,0,0,0,0,0,12749,0,12749,0,'Nalesette','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70011,0,0,0,0,0,3401,0,3401,0,'Branstock','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70012,0,0,0,0,0,3395,0,3395,0,'Thorgas','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70013,0,0,0,0,0,3343,0,3343,0,'Llane','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70014,0,0,0,0,0,3399,0,3399,0,'Thran','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70015,0,0,0,0,0,1300,0,1300,0,'Lyria','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70016,0,0,0,0,0,3351,0,3351,0,'Jorik','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70017,0,0,0,0,0,3407,0,3407,0,'Solm','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70018,0,0,0,0,0,1297,0,1297,0,'Keryn','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70019,0,0,0,0,0,1507,0,1507,0,'Osborne','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70020,0,0,0,0,0,3346,0,3346,0,'Sammuel','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70021,0,0,0,0,0,3393,0,3393,0,'Bob','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70022,0,0,0,0,0,1299,0,1299,0,'Wilhelm','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70023,0,0,0,0,0,1499,0,1499,0,'Brisombre','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70024,0,0,0,0,0,10216,0,10216,0,'Marry','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70025,0,0,0,0,0,4552,0,4552,0,'Haromm','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70026,0,0,0,0,0,4567,0,4567,0,'Kartosh','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70027,0,0,0,0,0,3429,0,3429,0,'MaxanAnvol','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70028,0,0,0,0,0,10215,0,10215,0,'Magis','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70029,0,0,0,0,0,3431,0,3431,0,'GranVivehache','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70030,0,0,0,0,0,1622,0,1622,0,'Azar','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70031,0,0,0,0,0,3436,0,3436,0,'Hogral','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70032,0,0,0,0,0,3053,0,3053,0,'Kelstrum','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70033,0,0,0,0,0,1578,0,1578,0,'Dannal','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70034,0,0,0,0,0,1579,0,1579,0,'SombreDuesten','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70035,0,0,0,0,0,1592,0,1592,0,'Isabella','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70036,0,0,0,0,0,1581,0,1581,0,'Maximillion','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70037,0,0,0,0,0,1604,0,1604,0,'Rupert','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70038,0,0,0,0,0,1600,0,1600,0,'Cain','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70039,0,0,0,0,0,1602,0,1602,0,'SombreBeryl','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70041,0,0,0,0,0,10548,0,10548,0,'Milituus','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70042,0,0,0,0,0,2810,0,2810,0,'Lexington','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70043,0,0,0,0,0,2123,0,2123,0,'Siln','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70044,0,0,0,0,0,19598,0,19598,0,'Umbrua','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70045,0,0,0,0,0,2102,0,2102,0,'Tigor','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70046,0,0,0,0,0,2082,0,2082,0,'Beram','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70047,0,0,0,0,0,2106,0,2106,0,'Turak','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70048,0,0,0,0,0,2121,0,2121,0,'Sheal','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70049,0,0,0,0,0,2115,0,2115,0,'Kym','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70050,0,0,0,0,0,2112,0,2112,0,'Kary','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70051,0,0,0,0,0,2087,0,2087,0,'Holt','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70052,0,0,0,0,0,2105,0,2105,0,'Urek','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70053,0,0,0,0,0,2103,0,2103,0,'Torm','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70054,0,0,0,0,0,2096,0,2096,0,'Sark','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70055,0,0,0,0,0,17211,0,17211,0,'Kerra','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70056,0,0,0,0,0,2139,0,2139,0,'Miles Welsh','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70057,0,0,0,0,0,2138,0,2138,0,'Malakai','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70058,0,0,0,0,0,2137,0,2137,0,'Cobb','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70059,0,0,0,0,0,2134,0,2134,0,'Shymm','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,1,0,0,0,0,0,0,0,0,0,0,143,145,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70060,0,0,0,0,0,6058,0,6058,0,'Ursyn','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70061,0,0,0,0,0,2135,0,2135,0,'Thurston','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70062,0,0,0,0,0,3793,0,3793,0,'Harutt','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70063,0,0,0,0,0,3819,0,3819,0,'Gart','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70064,0,0,0,0,0,3810,0,3810,0,'Lanka','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70065,0,0,0,0,0,10180,0,10180,0,'Meela','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70066,0,0,0,0,0,3794,0,3794,0,'Krang','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70067,0,0,0,0,0,10734,0,10734,0,'Gennia','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70068,0,0,0,0,0,3811,0,3811,0,'Yaw','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70069,0,0,0,0,0,3816,0,3816,0,'Narm','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70070,0,0,0,0,0,1880,0,1880,0,'Frang','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70071,0,0,0,0,0,1882,0,1882,0,'Jenshan','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70072,0,0,0,0,0,1884,0,1884,0,'Nartok','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70073,0,0,0,0,0,1878,0,1878,0,'Shikrik','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70074,0,0,0,0,0,3743,0,3743,0,'Tarshaw','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70075,0,0,0,0,0,3744,0,3744,0,'Thotar','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70076,0,0,0,0,0,3745,0,3745,0,'Dhugru','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70077,0,0,0,0,0,3746,0,3746,0,'Swart','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70078,0,0,0,0,0,1324,0,1324,0,'Groldar','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70079,0,0,0,0,0,1325,0,1325,0,'Mirket','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70080,0,0,0,0,0,1326,0,1326,0,'Zevrost','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70081,0,0,0,0,0,1360,0,1360,0,'Kardris','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70082,0,0,0,0,0,1373,0,1373,0,'Ormak','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70083,0,0,0,0,0,1374,0,1374,0,'Grezz','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70084,0,0,0,0,0,1375,0,1375,0,'Sorek','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70085,0,0,0,0,0,4231,0,4231,0,'Siantsu','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70086,0,0,0,0,0,4239,0,4239,0,'Xorjuul','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70087,0,0,0,0,0,4241,0,4241,0,'Siandur','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70088,0,0,0,0,0,4242,0,4242,0,'Zelmak','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70089,0,0,0,0,0,7915,0,7915,0,'ClaudeErksine','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70090,0,0,0,0,0,1721,0,1721,0,'Alyissia','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70091,0,0,0,0,0,1725,0,1725,0,'FrahunMurmombre','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70092,0,0,0,0,0,1733,0,1733,0,'Shanda','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70093,0,0,0,0,0,1732,0,1732,0,'Mardant','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70094,0,0,0,0,0,1707,0,1707,0,'Kyra','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70095,0,0,0,0,0,1704,0,1704,0,'Jannok','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70096,0,0,0,0,0,1708,0,1708,0,'Laurna','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70097,0,0,0,0,0,1706,0,1706,0,'Kal','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70098,0,0,0,0,0,4296,0,4296,0,'Harruk','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70099,0,0,0,0,0,4299,0,4299,0,'Reban','Hunter bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70100,0,0,0,0,0,4304,0,4304,0,'Bolyun','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70101,0,0,0,0,0,1897,0,1897,0,'Taijin','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70102,0,0,0,0,0,4068,0,4068,0,'Kenjai','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70103,0,0,0,0,0,2066,0,2066,0,'Danlaar','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70104,0,0,0,0,0,2196,0,2196,0,'Ariasta','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70105,0,0,0,0,0,2198,0,2198,0,'Sildanair','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70106,0,0,0,0,0,2200,0,2200,0,'Astarii','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70107,0,0,0,0,0,2201,0,2201,0,'Jandria','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70108,0,0,0,0,0,2202,0,2202,0,'Lariia','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70109,0,0,0,0,0,2231,0,2231,0,'Syurna','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70110,0,0,0,0,0,7669,0,7669,0,'Elissa','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70111,0,0,0,0,0,2252,0,2252,0,'Erion','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70112,0,0,0,0,0,2243,0,2243,0,'Anishar','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70113,0,0,0,0,0,2250,0,2250,0,'Denatharion','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70114,0,0,0,0,0,2255,0,2255,0,'Fylerian','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70115,0,0,0,0,0,2416,0,2416,0,'Caelyb','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70116,0,0,0,0,0,2675,0,2675,0,'Kaal','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70117,0,0,0,0,0,16800,0,16800,0,'Lana','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70118,0,0,0,0,0,2646,0,2646,0,'Richard','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70119,0,0,0,0,0,10214,0,10214,0,'Kaelystia','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,6,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70120,0,0,0,0,0,2644,0,2644,0,'Pierce','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70121,0,0,0,0,0,2657,0,2657,0,'Anastasia','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70122,0,0,0,0,0,2620,0,2620,0,'Chris','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70123,0,0,0,0,0,2658,0,2658,0,'Angela','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70124,0,0,0,0,0,2614,0,2614,0,'Baltus','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70125,0,0,0,0,0,3054,0,3054,0,'Kelv','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70126,0,0,0,0,0,3055,0,3055,0,'Bilban','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70127,0,0,0,0,0,3056,0,3056,0,'Daera','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70128,0,0,0,0,0,3072,0,3072,0,'Olmin','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70129,0,0,0,0,0,3073,0,3073,0,'Regnus','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70130,0,0,0,0,0,3086,0,3086,0,'Theodrus','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70131,0,0,0,0,0,3066,0,3066,0,'Braenna','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70132,0,0,0,0,0,3085,0,3085,0,'Toldren','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70134,0,0,0,0,0,3108,0,3108,0,'Bink','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70135,0,0,0,0,0,10214,0,10214,0,'Juli','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70136,0,0,0,0,0,3109,0,3109,0,'Nittegousse','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70137,0,0,0,0,0,3089,0,3089,0,'Valgar','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70138,0,0,0,0,0,3088,0,3088,0,'Beldruk','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70139,0,0,0,0,0,3087,0,3087,0,'Brandur','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70140,0,0,0,0,0,3101,0,3101,0,'Hulfdan','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70141,0,0,0,0,0,3100,0,3100,0,'Ormyr','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70142,0,0,0,0,0,3113,0,3113,0,'Phenwick','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70143,0,0,0,0,0,3115,0,3115,0,'Coeurdechardon','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70144,0,0,0,0,0,3116,0,3116,0,'Eglantin','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70145,0,0,0,0,0,3122,0,3122,0,'Alexander','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70146,0,0,0,0,0,3280,0,3280,0,'Wu','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70147,0,0,0,0,0,3287,0,3287,0,'Ilsa','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70148,0,0,0,0,0,3283,0,3283,0,'Joshua','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70149,0,0,0,0,0,3284,0,3284,0,'Arthur','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70150,0,0,0,0,0,3289,0,3289,0,'Katherine','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70151,0,0,0,0,0,3291,0,3291,0,'Deline','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70152,0,0,0,0,0,3286,0,3286,0,'Sandahl','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70153,0,0,0,0,0,3292,0,3292,0,'Jennea','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70154,0,0,0,0,0,19803,0,19803,0,'Elsharin','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70155,0,0,0,0,0,3299,0,3299,0,'Kaerbrus','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70156,0,0,0,0,0,3300,0,3300,0,'Sheldras','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70157,0,0,0,0,0,3301,0,3301,0,'Theridran','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70158,0,0,0,0,0,3312,0,3312,0,'Einris','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70159,0,0,0,0,0,3309,0,3309,0,'Ulfir','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70160,0,0,0,0,0,3310,0,3310,0,'Thorfin','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70161,0,0,0,0,0,10171,0,10171,0,'UnThuwa','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70162,0,0,0,0,0,4524,0,4524,0,'Pephredo','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70163,0,0,0,0,0,4522,0,4522,0,'Enyo','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70164,0,0,0,0,0,4526,0,4526,0,'Mai','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70165,0,0,0,0,0,4523,0,4523,0,'Deino','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70166,0,0,0,0,0,4665,0,4665,0,'Birgitte','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70167,0,0,0,0,0,12849,0,12849,0,'Thuul','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70168,0,0,0,0,0,4690,0,4690,0,'Zayus','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70169,0,0,0,0,0,10473,0,10473,0,'Xyera','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70170,0,0,0,0,0,4711,0,4711,0,'Urkyo','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70171,0,0,0,0,0,6060,0,6060,0,'Uthelnay','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70172,0,0,0,0,0,6072,0,6072,0,'Dink','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70173,0,0,0,0,0,6071,0,6071,0,'Darnath','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70174,0,0,0,0,0,7356,0,7356,0,'Karman','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70175,0,0,0,0,0,11037,0,11037,0,'Evencane','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70176,0,0,0,0,0,7357,0,7357,0,'Jannos','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70177,0,0,0,0,0,7538,0,7538,0,'Alenndaar','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70178,0,0,0,0,0,10738,0,10738,0,'Golhine','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70179,0,0,0,0,0,9337,0,9337,0,'Hesuwa','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70180,0,0,0,0,0,9336,0,9336,0,'Xao\'tsu','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70181,0,0,0,0,0,9338,0,9338,0,'Belia','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,3,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70182,0,0,0,0,0,10245,0,10245,0,'Dargh','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70183,0,0,0,0,0,11044,0,11044,0,'Meideros','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70184,0,0,0,0,0,11048,0,11048,0,'Presse','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70185,0,0,0,0,0,11053,0,11053,0,'Rohan','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70186,0,0,0,0,0,12053,0,12053,0,'Loganaar','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70187,0,0,0,0,0,13171,0,13171,0,'Romano','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70188,0,0,0,0,0,13341,0,13341,0,'Sagorne','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70189,0,0,0,0,0,15522,0,15522,0,'Julia','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70190,0,0,0,0,0,16811,0,16811,0,'Ithelis','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70191,0,0,0,0,0,15524,0,15524,0,'Invocateur','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70192,0,0,0,0,0,15518,0,15518,0,'Matrone','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70193,0,0,0,0,0,2659,0,2659,0,'Eclaireur','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70194,0,0,0,0,0,15520,0,15520,0,'Sallina','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70195,0,0,0,0,0,16685,0,16685,0,'Noellene','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70196,0,0,0,0,0,16707,0,16707,0,'Ponaris','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70197,0,0,0,0,0,16222,0,16222,0,'Keilnei','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70198,0,0,0,0,0,16223,0,16223,0,'Valaatu','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70199,0,0,0,0,0,16224,0,16224,0,'Aurelon','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70200,0,0,0,0,0,16225,0,16225,0,'Zalduun','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70201,0,0,0,0,0,16226,0,16226,0,'Kore','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70202,0,0,0,0,0,16787,0,16787,0,'Alamma','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70203,0,0,0,0,0,16800,0,16800,0,'Talionia','Warlock Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,8,0,16384,0,0,0,0,9,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warlock_bot',-1),(70204,0,0,0,0,0,16831,0,16831,0,'Zanien','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3500,2000,1,1,2,0,16384,0,0,0,0,9,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70205,0,0,0,0,0,16781,0,16781,0,'Zaedana','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70206,0,0,0,0,0,16824,0,16824,0,'Quithas','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70207,0,0,0,0,0,16739,0,16739,0,'Harene','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70208,0,0,0,0,0,16778,0,16778,0,'Tana','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70209,0,0,0,0,0,16816,0,16816,0,'Oninath','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70210,0,0,0,0,0,16829,0,16829,0,'Bachi','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70211,0,0,0,0,0,16767,0,16767,0,'Zelanis','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70212,0,0,0,0,0,16798,0,16798,0,'Elara','Rogue Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,1600,2000,1,1,4,0,16384,0,0,0,0,4,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'rogue_bot',-1),(70213,0,0,0,0,0,16858,0,16858,0,'Shalannius','Druid Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2200,2000,1,1,2,0,16384,0,0,0,0,11,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'druid_bot',-1),(70214,0,0,0,0,0,17434,0,17434,0,'Deremiis','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70215,0,0,0,0,0,17247,0,17247,0,'Caedmos','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70216,0,0,0,0,0,17225,0,17225,0,'Baatun','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70217,0,0,0,0,0,17212,0,17212,0,'Ahonan','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70218,0,0,0,0,0,17598,0,17598,0,'Firmanvaar','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70219,0,0,0,0,0,16860,0,16860,0,'Actron','Hunter Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70220,0,0,0,0,0,17213,0,17213,0,'Behomat','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70221,0,0,0,0,0,17600,0,17600,0,'Nobundo','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70222,0,0,0,0,0,17599,0,17599,0,'Tuluun','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70223,0,0,0,0,0,16914,0,16914,0,'Sulaa','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70224,0,0,0,0,0,17215,0,17215,0,'Ruada','Warrior Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3400,2000,1,1,1,0,16384,0,0,0,0,1,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'warrior_bot',-1),(70225,0,0,0,0,0,17233,0,17233,0,'Semid','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70226,0,0,0,0,0,17232,0,17232,0,'Guvan','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70227,0,0,0,0,0,17234,0,17234,0,'Tullas','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70228,0,0,0,0,0,17488,0,17488,0,'Killac','Hunter bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2800,2000,1,1,2,0,16384,0,0,0,0,3,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'hunter_bot',-1),(70229,0,0,0,0,0,17226,0,17226,0,'Jol','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70230,0,0,0,0,0,17248,0,17248,0,'Fallat','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70231,0,0,0,0,0,17243,0,17243,0,'Harnan','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70232,0,0,0,0,0,17241,0,17241,0,'Bati','Mage Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3800,2000,1,1,8,0,16384,0,0,0,0,8,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'mage_bot',-1),(70233,0,0,0,0,0,17792,0,17792,0,'Hobahken','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70234,0,0,0,0,0,6820,0,6820,0,'Gurrag','Shaman Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2600,2000,1,1,2,0,16384,0,0,0,0,7,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'shaman_bot',-1),(70235,0,0,0,0,0,19596,0,19596,0,'Auberose','Paladin Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,2300,2000,1,1,2,0,16384,0,0,0,0,2,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'paladin_bot',-1),(70236,0,0,0,0,0,10335,10335,10335,10335,'Afina','Priest Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3600,2000,1,1,8,0,16384,0,0,0,0,5,1,7,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'priest_bot',-1),(70237,0,0,0,0,0,26939,26939,26939,26939,'Imhadria','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70238,0,0,0,0,0,28039,28039,28039,28039,'Mynx','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,0.8,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70239,0,0,0,0,0,26688,26688,26688,26688,'Lankral','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,1,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70240,0,0,0,0,0,26195,26195,26195,26195,'Silver','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70241,0,0,0,0,0,27402,27402,27402,27402,'Vereth','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,0.8,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70242,0,0,0,0,0,27189,27189,27189,27189,'Arly','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,7,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70243,0,0,0,0,0,26217,26217,26217,26217,'Setaal','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,11,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70244,0,0,0,0,0,28842,28842,28842,28842,'Illyrie','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,4,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70245,0,0,0,0,0,28840,28840,28840,28840,'Zor\'be','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70246,0,0,0,0,0,25512,25512,25512,25512,'Datura','Death Knight Bot','',0,1,80,2,14,1,1.2,1.3,1,0,0,3300,2000,1,1,1,0,16384,0,0,0,0,6,10,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157552,'death_knight_bot',-1),(70247,0,0,0,0,0,1132,0,1132,0,'Voidwalker','Warlock\'s Pet Bot',NULL,0,1,80,2,14,0,1.2,1.3,1,0,0,2000,2000,1,1,2,0,0,0,16,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,1048688,'voidwalker_bot',-1),(70248,0,0,0,0,0,1105,0,0,0,'Hunter\'s Pet',NULL,NULL,0,1,80,0,14,0,1.1,1.14286,1,0,0,2000,0,1,1,1,0,0,0,7,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,5708,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,149,1,0,0,'',-1),(70301,0,0,0,0,0,17659,17659,17659,17659,'Gorkramato','Ex. Blademaster','',0,81,81,2,14,1,1.2,1.3,1.05,4,0,2200,2000,1,1,1,0,16384,0,0,0,0,12,2,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1,1,1,1,1,0,0,0,1,68157560,'blademaster_bot',-1),(71000,0,0,0,0,0,16853,16853,16853,16853,'Airen','Priestess of Suffering',NULL,0,95,95,1,14,1,1.2,1.3,1.173,4,0,1500,0,1,1,1,898,49152,2,0,0,0,0,0,3,67110912,0,0,0,450,450,450,450,450,450,0,0,0,0,0,0,0,0,0,0,0,0,'',0,3,1,1000,1,5,5,1,1,0,0,617299839,1048946,'npc_Airen_qI',-213);


-- EQUIPS --

delete from `creature_equip_template` where CreatureID between @BOT_START and @BOT_END;

insert into `creature_equip_template` (`CreatureID`, `ID`, `itemID1`, `itemID2`, `itemID3`, `VerifiedBuild`) values
('70001','1','18842','0','0','0'), ('70002','1','18842','0','0','0'), ('70003','1','18842','0','0','0'), ('70004','1','31289','0','0','0'), ('70005','1','31289','0','0','0'), ('70006','1','31289','0','0','0'),
('70007','1','31186','0','0','0'), ('70008','1','31186','0','0','0'), ('70009','1','31186','0','0','0'), ('70010','1','2291','0','2825','0'), ('70011','1','31289','0','0','0'), ('70012','1','2291','0','2825','0'),
('70013','1','18002','0','0','0'), ('70014','1','27903','0','0','0'), ('70015','1','7723','0','0','0'), ('70016','1','13984','6448','0','0'), ('70017','1','13984','6448','0','0'), ('70018','1','6633','820','0','0'),
('70019','1','13984','6448','0','0'), ('70020','1','12584','18825','0','0'), ('70021','1','18876','0','0','0'), ('70022','1','12584','18825','0','0'), ('70023','1','18876','0','0','0'), ('70024','1','18842','0','0','0'),
('70025','1','18203','18202','0','0'), ('70026','1','31186','0','0','0'), ('70027','1','31289','0','0','0'), ('70028','1','18842','0','0','0'), ('70029','1','28367','0','0','0'), ('70030','1','12584','18825','0','0'),
('70031','1','13984','6448','0','0'), ('70032','1','27903','0','0','0'), ('70033','1','18002','0','0','0'), ('70034','1','31289','0','0','0'), ('70035','1','18842','0','0','0'), ('70036','1','31186','0','0','0'),
('70037','1','31186','0','0','0'), ('70038','1','18842','0','0','0'), ('70039','1','31289','0','0','0'), ('70041','1','18842','0','0','0'), ('70042','1','18842','0','0','0'), ('70043','1','18203','18202','0','0'),
('70044','1','18203','18202','0','0'), ('70045','1','18203','18202','0','0'), ('70046','1','18203','18202','0','0'), ('70047','1','25622','0','0','0'), ('70048','1','25622','0','0','0'), ('70049','1','25622','0','0','0'),
('70050','1','2291','0','2825','0'), ('70051','1','2291','0','2825','0'), ('70052','1','2291','0','2825','0'), ('70053','1','18002','0','0','0'), ('70054','1','27903','0','0','0'), ('70055','1','28367','0','0','0'),
('70056','1','31289','0','0','0'), ('70057','1','31289','0','0','0'), ('70058','1','31289','0','0','0'), ('70059','1','18842','0','0','0'), ('70060','1','18842','0','0','0'), ('70061','1','18842','0','0','0'),
('70062','1','28367','0','0','0'), ('70063','1','25622','0','0','0'), ('70064','1','2291','0','2825','0'), ('70065','1','18203','18202','0','0'), ('70066','1','18002','0','0','0'), ('70067','1','25622','0','0','0'),
('70068','1','2291','0','2825','0'), ('70069','1','18203','18202','0','0'), ('70070','1','27903','0','0','0'), ('70071','1','2291','0','2825','0'), ('70072','1','31186','0','0','0'), ('70073','1','18203','18202','0','0'),
('70074','1','18002','0','0','0'), ('70075','1','2291','0','2825','0'), ('70076','1','31186','0','0','0'), ('70077','1','18203','18202','0','0'), ('70078','1','31186','0','0','0'), ('70079','1','31186','0','0','0'),
('70080','1','31186','0','0','0'), ('70081','1','18203','18202','0','0'), ('70082','1','2291','0','2825','0'), ('70083','1','7723','0','0','0'), ('70084','1','18002','0','0','0'), ('70085','1','18203','18202','0','0'),
('70086','1','2291','0','2825','0'), ('70087','1','2291','0','2825','0'), ('70088','1','27903','0','0','0'), ('70089','1','2291','0','2825','0'), ('70090','1','28367','0','0','0'), ('70091','1','6633','820','0','0'),
('70092','1','31289','0','0','0'), ('70093','1','25622','0','0','0'), ('70094','1','18002','0','0','0'), ('70095','1','13984','6448','0','0'), ('70096','1','31289','0','0','0'), ('70097','1','25622','0','0','0'),
('70098','1','2291','0','2825','0'), ('70099','1','2291','0','2825','0'),
('70100','1','2291','0','2825','0'), ('70101','1','31289','0','0','0'), ('70102','1','31289','0','0','0'), ('70103','1','2291','0','2825','0'), ('70104','1','7723','0','0','0'), ('70105','1','18002','0','0','0'),
('70106','1','31289','0','0','0'), ('70107','1','31289','0','0','0'), ('70108','1','31289','0','0','0'), ('70109','1','13984','6448','0','0'), ('70110','1','18842','0','0','0'), ('70111','1','6633','820','0','0'),
('70112','1','13984','6448','0','0'), ('70113','1','25622','0','0','0'), ('70114','1','25622','0','0','0'), ('70115','1','2291','0','2825','0'), ('70116','1','31186','0','0','0'), ('70117','1','31186','0','0','0'),
('70118','1','31186','0','0','0'), ('70119','1','18842','0','0','0'), ('70120','1','18842','0','0','0'), ('70121','1','18842','0','0','0'), ('70122','1','27903','0','0','0'), ('70123','1','18002','0','0','0'),
('70124','1','7723','0','0','0'), ('70125','1','18002','0','0','0'), ('70126','1','28367','0','0','0'), ('70127','1','2291','0','2825','0'), ('70128','1','2291','0','2825','0'), ('70129','1','2291','0','2825','0'),
('70130','1','31289','0','0','0'), ('70131','1','31289','0','0','0'), ('70132','1','31289','0','0','0'), ('70134','1','18842','0','0','0'), ('70135','1','18842','0','0','0'), ('70136','1','18842','0','0','0'),
('70137','1','18876','0','0','0'), ('70138','1','12584','18825','0','0'), ('70139','1','18876','0','0','0'), ('70140','1','6633','820','0','0'), ('70141','1','13984','6448','0','0'), ('70142','1','6633','820','0','0'),
('70143','1','31186','0','0','0'), ('70144','1','31186','0','0','0'), ('70145','1','31186','0','0','0'), ('70146','1','27903','0','0','0'), ('70147','1','18002','0','0','0'), ('70148','1','31289','0','0','0'),
('70149','1','12584','18825','0','0'), ('70150','1','18876','0','0','0'),
('70151','1','31186','0','0','0'), ('70152','1','31186','0','0','0'), ('70153','1','18842','0','0','0'), ('70154','1','18842','0','0','0'), ('70155','1','2291','0','2825','0'), ('70156','1','25622','0','0','0'),
('70157','1','25622','0','0','0'), ('70158','1','2291','0','2825','0'), ('70159','1','2291','0','2825','0'), ('70160','1','2291','0','2825','0'), ('70161','1','18842','0','0','0'), ('70162','1','18842','0','0','0'),
('70163','1','18842','0','0','0'), ('70164','1','18842','0','0','0'), ('70165','1','18842','0','0','0'), ('70166','1','18842','0','0','0'), ('70167','1','18842','0','0','0'), ('70168','1','31289','0','0','0'),
('70169','1','31289','0','0','0'), ('70170','1','31289','0','0','0'), ('70171','1','18842','0','0','0'), ('70172','1','18842','0','0','0'), ('70173','1','28367','0','0','0'), ('70174','1','12584','18825','0','0'),
('70175','1','7723','0','0','0'), ('70176','1','25622','0','0','0'), ('70177','1','2291','0','2825','0'), ('70178','1','25622','0','0','0'), ('70179','1','2291','0','2825','0'), ('70180','1','2291','0','2825','0'),
('70181','1','2291','0','2825','0'), ('70182','1','2291','0','2825','0'), ('70183','1','31289','0','0','0'), ('70184','1','31289','0','0','0'), ('70185','1','31289','0','0','0'), ('70186','1','25622','0','0','0'),
('70187','1','13984','6448','0','0'), ('70188','1','18203','18202','0','0'), ('70189','1','18842','0','0','0'), ('70190','1','12584','18826','0','0'), ('70191','1','31186','0','0','0'), ('70192','1','31289','0','0','0'),
('70193','1','13984','6448','0','0'), ('70194','1','2291','0','2825','0'), ('70195','1','12584','18826','0','0'), ('70196','1','31289','0','0','0'), ('70197','1','2291','0','2825','0'), ('70198','1','18842','0','0','0'),
('70199','1','18876','0','0','0'), ('70200','1','31289','0','0','0'),
('70201','1','27903','0','0','0'), ('70202','1','31186','0','0','0'), ('70203','1','31186','0','0','0'), ('70204','1','31186','0','0','0'), ('70205','1','18842','0','0','0'), ('70206','1','18842','0','0','0'),
('70207','1','25622','0','0','0'), ('70208','1','2291','0','2825','0'), ('70209','1','2291','0','2825','0'), ('70210','1','12584','18826','0','0'), ('70211','1','6633','820','0','0'), ('70212','1','13984','6448','0','0'),
('70213','1','25622','0','0','0'), ('70214','1','2291','0','2825','0'), ('70215','1','31289','0','0','0'), ('70216','1','18876','0','0','0'), ('70217','1','28367','0','0','0'), ('70218','1','18203','18202','0','0'),
('70219','1','2291','0','2825','0'), ('70220','1','18002','0','0','0'), ('70221','1','18203','18202','0','0'), ('70222','1','18203','18202','0','0'), ('70223','1','18203','18202','0','0'), ('70224','1','27903','0','0','0'),
('70225','1','18842','0','0','0'), ('70226','1','31289','0','0','0'), ('70227','1','12584','18825','0','0'), ('70228','1','2291','0','2825','0'), ('70229','1','18876','0','0','0'), ('70230','1','31289','0','0','0'),
('70231','1','18842','0','0','0'), ('70232','1','18842','0','0','0'), ('70233','1','18203','18202','0','0'), ('70234','1','18203','18202','0','0'), ('70235','1','29175','18826','0','0'), ('70236','1','31289','0','0','0'),
('70237','1','13505','0','0','0'), ('70238','1','12775','0','0','0'), ('70239','1','24044','0','0','0'), ('70240','1','43601','0','0','0'), ('70241','1','23499','0','0','0'), ('70242','1','38632','0','0','0'),
('70243','1','34891','0','0','0'), ('70244','1','38632','0','0','0'), ('70245','1','50798','0','0','0'), ('70246','1','12592','0','0','0'), ('70301','1','24044','0','0','0'),

('71000','1','0','30902','0','0');

-- -- -- Update 18.09.13 - Equips for shamans
-- Orcs and Draenei. Mainhand: Cudgel of Furious Justice, Offhand: Azure-Shield of Coldarra
UPDATE `creature_equip_template` SET `itemID1` = '50050', `itemID2` = '29266', `itemID3` = '0' WHERE `CreatureID` IN (SELECT entry FROM `creature_template` WHERE (`entry` BETWEEN @BOT_START AND @BOT_END) AND `trainer_class` = '7' AND (`trainer_race` = '2' OR `trainer_race` = '11'));
-- Taurens and some Draenei. De-Raged Waraxe (Two-Hand)
UPDATE `creature_equip_template` SET `itemID1` = '41816', `itemID2` = '0', `itemID3` = '0' WHERE `CreatureID` IN (SELECT entry FROM `creature_template` WHERE (`entry` BETWEEN @BOT_START AND @BOT_END) AND `trainer_class` = '7' AND (`trainer_race` = '6' OR `entry` IN (70218,70222,70223,70233)));


-- GOSSIPS --
delete from `npc_text` where ID between @BOT_START and @BOT_END;
insert into `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`,
`text4_0`, `text4_1`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`)
values
('70001','I live only to serve the master.','','0','1','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','-213'),
('70002','You need something?','','0','1','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','','','0','0','0','0','0','0','0','0','-213'),
('70003','Mortals... usually I kill wretches like you at sight',NULL,'0','1','396','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0','-213');


-- OUTFITS --
-- Npc Dress mod by Rochet2
CREATE TABLE IF NOT EXISTS `creature_template_outfits` (
    `entry` INT(10) UNSIGNED NOT NULL,
    `race` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
    `gender` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 for male, 1 for female',
    `skin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
    `face` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
    `hair` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
    `haircolor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
    `facialhair` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
    `head` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `shoulders` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `body` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `chest` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `waist` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `legs` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `feet` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `wrists` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `hands` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `back` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    `tabard` INT(10) UNSIGNED NOT NULL DEFAULT '0',
    PRIMARY KEY  (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- End Npc Dress mod

replace into `creature_template_outfits` (`entry`, `race`, `gender`, `skin`, `face`, `hair`, `haircolor`, `facialhair`, `head`, `shoulders`, `body`, `chest`, `waist`, `legs`, `feet`, `wrists`, `hands`, `back`, `tabard`)
values
('70301','2','0','0','14','9','7','5','0','0','0','0','59194','64674','0','36248','0','0','0'), -- Blademaster
('71000','11','1','0','5','0','6','0','0','53903','21842','35049','35058','35051','35067','35044','0','0','0'); -- Airen


-- Customize section
-- You can create your own values to be in line with your own server if these are not acceptable.

SET @CLASS_WARRIOR = 1;
SET @CLASS_PALADIN = 2;
SET @CLASS_HUNTER  = 3;
SET @CLASS_ROGUE   = 4;
SET @CLASS_PRIEST  = 5;
SET @CLASS_DK      = 6;
SET @CLASS_SHAMAN  = 7;
SET @CLASS_MAGE    = 8;
SET @CLASS_WARLOCK = 9;
SET @CLASS_DRUID   = 11;
SET @CLASS_BM      = 12;

-- Add flags_extra
-- -- -- Update 6.04.14 - extra flags for recognizing bots core-side - CREATURE_FLAG_EXTRA_NPCBOT

SET @EX_NO_PARRY_HASTEN = 8; -- 0x00000008 - CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN
SET @EX_NO_BLOCK = 16; -- 0x00000010 - CREATURE_FLAG_EXTRA_NO_BLOCK
SET @EX_NO_CRUSH = 32; -- 0x00000020 - CREATURE_FLAG_EXTRA_NO_CRUSH
SET @EX_NO_XP = 64; -- 0x00000040 - CREATURE_FLAG_EXTRA_NO_XP_AT_KILL
SET @EX_DIMINISH = 1048576; -- 0x00100000 - CREATURE_FLAG_EXTRA_ALL_DIMINISH
SET @EX_NPCBOT = 67108864; -- 0x04000000 - CREATURE_FLAG_EXTRA_NPCBOT - custom flag
SET @FLAGS_EX = @EX_NO_BLOCK | @EX_NO_CRUSH | @EX_NO_XP | @EX_DIMINISH | @EX_NPCBOT;
SET @FLAGS_EXN = @EX_NO_BLOCK | @EX_NO_CRUSH | @EX_NO_XP | @EX_DIMINISH | @EX_NPCBOT | @EX_NO_PARRY_HASTEN;
SET @FLAGS_EX_PET = @EX_NO_BLOCK | @EX_NO_CRUSH | @EX_NO_XP | @EX_DIMINISH;

-- Add extra 'unit_flags2' flags
SET @U2_ENEMY_INTERRACT = 16384; -- 0x00004000 - UNIT_FLAG2_ALLOW_ENEMY_INTERACT
SET @FLAGS_U2 = @U2_ENEMY_INTERRACT;

-- minions
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=3300, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_DK;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=2200, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_DRUID;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=2800, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_HUNTER;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=3800, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_MAGE;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=2300, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_PALADIN;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=3600, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_PRIEST;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=1600, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_ROGUE;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=2600, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_SHAMAN;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=3500, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_WARLOCK;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=3400, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_WARRIOR;
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=81, maxlevel:=81, baseattacktime:=2200, rangeattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EXN, unit_flags2:=`unit_flags2`|@FLAGS_U2, AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and trainer_class=@CLASS_BM;

-- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK       -- DK
-- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid    -- Druid
-- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter   -- Hunter
-- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage     -- Mage
-- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin  -- Paladin
-- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest   -- Priest
-- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue    -- Rogue
-- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman   -- Shaman
-- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock  -- Warlock
-- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior  -- Warrior
-- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster  -- BMaster

-- pets
UPDATE `creature_template` SET exp:=2, faction:=14, DamageModifier:=1.0, minlevel:=80, maxlevel:=80, baseattacktime:=2000, dynamicflags:=0, speed_walk:=1.2, speed_run:=1.3, InhabitType:=3, HealthModifier:=1, ManaModifier:=1, ArmorModifier:=1, RegenHealth:=0, mechanic_immune_mask:=1, flags_extra:=@FLAGS_EX_PET,                                       AIName:='', VerifiedBuild:=-1 where entry between @BOT_START and @BOT_END-1 and name='Voidwalker';

-- end
 
 
/* 
* world_npc.sql 
*/ 
SET
@Entry = 190012,
@Name = "Narpweaver";

INSERT INTO `creature_template` (`entry`, `modelid1`, `modelid2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(@Entry, 19646, 0, @Name, "Transmogrifier", NULL, 0, 80, 80, 2, 35, 129, 1, 0, 0, 2000, 0, 1, 0, 7, 138936390, 0, 0, 0, '', 0, 3, 1, 0, 0, 1, 0, 0, 'NPC_TransmogDisplayVendor');
 
 
/* 
* world_npc_buff.sql 
*/ 
DROP TABLE IF EXISTS `npc_buff_spells`;

CREATE TABLE `npc_buff_spells` (
  `spell_id` int(5) NOT NULL default '0' COMMENT 'Spell entry number',
  `cat_number` int(5) NOT NULL default '0' COMMENT '0-small buff 1-great buff 2-gm buff 3-player tools',
  `cost` int(10) NOT NULL default '0' COMMENT 'cost amount in copper',
  `name` text COMMENT 'Name of spell',
  PRIMARY KEY  (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `npc_buff_spells` */

INSERT INTO `npc_buff_spells` (`spell_id`, `cat_number`, `cost`, `name`) VALUES
-- Small Buff
(48469,1001,10000,"Mark of the Wild"),
(53307,1002,10000,"Thorns"),
(43017,1003,10000,"Amplify Magic"),
(42995,1004,10000,"Arcane Intellect"),
(61024,1005,10000,"Dalaran Intellect"),
(43015,1006,10000,"Dampen Magic"),
(20217,1007,10000,"Blessing of Kings"),
(48932,1008,10000,"Blessing of Might"),
(48936,1009,10000,"Blessing of Wisdom"),
(48072,1010,10000,"Divine Spirit"),
(48161,1011,10000,"Power Word: Fortitude"),
(48169,1012,10000,"Shadow Protection"),
-- Great Buff
(48470,2001,100000,"Gift of the Wild"),
(43002,2002,100000,"Arcane Brilliance"),
(61316,2003,100000,"Dalaran Brilliance"),
(25898,2004,100000,"Greater Blessing of Kings"),
(48934,2005,100000,"Greater Blessing of Might"),
(25899,2006,100000,"Greater Blessing of Sanctuary"),
(48938,2007,100000,"Greater Blessing of Wisdom"),
(48162,2008,100000,"Prayer of Fortitude"),
(48170,2009,100000,"Prayer of Shadow Protection"),
(48074,2010,100000,"Prayer of Spirit"),
-- GM Buff
(17013,3001,0,"Agamaggan's Agility"),
(16612,3002,0,"Agamaggan's Strength"),
(58453,3003,0,"Armor Magic"),
(34106,3004,0,"Armor Penetration"),
(25661,3005,0,"Increased Stamina"),
(16610,3006,0,"Razorhide"),
(10767,3007,0,"Rising Spirit"),
(16618,3008,0,"Spirit of the Wind"),
(7764,3009,0,"Wisdom of Agamaggan"),
-- Player Tools
(46642,4001,0,"Give me Gold"),
(24827,4002,0,"Give me Soul Shards"),
(38588,4003,0,"Heal me please"),
(53251,4004,0,"Heal me and party members Please"),
(42956,4005,0,"Conjure Refreshment"),
(42985,4006,0,"Conjure Mana Gem");

DELETE FROM `creature_template` WHERE `entry` = 60002;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('60002','0','0','0','0','0','18','0','18','0','LordPsyan','Buffs master','','0','59','61','0','35','1','1.48','1.14286','0','0','0','1500','1900','1','1','1','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','1','1','1','1','1','1','0','0','1','0','0','npc_buff','1');

REPLACE INTO `npc_text` (`ID`, `text0_0`) VALUES
   (100002, 'Choose your Buff Type.'),
   (100003, 'Choose your Buff.'); 
 
/* 
* world_professionnpc.sql 
*/ 
DELETE FROM `creature_template` WHERE `entry` = 60001;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values
('60001','0','0','0','0','0','18','0','18','0','Cyon','Profession master','','0','59','61','0','35','1','1.48','1.14286','0','0','0','1500','1900','1','1','1','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','1','1','1','1','1','1','0','0','1','0','0','professionnpc','1');
-- end
 
 
/* 
* world_texts.sql 
*/ 
SET @TEXT_ID := 50000;
INSERT INTO `npc_text` (`ID`, `text0_0`) VALUES
(@TEXT_ID, 'Transmogrification allows you to change how your items look like without changing the stats of the items.\r\nItems used in transmogrification are no longer refundable, tradeable and are bound to you.\r\nUpdating a menu updates the view and prices.\r\n\r\nNot everything can be transmogrified with eachother.\r\nRestrictions include but are not limited to:\r\nOnly armor and weapons can be transmogrified\r\nGuns, bows and crossbows can be transmogrified with eachother\r\nFishing poles can not be transmogrified\r\nYou must be able to equip both items used in the process.\r\n\r\nTransmogrifications stay on your items as long as you own them.\r\nIf you try to put the item in guild bank or mail it to someone else, the transmogrification is stripped.\r\n\r\nYou can also remove transmogrifications for free at the transmogrifier.'),
(@TEXT_ID+1, 'You can save your own transmogrification sets.\r\n\r\nTo save, first you must transmogrify your equipped items.\r\nThen when you go to the set management menu and go to save set menu,\r\nall items you have transmogrified are displayed so you see what you are saving.\r\nIf you think the set is fine, you can click to save the set and name it as you wish.\r\n\r\nTo use a set you can click the saved set in the set management menu and then select use set.\r\nIf the set has a transmogrification for an item that is already transmogrified, the old transmogrification is lost.\r\nNote that same transmogrification restrictions apply when trying to use a set as in normal transmogrification.\r\n\r\nTo delete a set you can go to the set\'s menu and select delete set.');

SET @STRING_ENTRY := 11100;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(@STRING_ENTRY+0, 'Item transmogrified'),
(@STRING_ENTRY+1, 'Equipment slot is empty'),
(@STRING_ENTRY+2, 'Invalid source item selected'),
(@STRING_ENTRY+3, 'Source item does not exist'),
(@STRING_ENTRY+4, 'Destination item does not exist'),
(@STRING_ENTRY+5, 'Selected items are invalid'),
(@STRING_ENTRY+6, 'Not enough money'),
(@STRING_ENTRY+7, 'You don\'t have enough tokens'),
(@STRING_ENTRY+8, 'Transmogrifications removed'),
(@STRING_ENTRY+9, 'There are no transmogrifications'),
(@STRING_ENTRY+10, 'Invalid name inserted');
 
 
/* 
* World_TrinityChat.sql 
*/ 
/**
* Table structure for irc_commands
*/
DROP TABLE IF EXISTS `irc_commands`;
CREATE TABLE `irc_commands` (
  `Command` varchar(10) NOT NULL default '',
  `Description` varchar(350) default NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='IRC Module System';

/**
* Records
*/
INSERT INTO `irc_commands` VALUES ('acct', '[acct <Player> <(un)lock/email/pass/rename/gmlevel>] : Perform Action To <Player> Account.', '3');
INSERT INTO `irc_commands` VALUES ('ban', '[ban <Player/IP> <ip/acct/unban/reason>] : Ban/Unban <Player>', '3');
INSERT INTO `irc_commands` VALUES ('chan', '[chan <op/deop/voice/devoice> <*IRC Nick*>] : Set Mode On Yourself, If <IRC Nick> Is Specified Then Set mode On Nick.', '3');
INSERT INTO `irc_commands` VALUES ('char', '[char <Player> <mailcheat/taxicheat/maxskill/setskill/combatstop/quest/mod>] : Perform Action To Character.', '3');
INSERT INTO `irc_commands` VALUES ('fun', '[fun <Player> <Sound/Say>] : Do Selected Fun Action To <Player>.', '3');
INSERT INTO `irc_commands` VALUES ('help', '[help Command] : Use No Paramaters For List Of Available Commands.', '0');
INSERT INTO `irc_commands` VALUES ('inchan', '[inchan <Channel>] : Display Users In Selected In Game <Channel>', '0');
INSERT INTO `irc_commands` VALUES ('info', '[info] : Display Server Info. (Number Of Players Online/Max Since Last Restart/Uptime)', '0');
INSERT INTO `irc_commands` VALUES ('item', '[item <Player> <add> <ItemID/[ItemName]> <Amount>] : Additem To <Player>, Use <ItemID> Or <[Exact Item Name]>.', '3');
INSERT INTO `irc_commands` VALUES ('jail', '[jail <Player> <release/Reason>] : Jail Selected <Player> For <Reason>. Using release As <Reason> Releases Player.', '3');
INSERT INTO `irc_commands` VALUES ('kick', '[kick <Player> <Reason>] : Kick <Player> For <Reason>.', '3');
INSERT INTO `irc_commands` VALUES ('kill', '[kill <Player> <Reason>] : Kill <Player> For <Reason>.', '3');
INSERT INTO `irc_commands` VALUES ('level', '[level <Player> <NewLevel>] : Level <Player> To <NewLevel>. *Can Be Done Offline*', '3');
INSERT INTO `irc_commands` VALUES ('login', '[login <UserName> <Password>] : Login To TriniChat Admin Mode.  (Must Be Done In A PM)', '0');
INSERT INTO `irc_commands` VALUES ('logout', '[logout] : Logout Of TriniChat Admin Mode.', '0');
INSERT INTO `irc_commands` VALUES ('lookup', '[lookup <acct/char/creature/faction/go/item/quest/skill/spell/tele> <ID/Name>] : ', '3');
INSERT INTO `irc_commands` VALUES ('money', '[money <Player> <(-)Money>] : Give Money To <Player>, Use - To Take Money. *Can Be Done Offline*', '3');
INSERT INTO `irc_commands` VALUES ('mute', '[mute <Player> <release/TimeInMins> <Reason>] : Mute Player For Reason, For <TimeInMins>. Using release As Time Releases Player. *Can Be Done Offline*', '3');
INSERT INTO `irc_commands` VALUES ('online', '[online] : Display All Users Logged In Game.', '0');
INSERT INTO `irc_commands` VALUES ('pm', '[pm <Player> <Message>] : Whisper <Player> In WoW <Message>.', '3');
INSERT INTO `irc_commands` VALUES ('reload', '[reload] : Reload TriniChat Config Options And Security Level From DataBase.', '3');
INSERT INTO `irc_commands` VALUES ('restart', '[restart] : Restart TriniChat, NOT Trinity Core World Server Itself. Forces Reconnection To IRC Server.', '3');
INSERT INTO `irc_commands` VALUES ('revive', '[revive <Player>] : Revive <Player>.', '3');
INSERT INTO `irc_commands` VALUES ('saveall', '[saveall] : Forces Trinity Core To Save All Players.', '3');
INSERT INTO `irc_commands` VALUES ('server', '[server setmotd [<motd>]/flusharenapoints]', '3');
INSERT INTO `irc_commands` VALUES ('shutdown', '[shutdown <TimeInSeconds>] : Shuts The Server Down In <TimeInSeconds>, Use 0 For Immediate Shut Down', '3');
INSERT INTO `irc_commands` VALUES ('spell', '[spell <Player> <Cast/Learn/UnLearn> <SpellID>] : Make <Player> <Learn> Or <UnLearn> A Spell, Or <Cast> A Spell On A <Player>.', '3');
INSERT INTO `irc_commands` VALUES ('sysmsg', '[sysmsg <a/n/e/add/del/list> <Message>] : Broadcasts A System Message. (a-Broadcast System Message)(n-Broadcast Notify Message)(e-Event Message)', '3');
INSERT INTO `irc_commands` VALUES ('tele', '[tele <Player> <l/c/r/to/cr/go/homebind> <Loc.Name/MAPID X Y Z/Recall/Player/Creature GUID/Gameobject GUID>] : Teleport Player To Location, Coords, Recall Location, Another Player, Creature or Gameobject. (l-Location)(c-Coords)', '3');
INSERT INTO `irc_commands` VALUES ('top', '[top <accttime/chartime/money> <limit>] : Display top stats for given option. Only GM Higher Than Config Option Can Use Limit.', '3');
INSERT INTO `irc_commands` VALUES ('who', '[who] : Displays Users Currently Logged In To TriniChat.', '1');

/**
* Table structure for irc_inchan
*/
DROP TABLE IF EXISTS `irc_inchan`;
CREATE TABLE `irc_inchan` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier',
  `name` varchar(12) NOT NULL default '',
  `channel` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`guid`,`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='IRC Module System';

/**
* Records
*/

/**
* Table structure for irc_autoannounce
*/
DROP TABLE IF EXISTS `irc_autoannounce`;
CREATE TABLE `irc_autoannounce` (
  `id` int(11) NOT NULL auto_increment,
  `message` longtext NOT NULL,
  `addedby` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='IRC Module System';

/**
* Records
*/
INSERT INTO `irc_autoannounce` VALUES ('1', 'Welcome to IRC Channel', '');

DELETE FROM `trinity_string` WHERE entry IN (6610,6611,6612);
INSERT INTO `trinity_string` VALUES ('6610', '|cffff0000[System Message]: %s|r', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('6611', '|cffff0000[Server Event]: %s|r', null, null, null, null, null, null, null, null);
INSERT INTO `trinity_string` VALUES ('6612', '|cffff0000[Automatic]: %s|r', null, null, null, null, null, null, null, null);
 
 
/* 
* world_trinity_string.sql 
*/ 
/* World trinity_string */
SET NAMES 'utf8';
DELETE FROM trinity_string WHERE `entry` IN (950, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960, 961, 962, 963, 964, 965, 966, 967, 968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 980, 981, 982, 983);

INSERT INTO `trinity_string` VALUES
('950', 'You are jailed by \'%s\' for %u hour(s)!', null, 'Vous tes emprisonn par \'%s\' pour %u heures!', 'Du wurdest von \'%s\' für %u Stunde(n) eingebuchtet!', null, null, null, null, null),
('951', '\'%s\' wrote this as reason: \'%s\'', null, '%s a crit ceci comme tant la raison de votre emprisonnement: %s.', '\'%s\' gab dies als Grund an: \'%s\'', null, null, null, null, null),
('952', '\'%s\' was jailed by you for %u hour(s).', null, 'Vous avez emprisonn %s pour %u heures!', '\'%s\' wurde von dir für %u Stunde(n) eingebuchtet.', null, null, null, null, null),
('953', 'You was released out of the jail by %s.', null, 'Vous avez t liber de la prison par %s.', '\'%s\' hat dich aus dem Knast entlassen.', null, null, null, null, null),
('954', 'You have released %s out of the jail.', null, 'Vous avez liber \'%s\' de la prison.', 'Du hast \'%s\' aus dem Knast geholt.', null, null, null, null, null),
('955', 'No reason given or reason is < %u chars!', null, 'Aucune raison d\\\'emprisonnement donne ou la raison est < %u personnages.', 'Du hast keinen Grund angegeben, oder der Grund ist < %u Zeichen!', null, null, null, null, null),
('956', 'No name given!', null, 'Aucun nom donn!', 'Du hast keinen Namen angegeben!', null, null, null, null, null),
('957', 'No time given!', null, 'Aucun temps donn!', 'Du hast keine Zeit angegeben!', null, null, null, null, null),
('958', 'The jailtime must be between 1 and %u hours!', null, 'Le temps d\\\'emprisonnement est situ entre 1 et %u heures!', 'Die Jail-Zeit muss zwischen 1 und %u Std. liegen!', null, null, null, null, null),
('959', 'The character \'%s\' is not jailed!', null, '\'%s\' n\\\'est pas emprisonn!', 'Der Charakter \'%s\' ist Überhaupt nicht im Knast!', null, null, null, null, null),
('960', 'Command forbidden for jailed characters!', null, 'Commandes interdites pour les personnages emprisons!', 'Sorry, aber das d?rfen Gefangene nicht!', null, null, null, null, null),
('961', 'You have %u hour(s) left in the jail.', null, 'Vous avez %u heures  attendre avant de quitter la prison.', 'Du musst noch %u Stunde(n) absitzen.', null, null, null, null, null),
('962', 'You have %u minute(s) left in the jail.', null, 'Vous avez %u minutes attendre avant de quitter la prison.', 'Du musst noch %u Minute(n) absitzen.', null, null, null, null, null),
('963', 'You\'re a free like a bird! ;-)', null, 'Vous tes libre.', 'Du bist frei wie ein Vogel! ;-)', null, null, null, null, null),
('964', '%s was %u times jailed and has %u minute(s) left. Last time jailed by %s. Last reason was: \'%s\'', null, '%s a t librde prison, il avait t emprisonn pour %u et a t libr au aprs %u minutes. Il avait t emprisonn par %s, pour la raison suivante: %s', '\'%s\' war bis jetzt %u mal im Knast, und hat noch %u Minute(n) abzusitzen.\n Zuletzt eingebuchtet von: \'%s\'\nLetzter Grund: %s', null, null, null, null, null),
('965', '\'%s\' was never jailed.', null, '\'%s\' n\\\'a jamais t emprisonn.', '\'%s\' hat eine weiße Weste.', null, null, null, null, null),
('966', 'You can\'t jail yourself!', null, 'Vous ne pouvez pas vous emprisonner vous-m me!', 'Du kannst dich nicht selber einbuchten!', null, null, null, null, null),
('967', 'You can\'t unjail yourself!', null, 'Vous ne pouvez pas vous librer vous m me!', 'So weit kommt es noch, daß Knastbruder sich selber befreien! :-(', null, null, null, null, null),
('968', '|cffff0000[!!! ATTENTION - IMPORTANT - WARNING !!!\r\n You were already %u times in prison. If you are in Jail for a total of  %u times, your character will be deleted\r\n|cffff0000!!! ATTENTION - IMPORTANT - WARNING !!!]', null, '|cffff0000[!!!ATTENTION - ATTENTION - ATTENTION!!!\r\n Vous étiez déjà %u fois en prison en %u fois, votre personnage supprimé\r\n|cffff0000!!! ATTENTION - ATTENTION - ATTENTION !!!]', '|cffff0000[!!! ACHTUNG - WICHTIG - WARNUNG !!!\r\n Du warst schon %u mal in Knast beim %u mal wird dein Charakter gelöscht\r\n|cffff0000!!! ACHTUNG - WICHTIG - WARNUNG !!!]', null, null, null, null, null),
('969', 'The character \'', null, 'Le personnage ', 'Der Charakter \'', null, null, null, null, null),
('970', '\' was jailed for ', null, ' a t emprisonn pour ', '\' wurde für ', null, null, null, null, null),
('971', ' hour(s) by the GM character \'', null, ' heure(s) par le MJ ', ' Stunde(n) von dem GM-Charakter \'', null, null, null, null, null),
('972', '\'. The reason is: ', null, '. La raison est: ', '\' eingebuchtet. Der Grund ist: ', null, null, null, null, null),
('973', 'The jail configuration was reloaded.', null, 'La configuration de jail a t recharge.', 'Die Gefängnis-Konfiguration wurde neu geladen.', null, null, null, null, null),
('974', '>> Trinity Jail config loaded.', null, '>> Configuration du jail charge.', '>> Gefängnis-Konfiguration geladen.', null, null, null, null, null),
('975', 'Can\'t load jail config! Table empty or missed! Use characters_jail.sql!', null, 'Impossible de charger la configuration du jail! Table vide ou innexistante! Appliquez characters_jail.sql!', 'Fehler beim laden der Gef?ngnis-Konfiguration! Der Table \'jail_conf\' ist leer oder nicht vorhanden! Nutze die \'characters_jail.sql\'!', null, null, null, null, null),
('976', 'Set all jail config settings to default...', null, 'Placez tous les param tres de configuration de prison par d faut.', 'Setze die Konfiguration des Gef?ngnisses auf Standardwerte...', null, null, null, null, null),
('977', 'The Character \'%s\'  is jailed and teleportet into the jail.', null, 'Le personnage \'%s\'  est emprisonn et t leport dans la prison.', 'Der Charakter \'%s\'  ist ein Knastbruder und wird in den Knast teleportiert.', null, null, null, null, null),
('978', 'The Character \'%s\'  was released out of the jail.', null, 'Le personnage %s  est liber  de prison.', 'Der Charakter \'%s\'  wurde aus dem Knast entlassen.', null, null, null, null, null),
('979', 'A character with this name doesn\'t exists!', null, 'Il n\'y a aucun personnage portant ce nom.', 'Ein Charakter mit diesem Namen gibt es nicht!', null, null, null, null, null),
('980', '|cffff0000[!!! ATTENTION - IMPORTANT - WARNING !!!\r\n You were already %u times in prison. If you are in Jail for a total of  %u times, your account  will be banned!\r\n|cffff0000!!! ATTENTION - IMPORTANT - WARNING !!!]', null, '|cffff0000[!!!ATTENTION - ATTENTION - ATTENTION!!!\r\n Vous avez %u fois en prison en %u fois votre compte sera banni\r\n|cffff0000!!! ATTENTION - ATTENTION - ATTENTION !!!]', '|cffff0000[!!! ACHTUNG - WICHTIG - WARNUNG !!!\r\n Du hast %u mal in Knast beim %u mal wird dein Account gebannt\r\n|cffff0000!!! ACHTUNG - WICHTIG - WARNUNG !!!]', null, null, null, null, null),
('981', 'Max. jailtimes reached!', null, 'Nombre maximum d\'Jails atteint!', 'Maximale Anzahl an Jails erreicht!', null, null, null, null, null),
('982', 'Robotron', null, 'Robotron', 'Robotron', null, null, null, null, null),
('983', 'Your Jail status was reset to 0 ', null, 'Votre statut a été Jail à 0 ', 'Dein Jail status wurde auf 0 zurück gesatzt', null, null, null, null, null);
 
 
/* 
* world_v1.0.sql 
*/ 
DELETE FROM `creature_template` WHERE `entry` = 535200;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
('535200','0','0','0','0','0','18','0','18','0','LordPsyan','1v1 Arena master','','0','59','61','0','35','1','1.48','1.14286','0','0','0','1500','1900','1','1','1','0','0','0','0','0','0','0','0','7','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','1','3','1','1','1','1','1','1','0','0','1','0','0','npc_1v1arena','1'); 
 
