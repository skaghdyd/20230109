<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="./css/findinfo.css">
<script src ='./js/findinfo.js'></script>
</head>
<body>
<div class = "container">
	<form name="pwfindscreen" method = "POST">
			<div class = "search-title">
				<h3>등록한 정보로 인증</h3>
			</div>
		<section class = "form-search">
			<div class = "find-id">
				<label>아이디</label>
				<input type="text" name="userId" id="userId" class = "btn-name" placeholder = "마켓컬리 ID">
			<br>
			</div>
		<!-- 	<div class = "find-phone">
				<label>이메일</label>
				<input type="text" name="member_email" class = "btn-phone" placeholder = "example@gmail.com">
			</div> -->
		 <div class = "find-phone">
				<label>번호</label>
				<input type="text" onKeyup = "addHypen(this);" name="userPhone" id="userPhone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
			</div> 
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="pw_search(this.form)">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
</div>

    <div class="footer-align">
        <hr>
        <div class="help-box">도움이 더 필요하신가요? <a href="index.jsp">고객센터</a> 또는 080-330-8877 번호로 문의하세요.</div>
   <!-- footer영역 -->
        </div>
 <script>
 
 </script>
</body>
</html>