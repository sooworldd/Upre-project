<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Details</title>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.input_text {
	width: 200px;
	height: 30px;
	border: none;
	background-color: lightgray;
	border-radius: 8px;
	font-size: 15px;
	font-family: 'GangwonEdu_OTFBoldA';
}

th {
	font-family: 'GangwonEdu_OTFBoldA';
}

td {
	line-height: 40px;
	padding-left: 20px;
}

.update_btn {
	margin: 20px 10px 0 10px;
	border: none;
	font-weight: bold;
	font-size: 18px;
	cursor: pointer;
	background: white;
	font-family: 'GangwonEdu_OTFBoldA';
	
}

.update_btn:hover {
	background: black;
	color: white;
	border-radius: 8px;
}
</style>
</head>

<body align="center">
	<form id="update_form" method="post" onsubmit="return validateForm()">
		<div>
			<h2 class="text-center">회원 상세 정보</h2>
			<table align="center">
				<tr>
					<th>회원아이디</th>
					<td><input name="id" value="${member.id}" class="input_text"
						readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input name="name" value="${member.name}"
						class="input_text"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input name="nickname" value="${member.nickname}"
						class="input_text"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="gender" value="Male"
						${member.gender == 'Male' ? 'checked' : ''}>
						<label for="male">Male</label>
						<input type="radio" name="gender"
						value="Female" ${member.gender == 'Female' ? 'checked' : ''}>
						<label for="female">Female</label></td>

				</tr>
				<tr>
					<th>생일</th>
					<td><input type="date" name="birth" value="${member.birth}"
						class="input_text"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input name="phone" value="${member.phone}"
						class="input_text"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="mail" value="${member.mail}"
						class="input_text"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input name="addr1" value="${member.addr1}"
						id="address_kakao1" onclick="execution_daum_address()"
						class="input_text"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="addr2" value="${member.addr2}"
						id="address_kakao2" class="input_text" readonly></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input name="addr3" value="${member.addr3}"
						id="address_kakao3" class="input_text"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><b><fmt:formatDate value="${member.joindate}"
								pattern="yyyy/MM/dd" /></b></td>
				</tr>
			</table>
		</div>
		<input type="button" id="update" value="수정" class="update_btn">
		<input type="button" id="delete" value="삭제" class="update_btn">
	</form>
	<script>
		function validateForm() {
			let inputs = document.querySelectorAll('.input_text');
			for (let i = 0; i < inputs.length; i++) {
				if (inputs[i].value == "") {
					alert("모든 필드를 입력해주세요.");
					return false;
				}
			}
			return true;
		}

		$('#update').on('click', function(e) {
			if (confirm("수정하시겠습니까?")) {
				$('#update_form').attr('action', '/admin/memberUpdate');
				$('#update_form').submit();
			}
		});

		$('#delete').on('click', function(e) {
			if (confirm("삭제하시겠습니까?")) {
				$('#update_form').attr('action', '/admin/membeDelete');
				$('#update_form').submit();
			}
		});

		/* 다음 주소 연동 */
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								//  document.getElementById("sample6_extraAddress").value = extraAddr;
								addr += extraAddr;

							} else {
								//document.getElementById("sample6_extraAddress").value = '';
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//document.getElementById('sample6_postcode').value = data.zonecode;
							// document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.

							$("#address_kakao1").val(data.zonecode);
							$("#address_kakao2").val(addr);
							//  document.getElementById("sample6_detailAddress").focus();

							//상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
							$("#address_kakao3").attr("readonly", false);
							$("#address_kakao3").focus();
						}
					}).open();
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
		
	</script>
</body>
</html>
