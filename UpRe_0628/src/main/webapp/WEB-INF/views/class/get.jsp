<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>class상세</title>
<style>
body {
	padding: 20px;
	font-family: 'GangwonEdu_OTFBoldA';
}

.detail-image {
	margin: 10px auto 0;
}

.detail-image img {
	max-width: 600px;
}

.container {
	text-align: center;
	font-family: 'GangwonEdu_OTFBoldA';
}

.button-group form button {
	width: 80px;
	height: 30px;
	font-size: 17px;
	border: none;
	border-radius: 8px;
	font-family: 'GangwonEdu_OTFBoldA';
	background: #e0e0e0;
	cursor: pointer;
}

textarea {
	font-size:20px;
	width: 600px;
	height: 250px;
	resize: none;
	padding: 15px 0 15px 15px;
	border-radius: 10px;
	border: none;
	font-family: 'GangwonEdu_OTFBoldA';
}

textarea:focus {
	outline: none;
}

.people {
	font-family: 'GangwonEdu_OTFBoldA';
}

.move-button {
	height: 30px;
	font-size: 17px;
	border: none;
	border-radius: 8px;
	font-family: 'GangwonEdu_OTFBoldA';
	background: #e0e0e0;
	cursor: pointer;
}

table {
	margin: 0 auto;
	max-width: 600px;
	width: 100%;
}

.table-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.table-row td:first-child {
	padding-right: 10px;
}

.table-row td:last-child {
	padding-left: 10px;
}

.table-row {
	font-family: 'GangwonEdu_OTFBoldA';
}

.center-image {
	display: flex;
	justify-content: center;
	align-items: center;
}

.table-row td:first-child {
	padding-right: 10px;
	text-align: left; /* Align text on the left side */
}

.table-row td:last-child {
	padding-left: 10px;
	text-align: left; /* Align text on the left side */
}

.button-group {
	display: flex;
	justify-content: center;
}
a {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 17px;
	text-decoration: none;
	color: black;
	margin-left: 15px;
}
</style>


</head>
<body>
	<%@ include file="../header.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<table>
			<tr class="table-row">
				<td><p>
						모집인원&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
  <path
								d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8Zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022ZM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816ZM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z" />
</svg>
					</p></td>
				<td>
					<p>
						<a href="#"
							onclick="openPopup(${pageInfo.class_id}); return false;"> <c:out
								value="${classCounts}" />/${pageInfo.class_peopleno}명 모집중 입니다.
						</a>
					</p>
				</td>

			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 1px solid black;"></td>
			</tr>
			<tr class="table-row">
				<td><p>
						클래스&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-scissors" viewBox="0 0 16 16">
  <path
								d="M3.5 3.5c-.614-.884-.074-1.962.858-2.5L8 7.226 11.642 1c.932.538 1.472 1.616.858 2.5L8.81 8.61l1.556 2.661a2.5 2.5 0 1 1-.794.637L8 9.73l-1.572 2.177a2.5 2.5 0 1 1-.794-.637L7.19 8.61 3.5 3.5zm2.5 10a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0zm7 0a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z" />
</svg>
					</p></td>
				<td><p>${pageInfo.class_name}</p></td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 1px solid black;"></td>
			</tr>
			<tr class="table-row">
				<td colspan="2" class="detail-image">
					<div align="center">
						<img src="../resources/img/${pageInfo.class_img}">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 1px solid black;"></td>
			</tr>
			<tr class="table-row">
				<td><p style="width: 85px;">
						상세정보&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
  <path
								d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z" />
  <path
								d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
</svg>
					</p></td>
				<td><textarea readonly>${pageInfo.class_content}</textarea></td>
			</tr>
		</table>
		<br> <br> <br>

		<div class="button-group">
			<form method="post" action="/member/classjoin" name="frm">
				<input type="hidden" name="class_id" value="${pageInfo.class_id}">
				<input type="hidden" name="class_name"
					value="${pageInfo.class_name}"> <input type="hidden"
					name="class_img" value="${pageInfo.class_img}"> <input
					type="hidden" name="id" value="${member.id}">
					 <input
					type="hidden" name="nickname" value="${member.nickname}">
					<c:if
					test="${member.id == null}">
					<button class="move-button" onclick="return login()">
						신청&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
        <path
								d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
        <path
								d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
    </svg>
					</button>
				</c:if>

				<c:if
					test="${classCounts == pageInfo.class_peopleno}">
					<button class="move-button" onclick="return finish()">
						신청&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
        <path
								d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
        <path
								d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
    </svg>
					</button>
				</c:if>
				<c:if
					test="${member.id != null && classCounts != pageInfo.class_peopleno}">
					<button class="move-button"
						onclick="return confirmAndCheckDuplicate()">
						신청&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
        <path
								d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
        <path
								d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
    </svg>
					</button>
				</c:if>
			</form>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="/class/main" method="get">
				<button class="move-button" type="submit">
					목록&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-box-arrow-in-left"
						viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0v-2z" />
  <path fill-rule="evenodd"
							d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z" />
</svg>
				</button>
			</form>
		</div>



		<br>


		<div class="button-group">
			<form method="get" action="/class/update">
				<input type="hidden" name="class_id"
					value='<c:out value="${pageInfo.class_id}"/>'>
				<%-- 관리자만 보이도록 코드 추가 --%>
				<c:if test="${member.lev == 1}">
					<button class="move-button" type="submit"
						onclick="return confirm('수정하시겠습니까?')">
						수정&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
  <path
								d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
  <path
								d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
</svg>
					</button>
				</c:if>
			</form>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form method="get" action="/class/delete">
				<input type="hidden" name="class_id" value="${pageInfo.class_id}">
				<%-- 관리자만 보이도록 코드 추가 --%>
				<c:if test="${member.lev == 1}">
					<button class="move-button" type="submit"
						onclick="return confirm('삭제하시겠습니까?')">
						삭제&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
  <path
								d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
  <path
								d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
</svg>
					</button>
				</c:if>
			</form>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	function finish() {
		alert("신청이 마감되었습니다.");
		return false;
	}
	
	function login() {
		alert("로그인이 필요합니다.");
		return false;
	}

	function confirmAndCheckDuplicate() {
		var memberId = "${member.id}";
		var classId = "${pageInfo.class_id}";

		// 이미 신청한 경우 확인 메시지를 띄우고 중복 신청 여부 확인
		if (memberId && classId) {
			if (confirm("참여하시겠습니까?")) {
				$.ajax({
					url : "/member/classCheck",
					type : "POST",
					data : {
						id : memberId,
						class_id : classId
					},
					success : function(response) {
						if (response === "success") {
							// 중복 체크 성공 시 폼 제출
							$("form[name='frm']").submit();
						} else {
							alert("이미 해당 클래스에 신청하셨습니다.");
						}
					},
					error : function(xhr, status, error) {
						// 오류 처리
					}
				});

				return false; // 폼 제출을 막습니다.
			} else {
				return false; // 폼 제출을 막습니다.
			}
		}

		return true; // 폼을 제출합니다.
	}
	
	function openPopup(classId) {
		window.open("/member/joinList?class_id=" + classId,
				"joinList", "width=300,height=450");
	}
</script>

</html>
