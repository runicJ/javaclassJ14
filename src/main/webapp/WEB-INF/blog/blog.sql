show tables;

create table travelog(
	tIdx  int not null auto_increment primary key,
	mid  varchar(20) not null,
	nickName  varchar(20) not null,
	tPhoto  varchar(200) not null,
	sort enum('여행기록', '여행지추천', '지역홍보', '지역음식소개', '공지사항'),
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

select * from travelog;

select *, datediff(tDate, now()) as date_diff, timestampdiff(hour, tDate, now()) as hour_diff from travelog;

SELECT count(*) as cnt FROM travelog;