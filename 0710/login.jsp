<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인폼</title>
   <style type="text/css">
       /*  b{display: none;} */
       /* 스타일 정의를 하는 영역 
       기본문법: 선택자{스타일정의}
                       ==> 스타일명:스타일값
      종류)
           div{스타일정의}
            ==> div태그에 스타일 정의
          .div{스타일정의}
            ==> <table class="div">
                <b class="div">
                <p class="div">
                 
          #div{스타일정의}
            ==> <table id="div"> */
   </style>
</head>
<%-- login.jsp --%>
<body>
  <center>
    <h3>로그인화면</h3>
    <hr>
    
   <div id="d1"> 
    <form action="selProduct.jsp" method="post">
          이름: <input type="text" name="username" size="10">
      <input type="submit"  value="로그인">    
    </form>
   </div>
   
   <div id="d2">
    <b><font color="blue">로그인한 상태입니다!!</font></b>
   </div>
   
   <%
       //자바스크립트를 통해 d1 또는 d2에 대한 보이기 설정
       
       
     if(session.getAttribute("loginName") != null){//로그인한 상태라면  
      out.print("<script>d1.style.display='none';");
      out.print("d2.style.display='';</script>");
     }else{
      out.print("<script>d1.style.display='';");
      out.print("d2.style.display='none';</script>");
     }
   %>
   
  </center>
</body>
</html>


