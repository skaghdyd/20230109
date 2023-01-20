<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="yhj_java.user.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&display=swap"
	rel="stylesheet" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.rtl.min.css"
	integrity="sha384-WJUUqfoMmnfkBLne5uxXj+na/c7sesSJ32gI7GfCk4zO4GthUKhSEGyvQ839BC51"
	crossorigin="anonymous" />
<link rel="stylesheet" href="css/admin.css" />
<script src="https://kit.fontawesome.com/089f36b7b1.js"
	crossorigin="anonymous"></script>
<title>admin</title>
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

body {
	overflow-x: hidden;
	padding-top: 75px;
	padding-left:317px;
}

.iconicon {
	display: flex;
	align-items: center;
}

.iconicon a:last-child {
	margin-left: auto;
}


.iconicon a:last-child i {
	color: #e15959;
}

.iconicon a:first-child {
	margin-right: 15px;
}

.iconicon li:nth-last-child(2) {
	margin-left: 75px;
}

.iconicon a:nth-last-child(3) {
	margin-left: 15px;
}

.iconicon a i:hover {
	color: #e15959;
	transition: 0.5s;
}

.height75 {
	height: 75px;
	position:fixed;
	top:0;
	left:317px;
	z-index: 9999;
}

.rowheight75 {
	align-items: center;
	height: 75px;

}

.rowheight75 div:last-child {
	padding-top: 14px;
}
</style>
</head>
<body>




	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-2 bg-dark"
				style="position: fixed; left: 0; top: 0; font-size: 20px; height: 100vh">
				<div>
					<a href=adminmain.jsp><img src="./image/11111.png" alt=""
						width="50" class="rouded-circle mr-3" /></a>
				</div>
				<div>
					<a href="adminmain.jsp"
						class="navbar-brand text-white text-center d-block mx-auto py-3 mb-4 bottom-border"><h2>관리자
							기능 목록</h2></a>
				</div>

				<ul class="navbar-nav flex-column mt-4">
					<li class="nav-item"><a href="#"
						class="btnA nav-link text-white p-3 mb-2 sidebar-link"> <i
							class="fa-sharp fa-solid fa-store"></i> 상품 관리
					</a></li>
					<li class="navbar-list"><a href="ProductAdd.jsp">상품 등록</a><br />
						<a href="productList.jsp">상품 목록</a><br /> 
						
				</ul>
				<ul class="navbar-nav flex-column mt-4">
					<li class="nav-item"><a href="#"
						class="btnB nav-link text-white p-3 mb-2 sidebar-link"> <i
							class="fa-sharp fa-solid fa-person-through-window"></i> 회원 관리
					</a></li>
					<li class="navbar-list"><a href="">회원 조회</a><br /> <a href="">회원
							수정</a><br /> <a href="">회원 제거</a><br /></li>
				</ul>
			</div>
			<div class="col-xl-10 bg-dark height75">
				<div class="row rowheight75">
					<div class="col-md-4">
						<h4 class="text-light text-uppercase mb-0">관리자 페이지</h4>
					</div>

					<div class="col-md-5">
						<form action="">
							<div class="input-group">
								<input type="text" class="form-control search-input"
									placeholder="Search..." style="color: #fff;">
								<button type="button"
									style="width: 50px; height: 50px; background: #fff; border-radius: 50%;">
									<i class="fas fa-search text-danger"></i>
								</button>
							</div>
						</form>
					</div>

					<div class="col-md-3">
						<ul class="iconicon">
							<a href="#"><i class="fas fa-comments fa-lg"></i></a>
							<a href="#"><i class="fas fa-bell fa-lg"></i></a>
							<a href="index.jsp"><i class="fa-solid fa-house"></i></i></a>
							<%
								String Sid = (String) session.getAttribute("adminName");
								if (Sid != null) {
							%>
							<li style="color:white"><%=Sid%>님 환영합니다</li>
							<%
								}
							%>

							<a href="logoutAction.jsp"><i class="fas fa-sign-out-alt fa-lg"></i></a>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</nav>

		<!-- Optional JavaScript; choose one of the two! -->

		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
			crossorigin="anonymous"></script>
		<!-- Option 2: Separate Popper and Bootstrap JS -->
		<!--
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
      -->

		<script>
      var BtnA = document.querySelector(".btnA");
      var BtnB = document.querySelector(".btnB");

      var active = document.querySelectorAll(".navbar-list");

      BtnA.addEventListener("click", ()=> {
        active[0].classList.toggle("active");
      });

      BtnB.addEventListener("click", ()=> {
        active[1].classList.toggle("active");
      });
      
      
</script>
</body>
</html>
