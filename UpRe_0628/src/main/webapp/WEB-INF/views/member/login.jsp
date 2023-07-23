<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%@ include file="../header.jsp"%>
<br>
	<form id="login_form" method="post">
		<main
			style="display: flex; justify-content: center; line-height: 35px;">
			<div class="mb-3"
				style="width: 400px; padding: 20px; background-color: gray; color: white;">
				<h4 align="center">
					<b>Log-in</b>
				</h4>
				<i class="bi bi-person"></i>
				<!-- 아이디 -->
				<input type="text" class="form-control"
					id="id_input" name="id" placeholder="ID"><i
					class="bi bi-lock"></i>
				<!-- 비밀번호 -->
				<input type="password" class="form-control"
					id="pw_input" name="pw" placeholder="Password">
					<div id="idError" style="color:red;"></div>
					<div id="passwordError" style="color:red;"></div>
					<div id="loginError" style="color:red;"></div>
					
			</div>
		</main>
		<div align="center">
			<input type="submit" id="login"class="btn btn-light"
				style="padding-left: 65px; padding-right: 65px;" value="Login">
				<a href="/member/join"><button type="button" id="join"class="btn btn-light"
				style="padding-left: 65px; padding-right: 65px;">join</button></a>
			<br> <a href="javascript:void(0)" id="searchLink" style="text-decoration: none; color: gray;">ID 찾기 /</a>
           <a href="javascript:void(0)" id="searchLink1" style="text-decoration: none; color: gray;">비밀번호 찾기</a>
		</div>
	</form>
	
	<%@ include file="../footer.jsp"%>
	<script>
	
	$('#login_form').on('submit', function(e) {
		  var id = $('#id_input').val();
		  var pw = $('#pw_input').val();

		  if (!id) {
		    e.preventDefault();  // 폼 제출을 중지합니다.
		    $('#idError').text('아이디를 입력해주세요.');
		  } else {
		    $('#idError').text('');  // 에러 메시지를 비웁니다.
		    
		    if (!pw) {
		      e.preventDefault();  // 폼 제출을 중지합니다.
		      $('#passwordError').text('비밀번호를 입력해주세요.');
		    } else {
		      $('#passwordError').text('');  // 에러 메시지를 비웁니다.
		    }
		  }
		});

	var loginError = "<c:out value='${errorMessage}'/>";

	  // 페이지가 로드되면 서버 오류 메시지를 출력합니다.
	  $(document).ready(function() {
	    if (loginError) {
	      $('#loginError').text(loginError);
	    }
	  });
	  
	  $(document).ready(function() {
		    $("#searchLink").click(function() {
		        window.open('/member/idSearch', 'searchWindow', 'width=600,height=400');
		    });
		});
	  $(document).ready(function() {
		    $("#searchLink1").click(function() {
		        window.open('/member/pwSearch', 'searchWindow', 'width=600,height=400');
		    });
		});

</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>