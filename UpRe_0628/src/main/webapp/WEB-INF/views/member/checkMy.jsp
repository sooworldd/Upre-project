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
	<form id="check_form" method="post" action="/member/checkMy">
		<input type="hidden" name="id" value="${member.id}">
		<main
			style="display: flex; justify-content: center; line-height: 35px;">
			<div class="mb-3"
				style="width: 400px; padding: 20px; background-color: gray; color: white;">
				<h4 align="center">
					<b>비밀번호 확인</b>
				</h4>
				<i class="bi bi-lock"></i> <input type="password" name="pw"
					class="form-control" id="pw_input" placeholder="Password">
				<div id="pwError" style="color: red;">${error}</div>
				<br>
				<div align="center">
					<input type="submit" id="pw_search" class="btn btn-light"
						style="padding-left: 65px; padding-right: 65px;" value="확인">
				</div>
			</div>
		</main>
	</form>


	<script>
	$(document).ready(function() {
	    $("#check_form").submit(function(event) {
	        var password = $("#pw_input").val();
	        if (password === '') {
	            event.preventDefault(); // Prevent form submission
	            $("#pwError").text("비밀번호를 입력하세요."); // Display error message
	        }
	    });
	});
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>