	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/qna/list.css">
	<script
	  src="https://code.jquery.com/jquery-3.4.1.js"
	  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	  
	
	</head>
	<body>
	<!-- 헤더 영역 -->
			<%@ include file="../header.jsp"%>
			<br>
		
		
		
		
	<div class="table_wrap" align="center">
	<h1><a href="/qna/list" data-text="Q&A" class="banner_button">Q&A</a>
	<a href="/qna/faq" data-text="FAQ" class="banner_button2">FAQ</a></h1>
	<br><br>
	<h2>1:1 문의</h2>
	<c:forEach var="question" items="${questionList}">
	  <!-- 질문 게시물 내용 표시 -->
	  <div>
	    <h2>${question.title}</h2>
	    <p>${question.content}</p>
	    <!-- 답변 표시	 영역 -->
	    <div id="replyContainer_${question.id}">
	      <!-- 여기에 답변을 동적으로 추가할 예정 -->
	    </div>
	    <hr>
	  </div>
	</c:forEach>
	
	<div>
		
		<table>
			<thead>
				<tr>
					
					<th class="title_width">문의 제목</th>
					<th class="answer_width">답변여부</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="category_width">문의 유형</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
				
					<td>
						<a class="move" href='<c:out value="${list.bno}"/>'>
							<c:out value="${list.title}"/>
						</a>
					</td>
					
					<td>
	        <c:choose>
	          <c:when test="${list.answer == '답변완료'}">
	            <span class="answer_complete">${list.answer}</span>
	          </c:when>
	          <c:otherwise>
	            <c:out value="${list.answer}" />
	          </c:otherwise>
	        </c:choose>
	      </td>
	      
					<td><c:out value="${list.writer}"/></td>
	                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
	                <td><c:out value="${list.category}"/></td>
				</tr>
			</c:forEach>	
		</table>
		
		<div class="search_wrap">
			<div class="search_area">
		
				<select name="type" class="search_type">
					<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
					<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
					<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
					<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
				</select>
				
				<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
				<button>Search</button>
				<c:if test="${member.id != null }">
				<a href="/qna/enroll" class="top_btn">문의하기</a>
				</c:if>
			</div>
		</div>		
		
		<div class="pageInfo_wrap" >
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}" class="page_btn">Previous</a></li>
					</c:if>
				
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn" ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}" class="page_btn">${num}</a></li>
					</c:forEach>
				
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }" class="page_btn">Next</a></li>
					</c:if>	
					
					
					
				</ul>
			</div>
		</div>
		
	
		
		<form id="moveForm" method="get">	
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	
	
	
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
			
				
		</form>
	</div>
	</div>
	
	<%@ include file="../footer.jsp"%>
	
	<script>
	$(document).ready(function(){
		
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		console.log(result);
		
		function checkAlert(result){
			
			if(result === ''){
				return;
			}
			
			if(result === "enrol success"){
				alert("등록이 완료되었습니다.");
			}
			
			if(result === "modify success"){
				alert("수정이 완료되었습니다.");
			}
			
			if(result === "delete success"){
				alert("삭제가 완료되었습니다.");
			}		
		}	
		
	});
	
		let moveForm = $("#moveForm");
	
		$(".move").on("click", function(e){
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
			moveForm.attr("action", "/qna/get");
			moveForm.submit();
		});
	
		$(".pageInfo a").on("click", function(e){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/qna/list");
			moveForm.submit();
			
		});	
		
		
		$(".search_area button").on("click", function(e){
			e.preventDefault();
			
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			
			if(!type){
				alert("검색 종류를 선택하세요.");
				return false;
			}
			
			if(!keyword){
				window.location.href = "/qna/list";
				return false;
			}		
			
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
		
	</script>
	
	</body>
	</html>
	
	
