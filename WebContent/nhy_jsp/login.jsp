<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>마켓퀄리 로그인</title>
<link rel="stylesheet" href="css/Login.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>


	<br>
	<br>
	<form method="post" action="loginAction.jsp">
		</div>

		<div class="logo image">
			<a href=index.jsp><img src="image/mama.png"></a>
		</div>
		<div class="form-group">
			<input type="text" class="form-control" name="userId"
				placeholder="아이디">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="userPw"
				placeholder="비밀번호">
		</div>
		<div class="login-button">
			<input type="submit" class="btn btn-primary form-control" value="로그인">
			</button>
		</div>
		</div>
		<div class="form-check2">
			<div>
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">로그인 상태
					유지</label>
			</div>
		</div>
	</form>
	<div class="button-login" align="center">
		<a id="kakao-login-btn"> </a>
	</div>
	<a href="javascript:void(0)" onclick="kakaoLogin();"> <img
		src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
		width="100%" height="100%" />
	</a>

	<a href="javascript:void(0)" onclick="kakaoLogout();"> <span>카카오
			로그아웃</span>
	</a>
	<br>
	<br>
	<footer class="footer">
		<div class="footer-info">
			<a href=findId.jsp>아이디 찾기</a> | <a href=findPw.jsp>비밀번호 찾기</a> | <a
				href="register.jsp">회원가입</a>
		</div>
	</footer>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!--카카오 qr 스크립트  -->
	<script>
		Kakao.init('490b24c14cba053c7a8956d1837ee10e'); //발급받은 키 중 javascript키를 사용해준다.
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
			Kakao.Auth.login({
				success : function(response) {
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response)

						},
						fail : function(error) {
							console.log(error)
						},
					})
				},
				fail : function(error) {
					console.log(error)
				},
			})
		}
		//카카오로그아웃  
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>
</body>
</html>

