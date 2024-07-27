<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 수정 페이지</title>
<link href="${root }css/student.css" rel="stylesheet">

</head>
<body>
	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />
	
    <div class="container">
        <h2>학생 수정</h2>
        <form:form action="${root }student/modify_pro" modelAttribute="modifyStudent" method="post">
        <!-- enctype="multipart/form-data" -->
        
        	<form:hidden path="student_idx"/>
        
        	<form:label path="student_status">상태</form:label>
            <form:select path="student_status">
            	<form:option value="수료중">수료중</form:option>
            	<form:option value="중도탈락">중도탈락</form:option>
            	<form:option value="수강취소">수강취소</form:option>
            	<form:option value="조기취업">조기취업</form:option>
            </form:select>
        
            <form:label path="student_name">이름</form:label>
            <form:input path="student_name" readonly="true" />

            <form:label path="student_email">이메일</form:label>
            <form:input path="student_email" type="email" placeholder="이메일" />

            <form:label path="student_phone">전화번호</form:label>
            <form:input path="student_phone" placeholder="전화번호" />
            
            <form:label path="student_team">팀</form:label>
            <form:input path="student_team" placeholder="팀" />

			<form:label path="student_position">직책</form:label>
            <div class="radio-group">
                <form:radiobutton path="student_position" value="팀장" label="팀장"/>
                <form:radiobutton path="student_position" value="부팀장" label="부팀장"/>
                <form:radiobutton path="student_position" value="팀원" label="팀원"/>
            </div>

			<%--             
			<form:label path="photo">사진 등록</form:label>
            <form:input path="photo" type="file" accept="image/*" required="required"/> --%>

            <input type="submit" value="수정"/>
        </form:form>
    </div>

	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>
</html>