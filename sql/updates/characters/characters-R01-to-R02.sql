-- missing tables for ike3 ahbot

DROP TABLE IF EXISTS ahbot_history;
DROP TABLE IF EXISTS ahbot_category;
DROP TABLE IF EXISTS ahbot_price;

CREATE TABLE ahbot_history (
id bigint(20) NOT NULL AUTO_INCREMENT,
buytime bigint(20) NOT NULL,
item bigint(20) NOT NULL,
bid bigint(20) NOT NULL,
buyout bigint(20) NOT NULL,
won bigint(20) NOT NULL,
category varchar(45) DEFAULT NULL,
auction_house bigint(20) NOT NULL,
PRIMARY KEY (id),
KEY won (won),
KEY category (category),
KEY auction_house (auction_house)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ahbot_category (
id bigint(20) NOT NULL AUTO_INCREMENT,
category varchar(45) DEFAULT NULL,
multiplier decimal(20, 2) NOT NULL,
max_auction_count bigint(20) NOT NULL,
expire_time bigint(20) NOT NULL,
PRIMARY KEY (id),
KEY helper (category, multiplier, expire_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ahbot_price (
id bigint(20) NOT NULL AUTO_INCREMENT,
item varchar(45) DEFAULT NULL,
price decimal(20, 2) NOT NULL,
auction_house bigint(20) NOT NULL,
PRIMARY KEY (id),
KEY ahbot_price_item (item)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Add new winner field, bound to player
ALTER TABLE `pvpstats_players`
  ADD COLUMN `winner` BIT(1) NOT NULL AFTER `character_guid`;

-- Resolve horde players victories
UPDATE `pvpstats_players` SET `winner` = 1 WHERE `battleground_id` IN (
    SELECT `id` FROM `pvpstats_battlegrounds` WHERE `winner_faction` = 0
) AND `character_guid` IN (
    SELECT `guid` FROM `characters` WHERE `race` IN (2, 5, 6, 8, 9, 10)
);

-- Resolve alliance players victories
UPDATE `pvpstats_players` SET `winner` = 1 WHERE `battleground_id` IN (
    SELECT `id` FROM `pvpstats_battlegrounds` WHERE `winner_faction` = 1
) AND `character_guid` IN (
    SELECT `guid` FROM `characters` WHERE `race` IN (1, 3, 4, 7, 11, 22)
);
