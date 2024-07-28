<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 등록 페이지</title>
<link href="${root }css/student.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $(".btn").click(function(){
        	
        	let instructorsJSON = JSON.parse('${instructorListJson}');
            $(".btn").removeClass("selected");
            $(this).addClass("selected");

            if ($(this).attr('id') == "devBtn") {
                $(".form-container input, .form-container select").css("border-color", "#800020");
                $(".form-container").show();
            } else if ($(this).attr('id') == "netBtn") {
                $(".form-container input, .form-container select").css("border-color", "#003366");
                $(".form-container").show();
            }
        });

        $(".form-container").hide();
    });
</script>
</head>



<body>
    <!-- 상단 메뉴바 -->
    <c:import url="/WEB-INF/views/include/top.jsp" />
    
    
    <div class="container">
        <h2>과정 등록</h2>
        <div class="btn-group">
            <button id="devBtn" class="btn">개발</button>
            <button id="netBtn" class="btn">네트워크</button>
        </div>
        
        <div class="form-container" style="padding: 20px; margin-top: 20px;">
            <form:form action="${root }admin/department/register_pro" modelAttribute="registerDepartment" method="post">
            
                <form:label path="lecture_idx">과정</form:label>
                <form:select path="lecture_idx" required="required">
                    <c:forEach var="lecture" items="${lectures}">
                        <form:option value="${lecture.lecture_idx}">${lecture.lecture_name }</form:option>
                    </c:forEach>
                </form:select> 

                <form:label path="department_date">개설일</form:label>
                <form:input path="department_date" type="date" required="required"/>
                
                <form:label path="instructor_idx">담당 강사</form:label>
                <form:select path="instructor_idx" required="required">
                    <c:forEach var="instructor" items="${instructors}">
                        <form:option value="${instructor.instructor_idx}">${instructor.instructor_name }</form:option>
                    </c:forEach>
                </form:select> 
                
                <form:label path="mentor_idx">부담임</form:label>
                <form:select path="mentor_idx" required="required">
                    <c:forEach var="mentor" items="${instructors}">
                        <form:option value="${mentor.instructor_idx}">${mentor.instructor_name }</form:option>
                    </c:forEach>
                </form:select>
                
                <form:label path="department_class">강의장</form:label>
                <form:select path="department_class">
                    <form:option value="501호">501호</form:option> <!-- 박진경 -->
                    <form:option value="503호">503호</form:option> <!-- 김금목 -->
                    <form:option value="504호">504호</form:option> <!-- 이수진 -->
                    <form:option value="506호">506호</form:option> <!-- 백승찬 -->  
                    <form:option value="507호">507호</form:option> <!-- 김주일 -->  
                    <form:option value="510호">510호</form:option> <!-- 최규리 -->  
                    <form:option value="512호">512호</form:option> <!-- 엄기흥 -->  
                    <form:option value="801호">801호</form:option> <!-- 김우태 -->  
                    <form:option value="802호">802호</form:option> <!-- 이명재 -->           
                    <form:option value="803호">803호</form:option> <!-- 이재철 -->           
                    <form:option value="901호">901호</form:option> <!-- 오창석 -->           
                    <form:option value="902호">902호</form:option> <!-- 신성현 -->           
                    <form:option value="903호">903호</form:option> <!-- 정세나 -->           
                    <form:option value="1013호">1013호</form:option>            
                    <form:option value="1014호">1014호</form:option>            
                </form:select>
                
                <input type="submit" value="과정등록"/>
            </form:form>
        </div>
    </div>

    <div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>
</html>
