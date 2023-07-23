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
	<form id="search_form" method="post">
		<main
			style="display: flex; justify-content: center; line-height: 35px;">
			<div class="mb-3"
				style="width: 400px; padding: 20px; background-color: gray; color: white;">
				<h4 align="center">
					<b>아이디 찾기</b>
				</h4>
				<!-- 이름 -->
				<i class="bi bi-person"></i> <input type="text" class="form-control"
					id="name_input1" name="name" placeholder="Name">
				<div id="nameError" style="color: red;"></div>


				<!-- 이메일 -->
				<i class="bi bi-lock"></i> <input type="text" class="form-control"
					id="mail_input1" name="mail" placeholder="E-Mail">
				<div id="mailError1" style="color: red;"></div>
				<div id="mailError2" style="color: red;"></div>
				<div id="errorMessage"></div>
				<div id="successMessage"></div>
				<br>
				<div align="center">
					<input type="button" id="id_search" class="btn btn-light"
						style="padding-left: 65px; padding-right: 65px;" value="찾기">
				</div>
			</div>
		</main>
<!-- 
		<main
			style="display: flex; justify-content: center; line-height: 35px;">
			<div class="mb-3"
				style="width: 400px; padding: 20px; background-color: gray; color: white;">
				<h4 align="center">
					<b>비밀번호 찾기</b>
				</h4>
				<i class="bi bi-person"></i>
				<!-- 이름 
				<input type="text" class="form-control" id="name_input2" name="name"
					placeholder="Name"><i class="bi bi-lock"></i>
				<!-- 아이디 
				<input type="text" class="form-control" id="id_input" name="id"
					placeholder="ID"><i class="bi bi-lock"></i>
				<!-- 이메일 
				<input type="text" class="form-control" id="mail_input2" name="mail"
					placeholder="E-Mail"><br>

				<div align="center">
					<input type="button" id="pw_search" class="btn btn-light"
						style="padding-left: 65px; padding-right: 65px;" value="찾기">
				</div>
			</div>
		</main> -->
	</form>
	<script>
	

	    $(document).ready(function() {
	        var errorMessage = "<c:out value='${errorMessage}'/>";
	        var successMessage = "<c:out value='${successMessage}'/>";

	        if (errorMessage) {
	            $('#errorMessage').text(errorMessage);
	        }
	        if (successMessage) {
	            $('#successMessage').text(successMessage);
	        }

	        $('#id_search').on('click', function(e) {
	            var name = $('#name_input1').val();
	            var mail = $('#mail_input1').val();

	            // 이메일 검증을 위한 정규식
	            var emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;

	            // 먼저 모든 에러 메시지를 비웁니다.
	            $('#nameError').text('');
	            $('#mailError1').text('');
	            $('#mailError2').text('');

	            if (!name) {
	                $('#nameError').text('이름을 입력해주세요.');
	                return;  // form 제출을 취소합니다.
	            } else if (!mail) {
	                $('#mailError1').text('이메일을 입력해주세요.');
	                return;  // form 제출을 취소합니다.
	            } else if (!emailRegex.test(mail)) { // 이메일 형식 검증
	                $('#mailError2').text('이메일 형식이 아닙니다.');
	                return;  // form 제출을 취소합니다.
	            }
	           
	            $('#search_form').attr('action', '/member/idSearch');
	            $('#search_form').submit(); 
	        });
	    });


	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>