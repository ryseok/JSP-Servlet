<%@tag import="com.encore.t0711.Product"%>
<%@tag pageEncoding="UTF-8" body-content="scriptless"%>

<!-- 태그내에 들어가는 속성을 정의 -->
<%@attribute name="border" %>
<%@attribute name="color" %>

<!-- juwon.tag (JSP문법과 흡사)
     파일명 == 태그명
 -->

<h3><jsp:doBody/></h3>
<%
    Product p = new Product();     
    String [] list =p.getProductList();
%>
 <table border="${border }" bgcolor="${color }" cellpadding="5" >
    <%
       for(int i=0; i<list.length; i++){
    	    out.print("<tr><td>" + list[i] +"</td></tr>"); 
       }
    %>
 </table>

