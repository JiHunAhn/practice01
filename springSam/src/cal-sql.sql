   --일정용 테이블
   --생성
   create table sistcalendar(
      seq number(8) primary key,
      id varchar2(50) not null,
      title varchar2(200) not null,
      content varchar2(4000) not null,
      wdate  varchar2(50) not null,
      regdate date not null
   );
   
  create sequence seq_sist_calendar start with 1 increment by 1;
  
  alter table sistcalendar add constraint fk_sist_calendar_id foreign key(id) references sistmember(id);
    
   -- 확인용
  select * from sistcalendar;
  
  -- 삭제
   drop table sistcalendar
   cascade constraint;
   
   drop sequence seq_sist_calendar;
   


--데이터 추가
   insert into SISTCALENDAR
   (seq, id, title, content, wdate, regdate)
   values(seq_sist_calendar.nextval, '111', '제목', '일정이 있을거야', '201608221517', sysdate)