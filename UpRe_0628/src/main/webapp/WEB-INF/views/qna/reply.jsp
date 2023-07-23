<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.vam.model.QnaVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna/reply.css">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6725ee7e5c.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 헤더 영역 -->
				<%@ include file="../header.jsp"%>
				<br>
	<div class="alldiv" align="center">		
<h1>[관리자] 문의 답변</h1>
<form id="replyForm" action="/qna/reply" method="post">
<div class="input_wrap">
    <label>문의 유형 : <c:out value="${pageInfo.category}"/> &nbsp;&nbsp;&nbsp;&nbsp; 문의 번호 : <c:out value="${pageInfo.bno}"/>번</label>
    <input type="hidden" name="bno" value="${pageInfo.bno}">
</div>

<div class="input_wrap" id="input_wrap2">
	    <label class="label_css">문의 제목</label>
	    <input name="title" class="title_css" style="width: 800px; height: 30px;" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
	    <label class="label_css">문의 내용</label>
	    <textarea rows="3" class="textarea_css" style="resize: none;" name="content" readonly ><c:out value="${pageInfo.content}"/></textarea>
	</div>

<div class="input_wrap">
    <label class="label_css">[관리자] 답변 입력</label>
    <textarea rows="3" class="textarea_css" style="resize: none;" name="reple" id="reple">${pageInfo.reple}</textarea> <!-- 수정: textarea에 id 추가 -->
</div>
	
<div class="btn_wrap">
    <a class="btn btn_list" id="list_btn" href="/qna/list"><i class="fa-solid fa-list"></i></a> 
    <!-- 변경: 답변 작성 후 해당 글의 상세 페이지로 이동 -->
    <a class="btn btn_re" id="re_btn"><i class="fa-solid fa-check"></i></a> <!-- 수정: onclick 이벤트 추가 -->
</div>
</form>

<form id="infoForm" action="/qna/modify" method="get">
    <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
    <input type="hidden" name="type" value="${cri.type }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
</form>
</div>
<%@ include file="../footer.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	  $("#re_btn").click(function() {
	    $("#replyForm").submit(); // replyForm을 제출하여 action에 정의된 URL로 이동
	  });
	});


    $(document).ready(function(){
        // 현재 날짜를 가져오는 함수
        function getCurrentDate() {
            var date = new Date();
            var year = date.getFullYear();
            var month = ("0" + (date.getMonth() + 1)).slice(-2);
            var day = ("0" + date.getDate()).slice(-2);
            return year + "/" + month + "/" + day;
        }

        // 문서가 로드될 때 현재 날짜를 설정
        $("#regdate").val(getCurrentDate());
    });
</script>
</body>
</html>
