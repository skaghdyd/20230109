<%@page import="min_java.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%-- <%
int currentPage = 1; //처음엔 무조건 1페이지

if (request.getParameter("currentPage") != null) {
	//선택한 페이지가 있으면 해당 페이지로 변경
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

productDAO productdao = productDAO.getInstance();

List<Product> noticeList = productdao.pro_selectAll(currentPage);
int totalPost = productdao.pro_getTotalPost();
%>	 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script type="text/javascript" src="./resources/js/validation.js"></script>

<title>상품 전체 리스트</title>
</head>
<body>

	<div class="jumbotron">
	
	<div class="container">
		<div>
			<a href="logout.jsp">logout</a>
		</div>

		<form name="newProduct" action="processAddProduct.jsp"
			class="form-horizontal" method="post" >


		</form>
	</div>
</body>
</html>