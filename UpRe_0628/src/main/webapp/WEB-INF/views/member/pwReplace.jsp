<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<form id="replace_form" method="post">

		<main
			style="display: flex; justify-content: center; line-height: 35px;">
			<div class="mb-3"
				style="width: 400px; padding: 20px; background-color: gray; color: white;">
				<h4 align="center">
					<b>비밀번호 재설정</b>
				</h4>
				<!-- 아이디 -->
				<i class="bi bi-lock"></i>
				<input type="text" class="form-control" id="id_input" name="id"
					value="${id }" readonly>
				<!-- 비밀번호 -->
			   <i class="bi bi-lock"></i>
				<input type="password" class="form-control" id="pw_input" name="pw"
					placeholder="Password"><div id="pwError" style="color: red;"></div><br>
					
				<!-- 비밀번호 확인 -->
				
				<input type="password" class="form-control" id="pwck_input"
					placeholder="Password-Check">
					<div id="pwckError" style="color: red;"></div>
				<br>
				<div align="center">
					<input type="button" id="pw_replace" class="btn btn-light"
						style="padding-left: 65px; padding-right: 65px;" value="확인">
				</div>
			</div>
		</main> 
	</form>
	<script>
	

	
	$(document).ready(function() {
		  var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/; // 비밀번호 조건 정규식

		  $('#pw_replace').on('click', function(e) {
		    var pw = $('#pw_input').val();
		    var pwck = $('#pwck_input').val();

		    // 먼저 모든 에러 메시지를 비웁니다.
		    $('#pwError').text('');
		    $('#pwckError').text('');

		    if (!pw) {
		      $('#pwError').text('비밀번호를 입력해주세요.');
		      return; // form 제출을 취소합니다.
		    } else if (!regex.test(pw)) {
		      $('#pwError').text('비밀번호는 영문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.');
		      return; // form 제출을 취소합니다.
		    } else if (!pwck) {
		      $('#pwckError').text('비밀번호를 재입력해주세요');
		      return; // form 제출을 취소합니다.
		    } else if (pw != pwck) {
		      $('#pwckError').text('입력하신 비밀번호가 일치하지 않습니다.');
		      return; // form 제출을 취소합니다.
		    }

		    alert("비밀번호를 재설정합니다. 다시 로그인해주세요.");
		    $('#replace_form').attr('action', '/member/pwReplace');
		    $('#replace_form').submit();
		  });
		});

	



	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>