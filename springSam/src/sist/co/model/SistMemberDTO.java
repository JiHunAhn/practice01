package sist.co.model;


/*drop table SistMember;

create table SistMember(
   id varchar2(50) primary key,   
   name varchar2(50) not null,
   pwd varchar2(50) not null,
   email varchar2(50) unique,   
   auth number(1) not null
);


select * from SistMember;*/


import java.io.Serializable;

public class SistMemberDTO implements Serializable {

   private String id;
   private String name;
   private String pwd;
   private String email;
   private int auth;
   
   public SistMemberDTO() {
      // TODO Auto-generated constructor stub
   }
   
   public SistMemberDTO(String id, String name, String pwd, String email, int auth) {
      super();
      this.id = id;
      this.name = name;
      this.pwd = pwd;
      this.email = email;
      this.auth = auth;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public int getAuth() {
      return auth;
   }

   public void setAuth(int auth) {
      this.auth = auth;
   }

   @Override
   public String toString() {
      return "SistMemberDTO [id=" + id + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", auth=" + auth
            + "]";
   }
   
}