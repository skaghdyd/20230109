<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] img ={"사진", "사진", "사진", "사진", "사진", "사진", "사진", "사진", "사진"};
String[] name = {"굴비", "굴비", "굴비", "굴비", "굴비", "굴비", "굴비", "굴비", "굴비"};
String[] price = {"50000", "50000", "500", "500", "500", "5000", "500", "5000", "50000"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SnackMall</title>
<script type="text/javascript">

function fnCart(name, price) {
	//alert("Name : " + name + "\nPrice : " + price);
	if(confirm("장바구니에 담으시겠습니까?")) {
		location.href = "contents/pro/CartPro.jsp?name=" + name + "&price=" + price;
	}
}

function fnView() {
	if(confirm("장바구니를 보시겠습니까?")){
		location.href = "contents/view/CartView.jsp";
	}
}
</script>
</head>
<body>
<div align="center">
	<h3>[오늘의 특가]</h3>
	<table border="1">
		<tr align="right">
			<td colspan="3">
				<input type="button" value="장바구니 보기" onclick="fnView()" />
			</td>
		</tr>
		<%
		for(int i = 0; i < img.length; i++) {
			if(i % 3 == 0) {
				out.println("<tr align='center'>");
			}
			out.println("<td>");
				out.println("<table>");
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<img src = 'img/" + img[i] + "' width='150' height='150' />");
						out.println("</td>");
					out.println("</tr>");

					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>" + name[i] + "</b>");
						out.println("</td>");
					out.println("</tr>");

					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>￦" + price[i] + "원</b>");
						out.println("</td>");
					out.println("</tr>");

					out.println("<tr align='center'>");
						out.println("<td>");

							//out.println("<input type='button' value='장바구니 담기' onclick='fnCart(\"" + name[i] + "\", \"" + price[i] + "\")' />");

							out.println("<input type='button' value='장바구니 담기' ");
							out.println("onclick='fnCart(\"" + name[i] + "\", \"" + price[i] + "\")' />");
						out.println("</td>");
					out.println("</tr>");
				out.println("</table>");
			out.println("</td>");
			if(i % 3 == 2) {
				out.println("</tr>");
			}
		}
		%>
	</table>
</div>
</body>
</html>