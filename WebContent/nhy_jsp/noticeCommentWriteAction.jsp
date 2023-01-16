<%@page import="nhy_java.dao.Dao"%>
<%@page import="nhy_java.notice.CommentDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int notice_idx = Integer.parseInt((String) request.getParameter("notice_idx"));
	int comment_idx = 0;
	String author = (String) session.getAttribute("userId");
	String comment_content = request.getParameter("comment_content");
	String createDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
	CommentDto commentDto = new CommentDto(notice_idx, comment_idx, author, comment_content, createDate);
	Dao dao = Dao.getInstance();
	int result = dao.notice_comment_write(commentDto);
	out.print("{");
	out.print("\"result\":" + result + ",");
	out.print("\"createDate\":" + createDate);
	out.print("}");
%>