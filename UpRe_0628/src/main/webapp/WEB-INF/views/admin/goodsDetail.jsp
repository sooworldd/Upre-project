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
.input_text {
   width: 200px;
   height: 30px;
   border: none;
   background-color: lightgray;
   border-radius: 8px;
   font-size: 15px;
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
}

.update_btn:hover {
   background: black;
   color: white;
   border-radius:8px;
}

</style>
</head>

<body align="center">
   <form id="update_form" method="post" onsubmit="return validateForm()"> 
      <div>
         <h2 class="text-center">회원 상세 정보</h2>
         <table align="center">
            <tr>
               <th>상품명</th>
               <td><input name="name" value="${goods.name}" class="input_text"
                  ></td>
            </tr>
            <tr>
               <th>가격</th>
               <td><input name="price" value="${goods.price}" class="input_text"/></td>
            </tr>
            <tr>
               <th>이미지경로</th>
               <td><input name="img" value="${goods.img}"
                  class="input_text"></td>
            </tr>
            <tr>
               <th>등록일</th>
               <td><input name="regdate" value="<fmt:formatDate value="${goods.regdate}" pattern="yy/MM/dd" />"
                  class="input_text" readonly></td>
            </tr>
             <tr>
               <th>수정일</th>
               <td><input name="regdate" value="<fmt:formatDate value="${goods.updatedate}" pattern="yy/MM/dd" />"
                  class="input_text" readonly></td>
            </tr>
         </table>
      </div>
      <input type="button" id="update" value="수정" class="update_btn">
   </form>
   
   <script>
      $('#update').on('click', function(e) {
         if (confirm("수정하시겠습니까?")) {
            $('#update_form').attr('action', '/admin/goodsUpdate');
            $('#update_form').submit();
         }

      });
      
      function validateForm() {
    	    let inputs = document.querySelectorAll('.input_text');
    	    for(let i = 0; i < inputs.length; i++) {
    	        if(inputs[i].value == "") {
    	            alert("모든 필드를 입력해주세요.");
    	            return false;
    	        }
    	    }
    	    return true;
    	}
      </script>
</body>
</html>