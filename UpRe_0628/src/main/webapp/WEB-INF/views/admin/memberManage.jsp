<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.id_tag{
	font-family: 'GangwonEdu_OTFBoldA';
	text-decoration:none;
	font-size:20px;
	color:black;
}

.wrapper{
	margin-top:50px;
}
.page_num{
	text-decoration:none;
	color:black;
}


.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo_wrap{
	margin-right: 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}
.search_option {
	width: 140px;
	height: 30px;
	font-size:15px;
	border-radius:8px;
	border:none;
	background:#e0e0e0;
}

.search_box {
	width: 300px;
	height: 28px;
	border-radius:8px;
	border:none;
	background:#e0e0e0;
	font-family: 'GangwonEdu_OTFBoldA';
}

.search_btn {
	width: 80px;
	height: 30px;
	font-size: 17px;
	border: none;
	border-radius: 8px;
	font-family: 'GangwonEdu_OTFBoldA';
	background:#e0e0e0;
	cursor:pointer;
}

th{
	font-family: 'GangwonEdu_OTFBoldA';
}

td{
	font-family: 'GangwonEdu_OTFBoldA';
}
</style>	
</head>

<body>
<%@ include file="../header.jsp" %>
	<div class="wrapper">
		<table class="table table-striped">
			<tr align="center">
				<th scope="col">번호</th>
				<th scope="col">회원아이디</th>
				<th scope="col">이름</th>
				<th scope="col">닉네임</th>
				<th scope="col">성별</th>
				<th scope="col">생일</th>
				<th scope="col">전화번호</th>
				<th scope="col">우편번호</th>
				<th scope="col">주소</th>
				<th scope="col">상세주소</th>
				<th scope="col">가입일</th>
			</tr>
			<c:forEach items="${memberList}" var="member" varStatus="status">
				<tr align="center">
					<td>${totalMembers - status.index}</td>
					<!-- 번호 부여 -->
					<td><a href="#" onclick="openPopup('${member.id}'); return false;" class="id_tag">${member.id}</a></td>
					<td>${member.name}</td>
					<td>${member.nickname}</td>
					<td>${member.gender}</td>
					<td>${member.birth}</td>
					<td>${member.phone}</td>
					<td>${member.addr1}</td>
					<td>${member.addr2}</td>
					<td>${member.addr3}</td>
					<td><fmt:formatDate value="${member.joindate}" pattern="yyyy/MM/dd" /></td>
				<tr>
			</c:forEach>
		</table>
	</div>
	<br><br>
	
	<div class="search_wrap" align="center">
			<div class="search_area">
				<select name="type" class="search_option">
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>아이디</option>
						<option value="N"
						<c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>이름</option>
				</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword }"
					class="search_box">
				<button class="search_btn">Search</button>
			</div>
		</div>
	<div class="pageInfo_wrap" align="center">
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
		



		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>
		</div>
	<script>
	
	let moveForm = $("#moveForm");
	
	
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();
	
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin/memberManage");
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
			alert("키워드를 입력하세요.");
			return false;
		}
		
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});

	
	
	
	function openPopup(id) {
	    window.open("/admin/memberDetail?id=" + id, "MemberDetail", "width=500,height=600");
	}
	
	
	</script>

	


</body>
</html>