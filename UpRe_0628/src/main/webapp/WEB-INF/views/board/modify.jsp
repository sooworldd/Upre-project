<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/modify.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<h1 class="head_title" align="center">수정 페이지</h1>
	<form id="modifyForm" action="/board/modify" method="post"
		enctype="multipart/form-data">
		<input type="hidden" id="board_no" name="board_no"
			value='<c:out value="${pageInfo.board_no}"/>'> <input
			type="hidden" name="oldFilePath"
			value="<c:out value="${pageInfo.imgurl}" />">
		<div align="center">


			<select name="category">
				<option value="null">---</option>
				<option value="Honey Tips">Honey Tips</option>
				<option value="Reviews">Reviews</option>
			</select>


		</div>
		<br>

		<table class="mo_table" align="center">
			<tr>
				<th><label>작성자</label></th>
				<td><c:out value="${pageInfo.writer}" /></td>
			</tr>
			<tr>
				<th><label>제목</label></th>
				<td><input name="title" class="mo_title"
					value='<c:out value="${pageInfo.title}"/>'></td>
			</tr>
			<tr>
				<th><label>게시판 내용</label></th>
				<td><textarea name="content" class="mo_content">
				<c:out value="${pageInfo.content}" /></textarea></td>
			</tr>
		</table>

		<!-- 이미지 수정 영역 -->
		<br>
		<div>
			<div class="update_file">
				<label for="file-upload-1" class="update_file_tag">파일을 수정하려면
					여기를 클릭해주세요.</label>
			</div>
			<div class="update_file">
				<input type="file" name="uploadFile" id="file-upload-1"
					onchange="previewFile()"> <img style="width: 300px;"
					class="img-fluid preview-img"
					src="../resources/img/${pageInfo.imgurl}" alt="">
			</div>
		</div>
		<!-- 버튼 -->
		<div class="btn_wrap">
			<a class="btn" id="list_btn">목록</a> <a class="btn" id="modify_btn">수정</a>
			<a class="btn" id="delete_btn">삭제</a> <a class="btn" id="cancel_btn">취소</a>
		</div>
	</form>


	<!-- submit할 때 전달할 값 -->

	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="board_no" name="board_no"
			value='<c:out value="${pageInfo.board_no}"/>'> <input
			type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount"
			value='<c:out value="${cri.amount}"/>'> <input type="hidden"
			name="type" value="${cri.type}"> <input type="hidden"
			name="keyword" value='<c:out value="${cri.keyword}"/>'>
	</form>

	<%@ include file="../footer.jsp"%>

	<script>
		let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#board_no").remove();
			form.attr("action", "/board/list");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/get");
			form.submit();
		});

		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			e.preventDefault(); // 이벤트 기본 동작 방지

			// 삭제 여부 확인
			var confirmDelete = confirm("게시물을 삭제하시겠습니까?");
			if (confirmDelete) {
				form.attr("action", "/board/delete");
				form.attr("method", "post");
				form.submit();
			}
		});

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
	</script>
</body>
</html>