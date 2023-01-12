<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/findinfo.css">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
		<form name="idfindscreen" method="POST">
			<div class="search-title">
				<h3>휴대폰 본인확인</h3>
			</div>
			<section class="form-search">
				<div class="find-name">
					<label>이름</label> <input type="text" id="userName" name="userName"
						class="btn-name" placeholder="등록한 이름"> <br>
				</div>
				<div class="find-phone">
					<label>번호</label> <input type="text" onkeyup = "addHypen(this);" id="userPhone" name="userPhone"
						class="btn-phone" placeholder="휴대폰번호를 '-' 없이 입력">
				</div>
				<br>
			</section>
			<div class="btnSearch">
				<input type="button" name="enter" value="찾기" onClick="id_search(this.form)">
				<input type="button" name="cancle" value="취소"
					onClick="history.back	()">
			</div>
		</form>
	</div>
<script src='./js/findinfo.js'></script>

</body>
</html>