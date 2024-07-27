<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <form:form action="${root }admin/department/register_pro" modelAttribute="registerDepartment" method="post">
        과정명 : <form:input path="department_name"/> <br />
        개설일 : <form:input path="department_date" type="date"/> <br />
        담당 강사  
        <form:select path="instructor_idx">
            
            <c:forEach var="instructor" items="${instructors}">
                <form:option value="${instructor.instructor_idx}">${instructor.instructor_name }</form:option>
            </c:forEach>
        </form:select>        
        <br />
        부담임  
        <form:select path="mentor_idx">
            
            <c:forEach var="mentor" items="${instructors}">
                <form:option value="${mentor.instructor_idx}">${mentor.instructor_name }</form:option>
            </c:forEach>
        </form:select>        
        
        <button type="submit">과정등록</button>
        
    </form:form>

</body>
</html>
