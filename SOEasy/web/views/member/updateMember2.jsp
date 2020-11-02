<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../../js/validate.js"></script>
<link rel="stylesheet" href="../../css/layout.css">
<title>SO Easy</title>
<style>
#joinTable {
	margin: 0 auto;
	clear : both;
	
}

.input-group {
	width: 450px;
	margin: 60px auto;
	padding: 0;
	position: relative;
}

#joinTable tr td input {
	border: none;
	border-bottom: 1px solid #888;
	font-size: 15px;
	display: inline;
	background: #ECECEC38;
}



.input {
	position: absolute;
	color: #3DB6AE;
	left: 0;
	top: 0;
	
	font-weight: bold;
}

input:focus {
	outline: none;
	border-bottom-width: 4px;
	border-color: #3DB6AE;
	transition: 0.5s;
}

tr {
	height: 100px;
}

.input-group button {
	background: #3DB6AE;
	width: 120px;
	height: 40px;
	border-radius: 10px;
	color: white;
	font-weight: border;
	border-color: #ECECEC38;
}

.checkRule {
	
	height: 40px;
	border-radius: 10px;
	display: block;
}

h1 {
	font-size: 60px;
	font-weight: bolder;
}

#joinTable tr td {
	left: 50px;
}

.submitButton {
	width: 400px;
	background: #3DB6AE;
	border-radius: 10px;
	height: 40px;
	border-style: none;
	color: white;
	font-size: 15px;
}
#validate1{
	font-weight: bold;
	font-size : 15px;
	font-family : sans-serif;
}
.input-group p {
	font-size : 13px;
	font-weight : normal;
}

#profileZone{
 border-radius: 50%;
 width:100px;
 height:100px;
 margin-left:auto;
 margin-right: auto;
 overflow: hidden;
 border: solid;

}
#profileZone img{
 	width: 100%;
    height: 100%;
    object-fit: cover;
}
	
#changeProfile{
	display: block;
	background: #3DB6AE;
	border : none;
	color : white;
	height : 40px;
	border-radius: 5px;
	width: 120px;
	text-align : center;
	font-weight: normal;
	line-height: 40px;
}
#changeProfile:active{
	outline: solid 1px black;
}

#profile{
 	display: none;
	visibility: hidden;
	opacity: 0; 
}
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>

	</header>
	<%
		if(userStatus ==0 || loginUser==null){
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,response);
		}
		%>
	<nav><%@ include file="../common/aside.jsp"%></nav>
	<section>




		<form action="/login/updateMember.me" method="post" id="joinForm" encType="multipart/form-data">
			<table id="joinTable" align="center">
			
				<tr>
					
					<td><h1 align="center">SO EASY<br><br>개인정보 수정<hr></h1><td>
				</tr>
				<tr>
					<td align="center" height="200px">
						<div id="profileZone">
							<img src="<%=request.getContextPath()+loginUser.getFilePath()+loginUser.getChangeName()%>" id="profilePhoto">
						</div>
						<br>
						<div style="margin-left:auto; margin-right:auto;">
						<label id="changeProfile" for="profile">프로필 사진 변경</label>
						<input type="file" accept="image/*,.pdf" id="profile" name="profile" onchange="loadImg(this);">
						</div>
			
					</td>
				</tr>
				<tr>
					<td class="input-group"><label for="id" class="input">아이디</label>
						<input type="text" name="userId" id="userId" value="<%=loginUser.getmId()%>" readonly/>
						
						</td>
				</tr>

				<tr>
					<td class="input-group" id="nickName-zone"><label for="nickName" class="input">닉네임
					</label> <input type="text" id="nickName" name="nickName" value="<%=loginUser.getmNick()%>" onkeyup="setTimeout(checkingNickName(),200)" readonly />
						<button type="button" onclick="changeNickName();">닉네임 수정</button>
						<input type="hidden" value=1 id="swNick">
						<p></p></td>
				</tr>

				<tr>
					<td class="input-group"><label for="name" class="input">이름</label>
						<input type="text" id="name"  name="name" value="<%=loginUser.getmName()%>" readonly/>
						<button type="button" onclick="changeName();">이름 수정</button>
						<input type="hidden" value=1 id="swName">
						</td>
				</tr>


				<tr>
					<td class="input-group" id="password-zone"><label for="password" class="input">비밀번호</label>
					<pre id="validate1">                                               0/16자</pre>
						<input type="password" id="password" name="password" onkeyup="setTimeout(checkPwdLength(),200);" readonly/>
						
						<button type="button" onclick="changePassword();">비밀번호 수정</button>
						<p></p>
						<input type="hidden" id="swPassword" value=1 name="swPassword">
						</td>
				</tr>
				
				<tr>
					<td class="input-group" id="password2-zone"><label for="password2"  class="input" >비밀번호확인</label>
						<input type="password" id="password2" name="password2" onkeyup="setTimeout(checkPwdSame(),200);" readonly/>
						<p></p></td>
						
				</tr>
				<tr id="phoneArea">
					<td class="input-group" id="phone-zone" ><label for="phoneNum" class="input">연락처
					</label> <input type="tel" id="phoneNum" name="phoneNum" value="<%=loginUser.getmPhone()%>" readonly/>
						<button type="button" onclick="changePhoneNum();">연락처 수정</button>
						<input type="hidden" id="cert">
						<input type="hidden" id="swPhone" value=1> 
						
						</td>
				</tr>

				<tr id="emailArea">
					<td class="input-group" id="email-zone"><label for="email" class="input">이메일</label>
						<input type="email" id="email"  name="email" value="<%=loginUser.getmEmail()%>" onkeyup="setTimeout(checkingEmail(),200)" readonly/>
						<button type="button" onclick="changeEmail();">이메일 수정</button>
						<p></p>
						<input type="hidden" id=eCert>
						<input type="hidden" id="swEmail" value=1>
						</td>
				</tr>

				

				<tr>
					<td><button type="button" name="transfer" id="trans"
							class="submitButton" onclick="checkUpdate();">개인정보 수정  완료</button></td>
				</tr>
						

			</table>
		</form>

	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
	<script>
		$(function(){
			checkNickName = true;
			checkpw = true;
			checkpw2 = true;
			checkEmail =true;
			checkCert = true;
		});
		function loadImg(value){
			
			if(value.files && value.files[0]){
				var reader= new FileReader
				reader.onload = function(e){
					
				$('#profilePhoto').attr("src",e.target.result); 
			}
			reader.readAsDataURL(value.files[0]);
			
			}
		}
	
		$('input').click(function() {
			$(this).attr('placeholder', '');
			$(this).parent().find('label').addClass('label-top');
		});
		
		function changeNickName(){
			$('input[name=nickName]').removeAttr("readonly");
			$('#nickName-zone button').text("닉네임 중복 확인").attr("onclick","checkSameNickName();");
			checkNick = false;
			
			
		}
		
		function changeName(){
			$('input[name=name]').removeAttr("readonly");
			
		}
		function changePassword(){
			$('input[name=password]').removeAttr("readonly");
			$('input[name=password2]').removeAttr("readonly");
			$('#swPassword').val(2);
			checkpw=false;
			checkpw2 = false;
			
		}
		function changePhoneNum(){
			$('input[name=phoneNum]').removeAttr("readonly");
			$('#phone-zone button').text("본인 인증").attr("onclick","certified2()");
			$('#phoneArea').after("<tr><td class='input-group' id='inputCert'><label for='certCode' class='input'>인증번호</label><input type='text' id='userCode' placeholder='인증번호를 입력해주세요' onclick=''/><button type='button' onclick='certifyCorrect();'>인증 확인</button><p></p></td></tr>");
			checkCert = false;
		}
		function changeEmail(){
			$('input[name=email]').removeAttr("readonly");
			$('#email-zone button').text("이메일 인증").attr("onclick","checkCertifiedEmail2();");
			$('#emailArea').after("<tr><td class='input-group' id='email-certificate'><label for='emailCode' class='input'>인증코드</label><input type='text' id='emailCode' placeholder='인증코드를 입력해주세요' onclick=''/><button type='button' onclick='checkEcert();'>인증 확인</button><p></p></td></tr>");
			checkEmail = false;	
		}
		
		function checkUpdate(){
			console.log(checkNickName);
			console.log(checkpw);
			console.log(checkpw2);
			console.log(checkEmail);
			console.log(checkCert);
			//프로필 사진 검사
			var $userProfileOriginalFile = $("#profile"); // 유저 프로필 사진명
			var fileExt = $userProfileOriginalFile.val().substring($userProfileOriginalFile.val().lastIndexOf(".") + 1); // 확장자명 구하기 위함
			var getUserProfileOriginalFile = RegExp(/jpg|jpeg|png|gif/i); // 유저 프로필 사진 유효성 검사
			
			
			if(!getUserProfileOriginalFile.test(fileExt) && $userProfileOriginalFile.val().length > 0){
				alert("프로필 사진은 jpg, jpeg, png, gif로 된 이미지만 가능합니다.");
				return false;
			}
			if(checkNickName === false){
				alert("닉네임을 확인하세요!");
				return;
			}
			
			if(checkpw=== false || checkpw2 === false){
				alert("비밀번호를 확인하세요!");
				return;
			}
			
			if(checkEmail === false){
				alert("이메일을 확인하세요!");
				return;
			}
			
			if(checkCert === false){
				alert("본인인증을 진행하세요!");
				return;
			}
			$('#joinForm').submit();
		}
	</script>
</body>
</html>