    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />

<style>

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}    

img{
	border:none;
	vertical-align: middle;
}

a{
	text-decoration:none;
	color:#333;
}

li{
	list-style:none;
}


.s1{
	width:100%;
	height:320px;
	background:url("./image/1.jpg") center center / cover no-repeat;
}

.s2{
	width:100%;
	height:320px;
	background:url("./image/2.jpg") center center / cover no-repeat;
}

.s3{
	width:100%;
	height:320px;
	background:url("./image/3.jpg") center center / cover no-repeat;
}
</style>


	
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide s1"></div>
        <div class="swiper-slide s2"></div>
        <div class="swiper-slide s3"></div>
      </div>
      <div class="swiper-scrollbar"></div>
    </div>
    
    
        <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
    	speed:1500,
    	autoplay:true,
    	loop:true,
        scrollbar: {
          el: ".swiper-scrollbar",
          hide: true,
        },
      });
    </script>



