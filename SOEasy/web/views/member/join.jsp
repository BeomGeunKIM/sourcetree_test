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

input:focus {
	outline: none;
	border-bottom-width: 4px;
	border-color: #3DB6AE;
	transition: 0.5s;
}

.input {
	position: absolute;
	color: #3DB6AE;
	left: 0;
	top: 0;
	opacity: 0;
	visibility: hidden;
	transition: 0.5s;
	font-weight: bold;
}

.label-top {
	top: -10px;
	opacity: 1;
	visibility: visible;
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
	/* 	height: 20px;
	opacity : 1;
	visibility : visible; */
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
</style>
</head>
<body>
	<header>
		<%@ include file="../common/header.jsp"%>

	</header>

	<nav></nav>
	<section>




		<form action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm">
			<table id="joinTable" align="center">
				<tr>
					<td><h1 align="center">회원가입</h1>
					<td>
				</tr>
				<tr>
					<td class="input-group" id="id-zone"><label for="id" class="input">아이디</label>
						<input type="text" id="userId" placeholder="아이디" name="userId" onkeyup="setTimeout(checkingId(),200);"/>
						<button type="button" onclick="checkSameId();">아이디 중복 확인</button>
						<p></p>
						</td>
				</tr>

				<tr>
					<td class="input-group" id="nickName-zone"><label for="nickName" class="input">닉네임
					</label> <input type="text" id="nickName"  name="nickName" placeholder="닉네임" onkeyup="setTimeout(checkingNickName(),200)" />
						<button type="button" onclick="checkSameNickName();">닉네임 중복 확인</button>
						<p></p>
						</td>
						
				</tr>

				<tr>
					<td class="input-group"><label for="name" class="input">이름</label>
						<input type="text" id="name" placeholder="이름" name="name" /></td>
				</tr>


				<tr>
					<td class="input-group" id="password-zone">
						<pre id="validate1">                                               0/16자</pre>
						<label for="password" class="input" >비밀번호</label>
						<input type="password" id="password" placeholder="비밀번호" name="password" onkeyup="setTimeout(checkPwdLength(),200);" />
						<p></p>
					</td>
				</tr>

				<tr>
					<td class="input-group" id="password2-zone">
					<label for="password02" class="input">비밀번호 확인</label>
					 <input type="password" id="password2" placeholder="비밀번호 확인" onkeyup="setTimeout(checkPwdSame(),200);" />
							<p></p>
					</td>
				</tr>

				<tr>
					<td class="input-group" id="phone-zone" ><label for="phoneNum" class="input">연락처
					</label> <input type="tel" id="phoneNum" name="phoneNum" placeholder="연락처" />
						<button type="button" onclick="certified();">본인 인증</button>
						<input type="hidden" id="cert">
						</td>
				</tr>
				
				<tr>
					<td class="input-group" id="inputCert"><label for="certCode" class="input">인증번호</label>
						<input type="text" id="userCode" placeholder="인증번호를 입력해주세요" onclick="" />
						<button type="button" onclick="certifyCorrect();">인증 확인</button>
						<p></p>
						</td>
						
				</tr>

				<tr>
					<td class="input-group" id="email-zone"><label for="email" class="input">이메일</label>
						<input type="email" id="email"  name="email" placeholder="이메일" onkeyup="setTimeout(checkingEmail(),200)" />
						<button type="button" onclick="checkCertifiedEmail();">이메일 인증</button>
						<p></p>
						<input type="hidden" id="eCert">
						</td>
						
				</tr>
				
				<tr>
					<td class="input-group" id="email-certificate"><label for="emailCode" class="input">인증코드</label>
						<input type="text" id="emailCode" placeholder="인증코드를 입력해주세요" onclick="" />
						<button type="button" onclick="checkEcert();">인증 확인</button>
						<p></p>
						</td>
						
				</tr>

				<tr class="checkRule">
					<td><input type="checkbox" name="rule" id="rule1" value="이용약관"><label
						for="rule1" class="check" onclick="turnRule1();">이용약관 동의</label></td>
				</tr>
				<tr class="checkRule">

					<td class="checkbox"><input type="checkbox" name="rule"
						id="rule2" value="이용약관동의"><label for="rule2" class="check" onclick="turnRule2();">개인정보지침
							동의</label></td>
				</tr>
				<tr class="checkRule">
					<td><input type="checkbox" name="rule" id="rule3" value="모두"><label
						for="rule3" class="check">모두 동의</label></td>
				</tr>

				<tr>
					<td><button type="button" name="transfer" id="trans"
							class="submitButton" onclick="checkAll();">회원 가입 완료</button></td>
				</tr>


			</table>
		</form>

	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>

	<script>
	
	
	

		//디자인  메소드
		$('input').click(function() {
			$(this).attr('placeholder', '');
			$(this).parent().find('label').addClass('label-top');
		});
		
		function turnRule1(){
			window.open('../common/rule1.jsp', 'window팝업', 'width=1000px, height=800px, menubar=no, status=no, resizable=no, toolbar=no');  
		}
		
		function turnRule2(){
			window.open('../common/rule2.jsp', 'window팝업', 'width=1000px, height=800px, menubar=no, status=no, resizable=no, toolbar=no');  
		}
		
	</script>
</body>
</html>