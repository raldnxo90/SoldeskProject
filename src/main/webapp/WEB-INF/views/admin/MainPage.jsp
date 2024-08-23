<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="${root}css/admin.css" rel="stylesheet" />
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
</head>
<body>

    <!-- 상단 메뉴바 -->
    <c:import url="/WEB-INF/views/include/top.jsp" />

    <div class="main">
        <div class="sidebar">
            <ul>
                <li class="dropdown">
                    <input type="checkbox" id="student-menu" class="menu-toggle">
                    <label for="student-menu" class="dropbtn">학생 관리</label>
                    <div class="dropdown-content">
                        <a href="${root}admin/student/register">학생 추가</a>
                        <a href="${root}admin/users/edit">학생 수정</a>
                        <a href="${root}admin/users/delete">학생 삭제</a>
                    </div>
                </li>
                <li class="dropdown">
                    <input type="checkbox" id="course-menu" class="menu-toggle">
                    <label for="course-menu" class="dropbtn">과정 관리</label>
                    <div class="dropdown-content">
                        <a href="${root}admin/department/register">과정 추가</a>
                        <a href="${root}admin/courses/edit">과정 수정</a>
                        <a href="${root}admin/courses/delete">과정 삭제</a>
                    </div>
                </li>
                <li class="dropdown">
                    <input type="checkbox" id="board-menu" class="menu-toggle">
                    <label for="board-menu" class="dropbtn">게시판 관리</label>
                    <div class="dropdown-content">
                        <a href="${root}admin/boards/edit">게시판 수정</a>
                        <a href="${root}admin/boards/delete">게시판 삭제</a>
                    </div>
                </li>
                <li class="dropdown">
                    <input type="checkbox" id="calendar-menu" class="menu-toggle">
                    <label for="calendar-menu" class="dropbtn">일정 관리</label>
                    <div class="dropdown-content">
                        <a href="${root}admin/calendar/add">일정 추가</a>
                        <a href="${root}admin/calendar/edit">일정 수정</a>
                        <a href="${root}admin/calendar/delete">일정 삭제</a>
                    </div>
                </li>
                <li><a href="${root}admin/settings">설정</a></li>
            </ul>
        </div>
        
        <div class="content">
            <div class="dashboard">
                <h2>대시보드</h2>
                <div class="stats">
                    <div class="stat">
                        <h3>회원 수</h3>
                        <p>100</p>
                    </div>
                    <div class="stat">
                        <h3>게시물 수</h3>
                        <p>50</p>
                    </div>
                    <div class="stat">
                        <h3>오늘의 방문자 수</h3>
                        <p>30</p>
                    </div>
                </div>
            </div>

            <div class="board-management">
                <h2>게시판 관리</h2>
                <table>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>관리</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>첫 번째 게시물</td>
                        <td>관리자</td>
                        <td><button>수정</button> <button>삭제</button></td>
                    </tr>
                    <!-- 추가 게시물 데이터 -->
                </table>
            </div>
            
            <div class="calendar">
                <h2>일정 관리</h2>
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
        $(document).ready(function() {
            let calendarEl = $('#calendar');
            let eventListEl = $('#event-list');
            let events = [{
                title : '1차 프로젝트',
                start : '2024-05-31'
            }, {
                title : '고난의 행군',
                start : '2024-06-10',
                end : '2024-06-15'
            }];

            let calendar = new FullCalendar.Calendar(calendarEl[0], {
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
                let currentMonth = calendar.getDate().getMonth();
                let currentYear = calendar.getDate().getFullYear();
                eventListEl.empty();

                $.each(events, function(index, event) {
                    let eventStart = new Date(event.start);
                    let eventEnd = event.end ? new Date(event.end) : eventStart;

                    if (eventStart.getMonth() === currentMonth && eventStart.getFullYear() === currentYear) {
                        let li = $('<li>').text(event.title + ' - ' + formatKoreanDate(eventStart, eventEnd));
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
                    return formatDate(start) + ' ~ ' + formatDate(end);
                }
            }
        });
    </script>
</body>
</html>
