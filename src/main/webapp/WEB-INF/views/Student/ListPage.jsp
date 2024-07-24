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
<script>
		let students = {
			"class1": [
				{"status": "수료중", "name": "구유진", "gender": "여성", "birthdate": "1989-01-01", "email": "ku@soldesk.com", "phone": "010-1234-5678", "photo": "감자 (1).png", "team": "마루", "position": "팀장"},
				{"status": "수료중", "name": "문태일", "gender": "남성", "birthdate": "1994-01-01", "email": "moon@soldesk.com", "phone": "010-1234-5678", "photo": "감자 (2).png", "team": "달다구리", "position": "팀장"},
				{"status": "수료중", "name": "윤동민", "gender": "남성", "birthdate": "1998-02-02", "email": "yun@soldesk.com", "phone": "010-2345-6789", "photo": "감자 (3).png", "team": "GPTeam", "position": "팀장"},
				{"status": "수료중", "name": "김현성", "gender": "남성", "birthdate": "1998-01-01", "email": "hyen@soldesk.com", "phone": "010-1234-5678", "photo": "감자 (4).png", "team": "달다구리", "position": "부팀장"},
				{"status": "수료중", "name": "김희진", "gender": "여성", "birthdate": "1996-01-01", "email": "hee@soldesk.com", "phone": "010-1234-5678", "photo": "감자 (5).png", "team": "달다구리", "position": "팀원"},
				{"status": "중도포기", "name": "이희선", "gender": "여성", "birthdate": "1993-01-01", "email": "hee@soldesk.com", "phone": "010-1234-5678", "photo": "감자 (9).png", "team": "달다구리", "position": "팀원"}
			],
			"class2": [
				{"status": "조기취업", "name": "홍길동", "gender": "남성", "birthdate": "1985-03-03", "email": "hong@soldesk.com", "phone": "010-3456-7890", "photo": "감자 (6).png", "team": "마흔아재", "position": "팀장"},
				{"status": "수료중", "name": "전우치", "gender": "남성", "birthdate": "1993-04-04", "email": "jun@soldesk.com", "phone": "010-4567-8901", "photo": "감자 (7).png", "team": "마흔아재", "position": "팀원"}
			]
		};

		function showStudents(classId) {
			var table = document.getElementById('student-list-body');
			table.innerHTML = '';

			if (students[classId]) {
				students[classId].forEach(function (student) {
					var row = document.createElement('tr');
					row.setAttribute('data-name', student.name.toLowerCase());
					row.setAttribute('data-team', student.team.toLowerCase());
					row.innerHTML = '<td>' + student.status + '</td><td>' + '<img src="' + student.photo + '" alt="학생 사진" class="student-photo"></td><td>' + student.name + '</td><td>' + student.team + '</td><td>' + student.position + '</td><td>' + student.gender + '</td><td>' + student.birthdate + '</td><td>' + student.email + '</td><td>' + student.phone + '</td><td><button class="edit-button">수정</button></td>';
					table.appendChild(row);
				});
			}
		}

		function sortTable(columnIndex) {
			let table = document.getElementById('student-list-body');
			let rows = Array.from(table.rows);
			let sortedRows;

			if (table.getAttribute('data-sorted-column') == columnIndex) {
				sortedRows = rows.reverse();
			} else {
				sortedRows = rows.sort((a, b) => {
					let aText = a.cells[columnIndex].innerText.toLowerCase();
					let bText = b.cells[columnIndex].innerText.toLowerCase();

					return aText > bText ? 1 : aText < bText ? -1 : 0;
				});
			}

			table.innerHTML = '';
			sortedRows.forEach(row => table.appendChild(row));
			table.setAttribute('data-sorted-column', columnIndex);
		}

		function filterStudents() {
			var filter = document.getElementById('filter').value.toLowerCase();
			var table = document.getElementById('student-list-body');
			var rows = table.getElementsByTagName('tr');

			for (var i = 0; i < rows.length; i++) {
				var name = rows[i].getAttribute('data-name');
				var team = rows[i].getAttribute('data-team');
				if (name.includes(filter) || team.includes(filter)) {
					rows[i].style.display = '';
				} else {
					rows[i].style.display = 'none';
				}
			}
		}
	</script>
</head>

<body>
	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />

	<div class="container">
		<h2>학생 관리</h2>
		<select id="class-select" onchange="showStudents(this.value)" required>
			<option value="" disabled selected>반 선택</option>
			<option value="class1">그래픽 기반 실시간 AI서비스를 활용한 cross-platform
				개발자 양성과정 12회차 801호 김우태(김진우)</option>
			<option value="class2">그래픽 기반 실시간 AI서비스를 활용한 cross-platform
				개발자 양성과정 13회차 903호 정세나(고은비)</option>
		</select> <input type="text" id="filter" class="filter"
			onkeyup="filterStudents()" placeholder="팀 또는 이름으로 검색...">
		<table class="student-list">
			<thead>
				<tr>
					<th onclick="sortTable(0)">상태</th>
					<th onclick="sortTable(1)">사진</th>
					<th onclick="sortTable(2)">이름</th>
					<th onclick="sortTable(3)">팀</th>
					<th onclick="sortTable(4)">직책</th>
					<th onclick="sortTable(5)">성별</th>
					<th onclick="sortTable(6)">생년월일</th>
					<th onclick="sortTable(7)">이메일</th>
					<th onclick="sortTable(8)">전화번호</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody id="student-list-body">
			</tbody>
		</table>
	</div>

	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>

</html>