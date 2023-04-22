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
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.css"
	rel="stylesheet">
<!-- Template Main JS File -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.4.min.js"></script>

<style>
.loginForm {
	padding-left: 5px;
	padding-right: 5px;
}

.registerForm {
	padding-left: 5px;
	padding-right: 5px;
	padding-bottom: 5px;
}
.inputLabel {
	font-size: xx-small;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/includes/topbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col">
				<!-- 로그인 양식 정리 -->
				<h4 style="font-weight: 800;">로그인</h4>
				<table class="loginForm">
					<tr class="loginForm">
						<th class="loginForm mb-5" style="font-size: xx-small;">회원아이디</th>
						<th class="loginForm" style="font-size: xx-small;">비밀번호</th>
					</tr>
					<tr class="loginForm">
						<td class="loginForm"><input id="userId" type="text"></td>
						<td class="loginForm"><input id="userPw" type="password"></td>
						<td class="loginForm"><button type="button"
								class="btn btn-secondary">로그인</button></td>
					</tr>
				</table>

				<hr>



				<h2>회원가입</h2>
				<form>
					<label for="registerId">회원아이디:</label> <input type="text" id="registerId"
						name="user_id" required><button>중복확인</button><br>
					<label for="registerPw">비밀번호:</label> <input
						type="password" id="registerPw" name="password" required><br>
					<label for="password_confirm">비밀번호 확인:</label> <input
						type="password" id="password_confirm" name="password_confirm"
						required><br>
					<label for="registerName">이름:</label> <input
						type="text" id="registerName" name="name" required><br>
					<label for="registerBirthday">생년월일:</label> <input type="date" id="registerBirthday"
						name="birthday" required><br>
					<label for="registerEmail">이메일:</label>
					<input type="email" id="registerEmail" name="email" required><br>
					<br>
					<button type="submit">회원가입</button>
				</form>


			</div>
		</div>
	</div>
	<script type="text/javascript">
		function register() {
			$.ajax({
				url : "${pageContext.request.contextPath }/userRegister",
				type : "get",
				data : {
					"registerId" : $("#registerId").val(),
					"registerPw" : $("#registerPw").val(),
					"registerName" : $("#registerName").val()
				},
				dataType : "json",
				success : function(response) {
					// 성공적으로 응답을 받았을 때 처리할 내용
				},
			});

		}
	</script>
</body>
</html>
