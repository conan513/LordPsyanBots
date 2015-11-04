/*
 * Author: Xees
 * Description: This file is used to apply the database tables needed for the ArenaGambler
 * Version: 1.2
*/
create table `custom_duel_config` (
    `optionIndex` int (10),
    `optionName` varchar (60),
    `optionValue` float
);
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('0','MAP ID ','1');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('1','X CORDS','-7218.97');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('2','Y CORDS','982.622');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('3','Z CORDS','303.524');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('4','O CORDS','1.40677');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('5','MINIMUM LEVEL','60');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('6','LEVEL DIFF','3');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('7','REWARD ON FLED','1');

create table `custom_duel_statistics` (
    `playerGUID` int (11),
    `duelsLost` int (10),
    `duelsWon` int (10),
    `duelsRefused` int (10),
    `duelsTotal` int (10)
);

INSERT INTO `custom_duel_config`
            (`optionIndex`,
             `optionName`,
             `optionValue`)
VALUES ('12',
        'ENABLE ONLY CURRENCY',
        '0');
INSERT INTO `custom_duel_config`
            (`optionIndex`,
             `optionName`,
             `optionValue`)
VALUES ('13',
        'ENABLE EQUAL BETS',
        '0');

insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('11','ENABLE ITEM LIMITS','0');

insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('8','MAXIMUM BET','1000');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('9','ENABLE GM DUEL','0');
insert into `custom_duel_config` (`optionIndex`, `optionName`, `optionValue`) values('10','ENABLE SAMEIP DUEL','0');

create table `custom_duel_storage` (
    `matchId` int (10),
    `challengerGUID` int (11),
    `defenderGUID` int (11),
    `challengerItemId` mediumint (8),
    `challengerItemCount` int (11),
    `defenderItemId` mediumint (8),
    `defenderItemCount` int (11),
    `matchDate` timestamp ,
    `matchWinner` int (11)
);
