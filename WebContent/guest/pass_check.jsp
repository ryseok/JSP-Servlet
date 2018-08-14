<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호확인</title>
  <script type="text/javascript">
    function checkpass(){
       var pass = document.passForm .pass.value; //'1111';
       var dpass = opener.document.editForm.dpass.value;//'1234';
       
       if(pass === dpass){
           opener.execUpDel();
       }else{
    	   alert('권한이 없습니다!!');
       }  
    	   window.close();
    }//checkpass
  </script>
</head>
<%--pass_check.jsp --%>
<body>
  <center>
    <form name="passForm">
       <table cellpadding="5">
         <tr>
            <td bgcolor="skyblue">비밀번호</td>
            <td><input type="password" name="pass"></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
              <input type="button" value="확인"
                     onclick="checkpass()">
            </td>
         </tr>
       </table>
    </form>
  </center>
  
</body>
</html>