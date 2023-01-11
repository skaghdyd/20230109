<%@page import="nhy_java.notice.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="nhy_java.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
			<h1 align="left">공지사항 읽기</h1>
			<div>
				<form action="noticeModify.jsp?idx=<%=idx %>" name="boardForm" enctype="multipart/form-data" method="post">
					<div id="titleDiv" align="left">
						<input id="title" type="text" name="title" placeholder=" 제목"
							value="<%=noticeDto.getTitle() %>" readonly>
					</div>
					<div id="contentDiv">
						<textarea id="content" name="content" rows="30" placeholder="내용"
							readonly><%=noticeDto.getContent() %></textarea>
					</div>
					<div align="left">
						첨부파일 :
						<%
						if (noticeDto.getSaveFileName() == null) {
						%>
						없음
						<%
						} else {
						%>
						<a><%=noticeDto.getSaveFileName()%></a>
						<%
						}
						%>
					</div>
					<div align="right">
						<input type="button" formtarget="iframe1" onclick="history.back()" value="뒤로가기">
						<%
						if(session.getAttribute("loginId")!=null){
						%>
						<button type="submit">글 수정</button>
						<%
						}
						%>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>