<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript">
	//3연속 동일 및 3연속 체킹
	let pw_passed = true;	//통과
	//핸들러 함수
	function CheckLogin() {
		let id = document.loginForm.id.value;
		let passwd = document.loginForm.passwd1.value;
		let passwdConfirm = document.loginForm.passwd2.value;
		
		if(id.length == 0){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(passwd.length == 0){
			alert("비밀번호를 입력해주세요");
		}else{
			if(passwd != passwdConfirm){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}
		let sameChar = 0;	//동일문자
		let sequenceCount1 = 0;	//연속성(+) 카운트
		let sequenceCount2 = 0; //연속성(-) 카운트
		pw_passed = true;	//통과
		console.log("passwd: "+passwd);

		for(let i = 0;i <passwd.length;i++){
			let char0;
			let char1;
			let char2;
			if( i >= 2){
				char0 = passwd.charCodeAt(i-2);
				char1 = passwd.charCodeAt(i-1);
				char2 = passwd.charCodeAt(i);

				//동일문자 카운트
				if((char0 == char1)&&(char1==char2)){
					sameChar++;
				}else{
					sameChar = 0;
				}
			}
			console.log(char0 + " : "+char1 +" : "+char2 +"=>"+sameChar);
			console.log("=================");
			//연속성(+) 카운트 c b a
			if(char0-char1==1&&char1-char2==1){
				sequenceCount1++;
			}else{
				sequenceCount1 = 0;
			}

			//연속성(-) 카운트 a b c
			if(char0-char1==-1&&char1-char2==-1){
				sequenceCount2++;
			}else{
				sequenceCount2 = 0;
			}
			console.log(sequenceCount1+" : "+sequenceCount2);
			console.log("================");
			
			if(sameChar > 0){//동일문자 3개가 있으면
				alert("동일문자 3개 이상 연속 입력할 수 없습니다.");
				pw_passed = false;	//통과안됨
			}

			if(sequenceCount1 > 0 || sequenceCount2 > 0){//연속문자 있으면
				alert("영문, 숫자는 3자 이상 연속 입력할수 없습니다.");
				pw_passed = false;	//통과안됨
			}

			if(!pw_passed){
				return false;
				break;
			}
		}
		document.loginForm.submit();
	}
</script>
</head>
<body>
	<form name="loginForm" action="validation02_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"/></p>
		<p>비밀번호: <input type="text" name="passwd1"/></p>
		<p>비밀번호 확인: <input type="text" name="passwd2"/></p>
		<p><input type="button" value="전송" onclick="CheckLogin()"/></p>
	</form>
</body>
</html>