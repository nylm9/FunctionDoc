<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Home</title>
<script
	src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.4.min.js"></script>
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.css"
	rel="stylesheet">
<!-- Template Main JS File -->
<script
	src="${pageContext.request.contextPath }/resources/assets/js/bootstrap.js"></script>


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

<script type="text/javascript">
	var Msg = '${Msg}';
	if (Msg.length > 0) {
		alert(Msg);
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/includes/topbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col">
				<!-- 로그인 양식 정리 -->
				<h4 style="font-weight: 800;">로그인</h4>
				<form action="${pageContext.request.contextPath }/userLogin" method="post">
					<table class="loginForm">
						<tr class="loginForm">
							<th class="loginForm mb-5" style="font-size: xx-small;">회원아이디</th>
							<th class="loginForm" style="font-size: xx-small;">비밀번호</th>
						</tr>
						<tr class="loginForm">
							<td class="loginForm"><input id="userId" name="userId" type="text"></td>
							<td class="loginForm"><input id="userPw" name="userPw" type="password"></td>
							<td class="loginForm"><button type="submit"
									class="btn btn-secondary">로그인</button></td>
						</tr>
					</table>
				</form>
				<hr>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>
