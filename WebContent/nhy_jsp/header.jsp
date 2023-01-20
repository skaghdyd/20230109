<%@page import="yhj_java.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="./css/header.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/089f36b7b1.js"
	crossorigin="anonymous"></script>
<script src="js/header.js" defer></script>
</head>
<body>
	<nav class="navbar">

		<div class="navbar_logo">
			<i class="fa-solid fa-store"></i> <a target="iframe1" href="main.jsp">
				Market Kurly</a>
		</div>
		<form class="search1">
			<input class="search" type="search" placeholder="Search" /> <span
				class=text>검색</span>
		</form>
		<ul class="navbar_menu">
			<li><a href="" class="aa">신상품</a></li>
			<li><a href="" class="aa">베스트</a></li>
			<li><a href="" class="aa">알뜰쇼핑</a></li>
			<li><a href="" class="aa">특가/혜택</a></li>
			<li><a target="iframe1" href="notice.jsp" class="aa">고객센터</a></li>

		</ul>

		<ul class="navbar_login">
			<%
				String Sid = (String) session.getAttribute("userId");
				if (Sid == null) {
			%>
			<li><a href="login.jsp">로그인</a></li>
			<li><a href="register.jsp">회원가입</a></li>
			<%
				} else if (Sid.equals("admin")) {
					session.setAttribute("adminName", "관리자");
					String admin = (String)session.getAttribute("adminName");
			%>
			<li><%=admin%>님 환영합니다</li>
			<li><a href="logoutAction.jsp">로그아웃</a></li>
			<li><a href="adminmain.jsp">관리자 페이지</a></li>
			
			<%
				} else {
			%>
			<li><%=Sid%>님 환영합니다</li>
			<li><a href="logoutAction.jsp">로그아웃</a></li>
			<%
				}
			%>


		</ul>

		<br>
		<ul class="navbar_icons">
			<li><i class="fa-solid fa-cart-shopping"></i></li>
			<li><i class="fa-sharp fa-solid fa-heart"></i></li>
		</ul>

		<a href="#" class="navbar_togleBtn"> <i
			class="fa-sharp fa-solid fa-bars"></i>
		</a>


	</nav>


</body>
</html>