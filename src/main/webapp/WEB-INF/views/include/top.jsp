<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<head>
<meta charset="UTF-8">
<link href="${root}css/top.css" rel="stylesheet" />
</head>
<script>
	console.log(${loginUserBean.user_login})
</script>
<div class="top-bar">
    <div class="user-links">
        <a href="${root}admin/main">관리자 페이지</a>
        <a href="${root}login">로그인</a>
        <a href="${root}logout">로그아웃</a>
        <a href="${root}mypage">마이페이지</a>
    </div>
</div>

<div class="head">
    <div class="title">학사관리 페이지</div>
</div>

<div class="nav">
    <ul>
        <li><a href="#">학원소개</a>
            <ul>
                <li><a href="${root }info/academy">학원소개</a></li>
                <li><a href="${root }info/instructor">강사소개</a></li>
            </ul>
        </li>
        <li><a href="#">학생관리</a>
            <ul>
                <li><a href="${root }student/register">학생 등록</a></li>
                <li><a href="${root }student/list">학생 목록</a></li>
            </ul>
        </li>
        <li><a href="#">교육관리</a>
            <ul>
                <li><a href="${root }education/plan">수업 계획</a></li>
                <li><a href="${root }education/schedule">수업 일정</a></li>
            </ul>
        </li>
        <li><a href="#">상담관리</a>
            <ul>
                <li><a href="${root }consultation/reservation">상담 예약</a></li>
                <li><a href="${root }consultation/records">상담 기록</a></li>
            </ul>
        </li>
    </ul>
</div>