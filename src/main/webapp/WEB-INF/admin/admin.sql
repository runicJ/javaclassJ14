show tables;

/* 신고테이블(complaint) */
create table complaint (
	cpIdx   int not null auto_increment primary key,  /* 신고테이블 고유번호 */
	part  varchar(15) not null,  /* 신고 분류 */
	partIdx  int not null,  /* 신고분류항목 글의 고유번호 */
	mid  varchar(20) not null,  /* 신고자 아이디 */
	cpContent  text not null,  /* 신고 사유 */
	cpDate  datetime default now(),  /* 신고한 날짜 */
	answer CHAR(2) DEFAULT 'NO',
	FOREIGN KEY (mid) REFERENCES member2(mId)
);
desc complaint;

insert into complaint values (default,'board',6,'hkd1234','불쾌한 문구',default);

select * from complaint;

select c.*, date_format(c.cpDate, '%Y-%m-%d %H:%i') as cpDate, b.title, b.nickName, b.mid as 피신고인 from complaint c, board b where c.partIdx = b.idx;  /* cpDate를 넣을 경우 앞에꺼 씹고 뒤에 것이 덮어써서 들어감 // on이 아니라 ,했으니까 where로 해야함 // Join 하는 것 */

/* 리뷰 테이블 */
create table review (
	rIdx  int not null auto_increment primary key,  /* 리뷰 고유번호 */
	part  varchar(20) not null,        /* 분야 */
	partIdx  int not null,             /* 해당 분야의 고유번호 */
	mid  varchar(20),         /* 리뷰 작성자 아이디 */
	nickName  varchar(20) not null,    /* 리뷰 작성자 닉네임 */
	star  int default 0,      /* 리뷰 별점 점수 */
	rContent  text,                     /* 리뷰 내용 */
	rDate  datetime default now(),     /* 리뷰 작성일 */
	purpose varchar(30),
    bIdx int,               /* 예약 고유번호, NULL 허용 */
	foreign key(mid) references member2(mid) ON DELETE SET NULL,
	foreign KEY(bIdx) references booking(bIdx)
);

desc review;

drop table review;

ALTER TABLE review AUTO_INCREMENT = 1;

/* 리뷰에 댓글 달기(대댓글과 비슷하지만 약간 틀림) // vo를 review와 같이 쓰기 위해 변수명 따로 줌 */
create table reply(
	reIdx  int not null auto_increment,  /* 댓글의 고유번호 */
	reviewIdx  int not null,           /* 원본글(부모글:리뷰)의 고유번호(외래키로 설정) */
	mid  varchar(20) not null,         /* 댓글 작성자 아이디 */
	nickName  varchar(20) not null,    /* 댓글 작성자 닉네임 */
	reContent text,                     /* 댓글 내용 */
	reDate  datetime default now(),     /* 댓글 작성일 */
	primary key(reIdx),
	foreign key(mid) references member2(mid),
	foreign key(reviewIdx) references review(rIdx)
);
desc reply;
select * from reply;

drop table reply;

select * from review order by idx desc;
select * from review where partIdx = 8;

select * from reply order by replyIdx desc;

select * from review v, reply r where v.partIdx=8 and v.idx = r.reviewIdx;
select * from review v, reply r where v.partIdx=8 and v.idx = r.reviewIdx order by v.idx, r.replyIdx desc;  /* 내부 조인이라 댓글이 없으면 리뷰가 안나옴(교집합) */
select * from review v left join reply r on v.partIdx=8 and v.idx = r.reviewIdx order by v.idx, r.replyIdx desc;  /* left join // 리뷰 14번이 안걸러짐 */
select * from (select * from review where partIdx = 8) as v left join reply r on v.idx = r.reviewIdx order by v.idx, r.replyIdx desc;  /* left join // 서브쿼리 사용 */