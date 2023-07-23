<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.p_wrapper {
	margin-top: 100px;
}

.shipping_information {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 30px;
	font-weight: bold;
}

.default_info {
	margin: 20px 0 20px 0;
	font-weight: bold;
	font-size: 18px;
	color: gray;
	font-family: 'GangwonEdu_OTFBoldA';
}

th {
	font-family: 'GangwonEdu_OTFBoldA';
	font-size: 18px;
}

td {
	text-align: left;
	font-weight: bold;
	font-size: 18px;
	line-height: 30px;
	text-align: center;
	font-family: 'GangwonEdu_OTFBoldA';
}

.input_text {
	width: 280px;
	height: 26px;
	border: none;
	background-color: lightgray;
	border-radius: 8px;
}

.payment_btn {
	margin-top: 24px;
	border: none;
	background: gray;
	color: white;
	border-radius: 8px;
	font-weight: bold;
	font-size: 20px;
	cursor: pointer;
}

.title {
	width: 200px;
	padding: 10px;
	border: 1px solid lightgray;
}

.price {
	width: 120px;
	padding: 10px;
	border: 1px solid lightgray;
}

.total_price {
	border: 1px solid lightgray;
	border-collapse: collapse;
}

.box_select_wrap {
	margin-top: 30px;
}

.box_notice {
	font-family: 'GangwonEdu_OTFBoldA';
	line-height: 22px;
}

.box_select {
	font-family: 'GangwonEdu_OTFBoldA';
	line-height: 22px;
}
</style>
</head>
<body align="center">
	<h2 class="shipping_information">주문 조회</h2>
	<form id="order_cancel" method="post" action="/member/orderCancel">
		<input type="hidden" name="order_no" value="${order.order_no}">
		<table align="center">
			<tr>
				<th>회원아이디</th>
				<td><div class="input_text">${order.id}</div></td>
			</tr>
			<tr>
				<th>주문번호</th>
				<td><div class="input_text">${order.order_no}</div></td>
			</tr>
			<tr>
				<th>주문일</th>
				<td><div class="input_text">
						<fmt:formatDate value="${order.orderdate}" pattern="yyyy년 MM월 dd일" />
					</div></td>
			</tr>
			<tr>
				<th>받으시는 분</th>
				<td><div class="input_text">${order.customer}</div></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><div class="input_text">${order.contact}</div></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><div class="input_text">${order.phone}</div></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<div class="input_text">${order.addr1}</div>
					<div class="input_text">${order.addr2}</div>
					<div class="input_text">${order.addr3}</div>
				</td>

			</tr>
			<tr>
				<th>배송 시 요청사항</th>
				<td><div class="input_text">${order.memo}</div></td>
			</tr>
			<tr>
				<th>택배상자 선택</th>
				<td><div class="input_text">${order.select_box}</div></td>
			</tr>
		</table>
		<br> <br>

		<table align="center" class="total_price">
			<tr>
				<td class="title">상품명</td>
				<td class="price">수량</td>
				<td class="price">가격</td>
				<td class="price">배송비</td>
				<td class="price">총 결제 금액</td>
			</tr>
			<tr>
				<td class="title">${order.product_name}</td>
				<td class="price">${order.quantity}</td>
				<td class="price"><fmt:formatNumber value="${order.price}"
						type="number" pattern="#,###" />원</td>
				<td class="price"><fmt:formatNumber
						value="${order.shipping_price}" type="number" pattern="#,###" />원</td>
				<td class="price"><fmt:formatNumber
						value="${order.price * order.quantity + order.shipping_price}"
						type="number" pattern="#,###" />원</td>
			</tr>
		</table>
		<!-- <input type="button" value="주문 취소" class="payment_btn" onclick="contirm_cancel()"> -->
		<input type="submit" id="delete" value="주문 취소" class="payment_btn"
			onclick="contirm_cancel()">
	</form>

	<script>
		window.onload = function() {
			var checkbox = document.getElementById('shipping');
			var address_kakao1 = document.getElementById('address_kakao1');
			var address_kakao2 = document.getElementById('address_kakao2');
			var address_kakao3 = document.getElementById('address_kakao3');

			var addr1 = address_kakao1.value;
			var addr2 = address_kakao2.value;
			var addr3 = address_kakao3.value;

			address_kakao1.value = '';
			address_kakao2.value = '';
			address_kakao3.value = '';

			checkbox.addEventListener('change', function() {
				if (checkbox.checked) {
					// 체크박스가 체크되면 주소 필드에 값을 채움
					address_kakao1.value = addr1;
					address_kakao2.value = addr2;
					address_kakao3.value = addr3;
				} else {
					// 체크박스가 해제되면 주소 필드의 값을 제거함
					address_kakao1.value = '';
					address_kakao2.value = '';
					address_kakao3.value = '';
				}
			});
		}

		/* 다음 주소 연동 */
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var fullAddress = data.address; // 사용자가 선택한 주소 변수
							var extraAddress = ''; // 참고항목 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.addressType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								if (data.bname !== '') {
									extraAddress += data.bname;
								}
								if (data.buildingName !== '') {
									extraAddress += (extraAddress !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								fullAddress += ' (' + extraAddress + ')';
							}

							// 주소 정보를 해당 필드에 넣는다.
							document.getElementById('address_kakao1').value = data.zonecode; // 우편번호
							document.getElementById('address_kakao2').value = fullAddress; // 주소
							document.getElementById('address_kakao3').focus(); // 상세주소 필드에 포커스
						}
					}).open();
		}

		function contirm_cancel() {
			if (confirm("주문을 취소하시겠습니까?")) {
				alert("완료되었습니다.");
			}
		}

	</script>
</body>
</html>