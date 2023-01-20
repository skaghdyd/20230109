
<%@page import="min_java.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <link href="styles/detail.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/detail.css" />
</head>

<body>
    <nav> <!--최상단의 배너-->
        <div class="menu">
            <a href="" class="logo"></a>
            <ul>
                <li><a href="" class="li">COFFEE</a></li>
                <li><a href="" class="li">MENU</a></li>
                <li><a href="" class="li">STORE</a></li>
                <li><a href="" class="li">WHAT'S NEW</a></li>
            </ul>
        </div>
    </nav>

    <section> <!--중반부의 레이아웃-->

        <div class="container" id="one"> <!-- 중반부 전체를 감싸는 div 태그-->
            
            <div class="first"> <!--중반부 를 두개의 div태그로 나누어 왼쪽 절반의 구역으로 나눠줌-->
                <p class="coldbrew">콜드 브루</p>
                <img src="coffeedetailpage.PNG" alt="콜드브루">
            </div>

            <div class="second"> <!--중반부 를 두개의 div태그로 나누어 오른쪾 절반의 구역으로 나눠줌-->
                    <br>
                    <p class="gray">홈 > MENU > 음료 > 에스프레소 > 화이트 초콜릿 모카</p>

                    <div id="fifth">
                        <div class="emojiright">
                            <p class="coffeename">화이트 초콜릿 모카</p>
                            <p class="coffeename2">White Chocolate Mocha</p>
                        </div>
                        <div id="heart2">
                            <a href="#"><i class="far fa-heart" id="heart3"></i></a>
                        </div>
                    </div>

                    <p class="seconddetail">달콤하고 부드러운 화이트 초콜릿 시럽과 에스프레소를 스팀 밀크와 섞어
                        휘핑크림으로 마무리한 음료로 달콤함과 강렬한 에스프레소가 부드럽게 어우러진 커피</p>

                    <div class="productdetail">
                        <span>제품 영양 정보</span>
                        <span>Tall(톨) / 355ml (12 fl oz)</span>
                    </div>

                    <div class="productdetail2"> <!--영양정보를 담아주는 div 태그-->
                        <div class="boxone"> <!--영양 정보를 좌우로 반반 나눠주었으며, 왼쪽에 해당하는 div 태그-->
                            <ul>
                                <li>
                                    <span class="l">1회 지공량(kcal)</span>
                                    <span>345</span class="r">
                                </li>
                                <li>
                                    <span class="l">포화지방 (g)</span>
                                    <span>11</span class="r">
                                </li>
                                <li>
                                    <span class="l">단백질 (g)</span>
                                    <span>11</span class="r">
                                </li>
                            </ul>
                        </div>

                        <div class="boxtwo"> <!--영양 정보를 좌우로 반반 나눠주었으며, 오른쪽에 해당하는 div 태그-->
                            <ul>
                            <ul>
                                <li>
                                    <span class="l">나트륨(mg))</span>
                                    <span>150</span class="r">
                                </li>
                                <li>
                                    <span class="l">당류 (g)</span>
                                    <span>35</span class="r">
                                </li>
                                <li>
                                    <span class="l">카페인 (mg)</span>
                                    <span>75</span class="r">
                                </li>
                            </ul>
                        </div>

                    </div>

                    <div class="allegy">알레르기 유발 요인 : 우유</div>


				<script type="text/javascript">

	
					function addToCart() {
						// 확인 true 취소 false
						if (confirm("상품을 장바구니에 추가하시겠습니까?")) { // 확인
							document.addForm.submit();
						} else { // 취소
							document.addForm.reset();
						}
					}
				</script>

				<p>	
				<form name="addForm" method="post"
					action="addCart.jsp?id=${product.productId}">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
					<a href="cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
					<a href="products.jsp" class="btn btn-secondary"> 상품목록&raquo;</a>	
				</form>
				</p>
                    
                   <!-- 리뷰 (나중!!)  -->
				<p class="reviewnav">리뷰</p>

                    <div class="Allcomment"> <!--모든 댓글 내용을 담아내는 div 태그-->
                        <div class="comment"> <!-- comment class는 각각 하나의 댓글을 담아냄 -->
                            <span class="id">coffee_lover</span>
                            <span class="ment">너무 맛있어요!</span>
                            <button class="deletebutton">삭제</button>
                            <a href="#" class="commentheart"><i class="far fa-heart"></i></a>
                        </div>

                        <div class="comment">
                            <span class="id">CHOCO7</span>
                            <span class="ment">오늘도 화이트 초콜릿 모카를 마시러 갑니다</span>
                            <button class="deletebutton">삭제</button>
                            <a href="#" class="commentheart"><i class="far fa-heart hearts"></i></a>
                        </div>

                        <div class="comment">
                            <span class="id">legend_dev</span>
                            <span class="ment">진짜 화이트 초콜릿 모카는 전설이다.</span>
                            <button class="deletebutton">삭제</button>
                            <a href="#" class="commentheart"><i class="far fa-heart"></i></a>
                        </div>
                    </div>

                    <input text="" placeholder="리뷰를 입력해주세요" class="reviewcomment"
                            onkeyup="if(window.event.keyCode==13){test()}"> <!--후반부에 구현할 댓글 입력을 위한 input 태그-->
    </section>
    
    <footer>
    </footer>

</body>



</html>