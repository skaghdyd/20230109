<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String loginId = (String) session.getAttribute("loginId");
	if(loginId==null){
		System.out.println("세션 없음");
	} else {
		System.out.println("세션 있음");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<style>
* {
	background-color: white;
}

#main {
	padding-top: 20px;
	width: 100%;
	height: auto;
	min-height: 100%;
	padding-bottom: 200px;
}

#iframe1 {
	width: 100%;
	height: 100vh;
}

#chatButton {
	position: fixed;
	bottom:30px;
	right:30px;
	border: 1px solid black;
	width: 50px;
	height: 50px;
	line-height: 50px;
}

#chatBox {
	display: none;
	position: fixed;
	bottom: 81px;
	right: 32px;
	width: 400px;
	height: 500px;
}

#messageWindow {
	position: absolute;
	bottom: 50px;
	border: 1px solid black;
	width: 100%;
	height: 450px;
	margin-right: 5px;
	overflow: auto;
}

#inputWindow {
	position: absolute;
	bottom: 0px;
	border: 1px solid black;
	width: 100%;
	height: 50px;
	line-height: 50px;
}

#inputMessage {
	width: 300px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="main" align=center>
		<article id="article1">
			<iframe id="iframe1" name="iframe1" src="main.jsp" width="1000px" height="700px" seamless></iframe>
		</article>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<div align="right">
		<div id="chatBox">
			<div id="messageWindow"></div>
			<div id="inputWindow" align="center">
	            <input id="inputMessage" type="text" onkeyup="enterkey()">
	            <input type="button" value="send" onclick="send()">
			</div>
		</div>
		<div id="chatButton" align="center" onclick="chatToggle()">채팅</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		let webSocket;
		let textarea = document.getElementById("messageWindow");
	    let inputMessage = document.getElementById('inputMessage');
	    
		function chatToggle() {
			if ($("#chatBox").css("display")=="block"){
				$("#chatBox").hide();
				webSocket.send("SYSTEM|<%=loginId%>님이 퇴장하셨습니다.");
				webSocket.close();
			} else {
				$("#chatBox").show();
				webSocket = new WebSocket('ws://172.30.1.77:8080/____jspProject/broadcasting');
				webSocket.onerror = function(event) {
			        onError(event)
			    };
			    webSocket.onopen = function(event) {
			        onOpen(event)
			        webSocket.send("SYSTEM|<%=loginId%>님이 입장하셨습니다.");
			    };
			    webSocket.onmessage = function(event) {
			        onMessage(event)
			    };
			}
		};
		
	    function onMessage(event) {
	        let message = event.data.split("|");
	        let sender = message[0];
	        let content = message[1];
	        if (content != "") {
	        	$("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
	        }
	    }
	    
	    function onOpen(event) {
	        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	    }
	    
	    function onError(event) {
	        alert(event.data);
	    }
	    
	    function send() {
	        if (inputMessage.value != "") {
	            $("#messageWindow").html(
	            		$("#messageWindow").html() + "<p class='chat_content'>나 : " + inputMessage.value + "</p>"
	            		);
	        }
	        webSocket.send("<%=loginId%>" + "|" + inputMessage.value);
	        inputMessage.value = "";
	    }
	    
	    //엔터키를 통해 send함
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	        }
	    }
	    
	    //채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	    window.setInterval(function() {
	        let elem = document.getElementById('messageWindow');
	        elem.scrollTop = elem.scrollHeight;
	    }, 0);
	    
	    //브라우저 창을 닫을때 퇴장 메세지 전송
	    window.addEventListener('beforeunload', function(){
    		webSocket.send("SYSTEM|<%=loginId%>님이 퇴장하셨습니다.");
	    });
	</script>
</body>
</html>