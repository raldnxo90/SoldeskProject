<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 등록 페이지</title>
<link href="${root}css/admin.css" rel="stylesheet"> 
<link href="${root}css/student.css" rel="stylesheet"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    let instructorsJSON = JSON.parse('${instructorListJson}'); // 서버에서 가져온 강사 JSON 파일
    let lectureJSON = JSON.parse('${lectureJson}'); // 서버에서 가져온 강좌 JSON 파일

    function filterOptions(sort) {
        let filteredInstructors = instructorsJSON.filter(instructor => instructor.instructor_sort === sort);
        let instructorSelect = $("#instructorSelect");
        instructorSelect.empty();
        filteredInstructors.forEach(function(instructor) {
            instructorSelect.append(new Option(instructor.instructor_name, instructor.instructor_idx));
        });

        let filteredLectures = lectureJSON.filter(lecture => lecture.lecture_sort === sort);
        let lectureSelect = $("#lectureSelect");
        lectureSelect.empty();
        filteredLectures.forEach(function(lecture){
            lectureSelect.append(new Option(lecture.lecture_name, lecture.lecture_idx));
        });
    }

    $(".btn").click(function(){
        $(".btn").removeClass("selected");
        $(this).addClass("selected");

        if ($(this).attr('id') == "devBtn") {
            $(".form-container input, .form-container select").css("border-color", "#800020");
            filterOptions("소프트웨어 개발");
        } else if ($(this).attr('id') == "netBtn") {
            $(".form-container input, .form-container select").css("border-color", "#003366");
            filterOptions("네트워크");
        }

        $(".form-container").show();
    });

    $(".form-container").hide();
});
</script>
</head> 
<body>
    <!-- 상단 메뉴바 -->
    <c:import url="/WEB-INF/views/include/top.jsp" />

    <div class="main">
        <!-- 사이드바 포함 -->
        <c:import url="/WEB-INF/views/include/adminSide.jsp" />
        
        <div class="content">
            <div class="container">
                <h2>과정 등록</h2>
                <div class="btn-group">
                    <button id="devBtn" class="btn">개발</button>
                    <button id="netBtn" class="btn">네트워크</button>
                </div>
                
                <div class="form-container" style="padding: 20px; margin-top: 20px;">
                    <form:form action="${root}admin/department/register_pro" modelAttribute="registerDepartment" method="post">
                    
                        <form:label path="lecture_idx">과정</form:label>
                        <form:select path="lecture_idx" id="lectureSelect" required="required"></form:select> 

                        <form:label path="department_date">개설일</form:label>
                        <form:input path="department_date" type="date" required="required"/>
                        
                        <form:label path="instructor_idx">담당 강사</form:label>
                        <form:select path="instructor_idx" id="instructorSelect" required="required"></form:select> 
                        
                        <form:label path="mentor_idx">부담임</form:label>
                        <form:select path="mentor_idx" required="required">
                            <c:forEach var="mentor" items="${instructors}">
                                <form:option value="${mentor.instructor_idx}">${mentor.instructor_name}</form:option>
                            </c:forEach>
                        </form:select>
                        
                        <form:label path="department_class">강의장</form:label>
                        <form:select path="department_class">
                            <form:option value="501호">501호</form:option>
                            <form:option value="503호">503호</form:option>
                            <form:option value="504호">504호</form:option>
                            <form:option value="506호">506호</form:option>
                            <form:option value="507호">507호</form:option>
                            <form:option value="510호">510호</form:option>
                            <form:option value="512호">512호</form:option>
                            <form:option value="801호">801호</form:option>
                            <form:option value="802호">802호</form:option>
                            <form:option value="803호">803호</form:option>
                            <form:option value="901호">901호</form:option>
                            <form:option value="902호">902호</form:option>
                            <form:option value="903호">903호</form:option>
                            <form:option value="1013호">1013호</form:option>
                            <form:option value="1014호">1014호</form:option>
                        </form:select>
                        
                        <input type="submit" value="과정등록"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>
</html>
