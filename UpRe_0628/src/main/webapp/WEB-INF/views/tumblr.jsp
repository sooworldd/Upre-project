<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/tumblr.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="item_datail">
		<div class="detail_left">
			<img src="${tumblr.img }" class="tumblr_img">
		</div>

		<div class="detail_right">
			<div class="title">${tumblr.name }</div>
			<div class="price">₩${tumblr.price }</div>
			<br>
			<table>
				<tr>
					<td class="table_name">배송비</td>
					<td class="table_content">3,000원 (50,000원 이상 구매 시 무료)<br>
						제주 3,000원, 제주 외 도서 산간 6,000원 추가
					</td>
				</tr>
				<tr>
					<td class="table_name">수량</td>
					<td class="table_content">
						<div class="quantity_wrapper">
							<button data-action="decrement" class="minus_btn">-</button>
							<input type="number" class="quantity" name="custom-input-number"
								value="1" min="1" max="5"></input>
							<button data-action="increment" class="plus_btn">+</button>
						</div>
					</td>
				</tr>
			</table>
			<hr style="width: 65%; float: left;">
			<div class="order">
				<table>
					<tr>
						<td class="table_name">주문 수량</td>
						<td class="table_content"><span id="quantity">1</span></td>
					</tr>
					<tr>
						<td class="table_name">총 상품 금액</td>
						<td class="table_content"><span id="total_price">₩${tumblr.price }</span>
						</td>
					</tr>
					<tr>
						<td><c:choose>
								<c:when test="${member != null}">
									<input type="button" value="구매하기" class="buy_btn"
										onclick="confirmPurchase(${quantityInput.value})" />
								</c:when>
								<c:otherwise>
									<input type="button" value="구매하기" class="buy_btn"
										onclick="alert('로그인 후에 구매하실 수 있습니다.'); return false;" />
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="detail_page" align="center">
		<div class="information">
			환경 보존을 위해 노력하는 '주호와 머리카락들'은 <br> 일회용품과 플라스틱 사용을 지양하고 지속 가능한 물건을
			사용하길 권장합니다.
		</div>
		<div class="detail_content">
			<div class="content_title">UpRe Stainless Steel Tumbler</div>
			<br>
			<div class="content_a">
				550ml 대용량<br> 최고급 보온/보냉 성능<br> 스테인리스 스틸의 뛰어난 내구성<br>
				결로현상 방지<br> 누수 방지<br>
			</div>
		</div>
	</div>
	<br>
	<div class="notice">
		<div>교환 및 반품 규정</div>
		<ul>
			<li>교환 및 반품은 배송완료일로부터 7일 이내로 규정합니다.</li>
			<li>교환 및 반품 신청시 지정택배사로 회수접수가 됩니다.</li>
			<li>단순 변심에 의한 교환 및 반품의 경우 제품 및 포장상태가 손상되지 않은 상태에서 가능하며,<br>
				왕복 배송비는 고객님께서 부담해주셔야 합니다.
			</li>
			<li>받으신 상품이 하자가 있거나 오배송 되었을 경우는 별도의 비용 없이 교환, 환불하여 드립니다.</li>
		</ul>
		<br>
		<div>교환 및 반품 절차</div>
		<ul>
			<li>교환/환불 신청 > 상품 회수 > 상품 검수 > 교환 발송 및 환불 진행</li>
		</ul>
	</div>


	<%@ include file="footer.jsp"%>


	<script>
		const quantityInput = document.querySelector('.quantity');
		const quantitySpan = document.querySelector('#quantity');
		const totalPriceSpan = document.querySelector('#total_price');
		const price = 25000;

		quantityInput.addEventListener('change', function() {
			const quantity = Number(quantityInput.value);
			const total = price * quantity;
			quantitySpan.textContent = quantity;
			totalPriceSpan.textContent = `₩${total}`;
		});

		function decrement(e) {
			const btn = e.target.parentNode.parentElement
					.querySelector('button[data-action="decrement"]');
			const target = btn.nextElementSibling;
			let value = Number(target.value);
			if (value > 1) {
				value--;
				target.value = value;
				const total = price * value;
				quantitySpan.textContent = value;
				totalPriceSpan.textContent = '₩' + total;
			}
		}

		function increment(e) {
			const btn = e.target.parentNode.parentElement
					.querySelector('button[data-action="decrement"]');
			const target = btn.nextElementSibling;
			let value = Number(target.value);
			if (value < 10) {
				value++;
				target.value = value;
				const total = price * value;
				quantitySpan.textContent = value;
				totalPriceSpan.textContent = '₩' + total;
			}
		}

		const decrementBtn = document
				.querySelector('button[data-action="decrement"]');
		const incrementBtn = document
				.querySelector('button[data-action="increment"]');
		decrementBtn.addEventListener('click', decrement);
		incrementBtn.addEventListener('click', increment);

		function confirmPurchase() {

			if (confirm("구매하시기 전 가격과 수량을 확인해주세요.")) {
				// 예를 선택한 경우 처리할 로직을 여기에 작성합니다.
				let quantity = quantityInput.value;
        		let totalPrice = totalPriceSpan.textContent.replace('₩','');
       			window.location.href = "/purchase?quantity=" + quantity + "&totalPrice=" + totalPrice;
				
			}
		}
	</script>

</body>
</html>