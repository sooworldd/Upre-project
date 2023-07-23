<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna/faq.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/js/qna/faq.js"></script>

<script>
$(document).ready(function() {
     $(".question").click(function() {
       $(this).next(".answer").slideToggle();
       $(this).toggleClass("active");
     });
     
    $(".answer").hide();
   });
</script>

  
</head>
<body>
      <%@ include file="../header.jsp"%>

<div class="alldiv" align="center">
<h1><a href="/qna/list" data-text="Q&A" class="banner_button atag">Q&A</a>
   <a href="/qna/faq" data-text="FAQ" class="banner_button2 atag">FAQ</a></h1>
<br><br><br><br><h2>자주 묻는 질문</h2><br>


<button class="question">아이디와 비밀번호가 기억 나지 않아요!</button>
  <div class="answer">
    <p>로그인 화면에서  아이디 찾기/비밀번호 찾기를 통해 확인 가능합니다.<br>
아이디 찾기는 아래 3가지 방법 중 하나로 진행해 주세요.<br><br><br>
■ 휴대전화<br>
회원 정보에 등록된 본인의 휴대전화 번호를 인증하는 방법입니다.<br><br><br>
■ 이메일<br>
회원 정보에 등록된 본인의 이메일 주소를 인증하는 방법입니다.<br><br><br>
■ 본인인증<br>
이용 중인 통신사와 휴대전화 번호를 인증하는 방법입니다.<br><br><br>
※ 비밀번호 재설정을 완료한 휴면 회원은 휴면 해제 및 탈퇴 신청이 취소됩니다.<br>
※ 비밀번호 찾기는 휴대전화 본인 인증으로만 가능합니다.<br><br></p>
  </div><br><br>

<button class="question">회원 정보 수정은 어디서 하나요?</button>
  <div class="answer">
    <p>회원 정보 수정은 아래 경로로 직접 변경 가능합니다. <br><br><br>
■ 회원 정보 수정 <br>
모바일(앱/웹) : 마이페이지 > 내 정보 관리 > 오른쪽 위 톱니바퀴<br>
PC(웹) : 마이페이지 > 회원정보 변경<br>
※ 원활한 주문 및 배송을 위해 회원 정보를 정확하게 기재해 주세요.<br><br><br>
■ 이름 개명 시 수정<br>
모바일(앱/웹) : 마이페이지 > 내 정보 관리 > 오른쪽 위 톱니바퀴 > 회원 정보 > 이름/휴대전화/생년월일<br>
PC(웹) : 마이페이지 > 회원정보 변경 > 이름수정<br><br><br>
※ 개명한 이름이 NICE 평가 정보에 등록되어 있어야 합니다.<br>
※ 본인인증을 통해 NICE 평가 정보 적용된 이름(실명)을 기준으로 변경됩니다.<br><br></p>
  </div><br><br>

<button class="question">구매했을 때 보다 가격이 떨어졌어요 차액 환불이 되나요?</button>
  <div class="answer">
    <p>상품 금액은 온라인 판매처 특성상 유동적으로 변동될 수 있어 차액 환불은 가능하지 않습니다. <br><br>
※ 판매 가격 변동으로 인한 교환(환불) 신청 시 반품 배송비는 회원님 부담으로 진행됩니다. <br><br>
※ 출고 처리중인 경우 취소는 가능하지 않습니다.<br><br></p>
  </div><br><br>

<button class="question">재고가 없어요. 언제쯤 구입할 수 있을까요?</button>
  <div class="answer">
    <p>품절 상품 재입고 여부 및 일정은 정확한 확인이 가능하지 않지만<br> 재입고 알림을 등록하면 알림톡으로 확인 할 수 있습니다.  <br>
알림 신청 방법은 아래내용을 확인해 주세요.<br>

■ 재입고 알림 신청<br>
모바일(앱) : 상품 선택 > 구매하기 > 재입고 알림 받기 선택<br><br>
※ 재입고 알림 신청은 APP에서만 신청이 가능합니다.<br>
※ 재고 입고 수량에서 요청순서에 따라 순차적으로 발송 됩니다.<br>
※ 재입고 알림 버튼이 보이지 않거나 재입고 관련 상세확인은 상품 페이지의 상품문의를 이용해 주세요.<br><br></p>
  </div><br><br>

<button class="question">결제하는 방법에 따라 할인 이벤트가 있나요?</button>
  <div class="answer">
    <p>결제하는 수단에 따라 할인 이벤트가 있습니다. <br>
할인 이벤트 확인 하는 방법은 아래 경로를 확인 해주세요. <br><br>
■ 할인 이벤트 확인 경로 <br>
모바일(앱/웹) : 이벤트 > 혜택에서 확인 가능 <br>
PC(웹) : 세일 > 기획전 에서 확인 가능 <br><br>
할인 이벤트 바로 가기<br>
※ 카드사 예산 소진 시 조기 종료 될 수 있습니다. <br>
※ 결제수단에 따라 이벤트 적용 조건이 다르기 때문에 상세보기에서 주의사항을 꼭 확인해 주세요.<br><br></p>
  </div><br><br>

<button class="question">결제 방법에는 어떤 것들이 있나요?</button>
  <div class="answer">
    <p>주문서 작성 시 무신사페이 또는 일반결제로 결제 항목에서 선택이 가능합니다.<br><br> 
■ UpRe페이 <br>
신용카드 또는 은행 계좌 연결해서 간편하게 결제할 수 있습니다.<br><br>
■ 일반 결제 <br>
신용카드, 가상계좌, 계좌이체, Apple pay, 휴대폰결제, 토스 페이, 카카오 페이, 네이버 페이, 페이코 결제가 있습니다. <br><br>
결제 관련 프로모션 바로 가기<br><br>
※ 신용카드 결제 선택 시 안전 결제(ISP) 또는 안심클릭으로 결제됩니다. (30만원 이상 결제 시 공인인증서 필요)<br>
※ 해외 카드(VISA, MasterCard, JCB만 해당)도 결제 가능합니다.<br>
※ 원하는 결제 수단으로 체크 후 결제 가능합니다. (단, 복합 결제는 불가) <br>
※ 그 외 문의 및 오류 관련 문의는 해당 결제 수단 고객센터로 문의해 주세요. <br>
※ 주문 완료 후 결제 방법 변경은 가능하지 않습니다. (입금 확인 상태에서 취소 후 다시 주문)<br><br></p>
  </div><br><br>

<button class="question">일반 배송 상품은 언제 배송 되나요?</button>
  <div class="answer">
    <p>일반배송은 브랜드마다 일정이 다르고 평일 기준으로 출고 됩니다. <br>
출고 일정은 상품의 상세페이지 출고 정보에서 확인 가능합니다. <br><br>
※ 평일 기준 출고로 연휴 및 공휴일은 배송일에서 제외됩니다.<br>
※ 무신사스토어는 전 상품 100% 무료 배송입니다. <br>
※ 배송 지연 상품의 경우 상품명에 지연으로 아이콘이 표시됩니다. <br>
※ 출고 지연 발생 시에는 알림톡 또는 문자를 통해 안내해 드립니다.<br>
※ 주문 시 배송 메모에 배송 희망 일자를 작성하셔도 해당일에 지정 배송은 어렵습니다.<br><br></p>
  </div><br><br>

<button class="question">주문한 상품이 일부만 도착했어요!</button>
  <div class="answer">
    <p>상품에 따라 출고지가 다르기 때문에 여러 개 상품을 주문한 경우에는 각각 배송이 됩니다.<br>
      브랜드가 달라도 상품 주문 시 한 번에 결제할 수 있습니다.<br><br>
      아직 도착하지 않는 상품은 아래 경로에서 배송진행 상황을 확인해 주세요.<br><br></p>
  </div><br><br>

<button class="question">반품접수는 어떻게 하나요?</button>
  <div class="answer">
    <p>교환(환불) 접수 시 선택했던 방법으로 반품 접수해 주세요.<br><br>

■ 회수해 주세요<br>
자동회수 서비스로 택배기사가 요청한 회수지로 평일 기준 1일 ~ 3일 이내 방문합니다. <br>
※ 방문 전 택배 기사분이 연락 후 방문 예정이며, 비대면으로 상품을 전달할 때는 반품 상자를<br>
구분할 수 있도록 표시 후 회수 장소에 보관해 주세요.<br><br>

■ 직접 발송했어요<br>
상품을 받은 택배사와 같은 택배사로 고객님께서 직접 반품 예약을 해주셔야 합니다.<br>
상품 회수 완료 시 반송장 정보를 입력해 주세요.<br><br>

※ 계약된 택배사가 아닌 다른 택배사 이용 시 추가 비용 발생할 수 있고 2개 이상의 브랜드 반송 시, 각각 반송지로 보내주세요.<br>
※ 안내서에 배송비 동봉 등에 대한 내용이 있더라도, 동봉하면 안 됩니다.<br><br></p>
  </div><br><br>
  
  <button class="question">상품을 받았는데 교환하고 싶어요!</button>
  <div class="answer">
    <p>교환은 배송 완료 일자 포함 7일 이내일 경우에만 주문/배송/픽업 조회에서 접수 가능합니다.<br>
(예시 : 3월 8일 상품을 받으신 경우 3월 14일까지 교환 접수 가능)<br><br>
■ 교환 접수 경로<br>
모바일(앱/웹): 마이페이지 > 주문/배송/픽업 조회 > 교환 요청<br>
PC(웹): 마이페이지 > 주문 내역 조회 > 교환 요청<br><br>
1. 반품할 상품의 교환을 선택 해주세요.<br><br>
2. 반품 방법을 선택해 주세요.<br>
- 회수해 주세요 : 자동회수 서비스로 택배기사가 요청한 회수지로 평일 기준 1일 ~ 3일 이내 방문합니다.<br> 
- 직접 발송했어요 : 상품을 받은 택배사와 같은 택배사로 반품 예약해야 합니다. <br>
※ 반송장 번호가 아직 없다면 반송장 정보는 '다음에 등록하기'를 선택해 주세요. <br><br>
3. 교환 배송비를 선결제해야 합니다.<br>
신용카드 또는 가상 계좌 결제만 가능합니다.<br><br>
4. 상품은 받아본 그대로 포장해서 반품해 주셔야 합니다.<br><br>
※ 회원님의 사유로 교환 진행중인 상품이 품절될 경우, 반품비가 발생될 수 있고 이를 제외한 결제 금액이 환불 처리됩니다. <br><br></p>
  </div><br><br>

</div>
<%@ include file="../footer.jsp"%>
</body>
</html>