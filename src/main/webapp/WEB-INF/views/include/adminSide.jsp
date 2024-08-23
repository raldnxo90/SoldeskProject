<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/" />

<link rel="stylesheet" href="${root }css/adminSide.css" />
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