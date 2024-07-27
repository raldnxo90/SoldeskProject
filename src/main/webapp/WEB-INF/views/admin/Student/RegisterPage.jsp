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
        <form:form action="${root }admin/student/register_pro" modelAttribute="registerStudent" method="post">
        <!-- enctype="multipart/form-data" -->

            <form:label path="student_name">이름</form:label>
            <form:input path="student_name" placeholder="이름 등록" required="required"/>

            <form:label path="student_gender">성별</form:label>
            <form:select path="student_gender" required="required">
                <form:option value="" label="성별 선택" disabled="disabled" selected="selected"/>
                <form:option value="남성" label="남성"/>
                <form:option value="여성" label="여성"/>
            </form:select>

            <form:label path="student_birth">생년월일</form:label>
            <form:input path="student_birth" type="date" placeholder="생년월일" required="required"/>

            <form:label path="student_email">이메일</form:label>
            <form:input path="student_email" type="email" placeholder="이메일" required="required"/>

            <form:label path="student_phone">전화번호</form:label>
            <form:input path="student_phone" placeholder="전화번호" required="required"/>
            
            <form:label path="student_education">최종학력</form:label>
            <form:input path="student_education" placeholder="학력" required="required"/>
            
            <form:label path="student_major">전공</form:label>
            <form:select path="student_major" required="required">
                <form:option value="" label="전공여부" disabled="disabled" selected="selected"/>
                <form:option value="전공" label="전공"/>
                <form:option value="비전공" label="비전공"/>
            </form:select>
            
			<script>
			    let departments = [];
			
			    <c:forEach var="depart" items="${departments}">
			        departments.push({
			            department_idx: "${depart.department_idx}",
			            department_name: "${depart.department_name}"
			        });
			    </c:forEach>
			
			    console.log(departments);
			</script>
 			
			<form:label path="department_idx">강의 선택</form:label>
			<form:select path="department_idx" required="required">
				<c:forEach var="depart" items="${departments }">
					<form:option value="${depart.department_idx}">${depart.department_name}</form:option>
				</c:forEach>
			</form:select>
            <%-- <form:select path="department_idx" required="required">
                <form:option value="" label="강의 선택" disabled="disabled" selected="selected"/>
                 
				<c:forEach var="depart" items="${departments}" >
                	<form:option value="${depart.department_idx}">${depart.department_name }</form:option>
                </c:forEach>

            </form:select> 
--%> 
			<%--             
			<form:label path="photo">사진 등록</form:label>
            <form:input path="photo" type="file" accept="image/*" required="required"/> --%>

            <input type="submit" value="등록"/>
        </form:form>
    </div>

	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>
</html>