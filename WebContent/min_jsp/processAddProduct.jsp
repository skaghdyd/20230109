<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
/* 파일이 저장될 서버의 경로 지정 */
/* String savePath = request.getServletContext().getRealPath("folderName"); */
/* 위에꺼 안먹으면 사용! String savePath = "D:/Projects/workspace/projectName/WebContent/folderName"; */
// String uploadDir = this.getClass().getResource("").getPath(); // 이클립스 서버쪽에 프로젝트의 해당폴더
// uploadDir = uploadDir.substring(1, uploadDir.indexOf(".metadata"))+"/_20230109/WebContent/min_jsp/up";

//String savePath = "D:/Projects/workspace/projectName/webapp/imgs";
//String savePath = request.getServletContext().getRealPath("imgs");
String uploadDir = "C:\\Users\\admin\\Desktop\\_20230109\\WebContent\\min_jsp\\up";


//확인
out.println("절대경로 : " + uploadDir + "<br/>");
// 파일 크기 15MB로 제한
int sizeLimit = 1024*1024*100;

/* (request 객체,저장될 서버 경로, 파일 최대 크기, 인코딩 방식, 같은 이름의 파일명 방지 처리)순서임 */
//아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
MultipartRequest multi = new MultipartRequest(request, uploadDir, sizeLimit, "utf-8", new DefaultFileRenamePolicy());


//----- 아래는 전송 받은 데이터들을 DB테이블에 저장시키기 위한 작업들 ---------
int productId = Integer.parseInt((String)multi.getParameter("productId"));
String name = multi.getParameter("name");
int unitPrice = Integer.parseInt((String)multi.getParameter("unitPrice"));
String description= multi.getParameter("description");
String manufacturer = multi.getParameter("manufacturer");
String category = multi.getParameter("category");
int unitsInStock = Integer.parseInt((String)multi.getParameter("unitsInStock"));
String fileName = multi.getOriginalFileName("file");
String fileRealName = multi.getFilesystemName("file");

// 확인용
System.out.println(productId);
System.out.println(name);
System.out.println(unitPrice);
System.out.println(description);
System.out.println(manufacturer);
System.out.println(category);
System.out.println(unitsInStock);

//DAO 객체 생성
ProductDAO productDao = new ProductDAO();
//데이터들을 담을 그릇인 DTO(혹은 Bean) 객체를 생성 후, 데이터들을 set해준다.
Product product = new Product(0,productId,name,unitPrice,
		description,manufacturer,category,unitsInStock,fileName,fileRealName);

//만들어놓은 insert 수행 메서드 사용. set으로 담아줬던 DTO를 넘겨서 insert 수행.
productDao.productAdd(product);

int result = productDao.productAdd(product); 

//만약 return할 페이지에 방금 전송한 데이터들을 출력하고 싶다면 DTO를 속성에 담아준다.
request.setAttribute("product", product);

//↓ 모든 것이 성공적으로 수행되었을 경우 return 될 page
if(result != 0){
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('상품 등록 성공')");
script.println("location.href = 'productList.jsp'");
script.println("</script>");
}

%>
