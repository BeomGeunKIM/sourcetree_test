<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
	int resultPwd=0;
	if(request.getAttribute("resultPwd") != null){
	 resultPwd = (int)request.getAttribute("resultPwd");
	System.out.println(resultPwd);
	}else{
		request.setAttribute("msg", "잘못된 접근입니다.");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,response);
	}
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">

<title>Insert title here</title>

</head>
<script>
	window.history.forward();
	function noBack(){window.history.forward();}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<header><%@ include file="../common/header.jsp"%></header>
	<section>
			<br><br><br><br>
			<form id="newPwForm" action="/login/updatePwd.me">
			<table id="joinTable">
			<tr>
				<td><h2 align="center" style="font-size: 35px;">비밀번호를 변경해 주세요</h2></td>
				<td><input type="hidden" value="<%=resultPwd%>" id="memNo"></td>
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
					<td><button class="submitButton" type="button" onclick="checkingInput();">전송</button></td>
				</tr>
			</table>
			
			</form>
			<script src="/login/js/validate.js"></script>
	</section>
	<footer><%@ include file="../common/footer.jsp"%></footer>
	
	<script>
	
	//디자인  메소드
	$('input').click(function() {
		$(this).attr('placeholder', '');
		$(this).parent().find('label').addClass('label-top');
	});
	</script>
</body>
</html>