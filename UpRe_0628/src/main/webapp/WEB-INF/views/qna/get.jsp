     	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/qna/get.css">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	  <script src="https://kit.fontawesome.com/6725ee7e5c.js" crossorigin="anonymous"></script>
	</head>
	<style>
	.title_css{
	font-family: 'GangwonEdu_OTFBoldA';
	border-radius: 10px;
	font-size: 20px;
	}
	.textarea_css{
	border-radius: 10px;
	}
	
	</style>
	<body>
	<!-- 헤더 영역 -->
				<%@ include file="../header.jsp"%>
				<br>
	
	
	<div class="alldiv" align="center">
	<h1>1:1 문의 내용</h1>
	<div class="input_wrap">
	    <label>문의 유형 : <c:out value="${pageInfo.category}"/> &nbsp;&nbsp;&nbsp;&nbsp; 문의 번호 : <c:out value="${pageInfo.bno}"/>번</label>
	</div>
	
	<div class="input_wrap" id="input_wrap2">
	    <label class="label_css">문의 제목</label>
	    <input name="title" class="title_css" style="width: 800px; height: 30px;" readonly="readonly" value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
	    <label class="label_css">문의 내용</label>
	    <textarea rows="3" class="textarea_css" style="resize: none;" name="content" readonly ><c:out value="${pageInfo.content}"/></textarea>
	</div>
	
	<c:if test="${pageInfo.reple != null}">
	    <div class="input_wrap">
	        <label class="label_css">문의 답변</label>
	        <textarea rows="3" class="textarea_css" style="resize: none;" name="reply" readonly>${pageInfo.reple}</textarea>
	    </div>
	</c:if>
	
	
	<div class="input_wrap">
	    <label>문의 작성자 : <c:out value="${pageInfo.writer}"/> &nbsp;&nbsp;&nbsp;&nbsp;
	     문의 등록일 : <fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/></label>
	</div>
			
	<div class="btn_wrap">
    <a class="btn btn_list" id="list_btn"><i class="fa-solid fa-list"></i></a>
    <c:if test="${member.id == pageInfo.id || member.lev == 1}">
        <a class="btn btn_modify" id="modify_btn"><i class="fa-solid fa-pen"></i></a>
    </c:if>
    <c:if test="${member.lev == 1}">
        <a class="btn btn_reply" id="reply_btn"><i class="fa-solid fa-right-left"></i></a>
    </c:if>
</div>
	<form id="infoForm" action="/qna/modify" method="get">
	    <input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
	    <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	    <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	    <input type="hidden" name="type" value="${cri.type }">
	    <input type="hidden" name="keyword" value="${cri.keyword }">
	</form>
	
	</div>
	<%@ include file="../footer.jsp"%>
	<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
	    form.find("#bno").remove();
	    form.attr("action", "/qna/list");
	    form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
	    form.attr("action", "/qna/modify");
	    form.submit();
	});
	
	$("#reply_btn").on("click", function(e){
	    form.attr("action", "/qna/reply");
	    form.submit();
	});
	</script>
	</body>
	</html>
