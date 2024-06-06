show tables;  /* 1 */

create table member2 (
  mIdx       int not null auto_increment,  	/* 회원 고유번호 */
  mid       varchar(30) not null,	      	/* 회원 아이디(중복불허) */
  pwd       varchar(100) not null,			/* 회원 비밀번호(SHA256 암호화 처리) */
  name		varchar(20) not null,			/* 회원 성명 */
  nickName  varchar(20) not null,			/* 회원 별명(중복불허/수정가능) */
  tel		varchar(15) not null,					/* 전화번호 : 010-1234-5678 */
  email		varchar(60),		  	/* 이메일(아이디/비밀번호 분실시에 사용)-형식체크필수 */
  residence varchar(10),  /* 거주지 체크 */
  photo		varchar(100) default 'noImage.jpg', /* 회원 사진 */
  content   text,							/* 회원 소개 */
  startDate datetime default now(),			/* 최초 가입일 */
  lastDate  datetime default now(),			/* 마지막 접속일 */
  userInfo char(3) default '공개',			/* 회원 정보 공개여부(공개/비공개(아이디,닉네임)) */
  userDel   char(2)  default 'NO',			/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중(1개월보관)) */
  primary key (mIdx),
  unique(mid)
);

desc member2;

insert into member2 value (default,'admin','1234','관리자','관리맨','010-1234-4567','admin@naver.com',default,default,'관리자입니다.',default,default,default,default);

select * from member2;

ALTER TABLE member2 AUTO_INCREMENT = 1;

select lastDate, now(), timestampdiff(day, lastDate, now()) as deleteDiff from member2;  /* 날짜비교(시간단위로 비교해줌) 뒤에서 앞을 뺌(now()-lastDate) // dateadd */

CREATE TABLE liked (
    lIdx int NOT NULL primary key,
    mId VARCHAR(20) NOT NULL,
    part VARCHAR(20),
    partIdx INT,
    FOREIGN KEY (mId) REFERENCES member2(mId)
);

/* 실시간 DB채팅 테이블 설계 */
create table memberChat(
	idx  int not null auto_increment primary key,
	mid  varchar(20) not null,
	chat  varchar(100) not null
);
desc memberChat;
drop table memberChat;

insert into memberChat values(default,'admin','안녕1');
insert into memberChat values(default,'soso1234','안녕2');
insert into memberChat values(default,'admin','안녕3');
insert into memberChat values(default,'hkd1234','안녕4');
insert into memberChat values(default,'admin','안녕5');
insert into memberChat values(default,'admin','안녕6');
insert into memberChat values(default,'hkd1234','안녕7');
insert into memberChat values(default,'aris1234','안녕8');
insert into memberChat values(default,'admin','안녕9');
insert into memberChat values(default,'admin','안녕10');
insert into memberChat values(default,'hkd1234','안녕11');
insert into memberChat values(default,'admin','안녕12');
insert into memberChat values(default,'admin','안녕13');
insert into memberChat values(default,'aris1234','안녕14');
insert into memberChat values(default,'admin','안녕15');
insert into memberChat values(default,'admin','안녕16');
insert into memberChat values(default,'aris1234','안녕17');
insert into memberChat values(default,'admin','안녕18');

select * from memberChat order by idx desc limit 15;  /* 화면에 50개만 나오도록 // 이대로 하면 최신문장이 위로 올라옴 */
select m.* from (select * from memberChat order by idx desc limit 15) m order by idx;

CREATE TABLE logHistory (
    logIdx INT AUTO_INCREMENT PRIMARY KEY,
    mId VARCHAR(20) NOT NULL,
    loginTime DATETIME DEFAULT now(),
    logoutTime DATETIME,
    hostIp VARCHAR(30) NOT NULL,
    FOREIGN KEY (mId) REFERENCES member2(mId)
);

drop table logHistory;