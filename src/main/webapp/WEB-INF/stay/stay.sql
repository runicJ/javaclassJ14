show tables;

create table stay(
	sIdx  int not null auto_increment,  /* 고유번호 */
	sort varchar(20) not null,			/* 유형 */
	sName varchar(200) not null,        /* 이름 */
	sPhoto varchar(200) not null,       /* 사진 */
	star  int default 0,                /* 별점 */
	address varchar(300) not null,               /* 주소 */
	sContent text not null,             /* 내용 */
	guestMax int not null,
	price int not null,
	residence varchar(20) not null,
	sDate datetime default now(),
	sDel char(2) default 'NO',
	primary key(sIdx)
);

drop table stay;

ALTER TABLE stay AUTO_INCREMENT = 1;

create table facility(
    fIdx int not null auto_increment primary key,
    bed int not null,
    toilet int not null,
    wifi char(2) default 'NO',
    ac char(2) default 'NO',
    parking char(2) default 'NO',
    pet char(2) default 'NO',
    kitchen char(2) default 'NO',
    washing char(2) default 'NO',
    sIdx int not null,
    foreign key(sIdx) references stay(sIdx) on delete cascade
);

drop table facility;

CREATE TABLE booking (
    bIdx INT AUTO_INCREMENT PRIMARY KEY,
    sIdx INT,
    mid VARCHAR(20),
    bDate DATETIME DEFAULT now(),
    checkIn DATETIME NOT NULL,
    checkOut DATETIME NOT NULL,
    guestNum INT NOT NULL,
    total INT NOT NULL,
    status VARCHAR(4) DEFAULT 'OK',
    FOREIGN KEY (sIdx) REFERENCES stay(sIdx) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (mid) REFERENCES member2(mid) ON DELETE SET NULL ON UPDATE CASCADE
);

drop table booking;