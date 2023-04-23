<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>userRegisterPage</title>
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
</head>
<body>
	<%@ include file="/WEB-INF/views/includes/topbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col">
				
				<h2>회원가입</h2>
				<form onsubmit="return userRegister()" action="${pageContext.request.contextPath }/userRegister" method="post">
					<label for="registerId">회원아이디:</label> <input type="text" id="registerId"
						name="userId" required><button type="button" onclick="registerId_Check()">중복확인</button><br>
					<label for="registerPw">비밀번호:</label> <input
						type="password" id="registerPw" name="userPw" required><br>
					<label for="password_confirm">비밀번호 확인:</label> <input
						type="password" id="registerPw_Confirm" name="registerPw_Confirm" oninput="registerPw_Confirm_Check()"
						required>
						<br>
						<p style="font-size: x-small;" id="registerPw_Confirm_Viewer">비밀번호 일치 확인</p>
						
					<label for="registerName">이름:</label> <input
						type="text" id="registerName" name="userName" required><br>
					<label for="registerBirthday">생년월일:</label> <input type="date" id="registerBirthday"
						name="userBirth" required><br>
					<label for="registerEmail">이메일:</label>
					<input type="email" id="registerEmail" name="userEmail" required><button type="button" id="email_confirm_btn" onclick="return registerEmail_confirm()">이메일 확인</button><br>
					<label for="email_confirm">이메일 인증번호:</label>
					<input type="password" id="email_confirm" onblur="email_confirm_check()" disabled="disabled" maxlength="6" placeholder="인증번호 6자리를 입력해주세요" >
					<br>
					<button type="submit" onsubmit="return userRegister()">회원가입</button>
				</form>


			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
	//로그인 기능 체크
	var registerId_Check_val = 0;
	var registerPw_Confirm_val = 0;
	var registerEmail_Confirm_val = 0;
	
	
		
		// 회원 아이디 중복 체크 
		function registerId_Check(){
			console.log('func-registerId-Check');
			$.ajax({
				url : "${pageContext.request.contextPath }/registerIdCheck",
				type : "get",
				data : {
					"registerId" : $("#registerId").val()
				},
				dataType : "json",
				success : function(Msg) {
					console.log("ajax-done");
					console.log(Msg.idCheckMsg);
					if(Msg.idCheckMsg === "available"){
						registerId_Check_val = 1;
						alert("사용가능한 아이디입니다.");
					} else {
						registerId_Check_val = 0;
						alert("해당 아이디는 이미 사용중입니다.");
					}
				},
			});
		};
		// 비밀번호 확인
		function registerPw_Confirm_Check(){
			console.log('func-registerPw_Confirm');
			if($("#registerPw").val() === $("#registerPw_Confirm").val()){
				console.log('같습니다.');
				$("#registerPw_Confirm_Viewer").html("사용가능합니다.");
				registerPw_Confirm_val = 1;
			} else {
				console.log('다릅니다.');
				$("#registerPw_Confirm_Viewer").html("일치하지 않습니다.");
				registerPw_Confirm_val = 0;
			}
		};
		
		//  리턴 회원가입 
		function userRegister() {
			console.log(registerId_Check_val+","+registerPw_Confirm_val)
			if(registerId_Check_val == 0){
				alert('아이디 중복확인을 해주세요.');
				return false;
			} else if (registerPw_Confirm_val == 0){
				alert('비밀번호가 서로 일치하지 않습니다.');
				return false;
			} else if (registerEmail_Confirm_val == 0){
				alert('이메일을 확인해주세요');
				return false;
			}
			$('#registerEmail').attr('disabled',false);
			return true;
		}
	</script>
	
	<!-- 이메일 인증 기능 소스 -->
	<script type="text/javascript">
		// 이메일 인증번호
		var emailCode = "";
		
		// 회원 이메일 인증
		function registerEmail_confirm(){
			if(registerEmail_Confirm_val == 1){
				alert('이미 확인된 이메일입니다.');
				return false;
			}
			const email = $('#registerEmail').val();
			console.log(email);
			const checkInput = $('#email_confirm');
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath }/registerEmailConfirm?email='+email+'',
				success : function (data) {
					console.log("data : " +  data);
					if(data === "unavailable"){
						alert('이미 존재하는 이메일 입니다.');
					} else {
						checkInput.attr('disabled',false);
						emailCode = data;
						alert('인증번호가 전송되었습니다.');
					}
				}			
			});
		}
		
		function email_confirm_check(){
			if($('#email_confirm').val() === emailCode){
				alert('이메일 번호가 일치합니다.');
				registerEmail_Confirm_val = 1;
				$('#email_confirm').attr('disabled',true);
				$('#registerEmail').attr('disabled',true);
				$('#email_confirm_btn').off('click');
			} else {
				alert('이메일 번호가 일치하지 않습니다.');
				registerEmail_Confirm_val = 0;
			}
		}
	</script>

</body>
</html>
