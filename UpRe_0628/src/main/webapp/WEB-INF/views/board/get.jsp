<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/get.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="table_wrap" align="center">
		<h1 class="head_title">
			<c:out value="${pageInfo.title}" />
		</h1>

		<div>
			<table class="post_table">
				<tr class="post_tr">
					<th><label>작성자</label></th>
					<th class="empty_space"><label>조회</label></th>
					<th><label>등록일</label></th>
					<th><c:choose>
							<c:when
								test="${member.id == like.id and like.like_check != null}">
								<img src="../resources/board/likeAft.png" alt="좋아요"
									class="like-cancel-button" />
								<img src="../resources/board/like.png" alt="좋아요"
									class="like-button" style="display: none;" />
							</c:when>
							<c:otherwise>
								<img src="../resources/board/like.png" alt="좋아요"
									class="like-button" />
								<img src="../resources/board/likeAft.png" alt="좋아요"
									class="like-cancel-button" style="display: none;" />
							</c:otherwise>
						</c:choose></th>
				<tr>
					<td><c:out value="${pageInfo.writer}" />
					<td><c:out value="${pageInfo.view_cnt}" /></td>
					<td><fmt:formatDate pattern="yyyy/MM/dd"
							value="${pageInfo.reg_date}" /></td>
					<td id="likeCountElement"><c:out value="${pageInfo.like_cnt}" /></td>
				</tr>
			</table>
		</div>
		<!-- 글 내용 영역 -->
		<div class="content_area">
			<hr>
			<c:if test="${not empty pageInfo.imgurl}">
				<img style="width: 300px; height: auto;"
					src="../resources/img/${pageInfo.imgurl}">
			</c:if>
			<textarea readonly class="content_wrap">${pageInfo.content}</textarea>
		</div>

		<!-- 댓글 영역 전체 감싸는 div -->
		<div class="re_all">
			<hr>
			<!-- 댓글 보이는 영역 -->
			<div>
				<c:forEach items="${replyList}" var="reply">
					<form class="org_reply_form" method="post">
						<div>
							<table class="re_table">
								<tr class="org-row" data-rno="${reply.rno}">
									<td class="nickname-cell">${reply.writer}</td>
									<td class="content-cell">${reply.content}</td>
									<td class="date_cell"><fmt:formatDate
											value="${reply.regdate}" pattern="yyyy-MM-dd" /></td>
									<td class="edit-cell"><c:if test="${member.id != null }">
											<button type="button" class="replyReplyBtn"
												aria-expanded="false" id="re_table_btn">답글</button>
										</c:if></td>
									<td class="edit-cell"><c:if
											test="${member.id == reply.id}">
											<button type="button"
												onclick="toggleDivVisibility(event, ${reply.rno})"
												class="re_option_btn">
												<b>…</b>
											</button>
											<div style="display: none;" id="reply_option_${reply.rno}">
												<button type="button" class="replyUpdate"
													onclick="showEditField(${reply.rno})" id="re_table_btn">수정</button>
												<button type="button" class="replyDeleteBtn delete"
													data-rno="${reply.rno}"
													data-rreply-exists="${rreplyExistMap[reply.rno]}"
													id="re_table_btn">삭제</button>
											</div>
										</c:if></td>
								</tr>
								<!-- 댓글 수정창 -->
								<tr class="edit-row" data-rno="${reply.rno}">
									<td class="nickname-cell">${reply.writer}</td>
									<td><textarea rows="3" name="content" class="rre_content">${reply.content}</textarea></td>
									<td class="date_cell"><fmt:formatDate
											value="${reply.regdate}" pattern="yyyy-MM-dd" /></td>
									<td class="edit-cell"><button type="button"
											id="re_table_btn" class="replyUpdateBtn">수정</button></td>
									<td class="edit-cell"><button type="button"
											id="re_table_btn" class="update_delete">취소</button></td>
								</tr>
							</table>

						</div>
					</form>

					<!-- 댓글에 대댓글 달기 -->
					<form action="/board/writeRreply" method="post">
						<input type="hidden" name="id" value="${member.id}"> <input
							type="hidden" name="writer" value="${member.nickname}"> <input
							type="hidden" name="board_no"
							value='<c:out value="${pageInfo.board_no}"/>'> <input
							type="hidden" name="rno" value='<c:out value="${reply.rno}"/>'>
						<div class="reply_div" style="display: none;">
							<table class="re_input_table">
								<tr class="reply-row" data-rno="${reply.rno}">
									<th colspan="2" class="re_writer">re:${member.nickname}</th>
								<tr />
								<tr>
									<td class="re_content"><textarea rows="3" name="content"
											class="en_content"></textarea></td>
									<td class="re_input_btn">
										<button type="submit" class="input_btn">등록</button>
									</td>
								</tr>
							</table>
						</div>
					</form>

					<!-- 대댓글 -->
					<form class="re_reply_form" method="post">
						<div>
							<c:forEach items="${rreplyList}" var="rreply">
								<table class="rre_table">
									<c:if test="${reply.rno == rreply.rno}">
										<tr class="org-row" data-rrno="${rreply.rrno}">
											<td class="nickname-cell">&nbsp;&nbsp;re:${rreply.writer}</td>
											<td class="content-cell">${rreply.content}</td>
											<td class="date_cell"><fmt:formatDate
													value="${rreply.regdate}" pattern="yyyy-MM-dd" />
											<td class="edit-cell"><c:if
													test="${reply.rno == rreply.rno && member.id != null}">
													<button type="button" class="replyReplyBtn"
														id="re_table_btn">답글</button>
												</c:if></td>
											<td class="edit-cell"><c:if
													test="${reply.rno == rreply.rno && member.id == rreply.id}">
													<button type="button"
														onclick="toggleDivVisibility2(event, ${rreply.rrno})"
														class="re_option_btn">
														<b>…</b>
													</button>
													<div style="display: none;"
														id="reply_option2_${rreply.rrno}">
														<button type="button" id="re_table_btn"
															class="replyUpdate">수정</button>
														<button type="button" class="replyDeleteBtn delete_re"
															id="re_table_btn">삭제</button>
													</div>
												</c:if></td>
										</tr>
										<!-- 대댓글 수정창 -->
										<tr class="edit-row" data-rrno="${rreply.rrno}">
											<td class="nickname-cell">${rreply.writer}</td>
											<td><textarea rows="3" name="content"
													class="rre_content2">${rreply.content}</textarea></td>
											<td class="date_cell"><fmt:formatDate
													value="${rreply.regdate}" pattern="yyyy-MM-dd" /></td>
											<td class="edit-cell"><button type="button"
													id="re_table_btn" class="rreplyUpdateBtn">수정</button></td>
											<td class="edit-cell"><button type="button"
													id="re_table_btn" class="return">취소</button></td>
										</tr>
									</c:if>
								</table>
							</c:forEach>
						</div>
					</form>

					<!-- 대댓글에 대댓글 달기 -->
					<form action="/board/writeRreply" method="post">
						<input type="hidden" name="id" value="${member.id}"> <input
							type="hidden" name="writer" value="${member.nickname}"> <input
							type="hidden" name="board_no"
							value='<c:out value="${pageInfo.board_no}"/>'> <input
							type="hidden" name="rno" value='<c:out value="${reply.rno}"/>'>
						<div class="reply_div" style="display: none;">
							<table class="re_input_table">
								<tr class="reply-row" data-rno="${reply.rno}">
									<th colspan="2" class="re_writer">re:${member.nickname}</th>
								<tr />
								<tr>
									<td class="re_content"><textarea rows="3" name="content"
											class="en_content"></textarea></td>
									<td class="re_input_btn">
										<button type="submit" class="input_btn">등록</button>
									</td>
								</tr>
							</table>
						</div>
					</form>

				</c:forEach>

			</div>

			<!-- 댓글작성창 -->
			<hr>
			<div>
				<form action="/board/writeReply" method="post" name="replyForm">
					<c:if test="${member.id != null}">
						<input type="hidden" id="bno" name="board_no"
							value='<c:out value="${pageInfo.board_no}"/>'>
						<input type="hidden" name="id" value="${member.id}">
						<table class="re_input_table">
							<tr>
								<th colspan="2" class="re_writer"><input name="writer"
									class="en_nickname" value="${member.nickname}" readonly></th>
							</tr>
							<tr>
								<td class="re_content"><textarea rows="3" name="content"
										class="en_content"></textarea></td>
								<td class="re_input_btn"><button type="submit"
										id="replyWriteBtn" class="input_btn">작성</button></td>
							</tr>
						</table>

					</c:if>
				</form>
			</div>
		</div>

		<!-- 수정으로 넘어갈 때 가져가는 값 -->
		<div>
			<form id="infoForm" action="/board/modify" method="get">
				<input type="hidden" id="bno" name="board_no"
					value='<c:out value="${pageInfo.board_no}"/>'> <input
					type="hidden" name="pageNum"
					value='<c:out value="${cri.pageNum}"/>'> <input
					type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			</form>
		</div>

	</div>
	<br>
	<div align="center">
		<a class="btn" id="list_btn">목록</a>
		<c:if test="${member.id != null && member.id == pageInfo.id}">
			<a class="btn" id="modify_btn">수정</a>
		</c:if>
		<c:if test="${member.lev == 1 }">
			<a class="btn" id="delete_btn">삭제</a>
		</c:if>
	</div>

	<%@ include file="../footer.jsp"%>
	<script>
	
	//=========================본 게시물 목록 수정===========================//
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
		    form.find("#board_no").remove();
		    if ("${pageInfo.category}" === "Honey Tips") {
		        form.attr("action", "/board/list");
		    } else if ("${pageInfo.category}" === "Reviews") {
		        form.attr("action", "/board/list2");
		    }
		    form.submit();
		});

		$("#modify_btn").on("click", function(e) {
			
			form.attr("action", "/board/modify");

			form.submit();
		});
		$("#delete_btn").on("click", function(e) {
			  e.preventDefault(); // 이벤트 기본 동작 방지

			  var confirmDelete = confirm("게시물을 삭제하시겠습니까?");
			  if (confirmDelete) {
			    form.attr("action", "/board/delete");
			    form.attr("method", "post");

			    // Hidden input 추가
			    var hiddenInput = $('<input type="hidden" id="bno" name="board_no">');
			    hiddenInput.val('<c:out value="${pageInfo.board_no}"/>');
			    form.append(hiddenInput);

			    form.submit();
			  }
			});


		
		//========================답글 보이기ㅣㅣ===========================//
		
		var buttons = document.querySelectorAll(".replyReplyBtn");

		buttons.forEach(function(button) {
		  button.addEventListener("click", function() {
		    var replyDiv = button.closest("form").nextElementSibling.querySelector(".reply_div");
		    var currentValue = button.getAttribute("aria-expanded");
		    var newValue = currentValue === "true" ? "false" : "true";
		    button.setAttribute("aria-expanded", newValue);

		    if (newValue === "true") {
		      replyDiv.style.display = "block"; // 보이도록 설정
		    } else {
		      replyDiv.style.display = "none"; // 숨기도록 설정
		    }
		  });
		});
		
		
		//========================댓글 삭제===========================//
		// 댓글 삭제
		$('.delete').on('click', function(e) {
    var rno = $(this).data('rno'); // 댓글 번호 가져오기
    var rreplyExists = $(this).data('rreply-exists'); // 대댓글 존재 여부 확인

    if (rreplyExists) {
        alert("이 댓글에는 대댓글이 있으므로 삭제할 수 없습니다.");
        return;
    }

    if (confirm("삭제하시겠습니까?")) {
        $.ajax({
            type: 'POST',
            url: '/board/deleteReply',
            data: { rno: rno },
            success: function(response) {
                // 삭제 성공 시 실행할 코드
                var $row = $('.org-row[data-rno="' + rno + '"]'); // 댓글 행 가져오기
                $row.remove(); // 댓글 행 제거
            },
            error: function(xhr, status, error) {
                // 오류 발생 시 실행할 코드
            }
        });
    }
});

		$('.delete_re').on('click', function(e) {
		    var rrno = $(this).closest('tr').data('rrno'); // 대댓글 번호 가져오기
		    var $row = $(this).closest('tr'); // 대댓글 행 가져오기

		    if (confirm("삭제하시겠습니까?")) {
		        $.ajax({
		            type: 'POST',
		            url: '/board/deleteRreply',
		            data: { rrno: rrno },
		            success: function(response) {
		                // 삭제 성공 시 실행할 코드
		                $row.remove(); // 대댓글 행 제거
		                location.reload(); // 페이지 리로드
		            },
		            error: function(xhr, status, error) {
		                // 오류 발생 시 실행할 코드
		            }
		        });
		    }
		});



		
		
		//========================댓글 수정===========================//
		
		// 댓글 수정 버튼을 클릭할 때 edit-row 보이기, org-row 숨기기
		 $('.replyUpdate').on('click', function() {
		   var rno = $(this).closest('tr').data('rno');
		   $('.edit-row[data-rno="' + rno + '"]').show();
		   $('.org-row[data-rno="' + rno + '"]').hide();
		 });

		 // 댓글 취소하기 버튼을 클릭할 때 org-row 보이기, edit-row 숨기기
		 $('.update_delete').on('click', function() {
		   var rno = $(this).closest('tr').data('rno');
		   $('.edit-row[data-rno="' + rno + '"]').hide();
		   $('.org-row[data-rno="' + rno + '"]').show();
		   // 취소된 댓글의 옵션 div를 숨김 처리
		   var replyOptionDiv = $('#reply_option_' + rno);
		   replyOptionDiv.hide();
		 });
		 
		// 대댓글 수정 버튼을 클릭할 때 edit-row 보이기, org-row 숨기기
		 $('.replyUpdate').on('click', function() {
		   var rrno = $(this).closest('tr').data('rrno');
		   $('.edit-row[data-rrno="' + rrno + '"]').show();
		   $('.org-row[data-rrno="' + rrno + '"]').hide();
		 });

		// 대댓글 취소하기 버튼을 클릭할 때 org-row 보이기, edit-row 숨기기
		 $('.return').on('click', function() {
		   var rrno = $(this).closest('tr').data('rrno');
		   $('.edit-row[data-rrno="' + rrno + '"]').hide();
		   $('.org-row[data-rrno="' + rrno + '"]').show();
		   // 취소된 대댓글의 옵션 div를 숨김 처리
		   var replyOptionDiv = $('#reply_option2_' + rrno);
		   replyOptionDiv.hide();
		 });

		// 댓글 수정하기 버튼을 클릭할 때 AJAX 요청 보내기
		$('.replyUpdateBtn').on('click', function() {
  		var rno = $(this).closest('.edit-row').data('rno');
  		var content = $(this).closest('.edit-row').find('textarea.rre_content').val();

  		// 수정 확인 메시지 표시
  		var confirmation = confirm('수정하시겠습니까?');
 		 if (confirmation) {
    		// AJAX 요청 보내기
   		 $.ajax({
      		type: 'POST',
      		url: '/board/updateReply',
      		data: {
			rno: rno,
        		content: content
      		},
     		 success: function(response) {		
      		  // 요청이 성공한 경우의 동작
        // 화면을 갱신하는 로직 수행
        	var orgRow = $('.org-row[data-rno="' + rno + '"]');		 
        		orgRow.find('.content-cell').text(content);
        		orgRow.find('.edit-status').show(); // 수정됨 텍스트 보이기
       		 orgRow.show();
       		 $('.edit-row[data-rno="' + rno + '"]').hide();

       		 // 수정된 댓글의 옵션 div를 숨김 처리
       		 var replyOptionDiv = $('#reply_option_' + rno);
       		 replyOptionDiv.hide();
     		 },
     		 error: function(xhr, status, error) {
        		// 요청이 실패한 경우의 동작
        		// 오류 처리 및 예외 상황 대응
      		  		console.error(error);
     		 }
  		  });
	 	 }
		});

		
		$('.rreplyUpdateBtn').on('click', function() {
			  var rrno = $(this).closest('.edit-row').data('rrno');
			  var content = $(this).closest('.edit-row').find('textarea.rre_content2').val();

			  // 수정 확인 메시지 표시
			  var confirmation = confirm('수정하시겠습니까?');
			  if (confirmation) {
			    // AJAX 요청 보내기
			    $.ajax({
			      type: 'POST',
			      url: '/board/updateRreply',
			      data: {
			        rrno: rrno,
			        content: content
			      },
			      success: function(response) {
			        // 요청이 성공한 경우의 동작
			        // 화면을 갱신하는 로직 수행
			        var orgRow = $('.org-row[data-rrno="' + rrno + '"]');
			        orgRow.find('.content-cell').text(content);

			        orgRow.show();
			        $('.edit-row[data-rrno="' + rrno + '"]').hide();

			        // 수정된 댓글의 옵션 div를 숨김 처리
			        var replyOptionDiv = $('#reply_option2_' + rrno);
			        replyOptionDiv.hide();
			      },
			      error: function(xhr, status, error) {
			        // 요청이 실패한 경우의 동작
			        // 오류 처리 및 예외 상황 대응
			        console.error(error);
			      }
			    });
			  }
			});


		 $('.like-button').on('click', function() {
			    var $likeButton = $(this);
			    var $cancelButton = $likeButton.siblings('.like-cancel-button');
			    var isExpanded = $likeButton.attr('aria-expanded') === 'true';

			    if (!isExpanded) {
			        if (${member.id == null}) {
			            alert('로그인이 필요합니다.');
			            return false;
			        }

			        // 좋아요 등록 처리
			        var board_no = parseInt("${pageInfo.board_no}");
			        var id = "${member.id}";
			        var likeCheck = "Y"; // like_check 값을 변수에 저장

			        $.ajax({
			            type: 'POST',
			            url: '/board/likeCheck',
			            data: { board_no: board_no, action: 'like', id: id, like_check: likeCheck },
			            success: function(response) {
			                $likeButton.attr('aria-expanded', 'true');
			                $likeButton.hide();
			                $cancelButton.show();
			                // 등록 성공 시 실행할 코드
			            },
			            error: function(xhr, status, error) {
			                // 오류 발생 시 실행할 코드
			            }
			        });
			    }
			});
		 
		


		 $('.like-cancel-button').on('click', function() {
			    var $cancelButton = $(this);
			    var $likeButton = $cancelButton.siblings('.like-button');
			    
			    // 좋아요 취소 처리
			    var board_no = parseInt("${pageInfo.board_no}");
			    var id = "${member.id}";

			    $.ajax({
			        type: 'POST',
			        url: '/board/deleteLike',
			        data: { board_no: board_no, action: 'cancel', id: id },
			        success: function(response) {
			            $likeButton.attr('aria-expanded', 'false');
			            $likeButton.show();
			            $cancelButton.hide();
			            // 취소 성공 시 실행할 코드
			            
			        },
			        error: function(xhr, status, error) {
			            // 오류 발생 시 실행할 코드
			        }
			    });
			});
		 
		 function toggleDivVisibility(event, rno) {
			    event.preventDefault();
			    var div = document.getElementById("reply_option_" + rno);
			    div.style.display = (div.style.display === "none") ? "block" : "none";
			}

		 

		 function toggleDivVisibility2(event, rrno) {
			    event.preventDefault();
			    var div = document.getElementById("reply_option2_" + rrno);
			    div.style.display = (div.style.display === "none") ? "block" : "none";
			}
		 
	</script>


</body>
</html>