<%@page import="yhj_java.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
System.out.println("id :"+id);

UserDAO userDAO = new UserDAO();

boolean result = userDAO.idcheck(id);
String str;

if(result){
	str="no";
	out.print(str);
}
else{
	str = "yes";
	out.print(str);
}
%>

