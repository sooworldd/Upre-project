<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/join.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
<body>
<%@ include file="../header.jsp"%>
	<br>
	<form id="join_form" method="post" name="frm">
		<main style="display: flex; justify-content: center;">
			<div class="mb-3"
				style="width: 400px; padding: 25px; background-color: lightgray; color: white;">
				<h4 align="center">
					<b>Join</b>
				</h4>
				<i class="bi bi-person"></i>
				<!-- 아이디 -->
				<input type="text" name="id" class="form-control" id="id_input"
					placeholder="ID"> <span class="final_id_ck1">아이디를
					입력해주세요.</span> <span class="final_id_ck2">아이디는 4~20자의 영문 소문자, 숫자만
					사용 가능합니다. </span> <span class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
					class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<!-- 비밀번호 -->
				<i class="bi bi-lock"></i> <input type="password" name="pw"
					class="form-control" id="pw_input" placeholder="Password">
				<span class="final_pw_ck1">비밀번호를 입력해주세요.</span> <span
					class="final_pw_ck2">비밀번호를 8자리 이상 입력해주세요.</span> <span
					class="final_pw_ck3">비밀번호는 영문, 숫자, 특수문자를 포함해야 합니다. </span> <input
					type="password" name="pw_check" class="form-control" id="pw_check"
					placeholder="Password-Check"><span class="final_pwck_ck">비밀번호가
					일치하지 않습니다.</span>
				<!-- 이름 -->
				<i class="bi bi-person-circle"></i> <input type="text" name="name"
					class="form-control" id="name_input" placeholder="Name"><span
					class="final_name_ck">이름을 입력해주세요.</span>
				<!-- 닉네임 -->
				<i class="bi bi-star"></i> <input type="text" name="nickname"
					class="form-control" id="nickname_input" placeholder="NickName"><span
					class="final_nickname_ck">닉네임을 입력해주세요.</span>
				<!-- 성별 -->
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gender-ambiguous" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M11.5 1a.5.5 0 0 1 0-1h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V1.707l-3.45 3.45A4 4 0 0 1 8.5 10.97V13H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V14H6a.5.5 0 0 1 0-1h1.5v-2.03a4 4 0 1 1 3.471-6.648L14.293 1H11.5zm-.997 4.346a3 3 0 1 0-5.006 3.309 3 3 0 0 0 5.006-3.31z"/>
</svg>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="male" value="Male" checked> <label
						class="form-check-label" for="male">Male</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="gender"
						id="female" value="Female"> <label
						class="form-check-label" for="female">Female</label>
				</div>
				<!-- 생일 -->
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-calendar-heart"
					viewBox="0 0 16 16">
  					<path fill-rule="evenodd" d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v11a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5ZM1 14V4h14v10a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1Zm7-6.507c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z" />
				</svg>
				<input type="date" name="birth" id="datePicker" class="form-control"><span
					class="final_birth_ck">생일을 입력해주세요.</span>
				<!-- 전화번호 -->
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
  					<path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z" />
				</svg>
				<input type="text" class="form-control" id="phone_input"
					name="phone" placeholder="Phone Number"><span
					class="final_phone_ck">전화번호를 입력해주세요.</span>
				<!-- 이메일 -->

				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-envelope-at" viewBox="0 0 16 16">
  					<path
						d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z" />
  					<path
						d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z" />
				</svg>
				<div class="mail_check_input_box" id="mail_check_input_box_false">
					<input type="text" class="form-control" id="mail" name="mail"
						placeholder="E-Mail"><span class="final_mail_ck1">이메일을
						입력해주세요.</span><span class="final_mail_ck2">이메일 형식이 잘못되었습니다.</span> <input
						type="text" class="form-control" placeholder="code"
						id="mail_check" disabled="disabled"><span
						class="final_mailCheck_ck">인증코드를 입력해주세요. </span> <span
						id="mail_check_input_box_warn"></span>
						<input type="button" class="mail_check_button" value="인증번호 전송"
						style="border:none; width:130px; font-weight:bold" align="center">
						<br>
				</div>

				<!-- 주소 영역 -->
				<i class="bi bi-pin-map"></i>
				<input type="text" class="form-control" id="address_kakao1" name="addr1"
					placeholder="Address" onclick="execution_daum_address()" readonly>
				<input type="text" class="form-control" id="address_kakao2" name="addr2" readonly> 
				<input type="text" class="form-control" id="address_kakao3" name="addr3"
					placeholder="Detailed Address">
				<span class="final_addr_ck">상세주소를 입력해주세요.</span>
				<br>
				<div align="center">
					<input type="submit" id="join_button" class="btn btn-light"
						value="가입하기" style="font-weight:bold">
				</div>
			</div>
		</main>


	</form>
	<%@ include file="../footer.jsp"%>
	<script>
		var code = "";

		var idCheck = false;
		var idckCheck = false;
		var pwCheck = false;
		var pwckCheck = false;
		var nameCheck = false;
		var nicknameCheck = false;
		var birthCheck = false;
		var phoneCheck = false;
		var mailCheck = false;
		var mailckCheck = false;
		var addrCheck = false;

		// 아이디 중복확인 및 유효성 검사
		$("#id_input").blur(function() {
			var id = $("#id_input").val(); // 아이디  

			// 정규 표현식 : 4자리 이상, 영문 대소문자, 숫자만 허용
			var idReg = /^[a-zA-Z0-9]{4,}$/;

			if (id === "") {
				$('.final_id_ck1').css('display', 'block');
				$('.final_id_ck2').css('display', 'none');
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_2').css("display", "none");
				idCheck = false;
			} else if (idReg.test(id)) {
				$('.final_id_ck1').css('display', 'none');
				$('.final_id_ck2').css('display', 'none');
				idCheck = true;

				// 아이디 중복 확인
				var data = {
					id : id
				} // '컨트롤에 넘길 데이터 이름' : '데이터(#id_input에 입력되는 값)'

				$.ajax({
					type : "post",
					url : "/member/idCheck",
					data : data,
					success : function(result) {
						if (result == 'success') {
							$('.id_input_re_1').css("display", "block");
							$('.id_input_re_2').css("display", "none");
							idckCheck = true;
							idCheck = true;
						} else if (result == 'empty') {
							$('.final_id_ck').css('display', 'block');
							$('.id_input_re_1').css("display", "none");
							$('.id_input_re_2').css("display", "none");
							idckCheck = false;
						} else {
							$('.id_input_re_2').css("display", "block");
							$('.id_input_re_1').css("display", "none");
							idckCheck = false;
						}
					}
				}); // ajax 종료    

			} else {
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_2').css("display", "none");
				if (id.length < 4) {
					$('.final_id_ck1').css('display', 'none');
					$('.final_id_ck2').css('display', 'block');
					idCheck = false;
				} else {
					$('.final_id_ck1').css('display', 'none');
					$('.final_id_ck2').css('display', 'block');
					idCheck = false;
				}
			}
		});

		/* 비밀번호 유효성검사 */
		$("#pw_input").blur(function() {
			var pw = $("#pw_input").val(); // 비밀번호
			var regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/; //비밀번호 조건

			if (pw == "") {
				$('.final_pw_ck1').css('display', 'block');
				$('.final_pw_ck2').css('display', 'none');
				$('.final_pw_ck3').css('display', 'none');
				pwCheck = false;
			} else if (pw.length < 8) {
				$('.final_pw_ck1').css('display', 'none');
				$('.final_pw_ck2').css('display', 'block');
				$('.final_pw_ck3').css('display', 'none');
				pwCheck = false;
			} else if (!regex.test(pw)) {
				$('.final_pw_ck1').css('display', 'none');
				$('.final_pw_ck2').css('display', 'none');
				$('.final_pw_ck3').css('display', 'block');
				pwCheck = false;
			} else {
				$('.final_pw_ck1').css('display', 'none');
				$('.final_pw_ck2').css('display', 'none');
				$('.final_pw_ck3').css('display', 'none');
				pwCheck = true;
			}
		});
		/* 비밀번호 확인 유효성검사 */
		$("#pw_check").blur(function() {
			var pw = $("#pw_input").val();
			var pwck = $("#pw_check").val();

			if (pwck == "") {
				$('.final_pwck_ck').css('display', 'block');
				pwckCheck = false;
			} else if (pwck == pw) {
				$('.final_pwck_ck').css('display', 'none');
				pwckCheck = true;
			}

		});

		/* 이름 유효성검사 */
		$("#name_input").blur(function() {
			var name = $("#name_input").val();

			if (name == "") {
				$('.final_name_ck').css('display', 'block');
				nameCheck = false;
			} else {
				$('.final_name_ck').css('display', 'none');
				nameCheck = true;
			}

		});

		/* 닉네임 유효성검사 */
		$("#nickname_input").blur(function() {
			var name = $("#nickname_input").val();

			if (name == "") {
				$('.final_nickname_ck').css('display', 'block');
				nicknameCheck = false;
			} else {
				$('.final_nickname_ck').css('display', 'none');
				nicknameCheck = true;
			}

		});

		/* 생일 유효성검사 */
		$("#datePicker").blur(function() {
			var birthDate = $("#datePicker").val();

			if (birthDate == "") {
				$('.final_birth_ck').css('display', 'block');
				birthCheck = false;
			} else {
				$('.final_birth_ck').css('display', 'none');
				birthCheck = true;
			}
		});

		/* 전화번호 유효성검사 */
		$("#phone_input").blur(function() {
			var phone = $("#phone_input").val();

			if (phone == "") {
				$('.final_phone_ck').css('display', 'block');
				phoneCheck = false;
			} else {
				$('.final_phone_ck').css('display', 'none');
				phoneCheck = true;
			}

		});

		/* 이메일 유효성검사 */
		$("#mail").blur(function() {
			var mail = $("#mail").val();
			var regex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/; // 이메일 형식 정규식

			if (mail == "") {
				$('.final_mail_ck1').css('display', 'block');
				$('.final_mail_ck2').css('display', 'none');
				mailCheck = false;
			} else if (!regex.test(mail)) { // 이메일 형식 검사
				$('.final_mail_ck1').css('display', 'none');
				$('.final_mail_ck2').css('display', 'block');
				mailCheck = false;
			} else {
				$('.final_mail_ck1').css('display', 'none');
				$('.final_mail_ck2').css('display', 'none');
				mailCheck = true;
			}
		});
		/* 인증번호 유효성검사 */
		$("#mail_check").blur(function() {
			var mailCheck = $("#mail_check").val();

			if (mailCheck == "") {
				$('.final_mailCheck_ck').css('display', 'block');
				mailckCheck = false;
			} else {
				$('.final_mailCheck_ck').css('display', 'none');
				mailckCheck = true;
			}

		});

		/* 상세주소 유효성검사 */
		$("#address_kakao3").blur(function() {
			var address = $("#address_kakao3").val();

			if (address == "") {
				$('.final_addr_ck').css('display', 'block');
				addrCheck = false;
			} else {
				$('.final_addr_ck').css('display', 'none');
				addrCheck = true;
			}

		});
		// 회원가입 유효성 검사
		$(document).ready(
				function() {
					$("#join_button").click(
							function(e) {
								// 모든 유효성 검사가 true인지 확인
								if (!(idCheck && idckCheck && pwCheck
										&& pwckCheck && nameCheck
										&& nicknameCheck && birthCheck
										&& phoneCheck && mailCheck
										&& mailckCheck && addrCheck)) {
									alert('입력한 정보를 다시 확인해주세요.');
									e.preventDefault(); // 가입 진행 막기
								} else{alert("회원가입이 완료되었습니다.");}
							});
				});

		/* 인증번호 이메일 전송 */
		$(".mail_check_button").click(function() {
			var mail = $("#mail").val();
			var checkBox = $("#mail_check"); // 인증번호 입력란
			var boxWrap = $("#mail_check_input_box"); // 인증번호 입력란 박스

			$.ajax({

				type : "GET",
				url : "mailCheck?mail=" + mail,
				success : function(data) {

					checkBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
			});
		});
		/* 인증번호 비교 */
		$("#mail_check").blur(function() {
			var inputCode = $("#mail_check").val(); // 입력코드    
			var checkResult = $("#mail_check_input_box_warn"); // 비교 결과 

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
			} else { // 일치하지 않을 경우
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
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
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>



</body>
</html>