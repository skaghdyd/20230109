<%@page import="nhy_java.notice.PageVO"%>
<%@page import="nhy_java.notice.NoticeDto"%>
<%@page import="nhy_java.dao.Dao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int currentPage = 1; //처음엔 무조건 1페이지

	if (request.getParameter("currentPage") != null) {
		//선택한 페이지가 있으면 해당 페이지로 변경
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	Dao dao = Dao.getInstance();

	int postCount = 10;
	
	String searchField = request.getParameter("searchField");
	String searchText = request.getParameter("searchText");
	
	List<NoticeDto> noticeList = dao.notice_selectAll(currentPage, postCount, searchField, searchText);
	int totalPost = dao.notice_getTotalPost(searchField, searchText);
	PageVO pageVO = new PageVO(currentPage, postCount, totalPost);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/notice.css" />
<link rel="stylesheet" href="./css/noticeAside.css" />
</head>
<body>
	<div id="mainDiv">
		<jsp:include page="noticeAside.jsp"></jsp:include>
		<section id="main" align=center>
			<h1 align="left">공지사항</h1>
			<table id="noticeTable" align=center border="1px">
				<thead>
					<tr>
						<th width="70">번호</th>
						<th width="500">제목</th>
						<th width="120">글쓴이</th>
						<th width="100">작성일</th>
						<th width="100">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (NoticeDto noticeDto : noticeList) {
							String createDate = noticeDto.getCreateDate();
							String year = createDate.substring(0, 4);
							String month = createDate.substring(4, 6);
							String date = createDate.substring(6, 8);
					%>
					<tr>
						<td width="70"><%=noticeDto.getIdx()%></td>
						<td width="500"><a target="iframe1"
							href="noticeRead.jsp?idx=<%=noticeDto.getIdx()%>"><%=noticeDto.getTitle()%></a></td>
						<td width="120"><%=noticeDto.getAuthor()%></td>
						<td width="100"><%=year + "-" + month + "-" + date%></td>
						<td width="100"><%=noticeDto.getHit()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<br>
			<form method="post" name="search" action="notice.jsp">
				<select class="form-control" name="searchField">
					<option value="0">선택</option>
					<option value="1">제목</option>
					<option value="2">글쓴이</option>
					<option value="3">내용</option>
				</select> 
				<input type="text" placeholder="검색어 입력" name="searchText">
				 <button type="submit">검색</button>
			</form>
			<div id="paging">
				<%
					if (totalPost > 0) {
						if (pageVO.isPrev()) {
				%>
				<a target="iframe1" href="notice.jsp?currentPage=1&&searchField=<%=searchField%>&&searchText=<%=searchText%>">처음</a> <a
					target="iframe1"
					href="notice.jsp?currentPage=<%=pageVO.getFirstPage() - 1%>">이전</a>
				<%
					}
						for (int i = pageVO.getFirstPage(); i <= pageVO.getLastPage(); i++) {
				%>
				<a target="iframe1" href="notice.jsp?currentPage=<%=i%>&&searchField=<%=searchField%>&&searchText=<%=searchText%>"><%=i%></a>
				<%
					}
						if (pageVO.isNext()) {
				%>
				<a target="iframe1"
					href="notice.jsp?currentPage=<%=pageVO.getLastPage() + 1%>&&searchField=<%=searchField%>&&searchText=<%=searchText%>">다음</a>
				<a target="iframe1"
					href="notice.jsp?currentPage=<%=pageVO.getEndPage()%>&&searchField=<%=searchField%>&&searchText=<%=searchText%>">끝</a>
				<%
					}
					}
				%>
			</div>
			<%
				if (session.getAttribute("userId") != null) {
					if (session.getAttribute("userId").equals("admin")) {
			%>
			<div align="right">
				<input id="noticeWrite" type="button" value="글쓰기"
					onclick="location.href='noticeWrite.jsp'">
			</div>
			<%
				}
				}
			%>
		</section>
	</div>
</body>
</html>