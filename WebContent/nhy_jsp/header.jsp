<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">
#header_header {
	width: 100%;
	height: 100px;
	line-height: 100px;
	display: flex;
	justify-content: space-between;
}

#header_nav {
	width: 100%;
	height: 23px;
	border-top: 1px solid red;
	border-bottom: 1px solid red;
	margin-right: 10%;
	display: flex;
	justify-content: space-evenly;
}

#header_nav * {
	text-decoration: none;
	color: black;
}

ul, ol, li {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align:center;
	background-color: white;
}

#header_nav_menu>li {
	display: inline-block;
	position: relative;
	width:200px;
}

#header_nav_menu>li:hover {
	background-color: gray;
}

#header_nav_menu>li:hover>a{
	color: white;
}

#header_nav_menu>li ul.header_nav_sub_menu {
	display: none;
}

#header_nav_menu>li ul.header_nav_sub_menu>li:hover {
	background-color: gray;
	color: white;
}

#header_nav_menu>li:hover ul.header_nav_sub_menu {
	display: block;
	position: absolute;
	width:200px;
}

#logo {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<header id="header_header">
		<div id="logoDiv">
			<a target="iframe1" href="main.jsp">
				<img id="logo" src="..\\yhj_jsp\\image\\mama.png" alt="logo">
			</a>
		</div>
		<div>
			<%
				if (session.getAttribute("loginId") == null) {
			%>
			<a href="loginAction.jsp">로그인</a>
			<%
				} else {
			%>
			<a href="logoutAction.jsp">로그아웃</a>
			<%
				}
			%>
			<a href="signUp.jsp">회원가입</a>
		</div>
	</header>
	<div align="right">
		<a target="iframe1" href="">찜상품보기</a> <a target="iframe1" href="">장바구니</a>
	</div>
	<nav id="header_nav">
		<form>
			<input type="search" placeholder="Search" /> <span>검색</span>
		</form>
		<ul id="header_nav_menu">
			<li>
				<a target="iframe1" href="">메뉴1</a>
				<ul class="header_nav_sub_menu">
					<li>메뉴1_하위1</li>
					<li>메뉴1_하위2</li>
					<li>메뉴1_하위3</li>
				</ul>
			</li>
			<li>
				<a target="iframe1" href="">메뉴2</a>
				<ul class="header_nav_sub_menu">
					<li>메뉴2_하위1</li>
					<li>메뉴2_하위2</li>
					<li>메뉴2_하위3</li>
				</ul>
			</li>
			<li>
				<a target="iframe1" href="">메뉴3</a>
				<ul class="header_nav_sub_menu">
					<li>메뉴3_하위1</li>
					<li>메뉴3_하위2</li>
					<li>메뉴3_하위3</li>
				</ul>
			</li>
			<li>
				<a target="iframe1" href="">메뉴4</a>
				<ul class="header_nav_sub_menu">
					<li>메뉴4_하위1</li>
					<li>메뉴4_하위2</li>
					<li>메뉴4_하위3</li>
				</ul>
			</li>
			<li>
				<a target="iframe1" href="notice.jsp">고객센터</a>
				<ul class="header_nav_sub_menu">
					<li>고객센터_하위메뉴1</li>
					<li>고객센터_하위메뉴2</li>
					<li>고객센터_하위메뉴3</li>
					<li>고객센터_하위메뉴4</li>
				</ul>
			<li>
		</ul>
	</nav>
</body>
</html>