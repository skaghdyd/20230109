<%@page import="yhj_java.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPhone = request.getParameter("userPhone");

	UserDAO user = new UserDAO();
	String pwd = user.findPw(userId, userPhone); //아이디를 디비에서 가져옴..실패시 널
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/findinfo.css">
<script src='./js/findinfo.js'></script>

</head>
<body>



	<form name="idsearch" method="post">
		<%
			if (pwd != null) {
		%>

		<div class="container">
			<div class="found-success">
				<h4>회원님의 비밀번호는</h4>
				<div class="found-id">
					<%=pwd%></div>
				<h4>입니다</h4>
			</div>
			<div class="found-login">
				<input type="button" id="btnLogin" value="로그인" onClick="location='login.jsp'" />
			</div>
		</div>
		<%
			} else {
		%>
		<div class="container">
			<div class="found-fail">
				<h4>등록된 정보가 없습니다</h4>
			</div>
			<div class="found-login">
				<input type="button" id="btnback" value="다시 찾기"
					onClick="history.back()" /> <input type="button" id="btnjoin"
					value="회원가입" onClick="location='register.jsp'" />
			</div>
		</div>

		<div class="adcontainer">
			<a href="#"><img src="./image/casead.png" /></a>
		</div>

		<%
			}
		%>
	</form>

	<div class="footer-align">
		<hr>
		<div class="help-box">
			도움이 더 필요하신가요? <a href="index.jsp">고객센터</a> 또는 080-330-8877 번호로
			문의하세요.
		</div>
	</div>
</body>
</html>