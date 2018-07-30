-- guest.sql
-- Oracle ==> SqlDeveloper

drop table guest;

create table guest(
   no number constraint guest_pk primary key,
   writer varchar2(20) not null,
   email varchar2(50),
   tel   varchar2(15),
   pass  varchar2(15)  not null,
   contents varchar2(300) not null,
   wdate date -- default sysdate
);

drop sequence guest_seq;
create sequence guest_seq
   start with 1
   increment by 1
   nocache
   nocycle;
   
   
   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동1','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동2','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동3','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동4','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동5','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동6','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동7','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동8','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동9','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동10','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동11','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동12','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동13','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동14','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동15','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동16','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동17','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동18','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동19','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동20','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동21','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동22','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동23','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동24','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동25','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동26','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동27','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동28','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동29','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동30','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동31','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);   
insert into guest (no,writer,email,tel,pass,contents,wdate) values (guest_seq.nextval,'홍길동32','gildong@daum.net','010-1234-5678','1234','안녕',sysdate);
   
   
   
   
   
   
   
   
   
   
select * from GUEST;   






