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
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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

td {
	text-align: left;
	font-weight: bold;
	font-size: 18px;
	line-height: 30px;
	text-align: center;
	font-family: 'GangwonEdu_OTFBoldA';
}

.input_text {
	weight: 80px;
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
<body>
	<%@ include file="header.jsp"%>
	<div class="p_wrapper" align="center">
		<div class="shipping_information">배송 정보 입력</div>
		<form action="/completion" method="get" id="frm">
			<input type="hidden" name="id" value='<c:out value="${member.id}"/>'>
			<input type="hidden" name="product_name"
				value="UpRe Stainless Steel Tumbler 550ml"> <input
				type="hidden" name="quantity" value='<c:out value="${quantity}"/>'>
			<input type="hidden" name="price"
				value='<c:out value="${totalPrice}"/>'> <input type="hidden"
				name="shipping_price"
				value="<c:choose><c:when test="${totalPrice < 50000}">3000</c:when><c:otherwise>0</c:otherwise></c:choose>">

			<table align="center">
				<tr>
					<td>받으시는 분</td>
					<td><input type="text" class="input_text" name="customer"
						value="${member.name}"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" class="input_text" name="contact"></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><input type="text" class="input_text" name="phone"
						value="${member.phone}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="address_kakao1" name="addr1"
						onclick="execution_daum_address()" placeholder="우편번호"
						class="input_text" readonly value="${member.addr1}"><br>
						<input type="text" id="address_kakao2" name="addr2"
						placeholder="주소" class="input_text" readonly
						value="${member.addr2}"><br> <input type="text"
						id="address_kakao3" name="addr3" class="input_text"
						placeholder="상세주소" value="${member.addr3}"></td>
				</tr>
				<tr>
					<td>배송 시 요청사항</td>
					<td><input type="text" class="input_text" name="memo"></td>
				</tr>
			</table>
			<div class="box_select_wrap">
				<div class="box_select">
					<span>택배상자 선택</span> <input type="radio" value="paperbox"
						name="select_box"> 종이박스 <input type="radio"
						value="recycle_box" name="select_box"> 재활용 택배박스
				</div>
				<br>
				<div class="box_notice">
					* 재활용 택배상자를 선택한 경우 고객님께서 상품을 수령하신 후 <br> 상자를 현관문 앞에 놓아주시면 택배
					기사님께서 박스를 수거해가십니다.
				</div>
			</div>
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
					<td class="title">UpRe Stainless Steel Tumbler 550ml</td>
					<td class="price">${quantity}</td>
					<td class="price">₩<fmt:formatNumber value="${totalPrice}"
							type="number" pattern="#,###" /></td>
					<td class="price"><c:choose>
							<c:when test="${totalPrice < 50000}">₩3,000</c:when>
							<c:otherwise>무료</c:otherwise>
						</c:choose></td>
					<td class="price"><c:choose>
							<c:when test="${totalPrice < 50000}">
							₩<fmt:formatNumber value="${totalPrice + 3000}" type="number"
									pattern="#,###" />
							</c:when>
							<c:otherwise>
							₩<fmt:formatNumber value="${totalPrice}" type="number"
									pattern="#,###" />
							</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
			<div>
				<input type="button" value="결제하기" id="orderInfo" class="payment_btn"
					onclick="handlePayment()">
			</div>
		</form>
	</div>

	<%@ include file="footer.jsp"%>

	<script>
		const quantity = $
		{
			quantity
		};
		// 구매 수량 표시
		const quantitySpan = document.getElementById('quantity');
		quantitySpan.textContent = quantity;

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

		function handlePayment() {
			alert("카카오페이 결제창으로 이동합니다 :)");
			event.preventDefault();

			$.ajax({
				type : "POST",
				url : '/kakaopay',
				dataType : 'json',
				success : function(data) {
					var pay = data.next_redirect_pc_url;
					window.open = pay;
					document.getElementById('frm').submit();
				},
				error : function(error) {
					alert("결제 연결에 실패하였습니다.");
				}
			});
		}
	</script>
</body>
</html>