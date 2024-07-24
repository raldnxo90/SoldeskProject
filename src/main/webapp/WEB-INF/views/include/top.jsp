<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }/" />

<div class="head">학사관리 페이지</div>

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
				<li><a href="#">수업 계획</a></li>
				<li><a href="#">수업 일정</a></li>
			</ul>
		</li>
		<li><a href="#">상담관리</a>
			<ul>
				<li><a href="#">상담 예약</a></li>
				<li><a href="#">상담 기록</a></li>
			</ul>
		</li>
	</ul>
</div>