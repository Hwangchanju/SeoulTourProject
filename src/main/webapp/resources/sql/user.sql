
create table users(
	user_id varchar2(100) primary key,
	user_pwd varchar2(200) not null, -- 암호화된 비번
	user_name varchar2(50) not null,
	user_zip varchar2(10) not null, --우편번호
	user_addr varchar2(100) not null, --디비로부터 검색된 주소값
	user_addr2 varchar2(100) not null, 
	user_phone varchar2(20),
	user_mail_id varchar2(50),
	user_mail_domain varchar2(100),
	user_regdate timestamp,
	user_state int, --가입회원 1, 탈퇴회원2
	user_delcont varchar2(4000), --탈퇴사유
	user_deldate date,
	enabled char(1) default  '1'
);



drop table users cascade constraints;

select * from users;

delete from users;

update 

--권한 테이블 생성
create table users_auth(
	user_id varchar2(40) not null,
	authority varchar2(30) not null,
	constraint users_userid_fk1 foreign key(user_id) references users(user_id)
);

select * from users_auth;



-- 자동로그인 테이블 생성
create table persistent_logins(
	series varchar2(64) primary key,
	username varchar2(64) not null,
	token varchar2(64) not null,
	last_used timestamp not null
);

drop table persistent_logins;


select * from persistent_logins;

select * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME LIKE 'USERS';




-- 사용자 커뮤니티 게시판 디비
create table user_content(
	content_no number(38) primary key,
	content_id varchar2(50) not null,
	content_name varchar2(50) not null,
	content_title varchar2(200) not null,
	content_local varchar2(50), -- 추가
	content_cont Clob not null,
	content_file varchar2(4000), --썸네일 파일
	content_hit number(38) default 0,
	content_ref number(38), --원본글과 답변글을 묶어주는 글 그룹번호
	content_step number(38), --첫번째 답변글이면 1, 두번째 답변글이면 2.. 원본글과 답변글을 구분하는 번호값으면서 몇번쨰 답변글인가를 알려줌(원본글 0)
	content_level number(38) default 0, --댓글의 댓글 쓸때, 해당 댓글 번호 저장
	content_regdate timestamp,
	constraint fk_user_content foreign key(content_id) references users(user_id) ON DELETE CASCADE
);


-- bbs_no_seq 시퀀스 생성, 시퀀스는 번호 생성기
create sequence content_no_seq
start with 1
increment by 1
nocache;


drop sequence content_level_seq;

drop table user_content;

select * from user_content;

update user_content set content_local='종로구' where content_no=149;


delete from user_content where content_title='댓글' AND content_title='댓글의 댓글';

select content_cont from user_content;

select COLUMN_NAME, DATA_TYPE FROM all_tab_columns where table_name='USER_CONTENT';

SELECT * FROM    ALL_CONSTRAINTS WHERE    TABLE_NAME = 'USER_CONTENT';