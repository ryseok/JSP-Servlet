<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 결과화면</title>
</head>
<%--checkOut.jsp --%>
<body>
  <center>
    <h3>선택된 상품목록</h3>
    <hr>
    <%
    
       HashMap<String,Integer> map = new HashMap<>();
         map.put("사과", 100);
         map.put("수박", 200);
         map.put("딸기", 300);
         map.put("파인애플", 400);
         map.put("바나나", 500);
     
       
       ArrayList<String> list = 
             (ArrayList<String>)session.getAttribute("fruitsName");
    
       int sum=0;
       for(int i=0; i<list.size(); i++){
    	   String fruitName = list.get(i);
    	   out.print(fruitName+"<br>");
    	   
    	   sum += map.get(fruitName);
       }
    //사과:100원, 수박:200원, 딸기:300원, 파인애플:400원, 바나나:500원
    %>
    <hr>
        총합계: <%= sum %>원
        
    <%--
         방법1)
        int sum=0;
        if(만약 사과) sum+=100;
        else if(만약 수박) sum+=200;
        ......
         방법2)
        String []fruitsName = {"사과","수박","딸기",...};
        int []price ={100,200,300,....}
         
        if(fruitsName[0]와 같다면)  sum+=price[0] 
        else if(fruitsName[1]와 같다면)  sum+=price[1]
         
        방법3)
        Vector<E>  ArrayList<E>   ---> E:Element(요소데이터) --->요소데이터로 어떤Type?
        
        HashMap  -----> 신발장, 사물함 클래스
        HashMap<K,V>  ---> K:Key(키,변수명)  V:Value(값데이터)
                           ---> 키와 값을 각각 어떤 Type?
                           
        HashMap<String,Integer> map = new HashMap<>();
           //데이터 저장  ---->  풋풋하게~!!                                  
            map.put("사과",100);
            map.put("수박",200);
        
           //데이터 조회  ----> 열쇠로~!!
              int price = map.get("사과");  ---> 100
              int price = map.get("수박");  ---> 200
     --%>    
    <br>
    <input type="button" value="장바구니 비우기(결제)"
           onclick="location.href='selProduct.jsp?action=remove&x=10'">
  </center>
</body>
</html>



