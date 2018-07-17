<%@page import="com.encore.t0712.dto.UserInfo"%>
<%@page import="com.encore.t0712.dao.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자수정</title> 
   <script type="text/javascript" src="/TomTest/js/check.js"></script>
</head>
<body>
  <center>
  <%
  /*
  <modifyuser.jsp페이지 해야 할 일>
 1. confirmprocess.jsp로 부터 데이터 얻기  request.getParameter("name");
 2. DAO객체생성
 3. select(id) 호출하면서 데이터 전달
 4. 실행된 결과를 현재 JSP페이지에 반영  value="<%= % >"
*/
      String id = request.getParameter("id");
                  //request.getAttribute("id");

      UserInfoDAO dao = new UserInfoDAO();
      UserInfo user = dao.select(id);
  %>
  
  
  <form name="frm" action="modifyprocess.jsp" method="post">
  <table width="600" border="0" cellpadding="5" >
      <tr bgcolor="#3399cc">
         <td><font size="4" color="white">사용자정보수정</font>
      </tr>      
  </table>
  <table border="1" cellpadding="5" width="600">
      <tr>
         <td width="100" bgcolor="#ffcccc">사용자ID</td>
         <td colspan="3"> 
         <input type="text" name="id" value="<%= user.getId()%>"
                readonly>
         <%-- <input type="text" name="id" value="<%= user.getId()%>"
                disabled>
         <input type="hidden" name="id" value="<%= user.getId()%>"> --%>
                
                </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">비밀번호</td>
         <td><input type="password" name="pass"  value="<%= user.getPass()%>"> </td>
         <td width="100" bgcolor="#ffcccc">비번확인</td>
         <td><input type="password" name="pass2"  value="<%= user.getPass()%>"> </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">사용자이름</td>
         <td colspan="3">
         <input type="text" name="name"  value="<%= user.getName()%>"
                disabled>        
         </td>
         
      </tr>
      <tr>        
         <td width="100" bgcolor="#ffcccc">주민번호</td>
         <td colspan="3">            
           <%
               String []jumin = user.getJumin().split("-");
               //"930203-1012345"  ---> {"930203", "1012345"}
           %>
              <input type="text" name="jumin1" size="6" maxlength="6"
                      style="height:23px" value="<%= jumin[0]%>"
                      disabled>
              -
              <input type="password" name="jumin2" size="7" maxlength="7"
                      style="height:23px" value="<%= jumin[1]%>"
                      disabled></td>
      </tr>
      <tr>         
         <%
             String []birth = user.getBirth().split("-");
         %>
         <td width="100" bgcolor="#ffcccc" >생년월일</td>
         <td colspan="3">
         <input type="text" name="year" size="4" maxlength="4"
                         value="<%=birth[0]%>" disabled>년
         <select name="month" disabled>
           <option><%=birth[1] %></option>  
         </select >월          
         <select name="day" disabled> 
           <option><%=birth[2] %></option>   
         </select>일          
          </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">우편번호</td>
         <td colspan="3">
            <input type="text" name="zip" size="5" maxlength="5"
                    value="<%= user.getZip()%>">
	     </td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">주소</td>
         <td colspan="3"><input type="text" name="addr" size="50"
                           value="<%= user.getAddr()%>"></td>
      </tr>
      <tr>
         <td width="100" bgcolor="#ffcccc">E-Mail</td>
         <td colspan="3"><input type="text" name="email" size="30"
                            value="<%= user.getEmail()%>">
          </td>
      </tr>
    
      <tr>
         <td width="100" bgcolor="#ffcccc">직업</td>
         <td colspan="3">
               <select name="job" >
                <% 
                String jobs[]={"==선택==","학생","공무원","언론/출판","군인/경찰","일반사무직",
        		   "영업직","기술/전문직","보건/의료","자영업","주부","기타" };
                  for(int i=0; i<jobs.length; i++){
              if(jobs[i].equals(user.getJob()))  	  
             out.print("<option value='"+jobs[i]+"' selected>"+jobs[i]+"</option>");
              else
             out.print("<option value='"+jobs[i]+"'>"+jobs[i]+"</option>");
                  }
        		%>      		
               </select>
         </td>
      </tr>
      <tr align="center">
         <td colspan="4">
           <input type="button" value="수정" onclick="validateCheck()">
           <input type="reset" value="취소">
         </td>
      </tr>
  </table>
  </form>
  </center>
</body>
</html>