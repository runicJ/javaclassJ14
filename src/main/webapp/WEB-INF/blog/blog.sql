show tables;

create table blog(
	tIdx  int not null auto_increment primary key,
	mid  varchar(20) not null,
	nickName  varchar(20) not null,
	tPhoto  varchar(200),
	title  varchar(100),
	sort  varchar(20),
	tDate  datetime default now(),
	viewCnt  int default 0,
	likedCnt  int default 0,
	openSw  char(3) default '공개',
	hostIp  varchar(30) not null,
	tContent  text,
	complaint  char(2) default 'NO'
);