create table emp3
(
    emp_no      number not null,
    emp_name    varchar2(40) not null,
    emp_hdate   date,
    emp_mgr_no  number,
    dept_no     number
);

create table dept3
(
    dept_no     number not null,
    dept_name   varchar2(30) not null,
    dept_area   varchar2(20)
);

alter table emp3
add constraint pk_emp primary key(emp_no);

alter table dept3
add constraint pk_dept primary key(dept_no);

alter table emp3
add constraint fk_emp foreign key (dept_no) references dept3(dept_no);

insert into dept3(dept_no, dept_name, dept_area)
values(10, '영업부', '서울');

insert into dept3(dept_no, dept_name, dept_area)
values(20, '총무부', '서울');

insert into emp3(emp_no, emp_name, emp_hdate, emp_mgr_no, dept_no)
values(1001, '홍길동', '2010-03-02', 1000, 10);

update emp3
set emp_name = '김서정', emp_hdate = '2020-09-01'
where emp_no = 1001;

create or replace view v_emp_dept
as
select emp_no, emp_name, emp_hdate, e.dept_no, dept_name
from emp3 e left join dept3 d 
on e.dept_no = d.dept_no;

create index idx_emp_name
on emp3(emp_name);

select e.*, a.emp_name 부서장명
from emp3 e left join dept3 d
on e.dept_no = d.dept_no
left join emp3 a
on e.EMP_MGR_NO = a.EMP_NO
order by e.dept_no;

select emp_no, emp_name, dept_no
from emp3 e
where dept_no in (select dept_no from dept3 where dept_area = '서울');