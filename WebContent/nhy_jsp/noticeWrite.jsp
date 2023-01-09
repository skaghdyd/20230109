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

#mainDiv {
	display: flex;
	height: auto;
	min-height: 100%;
	padding-bottom: 200px;
}

#main {
	width: 100%;
	padding: 20px 100px 20px 100px;
	border: 1px solid black;
	margin: 10px auto;
}

#board_write {
	border: 1px solid black;
}

#titleDiv, #contentDiv {
	border: 1px solid black;
}

#title {
	width: 99%;
	height: 100%;
	border: none;
}

#content {
	width: 99%;
	height: 100%;
	border: none;
	resize: none;
}

#main * {
	margin-bottom: 5px;
}
</style>
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