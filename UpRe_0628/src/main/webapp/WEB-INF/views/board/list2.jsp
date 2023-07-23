
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/list.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="table_wrap" align="center">
		<h1 class="head_title">Reviews</h1>
		<c:if test="${empty member.id}">
			<a href="#" class="top_btn" onclick="showLoginAlert()">게시글 등록</a>
		</c:if>
		<c:if test="${not empty member.id}">
			<a href="/board/enroll" class="top_btn">게시글 등록</a>
		</c:if>
		<table border="1" class="list_table">
			<thead>
				<tr>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="reg_date_width">작성일</th>
					<th class="view_cnt_width">조회수</th>
					<th class="view_cnt_width"><img
						src="../resources/board/likeAft.png"></th>
				</tr>
			</thead>

			<c:forEach items="${list2}" var="list">
				
					<c:if test="${list.writer == '관리자'}">
						<tr class="notice">
							<td><span class="notice-icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg></span><a class="move"
								href='<c:out value="${list.board_no}"/>'> <c:out
										value="${list.title}" />
							</a></td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${list.reg_date}" /></td>
							<td><c:out value="${list.view_cnt}" /></td>
							<td><c:out value="${list.like_cnt}" /></td>
						</tr>
					</c:if>
				
			</c:forEach>

			<c:forEach items="${list2}" var="list">
				
					<c:if test="${list.writer != '관리자'}">
						<tr>
							<td><a class="move" href='<c:out value="${list.board_no}"/>'>
									<c:out value="${list.title}" />
							</a></td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${list.reg_date}" /></td>
							<td><c:out value="${list.view_cnt}" /></td>
							<td><c:out value="${list.like_cnt}" /></td>
						</tr>
					</c:if>
			
			</c:forEach>

		</table>



		<!-- 검색 조건,  -->

		<div class="search_wrap">
			<div class="search_area">
				<select name="type" class="search_option">
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>검색
						기준</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
						+ 내용</option>
					<option value="TW"
						<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
						+ 작성자</option>
					<option value="TCW"
						<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목
						+ 내용 + 작성자</option>
				</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword }"
					class="search_box">
				<button class="search_btn">Search</button>
			</div>

		</div>

		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">

					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a
							href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>

					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
							href="${num}" class="page_num"><b>${num}</b></a></li>
					</c:forEach>

					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage + 1 }">Next</a></li>
					</c:if>
				</ul>
			</div>
		</div>



		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>

	</div>
	<%@ include file="../footer.jsp"%>
	<script>
		function showLoginAlert() {
			alert("로그인이 필요합니다. 게시글을 등록하려면 먼저 로그인해주세요.");
		}
		
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);
			console.log(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "enrol success") {
					alert("등록이 완료되었습니다.");
				}

				if (result === "modify success") {
					alert("수정이 완료되었습니다.");
				}

				if (result === "delete success") {
					alert("삭제가 완료되었습니다.");
				}
			}

		});

		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm.html('');
							moveForm
									.append("<input type='hidden' name='board_no' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/board/get");
							moveForm.submit();
						});

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/list2");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				window.location.href = "/board/list2";
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});

	</script>
</body>
</html>