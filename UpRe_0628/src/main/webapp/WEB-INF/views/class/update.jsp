<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.form-wrapper {
	text-align: center;
}

.img-fluid preview-img, .btn btn-primary px-3 image-regit, .people,
	.btn-submit, .btn-cancel {
	width: 80px;
	height: 30px;
	font-size: 17px;
	border: none;
	border-radius: 8px;
	font-family: 'GangwonEdu_OTFBoldA';
	background: #e0e0e0;
	cursor: pointer;
}

input[type="text"], textarea {
	border-radius: 20px;
	padding: 10px;
	resize:none;
}

.success {
	animation: blinkText 1s infinite;
	color: gray;
	font-family: 'GangwonEdu_OTFBoldA';
}

.people {
	font-family: 'GangwonEdu_OTFBoldA';
}

@
keyframes blinkText { 0% {
	color: black;
}

50%{
color:pink;
}

100%{
color:black;
}

}
.form-wrapper {
	font-family: 'GangwonEdu_OTFBoldA';
}

.btn-wrapper {
	font-family: 'GangwonEdu_OTFBoldA';
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<br>
	<br>

	<form name="classForm" action="/class/update" method="post"
		enctype="multipart/form-data" onsubmit="return validateForm();">
		<input type="hidden" name="oldFilePath" value="${pageInfo.class_img}" />
		<input type="hidden" name="class_id" value="${pageInfo.class_id}" />
		<div class="container">
			<div class="form-wrapper">
				<table>
					<caption style="font-weight: bold; font-size: 50px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-brightness-alt-high"
							viewBox="0 0 16 16">
  <path
								d="M8 3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 3zm8 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zm-13.5.5a.5.5 0 0 0 0-1h-2a.5.5 0 0 0 0 1h2zm11.157-6.157a.5.5 0 0 1 0 .707l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm-9.9 2.121a.5.5 0 0 0 .707-.707L3.05 5.343a.5.5 0 1 0-.707.707l1.414 1.414zM8 7a4 4 0 0 0-4 4 .5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5 4 4 0 0 0-4-4zm0 1a3 3 0 0 1 2.959 2.5H5.04A3 3 0 0 1 8 8z" />
</svg>
						&nbsp;CLASS&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-brightness-alt-high"
							viewBox="0 0 16 16">
  <path
								d="M8 3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 3zm8 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zm-13.5.5a.5.5 0 0 0 0-1h-2a.5.5 0 0 0 0 1h2zm11.157-6.157a.5.5 0 0 1 0 .707l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm-9.9 2.121a.5.5 0 0 0 .707-.707L3.05 5.343a.5.5 0 1 0-.707.707l1.414 1.414zM8 7a4 4 0 0 0-4 4 .5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5 4 4 0 0 0-4-4zm0 1a3 3 0 0 1 2.959 2.5H5.04A3 3 0 0 1 8 8z" />
</svg>
					</caption>
					<br>
					<br>
					<tr>
						<td>클래스&nbsp;<svg xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" fill="currentColor"
								class="bi bi-scissors" viewBox="0 0 16 16">
  <path
									d="M3.5 3.5c-.614-.884-.074-1.962.858-2.5L8 7.226 11.642 1c.932.538 1.472 1.616.858 2.5L8.81 8.61l1.556 2.661a2.5 2.5 0 1 1-.794.637L8 9.73l-1.572 2.177a2.5 2.5 0 1 1-.794-.637L7.19 8.61 3.5 3.5zm2.5 10a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0zm7 0a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
</svg></td>
						<td><input type="text" name="class_name" size="98"
							class="success" value="${pageInfo.class_name}" /></td>
					</tr>

					<tr>
						<td></td>
						<td></td>
					</tr>

					<tr>
						<td>상세정보&nbsp;<svg xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" fill="currentColor"
								class="bi bi-card-list" viewBox="0 0 16 16">
  <path
									d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
									d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
</svg></td>
						<td><textarea name="class_content" cols="96" rows="15"
								class="success" minlength="200" /> ${pageInfo.class_content}"</textarea></td>
					</tr>

					<tr>
						<td></td>
						<td></td>
					</tr>
					<br>
					<br>
					<tr>
						<td>모집인원&nbsp;<svg xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" fill="currentColor" class="bi bi-people"
								viewBox="0 0 16 16">
  <path
									d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8Zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022ZM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816ZM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z" />
</svg></td>
						<td><select name="class_peopleno" class="people">
								<option value="0" selected>!choose!</option>
								<option value="1"
									<c:if test="${pageInfo.class_peopleno == 1}">selected</c:if>>1</option>
								<option value="2"
									<c:if test="${pageInfo.class_peopleno == 2}">selected</c:if>>2</option>
								<option value="3"
									<c:if test="${pageInfo.class_peopleno == 3}">selected</c:if>>3</option>
								<option value="4"
									<c:if test="${pageInfo.class_peopleno == 4}">selected</c:if>>4</option>
								<option value="5"
									<c:if test="${pageInfo.class_peopleno == 5}">selected</c:if>>5</option>
								<option value="6"
									<c:if test="${pageInfo.class_peopleno == 6}">selected</c:if>>6</option>
								<option value="7"
									<c:if test="${pageInfo.class_peopleno == 7}">selected</c:if>>7</option>
								<option value="8"
									<c:if test="${pageInfo.class_peopleno == 8}">selected</c:if>>8</option>
								<option value="9"
									<c:if test="${pageInfo.class_peopleno == 9}">selected</c:if>>9</option>
								<option value="10"
									<c:if test="${pageInfo.class_peopleno == 10}">selected</c:if>>10</option>
						</select></td>
					</tr>
				</table>
				<br> <br> <br>
				<div class="filebox bs3-primary detail-image">
					<label for="class-img">상세이미지&nbsp;<svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-card-image" viewBox="0 0 16 16">
  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
  <path
								d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z" />
</svg></label> <input type="file" class="btn btn-primary px-3 image-regit"
						name="uploadFile" id="file-upload-1" onchange="previewFile()">
					<img style="width: 300px;" class="img-fluid preview-img"
						src="../resources/img/${pageInfo.class_img}" alt="">
				</div>
				<br> <br>
				<div class="btn-wrapper">
					<input type="submit" value="수정" class="btn btn-cancel"> <input
						type="button" value="취소" class="btn btn-cancel"
						onclick="location.href='/class/main';">
				</div>
			</div>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
	<script>
		//미리보기 사진
		function previewFile() {
			const preview = document.querySelector('.preview-img');
			const file = event.target.files[0];
			const reader = new FileReader();

			reader.addEventListener("load", function() {
				// 파일을 읽어서 이미지 URL로 설정합니다.
				preview.src = reader.result;
			}, false);

			if (file) {
				// 파일을 읽습니다.
				reader.readAsDataURL(file);
			}
		}

		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576 * 5; //5MB	

		function fileCheck(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		function validateForm() {
			var title = document.forms["classForm"]["businessName"].value;
			var content = document.forms["classForm"]["content"].value;
			var people = document.forms["classForm"]["numberOfPeople"].value;
			var img = document.forms["classForm"]["detailedImageFile"].value;

			if (title === "" || content === "" || people === "0" || img === "") {
				alert("모든 입력 항목은 필수입니다.");
				return false;
			}

			if (content.length < 100) {
				alert("상세정보는 100자 이상 입력해주세요.");
				return false;
			}
		}
	</script>
</body>
</html>
