<%-- <%@page import="guest.vo.Guest"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록:수정폼</title>
  <script type="text/javascript">
     var choice;
     
     function passCheck(updel){
    	 choice = updel;
    	 
       window.open('pass_check.jsp','confirm',
    		   'width=280,height=100,top=100,left=200');	 
     }
     
     function execUpDel(){
       if(choice == 'up')	 
    	document.editForm.submit();
       else //if(choice=='del')
    	location.href='/TomTest/guest/control?action=delete&no=${guest.no}'; 
     }
     
     function execDel(){
    	location.href='/struts/guest/delete.do?no=${guest.no}'; 
     }
  </script>
</head>
<%--editForm.jsp --%>
<body>
  <center>
     <h3>수정폼</h3>
     <hr>
     [<a href="/struts/guest.do">게시물 목록으로</a>]<br><br>
     <%--
        Guest guest = (Guest)request.getAttribute("guest");
     --%>
     <form action="/struts/guest/update.do" 
           method="post"
           name="editForm">
                  
       <input type="hidden" name="no" value="${guest.no }">
       <input type="hidden" name="dpass" value="${guest.pass }">
       
       <table border="1" cellpadding="5">
          <tr>
              <td bgcolor="skyblue" width="80px">작성자</td>
              <td><input type="text" name="writer"
                        value="${guest.writer}<%-- <%= guest.getWriter()%> --%>"></td>
          </tr>
          <tr>
              <td bgcolor="skyblue">email</td>
              <td><input type="text" name="email"
                         value="${guest.email}"></td>
          </tr>
          <tr>
              <td bgcolor="skyblue">전화번호</td>
              <td><input type="text" name="tel"
                         value="${guest.tel}"></td>
          </tr>
          <tr>
              <td bgcolor="skyblue">비밀번호</td>
              <td><input type="password" name="pass"
                         value="${guest.pass}"></td>
          </tr>
          <tr>
              <td colspan="2">
                <textarea rows="5" cols="35" 
                     name="contents">${guest.contents }</textarea></td>
          </tr>
          <tr>
              <td colspan="2" align="center">
                <!-- <input type="submit" value="수정"> -->
                <input type="submit" value="수정">
                <input type="reset" value="취소">
                <input type="button" value="삭제" onclick="execDel()">
              </td>
          </tr>
       </table>
    </form>
   
     
  </center>
</body>
</html>



