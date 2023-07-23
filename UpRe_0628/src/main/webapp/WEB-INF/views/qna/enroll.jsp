<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna/enroll.css">
<script src="https://kit.fontawesome.com/6725ee7e5c.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- 헤더 영역 -->
	
			<%@ include file="../header.jsp"%>
	
		<br><br>

	<div class="alldiv" align="center">
		<h1>1:1 문의 작성하기</h1>
		<form id="qna-form" action="/qna/enroll" method="post">
		<input type="hidden" name="id" value="${member.id}"/>
			<div class="input_wrap">
			<div class="note">
    <p>제품 사용, 오염, 전용 박스 손상, 라벨 제거, 사은품 및 부속 사용/분실 시, 교환/환불이 불가능합니다.</p>
    <p>교환을 원하시는 상품의 재고가 부족 시, 교환이 불가합니다.</p>
    <p>고객님의 주문내역을 선택, 질문이 필요한 상품을 선택하시면 1:1상담이 가능합니다.</p>
    <p>주문취소/교환/환불은 마이페이지>주문내역에서 신청하실 수 있습니다.</p>
    <p>1:1문의 처리 내역은 답변여부를 통해 확인하실 수 있습니다.</p>
    <p>상품 정보관련 문의는 해당 상품 문의에 남기셔야 빠른 답변이 가능합니다.</p><hr><br>
</div>
				<button id="delivery-button" type="button"
					onclick="selectCategory('delivery')" class="category-button">배송</button>
				<button id="order-button" type="button"
					onclick="selectCategory('order')" class="category-button">주문/결제</button>
				<button id="cancellation-button" type="button"
					onclick="selectCategory('cancellation')" class="category-button">취소/교환/환불</button>
				<br><br>
				<button id="member-button" type="button"
					onclick="selectCategory('member')" class="category-button">회원정보</button>
				<button id="product-button" type="button"
					onclick="selectCategory('product')" class="category-button">상품확인</button>
				<button id="service-button" type="button"
					onclick="selectCategory('service')" class="category-button">서비스</button>
				<br>
				<br> <select name="category" id="category-select"
					class="category-select">
				</select> <br>
			</div>


			<div class="input_wrap1">
				<input name="answer" value="답변대기">
			</div>
			<br>

			<div class="input_wrap2">
				<label>작성자 : ${member.nickname}</label> <input type="hidden"
					name="writer" value="${member.nickname}">
			</div>

			<div class="input_wrap">
				<label class="label_css">문의 제목</label> <input name="title"
					class="title_css">
			</div>
			<br>
			<div class="input_wrap">
				<label class="label_css">문의 내용</label>
				<textarea class="textarea_css" rows="3" name="content"
					style="resize: none;"></textarea>
			</div>
			
			<br> <a href="/qna/list" class="btn btn_list"><i class="fa-solid fa-list"></i></a> <a
				href="javascript:void(0);" class="btn btn_submit" onclick="submitForm()"><i class="fa-solid fa-check"></i></a>
		</form>
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
	const categoryOptions = {
			  delivery: [
			    "문의 유형을 선택해 주세요.",
			    "배송 일정 문의",
			    "예약 배송 문의",
			    "기타 배송 문의"
			  ],
			  order: [
			    "문의 유형을 선택해 주세요.",
			    "주문 문의",
			    "결제 문의",
			    "기타 주문/결제 문의"
			  ],
			  cancellation: [
			    "문의 유형을 선택해 주세요.",
			    "취소 문의",
			    "교환 문의",
			    "환불 문의"
			  ],
			  member: [
			    "문의 유형을 선택해 주세요.",
			    "회원 가입 문의",
			    "회원 정보 수정 문의",
			    "탈퇴 문의"
			  ],
			  product: [
			    "문의 유형을 선택해 주세요.",
			    "상품 재고 문의",
			    "상품 정보 문의",
			    "상품 리뷰 문의"
			  ],
			  service: [
			    "문의 유형을 선택해 주세요.",
			    "서비스 이용 문의",
			    "서비스 신청 문의",
			    "서비스 중단 문의"
			  ]
			};

			const categorySelect = document.getElementById("category-select");

			// 페이지 로드 시 배송 버튼을 선택한 상태로 설정
			window.addEventListener("load", function() {
			  selectCategory("delivery");
			 
			});
			
			

			function selectCategory(category) {
			  const options = categoryOptions[category];
			  if (options) {
			    categorySelect.innerHTML = "";
			    for (let i = 0; i < options.length; i++) {
			      const option = document.createElement("option");
			      option.text = options[i];
			      categorySelect.add(option);
			    }
			    categorySelect.style.display = "block";
			    categorySelect.value = options[0];
			  } else {
			    categorySelect.style.display = "none";
			  }

			  // 버튼 색상 변경
			  const buttons = document.querySelectorAll("button");
			  buttons.forEach(button => {
			    if (button.id === category + "-button") {
			      button.classList.add("button-selected");
			    } else {
			      button.classList.remove("button-selected");
			    }
			  });
			}

			function submitForm() {
				  // 필수 항목을 입력하는지 확인
				  var categorySelect = document.getElementById('category-select');
				  var titleInput = document.querySelector('input[name="title"]');
				  var contentTextarea = document.querySelector('textarea[name="content"]');

				  if (categorySelect.value === '' || titleInput.value === '' || contentTextarea.value === '') {
				    alert('모든 항목을 입력해주세요.');
				    return false; // 폼 전송 막기
				  }
				  
				  if (categorySelect.value === '문의 유형을 선택해 주세요.') {
				    alert('문의 유형을 선택해주세요.');
				    return false; // 폼 전송 막기
				  }

				  // 모든 항목이 입력되었으므로 폼 전송 진행
				  document.getElementById('qna-form').submit();
				}


			
	
	
</script>

</body>
</html>
