#create and use the TreasureHunter database
CREATE DATABASE IF NOT EXISTS `treasurehunters`;
USE `treasurehunters`;

#create and populate the badge table, which has descriptions of all the types of badges
DROP TABLE IF EXISTS `badge`;
CREATE TABLE `badge` (
  `badgeID` INT NOT NULL AUTO_INCREMENT,
  `badgeName` VARCHAR(20) DEFAULT NULL,
  `badgeDescription` VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (`badgeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `badge` WRITE;
INSERT INTO `badge` (badgeName, badgeDescription) VALUES  
							('Welcome','This is your first badge!'),
							('Beacon','Congrats on finding your first beacon!'),
                            ('Treasure','Congrats on your first treasure!'),
                            ('100Treasures','You\'ve found 100 treasures!'),
							('500Treasures','You\'ve found 500 treasures!'),
                            ('5000Treasures','You\'ve found 5000 treasures!'),
                            ('BoyScout','Keep on truck\'in!'),
                            ('RealmKnight','Knight of the Realm and Saviour of the Meek!'),
                            ('TimeTraveller','Man from Gallifrey! Who?'),
							('PowerRanger','Mighty Morphin Treasure Hunter!'),
                            ('Knightmare','Master of the night!'),
                            ('BlackBeard','Argh! I be Black Beard! Where be my booty?'),
                            ('CaptainSponge','Life\'s true treasure is having fun!'),
                            ('PeepingTom','Sneakiest sneak of sneakington'),
                            ('AdvanceTreasureFair','Congrats on finishing your first Advanced Quest!'),
                            ('HowCute','You\'ve completed your first mini quest!'),
                            ('Meow','The cats out of the bag!');
UNLOCK TABLES;


#create and populate the quest table which stores the record of all quests
DROP TABLE IF EXISTS `quest`;
CREATE TABLE `quest` (
  `questID` INT NOT NULL AUTO_INCREMENT,
  `questName` VARCHAR(45) DEFAULT NULL,
  `beacon` VARCHAR(45) DEFAULT NULL,
  `story` TEXT DEFAULT NULL,
  `advanceQuestID` INT DEFAULT NULL,
  PRIMARY KEY (`questID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `quest` WRITE;
INSERT INTO `quest` (questName, beacon, story, advanceQuestID) VALUES 
							('Good Will','QUT Gardens Point Campus, Brisbane','Venture to the brown waters of mucky muck over a bridge of good will. Good luck!',NULL),
                            ('Mini Good Will','Good Will Bridge, Brisbane','Gaze across the waters of mucky muck in search of a floating cat',1),
                            ('South Bank','South Bank','Stumble upon the site of EXPO 88 and hunt its many treasures',NULL),
                            ('Mini South Bank 1','Information Centre, South Bank','You\'re lost! Go in search of a map', 3),
                            ('Mini South Bank 2','Big Wheel, South Bank','The Wheel marks the Spot. Round and round and round...', 3),
                            ('Mini South Bank 3','Exhibition Centre, South Bank','There be a place of booths and booty a plenty. Find a magical machine selling golden vests of glory', 3),
                            ('Mini South Bank 4','QPAC, South Bank','Welcome, welcome, one and all. Find a man in a costume.', 3),
                            ('Surfing','Surfers Paradise Beach, Gold Coast','Argh me lad (or lady) we be headin to the sea! Buried below a sign of silver surf boards be the treasure we seek.', NULL),
                            ('Dreamers','Dreamworld Entry, Gold Coast','Ick they be but plastic but the people of the dream world will pay precious gold for this booty',NULL),
                            ('Seaworld Seal','Seaworld, Gold Coast','Splish splash, hunt the seal who be a show off.', NULL),
                            ('Dump','Recycle Centre, Logan','Pooh-ey! What a dump!?! Mix with the Logans to find discarded treasure that shimmers', NULL),
                            ('Valley','Fortitude Valley','Drunks and derelicts. Clubbers and bouncers. Seek the gates out of there.', NULL);
UNLOCK TABLES;




#create and populate the store table which stores the record of all of the game stores
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `storeID` INT NOT NULL AUTO_INCREMENT,
  `storeName` VARCHAR(45) DEFAULT NULL,
  `openTime` TIME DEFAULT NULL,
  `closeTime` TIME DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `store` WRITE;
INSERT INTO `store` (storeName, openTime, closeTime) VALUES 
							('Farmer Joes','08:00:00','16:00:00'),
                            ('All traders','01:00:00','23:00:00'),
                            ('24/7','00:01:00','23:59:00'),
							('Farmer Joes','08:00:00','16:00:00'),
                            ('Banana Pants','01:30:00','23:30:00'),
                            ('FaceyFacey','15:00:00','23:59:00'),
                            ('Black Death','21:00:00','23:00:00'),
                            ('Phone Booth','00:10:00','23:10:00'),
                            ('Pineapple under the sea','00:01:00','23:59:00'),
							('Yo Mumma\'s House','08:00:00','16:00:00'),
                            ('Weapon\'s Mart','01:00:00','23:00:00'),
                            ('Bag it up Shoppy','00:01:00','23:59:00'),
                            ('Kangaroo-la-lu', '06:00:00', '11:00:00');
UNLOCK TABLES;





#create and populate the treasure table which stores the record of all of the game treasures
DROP TABLE IF EXISTS `treasure`;
CREATE TABLE `treasure` (
  `treasureID` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT DEFAULT NULL,
  `points` INT NOT NULL DEFAULT '0',
  `webpage` VARCHAR(100) NOT NULL,
  `questID` INT,
  `type` ENUM('common','rare','ultra-rare','elite','uncommon') DEFAULT NULL,
  PRIMARY KEY (`treasureID`),
  CONSTRAINT `questID` FOREIGN KEY (`questID`) REFERENCES `quest` (`questID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `treasure` WRITE;
INSERT INTO `treasure` (description, points, webpage, questID, `type`) VALUES 
							('Pebble',10,'www.rocky.com',1,'common'),
                            ('City Cat',15,'www.meow.com.au',1,'ultra-rare'),
                            ('Rainbow',30,'www.redandblueandgreenandpurple.com.au/qut',1,'elite'),
                            ('Pidgeon',5,'https://qut.edu.au/treasurehunter',1,'common'),
                            ('Gold medalleon',100,'https://treasurehunters.com/9998%$uios&#js',1,'uncommon'),
                            ('Ibis',20,'https://www.test.com.au',1,'elite'),
                            ('Dirty dish rag',5,'www.howdirty.com',11,'common'),
                            ('Rusty bike',5,'www.howrusty.com',11,'common'),
                            ('Southbank Map',10,'www.directionsatlast.com',2,'common'),
                            ('Brisbane Map',15,'www.directionstocity',2,'ultra-rare'),
                            ('Gold Coast Map',30,'www.waveymap.com',2,'elite'),
                            ('Star Fish',25,'www.pointyfish.com',10,'common'),
                            ('Only 1 exists!',100,'https://treasurehunters.com/9998%$uios&#js',1,'uncommon'),
                            ('Sea cucumber',150,'https://www.test.com.au',10,'elite'),
                            ('Cigarette Butt',5,'www.ewwwwhowdirty.com',12,'common'),
                            ('Bouncer',65,'www.youhaveguts.com',12,'rare'),
                            ('Red lego brick',10,'www.lego.com/red',9,'common'),
                            ('Blue lego brick',10,'www.lego.com/blue',9,'common'),
                            ('Green lego brick', 10,'www.lego.com/green',9,'common'),
                            ('Lego House',20,'www.lego.com/house',9,'rare'),
                            ('Lego Batman',100,'www.lego.com/batman',9,'ultra-rare'),
                            ('Seal',20,'www.splishsplash.me',10,'uncommon'),
                            ('Stage',22,'www.encore.com',7,'uncommon'),
                            ('Life Line Book Fest Sign',200,'www.howrusty.com',6,'ultra-rare'),
                            ('Brisbane Sign',30,'www.hellobrisbane.com',3,'uncommon'),
                            ('Big Wheel Ticket',300,'www.nooneridesthewheel.com',5,'ultra-rare'),
                            ('Surfboard',40,'www.waverider.com',8,'uncommon');
UNLOCK TABLES;




#create and populate the player table which has all of the user information
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player` (
  `username` VARCHAR(30) NOT NULL,
  `firstName` VARCHAR(50) DEFAULT NULL,
  `lastName` VARCHAR(50) DEFAULT NULL,
  `gender` ENUM('Female','Male','Other','Prefer not to disclose') DEFAULT NULL,
  `dob` DATE DEFAULT NULL,
  email VARCHAR(320) NOT NULL,
  `streetNumber` VARCHAR(15) DEFAULT NULL,
  `streetName` VARCHAR(30) DEFAULT NULL,
  `suburb` VARCHAR(45) DEFAULT NULL,
  `state` ENUM ('QLD', 'SA', 'VIC', 'NSW', 'TAS', 'WA', 'NT', 'ACT') DEFAULT NULL,
  `postcode` char(4) DEFAULT NULL,
  `creationDateTime` DATETIME NOT NULL,
  `totalPoints` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `player` WRITE;
INSERT INTO `player` VALUES 
					('frankie','Frank','Smith','Male','1999-03-12', 'hellofrankie@gmail.com','180','Zelda Street','Linkburb','QLD','4000','2017-09-06 07:00:05',10),
                    ('jerry','Jerry','Seinfield','Other','1967-12-04', 'jezza@hotmail.com','3/5999','Elanor Road','Stafford','QLD','4053','2017-09-07 18:00:44',50),
                    ('jojo','Joanne','Kay','Prefer not to disclose','2000-08-02', 'joanne.kay@qut.edu.au','7','Latrobe Tce','Docklands','VIC','2000','2017-09-06 07:00:05',20),
                    ('nikki','Nikki','Storm','Female','1989-08-11', 'faceofthestorminator@outlook.com','1007','National Circuit','Barton','ACT','2600','2017-09-09 14:36:05',80),
                    ('drwho','Doctor','Who','Male','1800-01-01', 'tardis@whoville.com','1','PhoneBooth','Boothby','QLD','4000','2017-05-09 11:00:05',520),
                    ('chickenNeck','Graham','Marshall','Male','1995-10-25','chickenoregg@gmail.com', '53','Thugsta Drive','Helensvale','QLD','4212','2017-09-07 17:00:44',50),
                    ('banana95','Alanna','Davidson','Female','1995-05-14', 'banana95@gmail.com','587','Gumby Road','Sunnybank Hills','QLD','4109','2017-03-14 21:45:38',615),
                    ('ml','Tsai','MengLung','Male','1990-03-02', 'melt@gmail.com', '341','Main Street','Sunnybank','QLD','4109','2017-09-06 07:00:05',420),
                    ('twowong','Jason','Wong','Male','1989-11-15', 'twowongoneright@hotmail.com', '124','Seetan Street','Sunnybank Hills','QLD','4109','2017-09-09 14:36:05',380),
                    ('namasaya','Sietta','Stonebert', 'Female','1989-03-05', 'namasaya1989@yahoo.com', '21-29','Farris Street','Sunnybank','QLD','4109','2017-09-06 07:00:05',220),
                    ('jeffas','Jeffrey','Davidson','Male','1987-12-04', 'spanky4321@gmail.com','31/50','Ronker Road','Woolloongabba','QLD','4053','2017-10-17 12:00:44',311),
                    ('jojo123','Jessica','Kanikian','Female','1998-11-21','jessica.kanikian@connect.qut.edu.au', '17','Main Street','Sunnybank','QLD','4109','2017-08-04 13:00:00',20),
                    ('haxman','Allisandra','Zanita','Female','1972-08-11','haxinator@outlook.com', '78','O\'Grady Street','Upper Mount Gravatt','QLD','4012','2017-05-15 14:36:05',15);
UNLOCK TABLES;



#create and populate the phonenumber table which has all of the users phone numbers
DROP TABLE IF EXISTS `phonenumber`;
CREATE TABLE `phonenumber` (
  `username` VARCHAR(30) NOT NULL,
  `phoneNumber` CHAR(10) NOT NULL,
  PRIMARY KEY (`username`,`phoneNumber`),
  FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `phonenumber` WRITE;
INSERT INTO `phonenumber` VALUES 
					('frankie','0400123977'),
                    ('banana95', '3698521478'),
                    ('frankie','0733405211'),
                    ('jerry','0456789012'),
                    ('jojo','0400123456'),
                    ('jojo','0466111222'),
                    ('nikki','0215154878'),
                    ('drwho','0458987896'),
                    ('chickenNeck','0145232147'),
                    ('chickenNeck','0425647895'),
                    ('chickenNeck','0412354789'),
                    ('ml','5554785471'),
                    ('twowong','3802545411'),
                    ('namasaya','2314528974'),
                    ('jeffas','0485778991'),
                    ('jojo123','3725896523'),
                    ('haxman','2587487456');
UNLOCK TABLES;



#create and populate the playerprogress table which stores the record of the players progress for each quest
DROP TABLE IF EXISTS `playerprogress`;
CREATE TABLE `playerprogress` (
  `questID` int NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `progress` ENUM('active','complete','inactive') DEFAULT NULL,
  PRIMARY KEY (`questID`,`username`),
  CONSTRAINT `playerprogressquestID` FOREIGN KEY (`questID`) REFERENCES `quest` (`questID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `playerprogress` WRITE;
INSERT INTO `playerprogress` VALUES 
					(1,'frankie','inactive'),
                    (1, 'banana95', 'complete'),
                    (1,'jerry','active'),
                    (1,'jojo','complete'),
                    (1,'nikki','complete'),
                    (2,'frankie','active'),
                    (2, 'banana95', 'complete'),
                    (2,'jerry','inactive'),
                    (2,'nikki','complete'),
					(12,'jeffas','inactive'),
                    (2, 'jeffas', 'complete'),
                    (1,'drwho','active'),
                    (1,'chickenNeck','complete'),
                    (1,'twowong','complete'),
                    (2,'drwho','active'),
                    (2,'ml','inactive'),
                    (1,'jojo123','complete'),
                    (1,'haxman','active'),
                    (1,'namasaya','complete'),
                    (3, 'banana95','complete'),
                    (3,'drwho','complete'),
                    (3,'frankie','active'),
                    (4,'jerry','inactive'),
                    (4, 'banana95', 'active'),
                    (11,'frankie','inactive'),
                    (11, 'banana95','complete'),
                    (5,'jerry','active'),
                    (6,'jojo','complete'),
                    (7,'nikki','complete'),
                    (7,'banana95','complete'),
                    (8,'frankie','active'),
                    (9,'jerry','inactive'),
                    (9, 'banana95','inactive'),
                    (9,'nikki','complete');
UNLOCK TABLES;


##create and populate the playertreasure table which stores the record of the player locating the treasures
DROP TABLE IF EXISTS `playertreasure`;
CREATE TABLE `playertreasure` (
  `username` VARCHAR(30) NOT NULL,
  `treasureID` INT NOT NULL,
  PRIMARY KEY (`username`,`treasureID`),
  KEY `treasureID_idx` (`treasureID`),
  CONSTRAINT `treasureID` FOREIGN KEY (`treasureID`) REFERENCES `treasure` (`treasureID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usernametreasure` FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `playertreasure` WRITE;
INSERT INTO `playertreasure` VALUES 
					('frankie',1),
                    ('jerry',1),
                    ('frankie',3),
                    ('frankie',2),
                    ('jerry',2),
                    ('jojo',4),
                    ('jojo', 14),
                    ('nikki',4),
                    ('drwho', 6),
                    ('chickenNeck', 5),
                    ('chickenNeck', 3),
                    ('chickenNeck', 6),
                    ('ml', 27),
                    ('twowong',15),
                    ('namasaya', 23),
                    ('jeffas', 15),
                    ('jojo123', 15),
                    ('haxman', 8),
                    ('banana95', 1),
                    ('banana95', 2),
                    ('banana95', 3),
                    ('jeffas', 4);
UNLOCK TABLES;


#create and populate the purchases table which stores the records of the player buying badges at the stores
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `purchaseID` INT NOT NULL AUTO_INCREMENT,
  `storeID` INT NOT NULL,
  `badgeID` INT NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `cost` INT NOT NULL,
  `purchaseDateTime` DATETIME NOT NULL,
  PRIMARY KEY (`purchaseID`),
  KEY `store_idx` (`storeID`),
  KEY `badge_idx` (`badgeID`),
  KEY `usernamepurchase_idx` (`username`),
  FOREIGN KEY (`badgeID`) REFERENCES `badge` (`badgeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`username`) REFERENCES `player` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchase` WRITE;
INSERT INTO `purchase` (storeID, badgeID, cost, purchaseDateTime, username) VALUES 
						(1,1,0,'2017-09-10 03:05:00','frankie'),
						(1,2,20,'2017-09-12 12:35:00','nikki'),
                        (5,1,0,'2017-09-15 07:25:00','jerry'),
                        (3,4,2,'2017-09-15 07:25:00','jerry'),
                        (1, 1, 0, '2017-05-12 07:24:00', 'banana95'),
                        (13, 4, 0, '2017-09-15 07:24:00', 'banana95'),
                        (2, 15, 34, '2017-09-15 08:24:00', 'banana95'),
                        (2, 17, 15, '2017-09-15 09:34:00', 'banana95'),
                        (2, 3, 0, '2017-06-15 13:42:00', 'banana95'),
                        (6, 12, 21,'2017-09-15 07:28:00', 'jeffas');
UNLOCK TABLES;
