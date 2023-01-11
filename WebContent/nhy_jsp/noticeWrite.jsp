<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" href="./css/noticeWrite.css" />
</head>
<body>
	<div id="mainDiv">
		<jsp:include page="noticeAside.jsp"></jsp:include>
		<section id="main" align=center>
			<h4 align="left">공지사항 작성</h4>
			<div>
				<form action="noticeWriteAction.jsp" name="boardForm" enctype="multipart/form-data" method="post">
					<input type="hidden" name="loginId" value="<%=session.getAttribute("loginId") %>">
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
						<button type="submit">글 작성</button>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>