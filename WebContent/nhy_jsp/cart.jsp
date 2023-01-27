<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="min_java.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
if(session.getAttribute("userId")==null){
	PrintWriter writer = response.getWriter();
	writer.println("<script>");
	writer.println("alert('로그인을 해주세요')");
	writer.println("window.parent.location.href='login.jsp'");
	writer.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		CartDAO dao = CartDAO.getInstance();
		String userId = (String) session.getAttribute("userId");
		List<CartDTO> cartList = dao.listCart(userId);
		System.out.println(cartList);
	%> 

	<div class="container">
		<div class="row">
			<div class="col-md-6">
			<%
				for(int i = 0; i < cartList.size(); i++){
					CartDTO cart = cartList.get(i);
			%>
				<h3><%= cart.getUsername()%></h3>
				<p><%= cart.getPname()%>
				<p> <b>상품 금액</b> : <%=cart.getUnitprice()%>
				<p> <b>갯수</b> : <%=cart.getAmount()%>
				<p> <b>결제 금액</b> : <%=cart.getMoney()%>원
				<a href="deleteCart.jsp?productId=<%=cart.getProduct_id() %>" class="btn btn-secondary">삭제 &raquo;</a>
				<hr>
				<p> <a href="#" class="btn btn-info" onclick="order()">상품 주문 &raquo;</a>
					<a href="productList.jsp" class="btn btn-secondary">상품목록 &raquo;</a>			
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
<script type="text/javascript">
function order(){
	alert("결제 완료"); // 알림창
}
</script>
</html>