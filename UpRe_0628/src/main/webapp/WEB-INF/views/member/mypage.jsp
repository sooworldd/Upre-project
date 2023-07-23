<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

.mypage_wrapper {
	display: grid;
	grid-template-columns: 1fr 1fr;
	margin-top: 50px;
	text-align: center;
}

.my_posting::-webkit-scrollbar {
	width: 10px;
}

.my_posting::-webkit-scrollbar-thumb {
	background: lightgray;
	border-radius: 5px;
}

.my_posting::-webkit-scrollbar-track {
	background: white;
}

.my_order::-webkit-scrollbar {
	width: 10px;
}

.my_order::-webkit-scrollbar-thumb {
	background: lightgray;
	border-radius: 5px;
}

.my_order::-webkit-scrollbar-track {
	background: white;
}

.mypage_info {
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center;
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 30px;
}

.mypage_title {
	vertical-align: middle;
}

.my_update {
	display: flex;
	justify-content: left; /* 수평 가운데 정렬 */
	align-items: center;
	font-family: 'GangwonEdu_OTFBoldA';
	height: 100px;
	text-decoration: none;
	padding-left: 20px;
	margin-top: 20px;
	border: solid 1px lightgray;
}

.update_btn {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 20px;
	text-decoration: none;
	padding: 5px;
	border-radius: 8px;
	color: black;
	text-decoration: none;
}

.my_posting {
	display: flex;
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 20px;
	height: 100px;
	font-weight: bold;
	padding: 12px;
	border: solid 1px lightgray;
	overflow: auto;
	font-family: 'GangwonEdu_OTFBoldA';
}

.my_order {
	display: flex;
	height: 100px;
	font-family: 'GangwonEdu_OTFBoldA';
	font-weight: bold;
	font-size: 20px;
	padding: 12px;
	border: solid 1px lightgray;
	overflow: auto;
	height: 100px;
}

.my_class {
	display: flex;
	font-size: 20px;
	font-family: 'GangwonEdu_OTFBoldA';
	height: 100px;
	font-weight: bold;
	padding: 12px;
	border: solid 1px lightgray;
	overflow: auto;
	font-size: 20px;
}

.menu_title {
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center;
	width: 150px;
}

.menu_content {
	width: 600px;
}

th {
	padding: 0 10px 0 10px;
	border-bottom: 2px solid gray;
	padding: 5px 0 5px 0;
}

td {
	padding-top: 10px;
}

.table_th1 {
	width: 100px;
}

.table_th2 {
	width: 120px;
}

.table_th3 {
	width: 420px;
}

.table_th4 {
	width: 80px;
}

.move {
	text-decoration: none;
	color: navy;
	font-size: 22px;
	font-weight: bolder;
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
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="mypage_wrapper">
		<div class="mypage_info">
			<p class="mypage_title">'${member.nickname}'님의 마이페이지</p>
		</div>
		<div class="mypage_menu">
			<div class="my_update">
				<a href="#" onclick="openPopup2(); return false;"
					class="update_btn">정보 수정하기 <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
  <path
							d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
  <path
							d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
</svg></a>
			</div>

			<div class="my_posting">
				<div class="menu_title">
					내 포스팅&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
  <path
							d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z" />
</svg>
				</div>
				<div class="menu_content">
					<table align="center">
						<tr>
							<th class="table_th1">작성일</th>
							<th class="table_th2">게시판</th>
							<th class="table_th3">제목</th>
							<th class="table_th4">조회수</th>
						</tr>

						<c:forEach items="${boardList}" var="board">
							<c:if test="${member.id==board.id }">
								<tr>
									<td><fmt:formatDate value="${board.reg_date}"
											pattern="yyyy/MM/dd" /></td>
									<td>${board.category}</td>
									<td><a class="move"
										href="/board/get?board_no=${board.board_no}"><c:out
												value="${board.title}" /></a></td>
									<td>${board.view_cnt}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>

			<div class="my_order">
				<div class="menu_title">
					주문 조회&nbsp;
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
  <path
							d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
</svg>
				</div>
				<div class="menu_content">
					<table align="center">
						<tr>
							<th class="table_th1">주문일</th>
							<th class="table_th2">주문번호</th>
							<th class="table_th3">상품명</th>
							<th class="table_th4">수량</th>
						</tr>
						<c:forEach items="${orderList}" var="order">
							<c:if test="${member.id==order.id }">
								<tr>
									<td><fmt:formatDate value="${order.orderdate}"
											pattern="yyyy/MM/dd" /></td>
									<td><a href="#" class="move"
										onclick="openPopup1('${order.order_no}'); return false;">
											${order.order_no} </a></td>
									<td>${order. product_name}</td>
									<td>${order.quantity}</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<!-- 
			<a href="#" onclick="openPopup1('${member.id}');  return false;"
				class="update_btn">주문조회</a>
			 -->

			</div>
			<div class="my_class">
				<div class="menu_title">
					<div>
						클래스 신청 현황&nbsp;
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-calendar-check"
							viewBox="0 0 16 16">
  <path
								d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
  <path
								d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
</svg>
					</div>
				</div>

				<table align="center">

					<c:forEach items="${cartList}" var="cart">
						<c:if test="${member.id==cart.id }">
							<tr>

								<td><a class="move" href="/class/${cart.class_id}"><img
										style="width: 200px; height: auto;"
										src="../resources/img/${cart.class_img}"></a></td>
								<td>${cart.class_name }</td>

								<td>


									<form method="post" action="/member/classCancle">
										<input type="hidden" name="cart_no" value="${cart.cart_no}">

										<button class="move-button" type="submit"
											onclick="return confirm('참여를 철회하시겠습니까?')">
											삭제&nbsp;
											<svg xmlns="http://www.w3.org/2000/svg" width="16"
												height="16" fill="currentColor" class="bi bi-gear"
												viewBox="0 0 16 16">
  <path
													d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
  <path
													d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
</svg>
										</button>
									</form>
								</td>

							</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>

	<script>
		function openPopup1(orderNo) {
			window.open("/member/orderDetail?order_no=" + orderNo,
					"orderDetail", "width=700,height=650");
		}
		function openPopup2() {

			window.open('/member/checkMy', '_blank', 'width=480,height=680');
		}
	</script>
</body>
</html>