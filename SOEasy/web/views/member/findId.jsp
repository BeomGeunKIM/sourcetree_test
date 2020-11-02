<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String msg ="";
	if(request.getAttribute("msg")!=null){
		msg =(String)request.getAttribute("msg");
	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
section {
	clear: both;
}

#findBox {
	width: 600px;
	margin: 0 auto;
	clear: both;
	border-style: solid;
	border-width: 1px;
	border-color: #C4C4C4;
	height : 500px;
}

#findForm {
	padding: 0;
	margin : 0 auto;
	
}

#findBrand {
	font-size: 60px;
	font-weight: bolder;
}

#findForm div .button {
	height: 100px;
	width: 295px;
	margin: 0;
	display: inline-block;
	padding: 0;
	border: none;
	text-align: center;
	vertical-align: middle;
	
}

#findForm div .button p {
	font-size: 20px;
	font-weight: bolder;
}

.idfindNeeds {
	display: block;
	width: 350px;
	height: 30px;
	border-radius: 5px;
	border-color: lightgray;
	outline: none;
	border-style: solid 2px;
}
.button:first-child{
	background : #3DB6AE;
	
}
.button:nth-child(2) {
	
	background : lightgray;
}


#findButton{
	background: #3DB6AE;
	width: 500px;
	height : 75px;
	outline: none;
	border-style : none;
	border-radius : 10px;
	
	
}
#findButton:active{
	outline : none;
	
}
#findButton p{
	margin : 0 auto;
	padding : 0;
	line-height : 80px;
	font-size : 30px;
	font-weight: bolder;
}


#idBox table tr td label{
	font-size : 20px;
	font-weight : border;
}

#certCode{
	background : #3DB6AE;
	border-radius : 10px;
	border: none;
	height: 35px;
	font-weight: bolder;
	width: 80px;
}
#certCode:focus{
	outline : none;
}
#correctCert{
	background : #3DB6AE;
	border-radius : 10px;
	border: none;
	height: 35px;
	font-weight: bolder;
	width: 80px;
}

#correctCert:focus{
	outline : none;
}
</style>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<script>
 $(function(){
	var msg = "<%=msg%>";
	if(msg != ""){
		alert(msg);
	}
 });
</script>
</head>
<body>
	<header><%@ include file="../common/header.jsp"%></header>

	<section>

		<br>
		<p align=center id="findBrand">SO EASY</p>
		<div id="findBox">
	
			<form action="/login/findId.me" method="post" id="findForm">
				<input type="hidden" id="kindOf" name="kindOf" value=1>
				<div align="center">
					<div class="button">
						<br>
						<p>아이디 찾기</p>
					</div>
					<div class="button">
						<br>
						<p>비밀번호 찾기</p>
					</div>
					<div id="idBox">
						<h1>아이디는 가입하신 이름과 이메일로 찾을 수 있습니다.</h1>
						<table>
							<tr>
								<td><label style="margin-right : 20px;" id="text1">이름 </label></td>
								<td><input type="text" name="name" class="idfindNeeds"
									placeholder="이름을 입력하세요"></td>
								<td><br>
								<br>
								
								<br></td>

							</tr>


							<tr>
								<td ><label style="margin-right : 20px;" id="text2">이메일 </label></td>
								<td><input type="email" name="email" class="idfindNeeds"
									placeholder="이메일을 입력하세요" id="email"></td>
								<td><button id="certCode" type="button" onclick="sendCertifiedEmail();">인증코드 전송</button></td>
								<td><input type="hidden" id="eCode"></td>
								<td><br>
								<br>
								
								<br></td>
							</tr>
							<tr>
								<td ><label style="margin-right : 20px;" id="text2">인증코드 </label></td>
								<td><input type="text" name="userEcode" class="idfindNeeds" id="userEcode"
									placeholder="인증코드를 입력하세요"></td>
									<td><button type="button" id="correctCert" onclick="checkEcert();">인증확인</button></td>
									</tr>
						</table>
					</div>
					
					
					<br>
					<!-- 찾기 버튼 -->
					<button type="button" id="findButton" onclick="findId();"><p>찾기<p></button>
							
							
					</div>

				

			</form>


		</div>
	</section>

	<footer><%@ include file="../common/footer.jsp"%>
	</footer>

	<script>
	//이메일 유효성 검사 변수
	
	var canCertifiedEamil; //이메일 인증을 실행할 만한 조건이 되는지 체크
	var $email; // 유저 이메일
	var checkEmail = false;//이메일 인증 체크 했는지 여부
	var getEmail = RegExp(/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/); // 유저 이메일 유효성 검사

		//이메일 인증 검사
		function sendCertifiedEmail(){
		
				var email = $('#email').val();
				var name = $('#name').val();
				$.ajax({
					url: "/login/findECert.me",
					data: {email : email },
					type: "post",
					success: function(data){
						console.log(data);
						if(data =="fail"){
							alert("등록되지 않은 이메일 입니다");
						}
						
						else{
						alert("인증코드가 발송되었습니다!");
						$('#eCode').val(data);
					
						}
					},
					error: function(data){
						console.log("이메일 인증 에러")
					}
					
				});
		
		}
	
		function checkEcert(){
			var userEcode = $("#userEcode").val();
			var certEcode= $('#eCode').val();
			console.log(userEcode);
			console.log(certEcode);
			if(userEcode == certEcode){
				alert("이메일 인증이 완료되었습니다");
				$('#email-certificate p').text("이메일 인증 완료").css("color","green");
				$('#emailCode').prop("readonly",true);
				$('#email').prop("readonly",true);
				checkEmail=true;
				console.log("checkEmail :"+checkEmail);
					
			}else{
				alert("본인인증 실패 다시 입력해주세요");
				$('#inputCert p').text("본인인증을 다시 진행해주세요").css("color","red");
						
			}
		}
		
		function findId(){
			var name = $('input[name=name]').val();
			var email = $('input[name=email]').val();
			var eCode= $('input[name=userEcode]').val();
			console.log(name);
			console.log(email);
			if(name != "" && email!=""&& checkEmail==true){
				
				$('#findForm').submit();
		
			} else{
				
				alert("정보를 모두 입력해주십시오");
			}
		}
		
		$('.button:first-child').click(function() {
			$(this).css("background", "#3DB6AE");
			$('.button:nth-child(2)').css("background", "lightGray");
			$('#idBox h1').text("아이디는 가입하신 이름과 이메일로 찾을 수 있습니다.");
			$('#text1').text('이름');
			$('input[name=userId]').attr("placeholder","이름을 입력하세요");
			$('#kindOf').val(1);
		});
		
		$('.button:nth-child(2)').click(function() {
			$(this).css("background", "#3DB6AE");
			$('.button:first-child').css("background","lightGray");
			$('#idBox h1').text("비밀번호는 가입하신 아이디와 이메일로 찾을 수 있습니다.");
			$('#text1').text("아이디");
			$('input[name=userId]').attr("placeholder","아이디를 입력하세요");
			$('#kindOf').val(2);

		});
		
	</script>		

		

</body>
</html>