<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전달 파라미터</title>
</head>
<body>
  <form name="frm" action="print2.jsp" method="post">
        이름: <input type="text" name="uname" value="기본값"> <br> 
        비번: <input type="password" name="pass"> <br>
        히든: <input type="hidden" name="hide" value="하이드와지킬박사"> <br>
        좋아하는 과일:
       <input type="checkbox" name="fruit" value="사과">사과         
       <input type="checkbox" name='fruit' value="딸기">딸기      
       <input type="checkbox" name="fruit" value="바나나">바나나
       <br>  
        강의실:
       <input type="radio" name="room" value="1강의실" checked>1강의실       
       <input type="radio" name="room" value="2강의실">2강의실       
       <input type="radio" name="room" value="3강의실">3강의실       
       <input type="radio" name="room" value="4강의실">4강의실
       <br>
        점심메뉴:
       <select name="menu">
          <option value="김치찌게">한식</option>
          <option value="꿔바로우">중식</option>
          <option value="초밥">일식</option>
       </select><br>
         메모:
       <textarea rows="5" cols="30" name="memo">기본text!!</textarea>
       
    <input type="submit" value="입력내용출력">
  </form>
</body>
</html>