<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link href="${root}css/main.css" rel="stylesheet" />
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
</head>
<body>

	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />

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
				<div class="events-list" id="event-list-wrapper">
					<h3>이달의 일정</h3>
					<ul id="event-list"></ul>
				</div>
			</div>
		</div>
	</div>
	

	
	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
	<script>
		$(document)
				.ready(
						function() {
							let calendarEl = $('#calendar');
							let eventListEl = $('#event-list');
							let events = [ {
								title : '1차 프로젝트',
								start : '2024-05-31'
							}, {
								title : '고난의 행군',
								start : '2024-06-10',
								end : '2024-06-15'
							} ];

							let calendar = new FullCalendar.Calendar(
									calendarEl[0], {
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
								eventListEl.empty();

								$
										.each(
												events,
												function(index, event) {
													let eventStart = new Date(
															event.start);
													let eventEnd = event.end ? new Date(
															event.end)
															: eventStart;

													if (eventStart.getMonth() === currentMonth
															&& eventStart
																	.getFullYear() === currentYear) {
														let li = $('<li>')
																.text(
																		event.title
																				+ ' - '
																				+ formatKoreanDate(
																						eventStart,
																						eventEnd));
														eventListEl.append(li);
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
