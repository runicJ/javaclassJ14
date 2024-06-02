show tables;

create table travelog(
	tIdx  int not null auto_increment primary key,
	mid  varchar(20) not null,
	nickName  varchar(20) not null,
	tPhoto  varchar(200) not null,
	title  varchar(100) not null,
	residence  varchar(20),
	tDate  datetime default now(),
	viewCnt  int default 0,
	likedCnt  int default 0,
	openSw  char(3) default '공개',
	hostIp  varchar(30) not null,
	tContent  text,
	complaint  char(2) default 'NO',
	foreign key(mid) references member2(mid)
);

desc travelog;
drop table travelog;

insert into travelog values(default,'admin','관리자','noImage.jpg','여행블로그 게시판 시작합니다','Stay Balance',default,default,default,default,'192.168.50.58','여러분의 소중한 여행 후기를 올려주세요',default);

select * from travelog;

select *, datediff(tDate, now()) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff from travelog;

