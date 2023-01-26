<%@page import="java.io.PrintWriter"%>
<%@page import="min_java.CartDTO"%>
<%@page import="min_java.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = (String)session.getAttribute("userId");
int productId = Integer.parseInt(request.getParameter("productId"));
int amount = Integer.parseInt(request.getParameter("amount"));

CartDAO cartDAO = CartDAO.getInstance();

CartDTO cart = new CartDTO();
cart.setUserid(userId);
cart.setProduct_id(productId);
cart.setAmount(amount);

int result = cartDAO.insertCart(cart);

PrintWriter script = response.getWriter();
if(result > 0){
	script.println("<script>");
	script.println("alert('장바구니 DB등록 성공')");
	script.println("location.href = 'cart.jsp'");
	script.println("</script>");
} else if(result == 0){
	script.println("<script>");
	script.println("alert('이미 장바구니에 등록된 상품입니다.')");
	script.println("history.back()");
	script.println("</script>");
} else {
	script.println("<script>");
	script.println("alert('장바구니 등록 실패! 관리자에게 문의하세요.')");
	script.println("history.back()");
	script.println("</script>");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>