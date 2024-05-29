show tables;

create table stay(
	sIdx  int not null auto_increment,  /* 고유번호 */
	sort varchar(20) not null,			/* 유형 */
	sName varchar(200) not null,        /* 이름 */
	sPhoto varchar(200) not null,       /* 사진 */
	star  int default 0,                /* 별점 */
	address varchar(300),               /* 주소 */
	sContent text not null,             /* 내용 */
	guestCapacity int not null,
	price int not null,
	residence varchar(20),
	sDate datetime default now(),
	sDel char(2) default 'NO',
	primary key(sIdx)
);

drop table stay;

create table filter(
	fIdx int not null auto_increment primary key,  /**/
	bedroom int not null,
	bed int not null,
	toilet int not null,
	wifi char(2) default 'NO',
	ac char(2) default 'NO',
	parking char(2) default 'NO',
	pet char(2) default 'NO',
	kitchen char(2) default 'NO',
	washing char(2) default 'NO',
	sIdx int not null,
	foreign key(sIdx) references stay(sIdx)
);

drop table filter;