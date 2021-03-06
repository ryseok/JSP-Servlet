<%@page import="com.encore.t0712.dao.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리</title> 
  <%
  String id = request.getParameter("id");
  String pass = request.getParameter("pass");
    
  %>

   <script type="text/javascript">
      function movePage(updel){
    	 if(updel==='up') 
    	  location.href="modifyuser.jsp?id=<%=id%>";
    	 else{//if(updel==='del') 
    	   if(confirm("정말탈퇴?")){
    	      location.href="deleteid.jsp?id=${param.id}";
    	   }
    	 }
      }//movePage
   </script>   
</head>
<body>
<%
/*
<confirmprocess.jsp페이지 해야 할 일>
  1. 사용자정보입력폼으로 부터 데이터 얻기  request.getParameter("name");
  2. VO,Map사용해서 여러개의 데이터를 묶어주기
  3. DAO객체생성
  4. selectLogin() 호출하면서 데이터 전달
  5. 실행된 결과를 현재 JSP페이지에 반영
*/  
    
    
    UserInfoDAO dao = new UserInfoDAO();
      String result = dao.selectLogin(id, pass);
      //result = "success"  "fail_id"  "fail_pass"
   if(result.equals("success")){ 
	   
	   session.setAttribute("login", "success");//세션 로그인
	   
%>
 	  <table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>로그인 성공</b></td>
              </tr>
              <tr>
                <td>
                   입력하신 아이디와 패스워드를<br> 확인했습니다.
                   <br><br>                 
                    <input type="button" value="회원정보수정" 
                                         onclick="movePage('up')">
                    <input type="button" value="회원탈퇴"
                                         onclick="movePage('del')">
                   <br><br>
                   <a href="service.jsp">서비스화면</a>
                </td>
              </tr>
           </table>   
       <%}else if(result.equals("fail_pass")){ %> 	  
           <table width="280" border="0" cellpadding="5">
              <tr bgcolor="#3399cc">
                <td><b>로그인 실패</b></td>
              </tr>
              <tr>
                <td>
                   패스워드가 틀립니다.<br>
                   패스워드를 다시한번 확인해 주시기 바랍니다.<br><br>
                   <a href="userconfirm.jsp">로그인화면</a>
                </td>
              </tr>
           </table>   
          <%}else if(result.equals("fail_id")){ %>
    	  <table width="280" border="0" cellpadding="5">
			  <tr bgcolor="#3399cc">
				<td><b>로그인 실패</b></td>
			  </tr>
			  <tr>
				<td>
				   다시 아이디를 확인하세요.<br>
				   만약 가입하지 않으신 경우 신규가입을 하시기 바랍니다.<br><br>
				   <a href="userinput.jsp">신규가입</a>
				</td>
			  </tr>
          </table> 
         <%} %>
  </center>
</body>
</html>








