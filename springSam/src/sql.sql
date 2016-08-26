-- 멤버
drop table SistMember;

create table SistMember(
   id varchar2(50) primary key,   
   name varchar2(50) not null,
   pwd varchar2(50) not null,
   email varchar2(50) unique,   
   auth number(1) not null
);

select * from SistMember;

update SistMember set auth=1 where id='leehy0930'
	 

-- 게시판 테이블 
   -- 삭제
   drop table sistbbs
   cascade constraint;
   
   drop sequence seq_sistbbs
   
   
create table sistbbs(
      seq number(8) primary key,
      id varchar2(50) not null,
      ref number(8) not null,
      step number(8) not null,
      depth number(8) not null,
      title varchar2(200) not null,
      content varchar2(4000) not null,
      wdate date not null,
      parent number(8) not null,
      del number(1) not null,
      readcount number(8) not null
  );
  
  create sequence seq_sistbbs start with 1 increment by 1;
  
  alter table sistbbs add constraint fk_sistbbs_id foreign key(id) references sistmember(id);

-- 확인용
  select * from sistbbs;
  

