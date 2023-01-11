<%@page import="java.io.PrintWriter"%>
<%@page import="nhy_java.notice.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="nhy_java.dao.Dao"%>
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
Dao dao = Dao.getInstance();
int idx = Integer.parseInt(request.getParameter("idx"));
NoticeDto noticeDto = dao.notice_selectOne(idx);
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
			<h1 align="left">공지사항 수정</h1>
			<div>
				<form action="noticeModifyAction.jsp" name="boardForm" enctype="multipart/form-data" method="post">
					<input type="hidden" name="idx" value="<%=idx %>">
					<div id="titleDiv" align="left">
						<input id="title" type="text" name="title" placeholder=" 제목"
							value="<%=noticeDto.getTitle() %>" required>
					</div>
					<div id="contentDiv">
						<textarea id="content" name="content" rows="30" placeholder="내용"
							required><%=noticeDto.getContent() %></textarea>
					</div>
					<div id="fileUploadDiv" align="left">
						<%
						if (noticeDto.getSaveFileName() == null) {
						%>
						<input type="file" name="selectedFile" />
						<%
						} else {
						%>
						첨부파일 : <a><%=noticeDto.getSaveFileName()%></a>
						<input type="button" value="수정" onclick="modifyFile()">
						<%
						}
						%>
					</div>
					<div align="right">
						<input type="button" formtarget="iframe1" onclick="history.back()" value="취소">
						<button type="submit">완료</button>
					</div>
				</form>
			</div>
		</section>
	</div>
	<script>
		function modifyFile(){
			let fileInputBtn = document.createElement("INPUT");
			fileInputBtn.setAttribute("type", "file");
			fileInputBtn.setAttribute("name", "selectedFile");
			fileInputBtn.addEventListener("change", function(){
				let fileUploadDiv = document.getElementById("fileUploadDiv");
				fileUploadDiv.textContent = "";
				fileUploadDiv.appendChild(fileInputBtn);
			});
			fileInputBtn.click();
		}
	</script>
</body>
</html>