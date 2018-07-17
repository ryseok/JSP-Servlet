<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
</head>
<%-- error.jsp
    (JSP페이지에서 에러가 발생시 공통적으로 화면표시할 페이지) --%>
<body>
  <center>
     <table>
        <tr>
           <td><b>페이지에러발생</b></td>
        </tr>
        <tr bgcolor="orange">
          <td>
                         시스템이 원활하지 않습니다.<br>
                         잠시후에 다시 접속해 주세요.<br>
                         문제가 계속 발생하면 <br>
                         관리자에게 문의 바랍니다.
          </td>        
        </tr>
     </table>
  </center>
</body>
</html>
