create table member(
id varchar2(50),
pw varchar2(100),
name varchar2(50),
nickname varchar2(50),
gender varchar2(10),
birth varchar2(50),
phone varchar2(50),
mail varchar2(100),
addr1 varchar2(100),
addr2 varchar2(100),
addr3 varchar2(100),
joindate date,
lev char(1)
);

select * from member;

commit;

UPDATE member SET lev = 1 where id = 'admin';

create table goods(
name varchar2(100),
price number,
img varchar2(100),
regdate date DEFAULT sysdate,
updatedate date
);

select*from goods;

commit;

create table free_board (
    id varchar2(50),
    category varchar2(50),
    board_no number primary key,
    title varchar2(100) not null ,
    content varchar2(1000) not null ,
    writer varchar2(100) not null ,
    imgurl varchar2(100) ,
    reg_date date default  sysdate,
    view_cnt number default 0,
    like_cnt number default 0
);

select * from free_board;
drop table free_board;
commit;


CREATE TABLE free_like (
    id VARCHAR2(255),
    board_no number NOT NULL,
    like_check varchar2(30) default null
);
select * from free_like;
drop table free_like;

create sequence free_board_seq
start with 1 increment by 1 maxvalue 1000 nocycle  nocache ;

create sequence board_seq start with 1 increment by 1 maxvalue 1000 nocycle  nocache ;
drop sequence board_seq;

commit;

create sequence order_seq start with 1 increment by 1 nocycle nocache;

-- 시퀀스 생성
CREATE SEQUENCE order_seq START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

select * from tumbler_order;
drop table tumbler_order;
drop sequence order_seq;
insert into tumbler_order (id, order_no,orderdate,customer,contact,phone,addr1,addr2,addr3,memo,select_box,product_name,quantity,price,shipping_price)
values('soosung823',order_seq.NEXTVAL,sysdate,'customer','contact','phone','addr1','addr2','addr3','memo','select_box','product_name',1,25000,3000);

delete tumbler_order where id ='soosung823';
----- 주문 정보 테이블 -----------
CREATE TABLE tumbler_order (
  id VARCHAR2(50),
  order_no NUMBER,
  orderdate DATE,
  customer VARCHAR2(100),
  contact VARCHAR2(50),
  phone VARCHAR2(50),
  addr1 VARCHAR2(100),
  addr2 VARCHAR2(100),
  addr3 VARCHAR2(100),
  memo VARCHAR2(200),
  select_box VARCHAR2(100),
  product_name VARCHAR2(200),
  quantity NUMBER,
  price NUMBER,
  shipping_price NUMBER

);

select * from tumbler_order;
delete from tumbler_order where order_no=82;
commit;
-------------------------------------- QnA 테이블 ---------------------------------------
??????????????????? QnA 테이블 ???????????????????
create table upre_qna(
id varchar2(50),
bno number,
title varchar2(500) not null,
content varchar2(2000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
reple varchar2(2000),
category VARCHAR2(50),
answer varchar2(20),
CONSTRAINT pk_qna primary key(bno)
);

CREATE SEQUENCE seq_upre_qna
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE seq_upre_qna
START WITH 1 INCREMENT BY 1;

select * from upre_qna;
drop table upre_qna;
commit;

insert into upre_qna(bno,title,content,writer) values(seq_upre_qna.nextval,'테스트 제목','테스트 내용','정환1');
insert into upre_qna(bno,title,content,writer) values(seq_upre_qna.nextval,'테스트 제목','테스트 내용','정환2');
insert into upre_qna(bno,title,content,writer) values(seq_upre_qna.nextval,'테스트 제목','테스트 내용','정환3');

insert into upre_qna(bno,title,content,writer)(select seq_upre_qna.nextval,title,content,writer from upre_qna);
/* 2배로 복사되는 소스코드*/
select rn, bno, title, content, writer, regdate, updatedate from(
select /*index_desc(vam_board pk_board)*/
rownum as rn, bno, title, content, writer, regdate, updatedate
 from upre_qna where rownum <= 20)
where rn > 10;

commit;

-----------------------------------------------------------------------댓글-------------------------------------------------------
CREATE TABLE free_reply (
    id VARCHAR(255),
    board_no number NOT NULL,
    rno number NOT NULL,
    content VARCHAR(255),
    writer VARCHAR(255),
    regdate DATE,
    reply_cnt INT,
    PRIMARY KEY (rno)
);


select*from free_reply;

drop table free_reply;
-------시퀀스생성------------------
CREATE SEQUENCE free_REPLY_SEQ
START WITH 1
INCREMENT BY 1;
----------댓글테스트-----------------------------------------
insert into free_reply(BOARD_no, rno, content, writer) values(1, free_reply_seq.nextval, '테스트댓dd글', '테스트 작성자');
    
    commit;
    
    CREATE TABLE free_rreply (
    id VARCHAR(255),
    board_no number NOT NULL,
    rno number NOT NULL,
    rrno number NOT NULL,
    content VARCHAR(255),
    writer VARCHAR(255),
    regdate DATE,
    reply_cnt INT,
    PRIMARY KEY (rrno)
);
select*from free_rreply;
drop table free_rreply;
-------시퀀스생성------------------
CREATE SEQUENCE free_RREPLY_SEQ START WITH 1 INCREMENT BY 1;
----------댓글테스트-----------------------------------------
insert into free_rreply(id, BOARD_no, rno, rrno, content, writer) values('wngh0225',1, 31, free_rreply_seq.nextval, '테스트댓글', '테스트 작성자');    
commit;
----------------------------------------------

CREATE table class_table (
  CLASS_ID          NUMBER primary key,
  CLASS_IMG         VARCHAR2(255),
  CLASS_NAME        VARCHAR2(255),
  CLASS_CONTENT     VARCHAR2(4000),
  REG_DATE          DATE default sysdate,
  UPDATE_DATE       DATE default sysdate,
  CLASS_PEOPLENO    NUMBER,
  VIEW_CNT          NUMBER default 0
);


drop table class_table;
drop table class_cart;

CREATE TABLE class_cart (
  CART_NO       NUMBER,
  ID            VARCHAR2(50),
  NICKNAME      VARCHAR2(50),
  CLASS_ID      NUMBER,
  CLASS_IMG     VARCHAR2(100),
  CLASS_NAME    VARCHAR2(100),
  FOREIGN KEY (class_id) REFERENCES class_table (class_id) ON DELETE CASCADE
);

CREATE SEQUENCE cart_no_SEQ
START WITH 1
INCREMENT BY 1;

desc class_table;

commit;

CREATE SEQUENCE cart_no_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE class_id_SEQ START WITH 1 INCREMENT BY 1;

select * from class_table;
select * from class_cart;