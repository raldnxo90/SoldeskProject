<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css'
	rel='stylesheet' />
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

.head {
	width: 100%;
	height: 100px;
	text-align: center;
	background-color: #003366;
	color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 24px;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
}

.nav {
	width: 100%;
	background-color: white;
	display: flex;
	align-items: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	position: fixed;
	top: 100px;
	left: 0;
	z-index: 1000;
}

.nav>ul {
	display: flex;
	padding: 0;
	margin: 0;
	list-style: none;
	width: 100%;
	justify-content: center;
}

.nav>ul li {
	position: relative;
}

.nav>ul li>a {
	display: block;
	padding: 15px 30px;
	text-decoration: none;
	color: #003366;
	font-weight: bold;
}

.nav>ul li>a:hover {
	background-color: #003366;
	color: white;
}

.nav>ul li ul {
	display: none;
	position: absolute;
	top: 50px;
	left: 0;
	background-color: white;
	padding: 0;
	margin: 0;
	list-style: none;
	border: 1px solid #ddd;
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 1000;
}

.nav>ul li:hover ul {
	display: block;
}

.nav>ul li ul li {
	width: 200px;
}

.nav>ul li ul li a {
	display: block;
	padding: 10px;
	text-decoration: none;
	color: #003366;
	font-weight: normal;
}

.nav>ul li ul li a:hover {
	background-color: #ddd;
}

.main {
	width: 100%;
	min-height: 1200px;
	background-color: #f0f0f0;
	padding: 20px;
	box-sizing: border-box;
	display: flex;
	padding-top: 170px;
}

.content {
	display: flex;
	width: 100%;
}

.board {
	width: 70%;
	background-color: white;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	margin-right: 20px;
}

.calendar {
	width: 30%;
	background-color: white;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

#calendar {
	max-width: 100%;
	height: 400px;
	font-size: 12px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #003366;
	color: white;
}

td:nth-child(2) {
	text-align: left;
}

h2 {
	margin-top: 0;
	font-size: 20px;
}

.footer {
	width: 100%;
	height: 100px;
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

.events-list {
	margin-top: 20px;
	background-color: white;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.events-list ul {
	list-style: none;
	padding: 0;
}

.events-list li {
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #f9f9f9;
}

.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination a.active {
	background-color: #003366;
	color: white;
	border: 1px solid #003366;
}

.pagination a {
	color: #003366;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
	margin: 0 4px;
}
</style>
</head>
<body>
	<div class="head">학사관리 페이지</div>

	<div class="nav">
		<ul>
			<li><a href="#">학생관리</a>
				<ul>
					<li><a href="student/register">학생 등록</a></li>
					<li><a href="student/list">학생 목록</a></li>
				</ul></li>
			<li><a href="#">교육관리</a>
				<ul>
					<li><a href="#">수업 계획</a></li>
					<li><a href="#">수업 일정</a></li>
				</ul></li>
			<li><a href="#">상담관리</a>
				<ul>
					<li><a href="#">상담 예약</a></li>
					<li><a href="#">상담 기록</a></li>
				</ul></li>
		</ul>
	</div>

	<div class="main">
		<div class="content">
			<div class="board">
				<h2>공지사항</h2>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>연구수업에 대한 공지사항</td>
						<td>위대한</td>
					</tr>
					<tr>
						<td>2</td>
						<td>두 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>3</td>
						<td>세 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>4</td>
						<td>네 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>5</td>
						<td>다섯 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>6</td>
						<td>여섯 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>7</td>
						<td>일곱 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>8</td>
						<td>여덟 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>9</td>
						<td>아홉 번째 게시물</td>
						<td>관리자</td>
					</tr>
					<tr>
						<td>10</td>
						<td>열 번째 게시물</td>
						<td>관리자</td>
					</tr>
				</table>
				<div class="pagination">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
					<a href="#">5</a>
				</div>
			</div>
			<div class="calendar">
				<h2>일정관리</h2>
				<div id='calendar'></div>
				<div class="events-list" id="events-list">
					<h3>이달의 일정</h3>
					<ul id="event-list"></ul>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>


	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							let calendarEl = document
									.getElementById('calendar');
							let eventListEl = document
									.getElementById('event-list');
							let events = [ {
								title : '1차 프로젝트',
								start : '2024-05-31'
							}, {
								title : '고난의 행군',
								start : '2024-06-10',
								end : '2024-06-15'
							} ];

							let calendar = new FullCalendar.Calendar(
									calendarEl, {
										initialView : 'dayGridMonth',
										locale : 'ko',
										height : 'auto',
										contentHeight : 300,
										aspectRatio : 1.5,
										events : events,
										datesSet : function() {
											displayEvents();
										}
									});

							calendar.render();

							function displayEvents() {
								let currentMonth = calendar.getDate()
										.getMonth();
								let currentYear = calendar.getDate()
										.getFullYear();
								eventListEl.innerHTML = '';

								events
										.forEach(function(event) {
											let eventStart = new Date(
													event.start);
											let eventEnd = event.end ? new Date(
													event.end)
													: eventStart;

											if (eventStart.getMonth() === currentMonth
													&& eventStart.getFullYear() === currentYear) {
												let li = document
														.createElement('li');
												li.textContent = event.title
														+ ' - '
														+ formatKoreanDate(
																eventStart,
																eventEnd);
												eventListEl.appendChild(li);
											}
										});
							}

							function formatKoreanDate(start, end) {
								function formatDate(date) {
									let year = date.getFullYear() + '년 ';
									let month = (date.getMonth() + 1) + '월 ';
									let day = date.getDate() + '일';
									return year + month + day;
								}

								if (start.getTime() === end.getTime()) {
									return formatDate(start);
								} else {
									return formatDate(start) + ' ~ '
											+ formatDate(end);
								}
							}
						});
	</script>
</body>

</html>
