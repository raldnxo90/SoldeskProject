<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록 페이지</title>
<link href="${root }css/student.css" rel="stylesheet">

</head>
<body>
	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />
	
    <div class="container">
        <h2>학생 등록</h2>
        <form:form action="${root }student/register_pro" modelAttribute="student" >
        <!-- enctype="multipart/form-data" -->

            <form:label path="name">이름</form:label>
            <form:input path="name" placeholder="이름 등록" required="required"/>

            <form:label path="gender">성별</form:label>
            <form:select path="gender" required="required">
                <form:option value="" label="성별 선택" disabled="disabled" selected="selected"/>
                <form:option value="남성" label="남성"/>
                <form:option value="여성" label="여성"/>
            </form:select>

            <form:label path="birth">생년월일</form:label>
            <form:input path="birth" type="date" placeholder="생년월일" required="required"/>

            <form:label path="email">이메일</form:label>
            <form:input path="email" type="email" placeholder="이메일" required="required"/>

            <form:label path="phone">전화번호</form:label>
            <form:input path="phone" placeholder="전화번호" required="required"/>

            <form:label path="department">강의 선택</form:label>
            <form:select path="department" required="required">
                <form:option value="" label="강의 선택" disabled="disabled" selected="selected"/>
                <form:option value="class1" label="그래픽 기반 실시간 AI서비스를 활용한 cross-platform 개발자 양성과정 12회차 801호 김우태(김진우)"/>
                <form:option value="class2" label="그래픽 기반 실시간 AI서비스를 활용한 cross-platform 개발자 양성과정 13회차 903호 정세나(고은비)"/>
            </form:select>

			<%--             
			<form:label path="photo">사진 등록</form:label>
            <form:input path="photo" type="file" accept="image/*" required="required"/> --%>

            <input type="submit" value="등록"/>
        </form:form>
    </div>

	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>
</html>