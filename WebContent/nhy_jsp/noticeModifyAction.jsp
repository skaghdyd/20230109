<%@page import="nhy_java.dao.Dao"%>
<%@page import="nhy_java.notice.NoticeDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
PrintWriter writer = response.getWriter();

request.setCharacterEncoding("utf-8");

//C:\JavaProgramming\eclipse\source\_20230109\WebContent\nhy_jsp\\uploadFile
String savePath = "../source"+ request.getServletContext().getContextPath() + "/WebContent/nhy_jsp/uploadFile";

//파일 크기 15MB로 제한
int sizeLimit = 1024 * 1024 * 15;
MultipartRequest mr = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

File file = mr.getFile("selectedFile");
File newFile = null;

if (file == null) {
	//writer.println("<script>");
	//writer.println("alert('첨부된 파일이 없습니다.')");
	//writer.println("location.href='notice.jsp'");
	//writer.println("</script>");
} else {
	String oldName = mr.getFilesystemName("selectedFile");//자동으로 생성된 파일명
	String extension = oldName.substring(oldName.lastIndexOf("."), oldName.length());//확장자
	String now = new SimpleDateFormat("yyyyMMddHHmmssS").format(new Date());//현재시간
	
	//신규 파일명 : 세션아이디_현재시간_확장자
	newFile = new File(savePath + File.separator + session.getAttribute("loginId") + "_" + now + extension);
	file.renameTo(newFile);//파일명 수정
	System.out.println("**********************************************************");
	System.out.println("saveFile Name : " + file.getName());
	System.out.println("realFile Name : " + newFile.getName());
	System.out.println("File Size : " + newFile.length());
	System.out.println("**********************************************************");
}
	System.out.println("**********************************************************");
	System.out.println("Author : " + session.getAttribute("loginId"));
	System.out.println("Title : " + mr.getParameter("title"));
	System.out.println("Content : " + mr.getParameter("content"));
	System.out.println("**********************************************************");
	
	int idx = Integer.parseInt(mr.getParameter("idx"));
	String author = (String)session.getAttribute("loginId");
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String saveFileName = file==null ? null : file.getName();
	String realFileName = newFile==null ? null : newFile.getName();
	String createDate = "";
	int hit = 0;
	String modifyDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
	NoticeDto noticeDto = new NoticeDto(idx, author, title, content, saveFileName, realFileName, createDate, hit, modifyDate);
	Dao dao = Dao.getInstance();
	int result = dao.notice_update(noticeDto);
	
	if(result == 1) {
		writer.println("<script>");
		writer.println("alert('글 수정 완료.')");
		writer.println("location.href='notice.jsp'");
		writer.println("</script>");		
	} else {
		writer.println("<script>");
		writer.println("alert('글 수정 실패.')");
		writer.println("location.href='notice.jsp'");
		writer.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Write Action</title>
</head>
<body>
</body>
</html>