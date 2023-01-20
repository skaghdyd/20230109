<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="min_java.*"%>
<jsp:useBean id="productDAO" class="min_java.Product" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="admin.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		ProductDAO dao = ProductDAO.getInstance();
		Product product = dao.getProductById(no); 
	%> 

	<div class="container">
		<div class="row">
			<div class="col-md-6">
			<img src="/_20230109/nhy_jsp/uploadFile/<%=product.getFileRealName() %>"class="rounded" width="250px" height="300px" style="margin: 0; padding: 0;"  >
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				
				<p> <b>상품 코드 : </b><span class="badge badge-danger">
				<%=product.getProductId()%></span>
				
				<p> <b>제조사</b> : <%=product.getManufacturer()%>
				
				<p> <b>분류</b> : <%=product.getCategory()%>
				
				<p> <b>재고 수</b> : <%=product.getUnitsInSock()%>
				
				<h4><%=product.getUnitPrice()%>원</h4>
				<p> <a href="#" class="btn btn-info"> 상품 주문 &raquo;</a>
					<a href="productList.jsp" class="btn btn-secondary">상품
					 목록 &raquo;</a>
			
			</div>
		</div>
	</div>
	


</body>
</html>