<%@page import="com.encore.t0712.dao.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입처리결과</title>
</head>

<jsp:useBean id="user" class="com.encore.t0712.dto.UserInfo"></jsp:useBean>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:setProperty property="*" name="user"/>

<%
     //out.print(user);
           
     String jumin = request.getParameter("jumin1")+"-"+
    		        request.getParameter("jumin2");
     String birth = request.getParameter("year")+"-"+
    		         request.getParameter("month")+"-"+
    		         request.getParameter("day");
     user.setJumin(jumin);
     user.setBirth(birth);
     
     //out.print("<hr color=red>"+user);
     
     UserInfoDAO dao = new UserInfoDAO();
     
     
    /*
       <userprocess.jsp페이지 해야 할 일>
      1. 사용자정보입력폼으로 부터 데이터 얻기  request.getParameter("name");
      2. VO사용해서 여러개의 데이터를 묶어주기
      3. DAO객체생성
      4. insert() 호출하면서 데이터 전달
      5. 실행된 결과를 현재 JSP페이지에 반영
    */
%>
<body>
  <center>
    <% if(dao.insert(user)){
    	   // ${user.name}  (X) 지역변수는 레퍼런스X
    	   //만약 pageContext.setAttribute("user",user);있다면 가능
    	   // ${param.name} (O)
    	   // <%= user.getName() % >  (O)
    	%>     
     <table width="330" border="0" cellpadding="5">
         <tr bgcolor="#3399cc">
           <td><b>[${param.name}]님 가입을 축하합니다.</b></td>
         </tr>
         <tr>
           <td>
              입력하신 내용대로 가입이 완료되었습니다.<br>
              님께서 요청하신 아이디와 패스워드입니다.
              <p align="center">아이디:<%=user.getId() %><br>
                                패스워드:${param.pass }<br><br>
                 <a href="userconfirm.jsp">로그인 화면</a>                   
              </p>
           </td>
         </tr>
      </table>
     <%}else{ %>
     <table width="330" border="0" cellpadding="5">
        <tr bgcolor="#3399cc">
          <td><b>가입이 되지않았습니다.<br>
                    입력내용을 다시 한번 확인해 주세요.</b></td>
        </tr>
        <tr>
          <td>            
             <p align="center">입력이 정확한 경우에도 가입이 되지 않는 경우
              관리자에게 문의하여 주십시요.  <br>  
                <a href="javascript:history.back()">이전화면</a>               
             </p>
          </td>
        </tr>
     </table> 
      <%} %>
  </center>
</body>
</html>