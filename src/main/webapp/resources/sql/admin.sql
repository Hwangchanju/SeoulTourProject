
-- 관리자 멤버 디비
create table admins(
	admin_id varchar2(100) primary key,
	admin_pwd varchar2(200) not null, -- 암호화된 비번
	admin_name varchar2(50) not null,
	admin_zip varchar2(10) not null, --우편번호
	admin_addr varchar2(100) not null, --디비로부터 검색된 주소값
	admin_addr2 varchar2(100) not null, 
	admin_phone varchar2(20),
	admin_mail_id varchar2(50),
	admin_mail_domain varchar2(100),
	admin_regdate timestamp,
	admin_state int, --가입회원 1, 탈퇴회원2
	admin_delcont varchar2(4000), --탈퇴사유
	admin_deldate date,
	enabled char(1) default '0' not null
);

select * from admins;
