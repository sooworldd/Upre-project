<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/enroll.css">
</head>
<body>

	<%@ include file="../header.jsp"%>
	<h1 class="head_title" align="center">게시글 등록</h1>
	<form action="/board/enroll" method="post"
		enctype="multipart/form-data" name="frm">
		<input type="hidden" name="id" value="${member.id}">

		<div align="center">


			<select name="category">
				<option value="null">---</option>
				<option value="Honey Tips">Honey Tips</option>
				<option value="Reviews">Reviews</option>
			</select>


		</div>
		<br>
		<table class="en_table" align="center">
			<tr>
				<th><label>작성자</label></th>
				<td><input name="writer" class="en_nickname"
					value="${member.nickname}" readonly></td>
			</tr>
			<tr>
				<th><label>제목</label></th>
				<td><input name="title" class="en_title"></td>
			</tr>
			<tr>
				<th><label>내용</label></th>
				<td><img style="width: 150px;" class="img-fluid preview-img"
					src="" alt=""> <textarea rows="3" name="content"
						class="en_content"></textarea></td>
			</tr>
		</table>
		<!-- 사진첨부 영역 -->
		<br>
		<div>
			<div class="add_file_area">
				<label for="file-upload-1" class="add_file_tag">파일을 첨부하려면
					여기를 클릭해주세요.</label>
			</div>
			<div>
				<input type="file" name="uploadFile" id="file-upload-1"
					onchange="previewFile()">
			</div>
		</div>

		<div class="btn_area">
			<button type="submit" class="btn" id="registerButton">등록</button>
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
		
		document.querySelector("form").addEventListener("submit", function(event) {
	        event.preventDefault(); // 기본 동작인 폼 제출을 막습니다.

	        // 카테고리 값 확인
	        var category = document.querySelector("select[name='category']").value;

	        if (category === "null") {
	            // 카테고리가 null인 경우, 비동기 요청을 보내서 메시지를 표시합니다.
	            showErrorMessage("게시판을 선택해주세요.");
	        } else {
	            // 카테고리가 선택된 경우, 폼을 제출합니다.
	            event.target.submit();
	        }
	    });

	    // 오류 메시지 표시 함수
	    function showErrorMessage(message) {
	        // TODO: 오류 메시지를 표시하는 방식을 구현하세요.
	        alert(message);
	    }
		
	</script>
</body>
</html>