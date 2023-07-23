<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.com_wrap {
	font-family: 'GangwonEdu_OTFBoldA';
	margin-top: 100px;
	line-height: 30px;
}

a {
	text-decoration: none;
	color: black;
	font-weight: bold;
}

.btn_wrap {
	display: flex;
	align-items: center; /* 수직 정렬 */
	justify-content: center; /* 수평 정렬 */
}

.link_btn {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 20px;
	border: none;
	background: white;
	cursor: pointer;
	border-radius: 8px;
}

.link_btn:hover {
	background: black;
	color: white;
}
</style>
<body>
	<%@ include file="header.jsp"%>
	<div class="com_wrap" align="center">
		<h1 align="center">구매 완료</h1>
		<br>
		<div class="greeting">구매해주셔서 감사합니다.</div>
		<div class="greeting">구매 내역은 마이페이지에서 확인 가능합니다.</div>
		<br>
		<div class="btn_wrap">
			<button onclick="location.href='/member/mypage'" class="link_btn">마이페이지</button>
			<button onclick="location.href='/main'" class="link_btn">메인으로</button>
		</div>

	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>