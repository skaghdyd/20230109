<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<style>
* {
	background-color: white;
}

#left {
	width: 300px;
	margin-right: 50px;
}

#left ul {
	background-color: black;
	list-style: none;
	margin: 0;
	padding: 0;
}

#left ul li {
	margin-left: 20px;
	padding-top: 5px;
	background-color: black;
}

#left ul li a {
	background-color: black;
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<aside id="left">
		<h4>고객센터</h4>
		<ul>
			<li><a target="iframe1" href="notice.jsp">공지사항</a></li>
			<li><a target="iframe1" href="#">자주하는 질문</a></li>
			<li><a target="iframe1" href="#">1:1 문의</a></li>
			<li><a target="iframe1" href="#">대량주문 문의</a></li>
		</ul>
	</aside>
</body>
</html>