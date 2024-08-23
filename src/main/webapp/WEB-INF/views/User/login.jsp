<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<body>
	
	<c:if test="${status == false }">
		<h2>로그인에 실패했습니다.</h2>
	</c:if>

	<form:form action="${root}user/login_pro" modelAttribute="tempLoginUserBean" method="post">
		아이디<form:input path="user_id"/> <br />
		패스워드 <form:password path="user_pass"/> <br />
		<button type="submit">로그인</button>
	</form:form>
</body>
</html>