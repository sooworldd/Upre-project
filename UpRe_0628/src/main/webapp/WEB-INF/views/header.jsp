<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.header {
	width: 100%;
}

.upre {
	width: 40px;
	margin-top: 15px;
}

/*카테고리 버튼 + 메뉴 바*/
input[id="menuicon"] {
	display: none;
}

input[id="menuicon"]+label {
	display: block;
	width: 30px;
	height: 20px;
	position: fixed;
	top: 34px;
	left: 30px;
	cursor: pointer;
	z-index: 2;
	transition: all .35s;
}

input[id="menuicon"]+label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 3.5px;
	border-radius: 30px;
	background: lightgray;
	transition: all .35s;
}

input[id="menuicon"]+label span:nth-child(1) {
	top: 0;
}

input[id="menuicon"]+label span:nth-child(2) {
	top: 50%;
	transform: translateY(-50%);
}

input[id="menuicon"]+label span:nth-child(3) {
	bottom: 0;
}

input[id="menuicon"]:checked+label span:nth-child(1) {
	top: 50%;
	transform: translateY(-50%) rotate(45deg);
}

input[id="menuicon"]:checked+label span:nth-child(2) {
	opacity: 0;
}

input[id="menuicon"]:checked+label span:nth-child(3) {
	bottom: 50%;
	transform: translateY(50%) rotate(-45deg);
}

div[class="sidebar"] {
	width: 300px;
	height: 100%;
	background: white;
	position: fixed;
	top: 0;
	left: -300px;
	z-index: 1;
	transition: all .35s;
	top: 0;
}

input[id="menuicon"]:checked+label {
	left: 270px;
}

input[id="menuicon"]:checked+label+div {
	left: 0;
}
/* 로그인 아이콘 */
.login_btn {
	display: flex;
	align-items: center;
}

.login_icon {
	width: 40px;
}

.login_a {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 20px;
	text-decoration: none;
	color: gray;
	margin-left: 15px;
}

.login_a:hover {
	color: green;
}

/* 메뉴바 */
.sidebar {
	position: relative;
}

.sidebar_menu {
	padding-top: 10px;
	line-height: 30px;
}

.sidebar_menu a {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 20px;
	color: gray;
	text-decoration: none;
	margin-left: 20px;
}

.sidebar_menu a:hover {
	color: green;
}

.about {
	position: absolute;
	bottom: 5%;
}

.about a {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 20px;
	color: gray;
	text-decoration: none;
	margin-left: 20px;
}

.about a:hover {
	color: green;
}
</style>
</head>
<body>
	<div class="header" align="center">
		<a href="../main"> <img src="../resources/banner/upre.jpg"
			class="upre">
		</a>
	</div>
	<!-- 카테고리 영역 -->
	<div class="category">
		<input type="checkbox" id="menuicon" style="display: none;"> <label
			for="menuicon"> <span></span> <span></span> <span></span>
		</label>
		<div class="sidebar">
			<br>
			<div class="login_btn">
				<div class="login_wrap">
					<c:choose>
						<c:when test="${member == null }">
							<a href="/member/login" class="login_a"> <img
								src="../resources/banner/login2.png" class="login_icon"> <span
								class="login_link">&nbsp;&nbsp;로그인</span>
							</a>
						</c:when>
						<c:otherwise>
							<a href="/member/mypage" class="login_a"> <img
								src="../resources/banner/login2.png" class="login_icon"> <span
								class="login_link">&nbsp;&nbsp;${member.nickname}</span></a>
							<a href="/member/logout" class="login_a">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<hr style="width: 90%;">
			<div class="sidebar_menu">
				<c:if test="${member.lev == null}">
					<div>
						<a href="/board/list">Honey tips</a>
					</div>
					<div>
						<a href="/board/list2">Reviews</a>
					</div>


					<div>
						<a href="/qna/list">QnA / FAQ</a>
					</div>

					<div>
						<a href="/class/main">One day class / crafts</a>
					</div>
				</c:if>
			</div>

			<!-- 관리자 계정인 경우에만 보이는 메뉴 -->
			<div class="sidebar_menu">
				<c:if test="${member.lev == 1}">
					<div>
						<a href="/admin/memberManage">회원관리</a>
					</div>
					<div>
						<a href="/board/list">꿀팁게시판관리</a>
					</div>
					<div>
						<a href="/board/list2">리뷰게시판관리</a>
					</div>
					<div>
						<a href="/qna/list">QnA / FAQ</a>
					</div>
					<div>
						<a href="/admin/goodsManage">굿즈관리</a>
					</div>
					<div>
						<a href="/class/main">One day class / crafts 관리</a>
					</div>
				</c:if>
			</div>

			<div class="about">
				<div>
					<a
						href="https://www.me.go.kr/home/web/board/read.do?menuId=10392&boardMasterId=713&boardId=853220">
						재활용품 분리배출 방법 </a>
				</div>
				<div>
					<a href="#">UpRe</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>