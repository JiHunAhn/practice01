
	--게시판 관련
	
      create table sistpds (
      seq number(8) primary key,
      id varchar2(50) not null,
      title varchar2(200) not null,
      content varchar2(4000) not null,
      filename varchar2(50) not null,
      readcount number(8) not null,
      downcount number(8) not null,
      regidate date not null
   );
   
    create sequence seq_sist_pds start with 1 increment by 1;
    
    alter table sistpds add constraint fk_sist_pds_id foreign key(id) references sistmember(id);
    
       -- 확인용
  select * from sistpds;
  
    -- 삭제
   drop table sistpds
   cascade constraint;
   
   drop sequence seq_sist_pds;