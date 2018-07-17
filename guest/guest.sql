-- guest.sql
-- Oracle ==> SqlDeveloper

drop table guest;

create table guest(
   no number constraint guest_pk primary key, --±Û¹øÈ£
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
   
   
   




