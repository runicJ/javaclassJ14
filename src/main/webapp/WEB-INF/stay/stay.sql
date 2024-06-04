show tables;

create table stay(
	sIdx  int not null auto_increment,  /* 고유번호 */
	sort varchar(20) not null,			/* 유형 */
	sName varchar(200) not null,        /* 이름 */
	sPhoto varchar(200) not null,       /* 사진 */
	star  int default 0,                /* 별점 */
	address varchar(300),               /* 주소 */
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
    wifi BOOLEAN default FALSE,
    ac BOOLEAN default FALSE,
    parking BOOLEAN default FALSE,
    pet BOOLEAN default FALSE,
    kitchen BOOLEAN default FALSE,
    washing BOOLEAN default FALSE,
    sIdx int not null,
    foreign key(sIdx) references stay(sIdx) on delete cascade
);

drop table facility;

CREATE TABLE booking (
    bIdx INT AUTO_INCREMENT PRIMARY KEY,
    sIdx INT NOT NULL,
    mId VARCHAR(20) NOT NULL,
    bDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    checkIn DATETIME,
    checkOut DATETIME,
    guestNum INT,
    total INT,
    status CHAR(2) DEFAULT 'NO',
    FOREIGN KEY (sIdx) REFERENCES stay(sIdx),
    FOREIGN KEY (mId) REFERENCES member2(mId)
);

drop table booking;