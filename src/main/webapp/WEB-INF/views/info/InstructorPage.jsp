<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Introduction</title>
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

        .instructor-info-class {
            width: 100%;
            text-align: center;
            color: #007BFF;
        }

        .instructor-info-header {
            width: 100%;
            text-align: left;
            margin-bottom: 20px;
        }

        .instructor-info-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            width: 100%;
        }

        .instructor-photo {
            width: 250px;
            height: 250px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 30px;
        }

        .instructor-info {
            flex: 1;
        }

        .instructor-info h2 {
            margin-top: 0;
            font-size: 32px;
            color: #003366;
            margin-bottom: 20px;
        }

        .instructor-info p {
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
    </style>
</head>

<body>

	<!-- 상단 메뉴바 -->
	<c:import url="/WEB-INF/views/include/top.jsp" />

    <div class="container">
        <div class="instructor-info-header">
            <h1>강사 소개</h1>
        </div>
        
        <div class="instructor-info-container">
            <img src="${root }image/귤.jpg" class="instructor-photo">
            <div class="instructor-info">
                <h2>최규리</h2>
                <p><strong>분야 : </strong> 소프트웨어 개발 </p>
                <p><strong>이메일 : </strong> ####</p>
                <p><strong>연락처 :</strong> ####</p>
                <p><strong>ㅇㅇㅇㅇ</strong> ㅇㅇㅇㅇ</p>
            </div>
        </div>
        <div class="instructor-info-container">
            <img src="${root }image/쮸쀼쮸쀼.jpg" class="instructor-photo">
            <div class="instructor-info">
                <h2>오창석</h2>
                <p><strong>분야 : </strong> 클라우드 </p>
                <p><strong>이메일 : </strong> ####</p>
                <p><strong>연락처 :</strong> ####</p>
                <p><strong>ㅇㅇㅇㅇ</strong> ㅇㅇㅇㅇ</p>
            </div>
        </div>
        
        <div class="instructor-info-container">
            <img src="${root }image/삵.jpeg" class="instructor-photo">
            <div class="instructor-info">
                <h2>정세나</h2>
                <p><strong>분야 : </strong> 소프트웨어 개발 </p>
                <p><strong>이메일 : </strong> ####</p>
                <p><strong>연락처 :</strong> ####</p>
                <p><strong>ㅇㅇㅇㅇ</strong> ㅇㅇㅇㅇ</p>
            </div>
        </div>
         <div class="instructor-info-container">
            <img src="${root }image/나에게하는말.jpg" class="instructor-photo">
            <div class="instructor-info">
                <h2>김우태</h2>
                <p><strong>분야 : </strong> 소프트웨어 개발 </p>
                <p><strong>이메일 : </strong> ####</p>
                <p><strong>연락처 :</strong> ####</p>
                <p><strong>ㅇㅇㅇㅇ</strong> ㅇㅇㅇㅇ</p>
            </div>
        </div>
        
    </div>


</body>

</html>