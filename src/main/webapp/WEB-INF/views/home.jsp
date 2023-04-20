<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Home</title>
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/css/style.css"
	rel="stylesheet">
<!-- Template Main JS File -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.4.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<div style="border: 1px black solid;" >
					<h2 style="text-align: center;">안녕하세요 이용을 위해 우선 로그인해주세요!</h2>							
				</div>
				<p>회원아이디</p>
				<input id="userId" type="text">
				<p>비밀번호</p>
				<input id="userPw" type="text">
				<button>로그인</button>
				<hr>
				<p>회원아이디</p>
				<input id="registerId" type="text">
				<p>비밀번호</p>
				<input id="registerPw" type="text">
				<p>이름</p>
				<input id="registerName" type="text">
				<button onclick="register()">회원가입</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function register(){
			
			$.ajax({
			    url: "${pageContext.request.contextPath }/userRegister",
			    type: "get",
			    data: {
			        "registerId" : $("#registerId").val(),
			        "registerPw" : $("#registerPw").val(),
			        "registerName" : $("#registerName").val()
			    },
			    dataType: "json",
			    success: function(response) {
			        // 성공적으로 응답을 받았을 때 처리할 내용
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        // 오류 발생시 처리할 내용
			    }
			});

		}
	</script>
</body>
</html>
