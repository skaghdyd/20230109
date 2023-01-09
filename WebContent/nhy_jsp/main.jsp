<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
</head>
<body>
<%
if(session.getAttribute("loginId")==null){
%>
로그인을 해주세요.
<%
} else {
%>
<%=session.getAttribute("loginId") %>님 환영합니다.
<%
}
%>
</body>
</html>