<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%-- addrResult.jsp(ajax요청에 대한 데이터 출력) --%>
<select>
 <option>==선택==</option>
 <c:forEach items="${list }" var="str">
  <option>${str }</option>
 </c:forEach>
</select>