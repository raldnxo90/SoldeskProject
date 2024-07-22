<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록 페이지</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	height: 100vh;
	background-color: #f0f0f0;
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

.container {
	width: 400px;
	padding: 20px;
	background-color: white;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	text-align: center;
	margin: auto;
	margin-top: 200px;
}

.container h2 {
	margin-top: 0;
	font-size: 24px;
	color: #003366;
}

.container form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

.container input[type="text"], .container input[type="email"],
	.container input[type="date"], .container input[type="file"],
	.container select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

.container input[type="submit"] {
	background-color: #003366;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.container input[type="submit"]:hover {
	background-color: #002244;
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

.links {
	margin-top: 20px;
}

.links a {
	color: #003366;
	text-decoration: none;
	font-size: 14px;
}

.links a:hover {
	text-decoration: underline;
}

label {
	text-align: left;
	width: 100%;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="head">학사관리 페이지</div>

	<div class="nav">
		<ul>
			<li><a href="#">학생관리</a>
				<ul>
					<li><a href="#">학생 등록</a></li>
					<li><a href="#">학생 목록</a></li>
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


	<div class="container">
		<h2>학생 등록</h2>
		<form enctype="multipart/form-data">

			<label for="name">이름</label> <input type="text" id="name"
				placeholder="이름 등록" required> <label for="gender">성별</label>
			<select id="gender" required>
				<option value="" disabled selected>성별 선택</option>
				<option value="남성">남성</option>
				<option value="여성">여성</option>
			</select> <label for="birthdate">생년월일</label> <input type="date"
				id="birthdate" placeholder="생년월일" required> <label
				for="email">이메일</label> <input type="email" id="email"
				placeholder="이메일" required> <label for="phone">전화번호</label>
			<input type="text" id="phone" placeholder="전화번호" required> <label
				for="class">강의 선택</label> <select id="class" required>
				<option value="" disabled selected>강의 선택</option>
				<option value="class1">그래픽 기반 실시간 AI서비스를 활용한 cross-platform
					개발자 양성과정 12회차 801호 김우태(김진우)</option>
				<option value="class2">그래픽 기반 실시간 AI서비스를 활용한 cross-platform
					개발자 양성과정 13회차 903호 정세나(고은비)</option>
			</select> <label for="photo">사진 등록</label> <input type="file" id="photo"
				accept="image/*" required> <input type="submit" value="등록">
		</form>
	</div>

	<div class="footer">&copy; 솔데스크 학사 관리 시스템</div>
</body>
</html>