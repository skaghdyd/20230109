<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="min_java.Product"%>
<%@ page import="java.io.File" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="min_java.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<br>

<%
request.setCharacterEncoding("UTF-8");

String uploadDir = application.getRealPath("/nhy_jsp")+"/uploadFile";

int maxSize = 1024*1024*100;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, uploadDir,maxSize,encType,new DefaultFileRenamePolicy());


%>
<% 
int productId = Integer.parseInt((String)multi.getParameter("productId"));
String name = multi.getParameter("name");
int unitPrice = Integer.parseInt((String)multi.getParameter("unitPrice"));
String description= multi.getParameter("description");
String manufacturer = multi.getParameter("manufacturer");
String category = multi.getParameter("category");
int unitsInStock = Integer.parseInt((String)multi.getParameter("unitsInStock"));
String fileName = multi.getOriginalFileName("file");
String fileRealName = multi.getFilesystemName("file");

System.out.println(productId);
System.out.println(name);
System.out.println(unitPrice);
System.out.println(description);
System.out.println(manufacturer);
System.out.println(category);
System.out.println(unitsInStock);
ProductDAO productDao = new ProductDAO();
Product product = new Product(0,productId,name,unitPrice,description,manufacturer,category,unitsInStock,fileName,fileRealName);
int result = productDao.productAdd(product);

if(result != 0){
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('상품 등록 성공')");
script.println("location.href = 'admin.jsp'");
script.println("</script>");
}


%>
