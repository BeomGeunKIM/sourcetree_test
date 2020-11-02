<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int errorCode =0;
	String msg = (String)request.getAttribute("msg");

	if(request.getAttribute("errorCode")!=null){
			errorCode = (int)request.getAttribute("errorCode");
			
	}else{
		errorCode = 0;
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SO Easy</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="/login/css/layout.css">
<style>


.input-group {
	width: 400px;
	margin: 60px auto;
	padding: 0;
	position: relative;
}

.loginForm {
	border: none;
	border-bottom: 1px solid #888;
	font-size: 15px;
	display: inline;
	background: #ECECEC38;
	width: 400px;
}

.loginForm:focus {
	outline: none;
	border-bottom-width: 4px;
	border-color: #3DB6AE;
	transition: 0.5s;
}

.inputInfo {
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

table {
	margin: auto;
	padding: 0;
}

.input-group button {
	background: #3DB6AE;
	width: 400px;
	height: 40px;
	border-radius: 10px;
	color: white;
	font-weight: border;
	border-color: #ECECEC38;
}

#loginTitle {
	font-size: 60px;
	font-weight: bolder;
	margin: 0 auto;
	padding: 0;
	text-align: center;
}





.findAndJoin {
	margin: 24px;
	text-decoration: none;
	color: black;
	font-weigth: bolder;
	font-size: 15px;
}





#find {
	text-align: center;
	align-content: center;
}

.stick{
	display : inline-block;
}



</style>
</head>
<script>
window.history.forward();
	function noBack(){window.history.forward();}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	
		<header>
			<%@ include file="../common/header.jsp"%>
		</header>

		<section align="center">
			<br><br>
			
			<h1 id="loginTitle">SO Easy</h1>
			<h2>로그인</h2>
			<form action="<%=request.getContextPath()%>/login.me" method="post">
				<table>
					<tr>
						<td class="input-group"><label for="id" class="inputInfo">아이디</label>
							<input type="text" id="id" placeholder="아이디" class="loginForm"
							name="userId" /></td>



					</tr>
					<tr>
						<td class="input-group"><label for="password" class="inputInfo">비밀번호</label>
							<input type="password" id="password" placeholder="비밀번호"
							class="loginForm" name="password" /></td>

					</tr>
					<tr id="find">
						<td><a class="findAndJoin" href="/login/views/member/findId.jsp">아이디 찾기</a> <pre class="stick">|</pre> <a
							class="findAndJoin" href="/login/views/member/findId.jsp">비밀번호찾기</a> <pre class="stick">|</pre> <a
							class="findAndJoin" href=/login/views/member/join.jsp>회원가입</a></td>
					</tr>


					<tr>
						<td class="input-group">
							<button type="button" onclick="checkNullLogin();">로그인</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
		
			<footer><%@ include file="../common/footer.jsp"%></footer>
	
	
	<script>
		
		$(document).ready(function(){
			var msg = '<%=msg%>';
			var errorCode = <%=errorCode%>;
			if(errorCode > 0){
				alert(msg);
				console.log(msg);
			}
			
		});
		$('input').click(function() {
			$(this).attr('placeholder', '');
			$(this).parent().find('label').addClass('label-top');
		});
		
		function checkNullLogin(){
			if($('#id').val().length==0 ||$('#password').val().length==0){
				alert("정보를 모두 입력해주세요.");
				return;
			}
			else{
				$('form').submit();
			}
			
		}
	</script>
</body>
</html>