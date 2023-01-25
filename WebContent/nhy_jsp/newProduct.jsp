

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="min_java.*"%>
<jsp:useBean id="productDAO" class="min_java.Product" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

li {
	list-style: none;
}

a {
	text-decoration: none !important;
	color: #fff !important;
}

img {
	border: none;
	vertical-align: middle;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>

</head>


<body>
	<jsp:include page="main.jsp" />
	<div class="">
		<div class="container"></div>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
		ProductDAO dao = ProductDAO.getInstance();
		List<Product> productlist = new ArrayList<Product>();
		productlist = dao.getAllProducts();
	%>

	<div class=container>
		<div class="row" align="center">
			<%
				for (int i = 0; i < productlist.size(); i++) {
					Product product = productlist.get(i);
			%>
			<div class="col-md-4">
				<%-- 				<p><%=product.getProductId() %> --%>
				<img
					src="/_20230109/nhy_jsp/uploadFile/<%=product.getFileRealName()%>"
					class="rounded" width="250px" height="300px"
					style="margin: 0; padding: 0;">
				<h4><%=product.getPname()%></h4>
				<p><%=product.getUnitPrice()%>원
					<%-- 				<p><%=product.getDescription() %> --%>
					<%-- 				<p><%=product.getManufacturer() %> --%>
					<%-- 				<p><%=product.getCategory() %> --%>
					<%-- 				<p><%=product.getUnitsInSock() %> --%>
				<p>
					<a href="productEdit.jsp?no=<%=product.getNo()%>"
						class="btn btn-success" role="button">상품 구매 &raquo;</a> <a
						href="newProductDetail.jsp?no=<%=product.getNo()%>"
						class="btn btn-info" role="button">상세 정보 &raquo;</a>
				<p>
					<a href="processDeleteProduct.jsp?no=<%=product.getNo()%>"
						class="btn btn-danger" role="button">장바구니 추가 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
		<hr>
	</div>
</body>
</html>