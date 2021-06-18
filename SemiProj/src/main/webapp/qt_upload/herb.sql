select * from board;

insert into board(no, name, pwd, title, email, regdate, readcount, content)
select BOARD_SEQ.nextval, name, pwd, title, email, sysdate, 0, content
from board;

select * from guestbook;

insert into guestbook(no, name, pwd, content)
values(GUESTBOOK_SEQ.nextval, '박나나',1234,'싫어요..');

select * from  reboard order by groupno desc, sortno;

update reboard
set sortno=sortno+1
where groupno=2 and sortno>0;

insert into reboard(no, name, pwd, title, email, content, groupno, step, sortno)
values(REBOARD_SEQ.nextval, '바나' , '1' , '1234', '', '', 2, 1, 1);

select pwd from reboard
where no=1;

update reboard
set regdate='2021-06-05'
where no=3;

exec deleteReboard(2, 0, 2 );   --update됨 delflag='Y'; 삭제안됨
exec deleteReboard(4, 2, 2 );   --답글이라 삭제됨

select * from member;

select * from zipcode;

commit;

insert into member(no, userid, name, pwd, email, hp, zipcode, 
    address, addressDetail, date, mileage, outdate)
values(member_seq.nextval, 'aamm', '아무개', '123', '',
    '010-123-1234', '', '', '','','','');

select count(*) from member
where userid='chacha';

select zipcode from zipcode
where dong like '%대치%';

select pwd from member
where userid='chacha';

update member
set pwd=1234, email='111@gamil.com', hp='010-1212-1212',zipcode='',
address='', addressDetail=''
where userid='aa';

--회원삭제 (outdate를 업데이트)
update member
set outdate=sysdate
where userid='it111';

-- top6 가져오기
select * from
(
select * from board
order by no desc
)
where rownum<=6;

select * from board order by no desc;

select * from book;

commit;