  --투표 관련
   --생성
   create table sistpoll (
     pollid number not null,
     id varchar2(50) not null,
     question varchar2(1000) not null,
     sdate date not null,
     edate date not null,
     itemcount number not null,
     polltotal number not null,
     regdate date not null,
     CONSTRAINT PK_SIST_POLL PRIMARY KEY("POLLID")
   );
   
   create sequence  seq_sist_poll start with 1 increment by 1;
   
   alter table sistpoll add constraint fk_sist_poll foreign key(id) references sistmember(id);
   
   --확인
   select * from sistpoll
   
       -- 삭제
   drop table sistpoll
   cascade constraint;
   
   drop sequence seq_sist_poll;
   
    
   --sub 관련
   --생성
 CREATE TABLE SISTPOLLSUB(
   POLLSUBID NUMBER NOT NULL,
   POLLID NUMBER NOT NULL,
   ANSWER VARCHAR2(1000) NOT NULL,
   ACOUNT NUMBER NOT NULL,
   CONSTRAINT PK_SIST_POLLSUB PRIMARY KEY("POLLSUBID")
);

CREATE SEQUENCE SEQ_SIST_POLLSUB START WITH 1 INCREMENT BY 1;

ALTER TABLE SISTPOLLSUB ADD CONSTRAINT FK_SIST_POLLSUB FOREIGN KEY("POLLID")
REFERENCES SISTPOLL ("POLLID");
   
      --확인
   select * from SISTPOLLSUB
   
       -- 삭제
   drop table SISTPOLLSUB
   cascade constraint;
   
   drop sequence SEQ_SIST_POLLSUB;
   
   
   
   --Voter 관련
   --생성
   
   create table sistvoter(
     voterid number not null,
     pollid number,
     pollsubid number not null,
     id varchar2(50) not null,
     regdate date not null,
     constraint pk_sist_voter primary key(voterid)
   );
   
    create sequence seq_sist_voter start with 1 increment by 1;
   
    alter table sistvoter add constraint fk1_sist_voter foreign key(pollid) references sistpoll(pollid);
   
    alter table sistvoter add constraint fk2_sist_voter foreign key(pollsubid) references sistpollsub(pollsubid);
    
    alter table sistvoter add constraint fk3_sist_voter foreign key(id) references sistmember(id);
    
   --확인
   select * from sistvoter
   
       -- 삭제
   drop table sistvoter
   cascade constraint;
   
   drop sequence seq_sist_voter;
   
   