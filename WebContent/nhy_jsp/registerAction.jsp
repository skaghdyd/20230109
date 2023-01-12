<%@page import="yhj_java.user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<br>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="yhj_java.user.User" scope="page" />
<jsp:setProperty property="*" name="user" />
<%
String userId = null;
if(session.getAttribute("userId") != null) {
	userId = (String)session.getAttribute("userId");
}
if(userId != null) {
	PrintWriter script =response.getWriter();
	script.println("<script>");
	script.println("alert('이미 로그인 되어있습니다.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}
System.out.println("getId :" + user.getUserId());
System.out.println("Password :" + user.getUserPw());
System.out.println("name :" + user.getUserName());
System.out.println("email :" + user.getUserEmail());
System.out.println("phone :" + user.getUserPhone());
System.out.println("postcode :" + user.getUserPostcode());
System.out.println("address :" + user.getUserAdd());
System.out.println("detailaddress :" + user.getUserDetailAdd());
System.out.println("gender :" + user.getUserGender());
System.out.println("birth :" + user.getUserBirth());

UserDAO userDAO = new UserDAO();
int result = userDAO.register(user);

String url = "index.jsp";
	String msg;

	if(result == -1){
		msg="회원가입 실패";
	}
	else{
		msg="회원가입 성공";
	}

%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>