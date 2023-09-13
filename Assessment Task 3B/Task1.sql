CREATE DATABASE IF NOT EXISTS membervoting;
USE membervoting;

CREATE TABLE Member (
	MemberNr INT,
    Fullname VARCHAR(255),
    Address VARCHAR(255),
    `Password` VARCHAR(255),
    PRIMARY KEY (MemberNr)
);

CREATE TABLE File (
	Filename VARCHAR(255),
    Foldername VARCHAR(255),
    size VARCHAR(255) DEFAULT NULL,
    MemberNr INT,
    PRIMARY KEY (Filename, Foldername),
    FOREIGN KEY (MemberNr) references Member(MemberNr)
);

CREATE TABLE Motion (
	MotionNr INT,
    MotionText VARCHAR(255),
    PRIMARY KEY (MotionNr)
);

CREATE TABLE Voting (
	MemberNr INT,
    MotionNr INT,
    `Option` TINYINT(1),
    PRIMARY KEY (MemberNr, MotionNr),
    FOREIGN KEY (MemberNr) references Member(MemberNr),
    FOREIGN KEY (MotionNr) references Motion(MotionNr)
);

