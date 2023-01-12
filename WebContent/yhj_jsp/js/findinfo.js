//아이디 찾기

function id_search(frm) {
	var userName = frm.userName;
	var userPhone = frm.userPhone;
	console.log("userName >>> " + userName.value);
	console.log("userPhone >>> " + userPhone.value);
	if (userName.value.length < 1) {
		alert("이름을 입력해주세요");
		return;
	}

	if (userPhone.value.length != 13) {
		alert("핸드폰번호를 정확하게 입력해주세요");
		return;
	}

	frm.method = "post";
	frm.action = "findIdResult.jsp"; // 넘어간화면
	frm.submit();
}

//비밀번호찾기
function pw_search(frm){

// var frm=document.pwfindscreen;
 
 var userId = frm.userId;
 var userPhone = frm.userPhone;
 

 if(userId.value.length<1){
  alert("아이디를 올바르게 입력해주세요");
  return;
 }

  if (userPhone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }
	
 frm.method="post";
 frm.action="findPwResult.jsp"; //넘어간화면
 frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
 
}

function addHypen(obj) {
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";

	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	