<%@ page contentType="text/html; charset=UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
    
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
<style type="text/css">
#login_wrap{
	margin: 10px;
}
#login_wrap th{
	font-weight: bold;
}
#main_wrap{
	width: 800px;   margin-left: auto; 	margin-right: auto;	padding: 0px
}
#content_wrap{
	width: 100%;	height: 500px;	background-image: url(image/휘장.png);	background-repeat: no-repeat;	background-position: top center;
}
.login_title_wrap{
	width: 500px;	height:60px;	color: #ffffff;	text-align: center; 	
	background-color: #3e5fba;	border: solid 1px #efefef;	font-weight: bold;	
}
.content_table{
	width: 98%; 	border-bottom: 1px solid #efefef; 	border-right: 1px solid #efefef;
	border-collapse: collapse; 	margin-left: auto; 	margin-right: auto; 	clear: both;	
}
.content_table td, .content_table th{
	text-align: center; 	border-top: 1px solid #efefef;  	border-left: 1px solid #efefef;
	padding:0.3em; 	vertical-align: middle;
} 
.content_table th{
	background-color: #4d6bb3; 	color: #ffffff; 	line-height: 1.7em; 	font-weight: normal;
}
.content_table td{
	padding-left: 5px; 	text-align: left; 	line-height: 1.7em;
}
.content_table td.contents{
	width: 100%; 	height: 400px; 	overflow: auto;
}
.content_table select{
	height: 19px; 	border: #cccccc solid 1px; 	vertical-align: middle; 	line-height: 1.8em; 	padding-left: 0px;	
} 
.content_table select option{
	margin-right: 10px;
}
</style>

</head>
<body>

<div id="main_wrap">
<div id="middle_wrap">
<div id="content_wrap">
<div style="width:502px; height:166px; margin-left: auto; margin-right:auto; position:relative; top:100px;">
<div class="login_title_wrap">

	<div style="margin-top: 12px">
		<h2>뉴비는 언제나 환영</h2>
	</div>
	
	   <div id="login_wrap">
	       <form action="" method="post" id="_frmForm" name="frmForm">
	           <table class="content_table" style="width: 75%;">
	               <colgroup>
	                 <col style="width:30%"><col style="width:70%">
	               </colgroup>
	               
	               <tr>
	                  <th>아이디 확인</th>
	                  <td><input type="text" name="sid" id="_id" size="30"/>
	                  <a href="#none" id="_btnGetId" title="아이디확인">
	                      <img src="image/idcheck.png" alt="아이디 확인"/>
	                 </a>
	                      
	                      <div id="_rgetid"></div>
	                  
	                  </td>
	               </tr>
	               
	               <tr>
	                   <th>아이디</th>
	                   <td><input type="text" name="id" id="_userid" size="30" data-msg="아이디" readonly="readonly"/></td>
	               </tr>
	               
	               <tr>
	                   <th>비밀번호</th>
	                   <td><input type="password" name="pwd" id="_pwd" size="30" data-msg="비밀번호"/></td>
	               </tr>
	               
	               <tr>
	                   <th>이름</th>
	                   <td><input type="text" name="name" id="_name" size="30" data-msg="이름"/></td>
	               </tr>
	               
	              <tr>
	                   <th>이메일</th>
	                   <td><input type="text" name="email" id="_email" size="30" data-msg="이메일"/></td>
	               </tr>
	               
	              <tr>
	                  <td colspan="2" style="height: 50px; text-align: center;">
	                      <a href="#none" id="_btnRegi" title="회원가입"><img src="image/regi.jpg" alt="회원가입"></a>
	                      <a href="#none" id="_btnLogin" title="로그인"><img src="image/login_btn.jpg" alt="로그인"></a>
	                  </td>
	               </tr>
	           </table>
	       </form>
	   </div>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	
	
<script type="text/javascript">
$("#_btnRegi").click(function(){
	if($("#_userid").val() == ""){
		alert($("#_userid").attr("data-msg")+" 입력해라");
		$("#_userid").focus();
	}else if($("#_pwd").val() == ""){
		alert($("#_pwd").attr("data-msg")+" 입력해라");
		$("#_pwd").focus();
	}else if($("#_name").val() == ""){
		alert($("#_name").attr("data-msg")+" 입력해라");
		$("#_name").focus();
	}else if($("#_email").val() == ""){
		alert($("#_email").attr("data-msg")+" 입력해라");
		$("#_email").focus();
	}else{
		$("#_frmForm").attr({"target":"_self", "action":"regiAf.do"}).submit();
	}
	
});

$("#_btnGetId").click(function(){
	var _id=$("#_id").val();
	if(_id==""){
		alert("확인 할 아이디 입력해라");
		$("#_id").focus();
	}else{
		showallcust(_id);
	}
	
});

function showallcust(id){	
	$.ajax({
		type:"POST",
		url:"./getID.do",
		async:true,
		data:"id="+id,
		success:function(msg){			
			outputList(msg);
		}
	});
};

function outputList(msg) {	
	if(msg.message=='Sucs'){		
		$("#_rgetid").html("사용못해");
		$("#_rgetid").css("background-color", "#ff0000");
		$("#_userid").val("");
	}else{		
		$("#_rgetid").html("사용해");
		$("#_rgetid").css("background-color", "#0000ff");
		$("#_userid").val($("#_id").val());		
	}	
};

</script>



</body>
</html>