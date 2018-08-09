<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%-- mission3.jsp(사원번호,사원명,급여,부서번호,입사일자) --%>
  <table border="1" cellpadding="5">
     <tr bgcolor="orange">
       <th>사원번호</th>
       <th>사원명</th>
       <th>급여</th>
       <th>부서번호</th>
       <th>입사일자</th>
     </tr>
     <c:forEach items="${list }" var="emp">
     <tr>
       <td>${emp.empno }</td>
       <td>${emp.ename }</td>
       <td>${emp.sal }</td>
       <td>${emp.deptno }</td>
       <td>${emp.hiredate }</td>
     </tr>
     </c:forEach>
  </table>