<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

th {
	font-family: 'GangwonEdu_OTFBoldA';
	padding-bottom: 20px;
}

td {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 50px;
	line-height: 40px;
	padding-left: 20px;
	padding-bottom: 20px;
}


</style>
</head>
<body>
	<table align="center">
		<tr>
			<th colspan=2>참여자</th>
		</tr>
		<c:forEach items="${cartList}" var="cart" varStatus="loop">
			<tr>
				<td>${loop.index + 1}.</td>
				<td>${cart.nickname}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>