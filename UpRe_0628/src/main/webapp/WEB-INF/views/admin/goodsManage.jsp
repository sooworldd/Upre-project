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
</head>

<body>
<%@ include file="../header.jsp" %>
	<div>
		<table class="table table-striped">

			<tr align="center">
				<th scope="col">번호</th>
				<th scope="col"></th>
				<th scope="col">상품명</th>
				<th scope="col">가격</th>
				<th scope="col">등록일</th>
				<th scope="col">수정일</th>
			</tr>
			
			<c:forEach items="${goodsList}" var="goods">
				<tr align="center">
					<td>${totalGoods - status.index}</td>
					<!-- 번호 부여 -->
					<td><a href="#" onclick="openPopup('${goods.name}'); return false;"><img src="${goods.img}" width="100" height="100"></a></td>

					<td>${goods.name}</td>
					<td><fmt:formatNumber value="${goods.price}" pattern="#,###"/></td>
					<td><fmt:formatDate value="${goods.regdate}" pattern="yyyy/MM/dd" /></td>
					<td><fmt:formatDate value="${goods.updatedate}" pattern="yyyy/MM/dd" /></td>
					
				<tr>
			</c:forEach>
			
		</table>
	</div>
	<script>
	
	function openPopup(name) {
	    window.open("/admin/goodsDetail?name=" + name, "goodsDetail", "width=500,height=600");
	}
	</script>

	


</body>
</html>