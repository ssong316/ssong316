/*drop table pd;
create table pd
(
 no number primary key,
 pdName varchar2(50) not null,
 price number null,
 regdate  date default sysdate
);

drop sequence pd_seq;
create sequence pd_seq
increment by 1
start with 1
nocache;

insert into pd(no, pdname, price)
 values (pd_seq.nextval, '마우스', 15000) ;

select * from pd order by no desc;
*/
--------------------------------------------------
drop table mem;
create table mem
(
 no number primary key,
 id varchar2(50) not null,
 pwd varchar2(50) not null,
 name varchar2(50) not null,
 hp varchar2(50) null,
 regdate  date default sysdate
);

create sequence mem_seq
increment by 1
start with 1
nocache;

insert into mem(no, id, pwd, name, hp)
 values (mem_seq.nextval, 'hong', '1','홍길동', '010-100-2000') ;


--
create table person
(
  no number(4) primary key,
  name varchar2(20) not null,
  tel varchar2(20)
  );

create sequence person_seq
start with 1
increment by 1
nocache;

insert into person
values(person_seq.nextval, '홍길동','010-100-2000');

insert into person
values(person_seq.nextval, '김연아','010-200-3000');

insert into person
values(person_seq.nextval, '손연재','010-300-4000');

commit;

select * from person;

----------------------------------------
create table book(
    no number primary key,
    title varchar2(100),
    price number,
    publisher varchar2(100),
    joindate date  default sysdate
);

--no는 자동증가..
create sequence book_seq
increment by 1
start with 1
nocache;

select * from book order by no desc;


--SELECT mem_seq.CURRVAL  FROM DUAL;
--SELECT mem_seq.NEXTVAL  FROM DUAL;  --nextval 은 조회할 때마다 값이 증가함
