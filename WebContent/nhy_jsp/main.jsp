<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/reset.css" />
</head>
<body>
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
					<div class="flyIn lineOne">FineApple</div>
					<div class="flyIn lineTwo">makes</div>
					<div class="flyIn lineThree">Innovation</div>
					<div class="flyIn lineFour"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- //visual -->

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

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