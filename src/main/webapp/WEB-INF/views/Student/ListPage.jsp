<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 관리 페이지</title>
<link href="${root }css/student.css" rel="stylesheet">
<style type="text/css">
	.container {
		width: 90%;
		max-width: 1200px;
		padding: 20px;
		background-color: white;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		border-radius: 5px;
		text-align: center;
		margin: auto;
		margin-top: 200px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        let students = JSON.parse('${stdListJson}');
        let root = '${root}';
        
        function showStudents(departmentId) {
            var $table = $('#student-list-body');
            $table.empty();

            $.each(students, function(index, student) {
                if (student.department_idx == departmentId) {
                    let $row = $('<tr>');
                    $row.attr('data-team', student.team ? student.team.toLowerCase() : '미정');
                    $row.attr('data-name', student.student_name.toLowerCase());
                    $row.html('<td>' + student.student_status + '</td>' +
                              '<td><img src="' + root + 'image/' + student.student_photo + '" alt="학생 사진" class="student-photo"></td>' +
                              '<td><a href="' + root + 'student/information?std=' + student.student_idx + '">' + student.student_name + '</a></td>' +
                              '<td>' + student.student_team + '</td>' +
                              '<td>' + student.student_position + '</td>' +
                              '<td>' + student.student_gender + '</td>' +
                              '<td>' + student.student_birth + '</td>' +
                              '<td>' + student.student_email + '</td>' +
                              '<td>' + student.student_phone + '</td>' );
                    $table.append($row);
                }
            });
        }
        
        $('#class-select').change(function() {
            showStudents($(this).val());
        });
    });
</script>
</head>

<body>
	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />

	<div class="container">
		<h2>학생 관리</h2>
		<select id="class-select" required>
			<option value="" disabled selected>반 선택</option>
			<c:forEach var="department" items="${departList}">
				<option value="${department.department_idx}">${department.department_name}</option>
			</c:forEach>
		</select>
		<input type="text" id="filter" class="filter" onkeyup="filterStudents()" placeholder="팀 또는 이름으로 검색...">
		<table class="student-list">
			<thead>
				<tr>
					<th>상태</th>
					<th>사진</th>
					<th>이름</th>
					<th>팀</th>
					<th>직책</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody id="student-list-body">
			</tbody>
		</table>
	</div>

	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>

</html>