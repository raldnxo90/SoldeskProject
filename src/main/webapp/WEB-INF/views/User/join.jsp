<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function confirmStudent(){
		let confimEmail = $("#confimEmail").val();
		let check_email = $("#check_email").val();
		let student_idx = $("#student_idx").val();
		console.log(confimEmail);
		console.log(check_email);
		
		if(confimEmail.length == 0){
			
			alert('이메일을 입력하세요!!')
			return
			
		}else{
			
			$.ajax({
				url : '${root}user/confirmStudent?email='+confimEmail,
				type : 'get',
				success : function(result){
					if(result != null){
						console.log(result)
						alert("회원가입 가능한 학생입니다")
						$("#check_email").val(true);
						$("#student_idx").val(result);
						
					}else{
						console.log(result)
						alert("회원가입 불가능한 학생입니다")
					}
					
				}
			});
		}
		
	};

</script>
</head>
<body>
	
	이메일 : <input id="confimEmail" type="text" />
	<button type="button" onclick="confirmStudent()">학생확인</button>
	
	<form:form action="join_pro" modelAttribute="joinUserBean">
		<form:hidden path="student_idx"/>
		<form:hidden path="check_email"/>
		아이디 : <form:input path="student_id"/> <br />
		<form:errors path="student_id" style="color:red;" ></form:errors>
		패스워드 : <form:password path="student_pass"/> <br />
		<button type="submit">회원가입</button>
	</form:form>
</body>
</html>