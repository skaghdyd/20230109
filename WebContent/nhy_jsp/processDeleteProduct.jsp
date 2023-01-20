<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="min_java.Product"%>
<%@ page import="java.io.File" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="min_java.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int no = Integer.parseInt((String)request.getParameter("no"));


ProductDAO productDao = new ProductDAO();
Product proNo = new Product();
int result = productDao.deleteProduct(no);

if(result != 0){
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('상품 삭제 성공')");
script.println("location.href = 'productList.jsp'");
script.println("</script>");
}
%>
</body>
</html>