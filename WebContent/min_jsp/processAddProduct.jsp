<%@page import="min_java.Product"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="min_java.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<br>

<%
request.setCharacterEncoding("UTF-8");
%>
<%
int productId = Integer.parseInt((String)request.getParameter("productId"));
String name = request.getParameter("name");
int unitPrice = Integer.parseInt((String)request.getParameter("unitPrice"));
String description= request.getParameter("description");
String manufacturer = request.getParameter("manufacturer");
String category = request.getParameter("category");
int unitsInStock = Integer.parseInt((String)request.getParameter("unitsInStock"));



System.out.println(productId);
System.out.println(name);
System.out.println(unitPrice);
System.out.println(description);
System.out.println(manufacturer);
System.out.println(category);
System.out.println(unitsInStock);
ProductDAO productDao = new ProductDAO();
Product product = new Product(0,productId,name,unitPrice,description,manufacturer,category,unitsInStock);
//Product(int, String, String, int, String, String, String, int
int result = productDao.productAdd(product); 


%>
