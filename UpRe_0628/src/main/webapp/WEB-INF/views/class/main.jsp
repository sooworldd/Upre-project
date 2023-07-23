<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.image-wave-border {
  overflow: hidden;
  position: relative;
  display: inline-block;
}

.image-wave-border:before {
  content: "";
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  height: 3px;
  background: linear-gradient(90deg, transparent, #000);
  visibility: hidden;
  transform: scaleX(0);
  transition: visibility 0s, transform 0.3s ease-in-out;
  transform-origin: left;
}

.image-wave-border:hover:before {
  visibility: visible;
  transform: scaleX(1);
}

.center {
	display: flex;
	justify-content: center;
	align-items: center;
}



.search-wrap {
	text-align: center;
	margin-bottom: 20px;
}

.page-info-wrap {
	text-align: center;
}

.page-info {
	display: inline-block;
	list-style-type: none;
	padding: 0;
	margin: 10px;
}

.page-info-btn {
	display: inline-block;
	margin: 5px;
	padding: 5px;
	border: 1px solid black;
	text-decoration: none;
	color: #000;
}

.page-info-btn.active {
	font-weight: bold;
}

.search_option {
	width: 140px;
	height: 30px;
	font-size: 15px;
	border-radius: 8px;
	border: none;
	background: #e0e0e0;
	font-family: 'GangwonEdu_OTFBoldA';
}

.search_box {
	width: 300px;
	height: 28px;
	border-radius: 8px;
	border: none;
	background: #e0e0e0;
	font-family: 'GangwonEdu_OTFBoldA';
}

.search_btn {
	width: 80px;
	height: 30px;
	font-size: 17px;
	border: none;
	border-radius: 8px;
	font-family: 'GangwonEdu_OTFBoldA';
	background: #e0e0e0;
	cursor: pointer;
}

.main {
	font-family: 'GangwonEdu_OTFBoldA';
}

.join-button {
	margin-top: 20px;
}

.classname {
	font-family: 'GangwonEdu_OTFBoldA';
}

.image-wave-border {
	overflow: hidden;
	position: relative;
	display: inline-block;
}

.image-wave-border:before {
	content: "";
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	height: 3px;
	background: linear-gradient(90deg, transparent, #000);
	visibility: hidden;
	transform: scaleX(0);
	transition: visibility 0s, transform 0.3s ease-in-out;
	transform-origin: left;
}

.image-wave-border:hover:before {
	visibility: visible;
	transform: scaleX(1);
}

.image-container {
  width: 400px;
  height: 400px;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.image-container img {
  transition: transform 0.3s ease;
  width: 100%;
  object-fit: contein; /* Maintain aspect ratio and fill the container */
}


.image-container:hover img {
  transform: scale(1.2);
}

.classname1{
  font-size: 20px; 
  color: black; 
  text-shadow: 0 0 5px #blue;
  width:400px;
}



</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <br>
    <br>
    <br>

    <form id="joinclass">
        <table align="center">
            <tr>
                <c:forEach items="${list}" var="item" varStatus="status">
                    <input type="hidden" name="id" value="${member.id}">
                    <input type="hidden" name="class_id" value="${item.class_id}">
                    <input type="hidden" name="class_name" value="${item.class_name}">
                    <input type="hidden" name="class_img" value="${item.class_img}">
                    <input type="hidden" name="class_peopleno" value="${item.class_peopleno}">
                    <input type="hidden" name="view" value="${item.view_cnt}">

                    <td>
                        <a class="move image-wave-border" href="#" data-class-id="${item.class_id}">
                            <div class="image-container">
                                <img src="../resources/img/${item.class_img}" alt="Class Image">
                            </div>
                        </a>

                        <br>
                        <div class="classname">
                            <div class="classname1">
                                <c:out value="${item.class_name}" />
                            </div>
                            <br>
                             모집인원: <c:out value="${classCounts[item.class_id]}"/> /<c:out value="${item.class_peopleno}" />
                            <br>
                            조회수: <c:out value="${item.view_cnt}" />
                        </div>
                        <fmt:formatDate pattern="yyyy/MM/dd" value="${item.reg_date}" />
                        <br>
                    </td>

                    <c:if test="${(status.index + 1) % 3 == 0 || status.last}">
                        </tr><tr>
                    </c:if>
                </c:forEach>
            </tr>
        </table>



	</form>
	<br>
	<div class="center search-wrap">
    <form id="searchForm">
        <div class="search_area">
            <select name="type" class="search_option">
                <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/> >검색 기준</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/> >제목</option>
                <option value="A" <c:out value="${pageMaker.cri.type eq 'A'?'selected':'' }"/> >내용</option>
                <option value="NA" <c:out value="${pageMaker.cri.type eq 'NA'?'selected':'' }"/> >제목 + 내용</option>
            </select>
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }" class="search_box">
            <button type="button" class="search_btn">search</button>
        </div>
    </form>
   	&nbsp;
   	
    <!-- 등록하기 버튼 추가 -->
    <div>
    	<form action="/class/insert" method="get">
 			<c:if test="${member.lev == 1}">
        		<button class="search_btn" >등록하기</button>
        	</c:if>
    	</form>
    </div>
    
</div>

       
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
 
</div>


	<%@ include file="../footer.jsp"%>
	
	
	<!-- JavaScript 코드 -->
	<script>
		let moveForm = $("#moveForm");

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/admin/memberManage");
			moveForm.submit();
		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
		
		 $(document).ready(function() {
		        $(".move").on("click", function(e) {
		            e.preventDefault();
		            var classId = $(this).data("class-id");
		            window.location.href = "/class/" + classId;
		        });
		    });
		 
	</script>



</body>
</html>
