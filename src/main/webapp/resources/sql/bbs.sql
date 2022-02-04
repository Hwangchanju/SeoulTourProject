drop table bbs3;

create table bbs2 as select * from bbs where 10=0;

select * from bbs2;

select * from bbs3 order by bbs_no asc;

select bbs2_no_seq.nextval from dual;

create sequence bbs3_no_seq
start with 1
increment by 1
nocache;

create sequence bbs2_no_seq
start with 1
increment by 1
nocache;

select bbs3_no_seq.nextval from dual;

select bbs_no_seq.nextval from dual;

select bbs_file from bbs2 where bbs_no='30';

alter table bbs2 MODIFY (bbs_cont varchar2(10000));

alter table bbs2 add (bbs_cont2 clob);

update bbs2 set bbs_cont2=bbs_cont;

alter table bbs2 drop column bbs_cont;

alter table bbs2 rename column bbs_cont2 to bbs_cont;


alter table bbs3 add bbs_category varchar2(100) null;


create table bbs2(
bbs_no number(38) primary key --게시물 번호
,bbs_name varchar2(50) not null --글쓴이
,bbs_title varchar2(200) not null  --제목
,bbs_pwd varchar2(30) not null --비밀번호
,bbs_cont clob not null --글내용
,bbs_file varchar2(200) --첨부파일명
,bbs_hit number(38) default 0 --조회수
,bbs_ref number(38) --원본글과 답변글을 묶어주는 글 그룹번호
,bbs_step number(38) --첫번째 답변글이면 1, 두번째 답변글이면 2.. 원본글과 답변글을 구분하는 번호값으면서 몇번쨰 답변글인가를 알려줌(원본글 0)
,bbs_level number(38) --답변글 정렬순서
,bbs_date date --등록날짜
);