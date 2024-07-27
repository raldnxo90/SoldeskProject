<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>학생 상세 페이지</title>
<link href="${root }css/student.css" rel="stylesheet">
<style>
	.container {
		width: 90%;
		max-width: 1200px;
		padding: 20px;
		background-color: white;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		border-radius: 5px;
		margin: auto;
		margin-top: 200px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.student-info-class {
		width: 100%;
		text-align: center;
		color: #007BFF;
	}
	
	.student-info-header {
		width: 100%;
		text-align: left;
		margin-bottom: 20px;
	}
	
	.student-info-container {
		display: flex;
		align-items: center;
		margin-bottom: 20px;
		width: 100%;
	}
	
	.student-photo {
		width: 280px;
		height: 280px;
		object-fit: cover;
		border-radius: 50%;
		margin-right: 30px;
	}
	
	.student-info {
		flex: 1;
	}
	
	.student-info h2 {
		margin-top: 0;
		font-size: 32px;
		color: #003366;
		margin-bottom: 20px;
	}
	
	.student-info p {
		margin: 10px 0;
		font-size: 20px;
	}
	
	.footer {
		width: 100%;
		height: 50px;
		background-color: #003366;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 18px;
		position: fixed;
		bottom: 0;
		left: 0;
	}
	
	.consultation-container {
		margin-top: 20px;
		width: 100%;
	}
	
	.consultation-form {
		width: 100%;
		max-width: 800px;
		margin: 20px auto;
		padding: 20px;
		background-color: #f0f0f0;
		border-radius: 5px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.consultation-form textarea {
		width: 100%;
		padding: 15px;
		border: 1px solid #ddd;
		border-radius: 5px;
		box-sizing: border-box;
		margin-bottom: 20px;
		font-size: 16px;
	}
	
	.consultation-form button {
		padding: 12px 24px;
		background-color: #007BFF;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
	}
	
	.consultation-form button:hover {
		background-color: #0056b3;
	}
	
	.consultation-list {
		width: 100%;
		border-collapse: collapse;
		margin-top: 20px;
		background-color: #fff;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.consultation-list th,
	.consultation-list td {
		border: 1px solid #ddd;
		padding: 12px;
		font-size: 16px;
		word-break: break-word;
	}
	
	.consultation-list th {
		background-color: #003366;
		color: white;
	}
	
	.consultation-list th:first-child,
	.consultation-list td:first-child {
		width: 100px;
		text-align: center;
	}
	
	.consultation-list th:nth-child(2),
	.consultation-list td:nth-child(2) {
		width: 120px;
		text-align: center;
	}
	
	.buttons {
		margin-top: 20px;
		width: 100%;
		display: flex;
		justify-content: center;
		gap: 10px;
	}
	
	.buttons a {
		padding: 12px 24px;
		background-color: #007BFF;
		color: white;
		text-decoration: none;
		border-radius: 5px;
		font-size: 16px;
		text-align: center;
		flex: 1;
		max-width: 200px;
	}
	
	.buttons a:hover {
		background-color: #0056b3;
	}
	
	.student-info-container {
    display: flex;
    align-items: flex-start;
    gap: 20px; /* 사진과 정보 사이의 간격을 조절 */
}


.student-info {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.student-info p {
    margin: 5px 0; /* 각 정보 항목 사이의 간격을 조절 */
}
</style>
</head>

<body>
	<div class="head">
		학생 상세 페이지
	</div>

	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />


	<div class="container">
		<div class="student-info-class">
			<h2>${departmentName }</h2>
		</div>

		<div class="student-info-header">
			<h2>${std.student_name } 학생 상세 정보</h2>
		</div>
   	 	<div class="student-info-container">
        	<img src="${root}image/${std.student_photo}" alt="학생 사진" class="student-photo">
	        <div class="student-info">
	            <p><strong>상태:</strong> ${std.student_status}</p>
	            <p><strong>성별:</strong> ${std.student_gender}</p>
	            <p><strong>생년월일:</strong> ${std.student_birth}</p>
	            <p><strong>이메일:</strong> ${std.student_email}</p>
	            <p><strong>전화번호:</strong> ${std.student_phone}</p>
	            <p><strong>팀:</strong> ${std.student_team}</p>
	            <p><strong>직책:</strong> ${std.student_position}</p>
	        </div>
		</div>
		<div class="consultation-container">
			<h3>문태일 상담 내용</h3>
			<table class="consultation-list">
				<thead>
					<tr>
						<th>담당자</th>
						<th>상담 일자</th>
						<th>상담 내용</th>
						<th>해결책</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>김우태</td>
						<td>2024-05-30</td>
						<td>팀장의 지나친 프로젝트 분량 욕심에 대한 피로감, 팀장이 본인을 노골적으로 무시하는 것에 대한 좌절감</td>
						<td>
							팀장에 대한 경고 및 팀장 교체, 그리고 재발 시 (전)팀장을 팀에서 추방하여 개인프로젝트로 전환할 것을 약속함
						</td>
					</tr>
					<tr>
						<td>김진우</td>
						<td>2024-05-31</td>
						<td>팀장의 지나친 프로젝트 분량 욕심에 대한 피로감, 팀장이 본인을 노골적으로 무시하는 것에 대한 좌절감</td>
						<td>
							팀장에 대한 경고 및 팀장 교체, 그리고 재발 시 (전)팀장을 팀에서 추방하여 개인프로젝트로 전환할 것을 약속함
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="buttons">
			<a href="#">상담 등록</a>
			<a href="${root }student/modify?std=${std.student_idx}">학생 수정</a>
			<a href="#">학생 목록</a>
		</div>
	</div>

	<div class="footer">
		&copy; 솔데스크 학사 관리 시스템
	</div>
</body>

</html>