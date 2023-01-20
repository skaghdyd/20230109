<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="./css/main2.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.rtl.min.css"
	integrity="sha384-WJUUqfoMmnfkBLne5uxXj+na/c7sesSJ32gI7GfCk4zO4GthUKhSEGyvQ839BC51"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/089f36b7b1.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

<jsp:include page="admin.jsp"/>
<!-- visual -->
					<div class="sec_visual">
						<div class="visual">
							<!-- Swiper -->
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide s1"></div>
									<div class="swiper-slide s2"></div>
									<div class="swiper-slide s3"></div>
								</div>
								<div class="swiper-scrollbar"></div>
							</div>
							<!-- //Swiper -->
							<div class="visual_text">
								<div class="flyinTxtCont">
									<div class="flyIn lineOne">Market</div>
									<div class="flyIn lineTwo">Kurly</div>
									<div class="flyIn lineThree">Innovation</div>
								</div>
							</div>
						</div>
					</div>
					<div class="sec_visual">
						<div class="visual">
							<!-- Swiper -->
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide s4"></div>
									<div class="swiper-slide s5"></div>
									<div class="swiper-slide s6"></div>
								</div>
								<div class="swiper-scrollbar"></div>
							</div>
							<!-- //Swiper -->
							<div class="visual_text">
								<div class="flyinTxtCont">
									<div class="flyIn lineOne">Fast</div>
									<div class="flyIn lineTwo">Accurate </div>
									<div class="flyIn lineThree">Delivery</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //visual -->






					<!-- Swiper JS -->
					<script
						src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

					<!-- Initialize Swiper -->
					<script>
		var swiper = new Swiper(".mySwiper", {
			loop : true,
			speed : 1000,
			autoplay : true,
			scrollbar : {
				el : ".swiper-scrollbar",
				hide : true,
			},
		});
	</script>
</body>
</html>