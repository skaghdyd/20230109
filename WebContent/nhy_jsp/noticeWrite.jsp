<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(session.getAttribute("loginId")==null){
	PrintWriter writer = response.getWriter();
	writer.println("<script>");
	writer.println("alert('로그인을 해주세요')");
	writer.println("history.back()");
	writer.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/noticeWrite.css" />
<link rel="stylesheet" href="./css/noticeAside.css" />
</head>
<body>
	<div id="mainDiv">
		<jsp:include page="noticeAside.jsp"></jsp:include>
		<section id="main" align=center>
			<h1 align="left">공지사항 쓰기</h1>
			<div>
				<form action="noticeWriteAction.jsp" name="boardForm" enctype="multipart/form-data" method="post">
					<div id="titleDiv" align="left">
						<input id="title" type="text" name="title" placeholder=" 제목"
							required>
					</div>
					<div id="contentDiv">
						<textarea id="content" name="content" rows="30" placeholder="내용"
							required></textarea>
					</div>
					<div align="left">
						<input type="file" name="selectedFile" />
					</div>
					<div align="right">
						<input type="button" formtarget="iframe1" onclick="history.back()" value="취소">
						<button type="submit">글 작성</button>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>