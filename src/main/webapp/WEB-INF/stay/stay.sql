show tables;

create table stay(
	sIdx  int not null auto_increment,
	sName varchar(200) not null,
	sPhoto varchar(200) not null,
	star  int default 0,
	address varchar(300),
	sContent text not null,
	guestCapacity int not null,
	price int not null,
	sort varchar(20),
	fIdx int not null,
	sDate datetime default now(),
	sDel char(2) default 'NO',
	primary key(sIdx),
	foreign key(fIdx) references filter(fIdx)
);

create table filter(
	fIdx int not null auto_increment primary key,
	bed int not null,
	toilet int not null,
	wifi char(2) default 'NO',
	a/c char(2) default 'NO',
	parking char(2) default 'NO',
	pet char(2) default 'NO',
	kitchen char(2) default 'NO',
	washing machine char(2) default 'NO'
);