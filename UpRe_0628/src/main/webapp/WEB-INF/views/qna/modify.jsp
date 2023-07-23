<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna/modify.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6725ee7e5c.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- 헤더 영역 -->
	<%@ include file="../header.jsp"%>
	<br>

	<div class="alldiv" align="center">
		<h1>문의 내역 수정하기</h1>
		<form id="modifyForm" action="/qna/modify" method="post">
			<div class="input_wrap">
				<label>문의 유형 : <c:out value="${pageInfo.category}" />
					&nbsp;&nbsp;&nbsp;&nbsp; 문의 번호 : <c:out value="${pageInfo.bno}" />번
				</label> <input type="hidden" name="bno" value="${pageInfo.bno}">
			</div>
			<div class="input_wrap">
				<label class="label_css">문의 제목(수정)</label> <input name="title"
					class="title_css" value='<c:out value="${pageInfo.title}"/>'>
			</div>
			<div class="input_wrap">
				<label class="label_css">문의 내용(수정)</label>
				<textarea rows="3" class="textarea_css" style="resize: none;"
					name="content"><c:out value="${pageInfo.content}" /></textarea>
			</div>
			<div class="input_wrap">
				<label>문의 작성자 : <c:out value="${pageInfo.writer}" />
					&nbsp;&nbsp;&nbsp;&nbsp; 문의 등록일 : <fmt:formatDate
						pattern="yyyy/MM/dd" value="${pageInfo.regdate}" /></label>
			</div>
			<div class="btn_wrap">
				<a class="btn btn_list" id="list_btn"><i
					class="fa-solid fa-list"></i></a> <a class="btn btn_modify"
					id="modify_btn"><i class="fa-solid fa-check"></i></a> <a
					class="btn btn_delete" id="delete_btn"><i
					class="fa-solid fa-trash-can"></i></a> <a class="btn btn_cancel"
					id="cancel_btn"><i class="fa-regular fa-circle-xmark"></i></a>
			</div>
		</form>
		<form id="infoForm" action="/qna/modify" method="get">
			<input type="hidden" id="bno" name="bno"
				value='<c:out value="${pageInfo.bno}"/>'> <input
				type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount"
				value='<c:out value="${cri.amount}"/>'> <input type="hidden"
				name="type" value="${cri.type }"> <input type="hidden"
				name="keyword" value="${cri.keyword }">

		</form>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/qna/list");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/qna/get");
			form.submit();
		});

		/* 삭제 버튼 */
		$("#delete_btn").on(
				"click",
				function(e) {
					e.preventDefault(); // 이벤트 기본 동작 방지

					// 삭제 여부 확인
					var confirmDelete = confirm("게시물을 삭제하시겠습니까?");
					if (confirmDelete) {
						form.attr("action", "/board/delete");
						form.attr("method", "post");

						// category 필드 추가
						var categoryInput = $("<input>").attr("type", "hidden")
								.attr("name", "category").val(
										"${pageInfo.category}");
						form.append(categoryInput);

						form.submit();
					}
				});
	</script>

</body>
</html>