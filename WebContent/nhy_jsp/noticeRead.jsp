<%@page import="nhy_java.notice.CommentDto"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="nhy_java.notice.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="nhy_java.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(session.getAttribute("userId")==null){
	PrintWriter writer = response.getWriter();
	writer.println("<script>");
	writer.println("alert('로그인을 해주세요')");
	writer.println("window.parent.location.href='login.jsp'");
	writer.println("</script>");
}

Dao dao = Dao.getInstance();

int idx = Integer.parseInt(request.getParameter("idx"));

NoticeDto noticeDto = dao.notice_selectOne(idx);

if(!((String)session.getAttribute("userId")).equals(noticeDto.getAuthor())){
	dao.notice_addHit(idx);
}

List<CommentDto> commentList = dao.notice_comment_select(idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/noticeWrite.css" />
<link rel="stylesheet" href="./css/noticeAside.css" />
</head>
<body>
	<div id="mainDiv">
		<jsp:include page="noticeAside.jsp"></jsp:include>
		<section id="main" align=center>
			<h1 align="left">공지사항 읽기</h1>
			<div>
				<form action="noticeModify.jsp?idx=<%=idx %>" name="boardForm" enctype="multipart/form-data" method="post">
					<div id="titleDiv" align="left">
						<input id="title" type="text" name="title" placeholder="제목"
							value="<%=noticeDto.getTitle() %>" readonly>
					</div>
					<div id="contentDiv">
						<textarea id="content" name="content" rows="30" placeholder="내용"
							readonly><%=noticeDto.getContent() %></textarea>
					</div>
					<div align="left">
						첨부파일 :
						<%
						if (noticeDto.getSaveFileName() == null) {
						%>
						없음
						<%
						} else {
						%>
						<a href="noticeFileDownloadAction.jsp?fileName=<%=noticeDto.getRealFileName()%>"><%=noticeDto.getSaveFileName()%></a>
						<%
						}
						%>
					</div>
					<div align="right">
						<input type="button" formtarget="iframe1" onclick="history.back()" value="뒤로가기">
						<%
						if(((String)session.getAttribute("userId")).equals(noticeDto.getAuthor())){
						%>
						<button type="submit">글 수정</button>
						<%
						}
						%>
					</div>
				</form>
			</div>
			<h1 align="left">댓글입력</h1>
			<div>
				<form id="commentForm">
					<input type="hidden" name="notice_idx" value="<%=idx%>">
					<div id="commentDiv" align="left">
						<textarea id="comment_content" type="text" name="comment_content" rows="3" placeholder="댓글을 입력해주세요."></textarea>
					</div>
					<div align="right">
						<input type="button" onclick="addComment()" value="입력">
					</div>
				</form>
			</div>
			<% 
			if(commentList.size()>0){
			%>
				<h1 align="left">댓글목록</h1>
				<div id="commentListDiv">
				<!-- for문으로 넣어줌 -->
				<%
				for(int i=0; i<commentList.size(); i++){
					CommentDto commentDto = commentList.get(i);
				%>
					<form class="commentList" align="left">
						<div class="commentHeader">
							<div>
								<%=commentDto.getAuthor() %> / <%=commentDto.getCreateDate() %>
							</div>
							<div>
								<%
								if(commentDto.getAuthor().equals((String)session.getAttribute("userId"))){
								%>
								<input class="commentModifyBtn" type="button" onclick="modifyComment(this, <%=idx%>, <%=commentDto.getComment_idx()%>)" value="수정">
								<input type="button" onclick="deleteComment(<%=idx%>, <%=commentDto.getComment_idx()%>)" value="삭제">
								<%
								}
								%>
							</div>					
						</div>
						<div>
							<p class="commentContent">
								<%=commentDto.getContent() %>
							</p>
						</div>
					</form>
				<%
				}
				%>
			<%
			}
			%>
			</div>
		</section>
	</div>
	<script>
		function addComment(){
			let comment = document.getElementById('comment_content').value;
			if(comment==null || comment==''){
				alert('댓글이 입력되지 않았습니다.');
				return;
			}
			let commentForm = document.getElementById('commentForm');
			let formData = new FormData(commentForm);
			fetch('./noticeCommentWriteAction.jsp', {
				method:'POST',
				body: new URLSearchParams(formData)
			})
			.then(res => res.json())
			.then(data => {				
					if(data['result']==1){
						alert('댓글이 작성되었습니다.');
						location.href='noticeRead.jsp?idx=<%=idx%>';
						
						<%--  var el = document.querySelector('#commentListDiv');
						 var formElem = document.createElement('form');
						 formElem.classList.add('add');
						 formElem.innerHTML = ''
								+ '<input class="commentModifyBtn" type="button" onclick="modifyComment(<%=idx%>, <%=commentDto.getComment_idx()%>)" value="수정">'
								+ '<input type="button" onclick="deleteComment(<%=idx%>, <%=commentDto.getComment_idx()%>)" value="삭제">';
						
								el.prependChild(formElem); --%>
					} else {
						alert('댓글 작성에 실패하였습니다.\r\n관리자에게 문의해주세요.');
					}
				});
		}
		
		function deleteComment(notice_idx, comment_idx){
			if (confirm("정말로 댓글을 삭제하시겠습니까?")) {
				fetch('./noticeCommentDeleteAction.jsp',{
					method:'post',
					body:new URLSearchParams({
						'notice_idx' : notice_idx,
						'comment_idx' : comment_idx
					})
				})
				.then(res=>res.json())
				.then(function(data){
					if(data['result']>0){
						alert('댓글이 삭제되었습니다.');
						location.href='noticeRead.jsp?idx=<%=idx%>';
					}
				});
			}
		}
		
		function modifyComment(commentModifyBtn, notice_idx, comment_idx){
			let parent = commentModifyBtn.parentNode.parentNode.parentNode;
			if(!parent.classList.contains('modifyActive')){
				parent.classList.add('modifyActive');
				let modifyCommentDiv = document.createElement('div');
				modifyCommentDiv.innerHTML =
					'<div align="right">'+
					'<input type="button" onclick="modifyConfirm(this, '+ notice_idx + ',' + comment_idx + ')" value="확인">' +
					'<input type="button" onclick="modifyCancel(this)" value="취소">' +
					'</div>'+
					'<div>'+
					'<textarea style="width:100%; resize: none;"></textarea>'+
					'</div>'
					;
				commentModifyBtn.parentNode.parentNode.parentNode.appendChild(modifyCommentDiv);				
			}
		}
		
		function modifyConfirm(modifyCommentDiv, notice_idx, comment_idx){
			let modifyContent = modifyCommentDiv.parentNode.nextElementSibling.firstChild.value;
			if(modifyContent==null || modifyContent==''){
				alert('댓글이 입력되지 않았습니다.');
				return;
			}
			
			if (confirm("정말로 댓글을 수정하시겠습니까?")) {
				fetch('./noticeCommentModifyAction.jsp',{
					method:'post',
					body:new URLSearchParams({
						'notice_idx' : notice_idx,
						'comment_idx' : comment_idx,
						'modifyContent' : modifyContent
					})
				})
				.then(res=>res.json())
				.then(function(data){
					if(data['result']>0){
						alert('댓글이 수정되었습니다.');
						location.href='noticeRead.jsp?idx=<%=idx%>';
					}
				});
			}
		}
		
		function modifyCancel(modifyCommentDiv){
			modifyCommentDiv.parentNode.parentNode.parentNode.classList.remove('modifyActive');  
			modifyCommentDiv.parentNode.parentNode.remove();
		}
	</script>
</body>
</html>