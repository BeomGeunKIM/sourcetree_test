<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<style>
	#infoBox{
		width: 40%;
		margin-left : auto;
		margin-right: auto;
		border: solid 1px lightgray;
		height : 400px;
		
		
	}
	.moveButton{
		height : 50px;
		background : #3DB6AE;
		color : white;
		font-weight: bolder;
		font-size:  20px;
		border: none;
	}
	.moveButton:active{
		outline: none;
	}
</style>
<title>Insert title here</title>
</head>
<script>
	window.history.forward();
	function noBack(){window.history.forward();}
</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<header><%@ include file="../common/header.jsp"%></header>
	<section>
		<br><br><br>
		<h1 style="margin-left:auto; margin-right:auto; margin-top:0; font-size:60px; font-weight:bolder;" align="center">SO EASY</h1>
		<br>
		<div id="infoBox">
		
		<div style="width:100%; height:60px; background:#3DB6AE; margin:0;">
			
			<h1 align="center" style="line-height:60px; margin:0">삭제된 아이디</h1>
		</div>
		<br><br><br>
		<h2 style="text-align: center"><%=loginUser.getmId()%>는 정지된 계정입니다.
		<br><label style=font-size:30px; id="seconds"></label>초후 메인화면으로 이동합니다.</h2>
		<br><br><br>
		<div align="center">
		<button type="button" class="moveButton" onclick="moveMain();">메인으로 이동</button>
		
		</div>
		</div>
	</section>
	<footer><%@ include file="../common/footer.jsp"%></footer>
	<script>
		$(function(){
			
			var count=5;
			var counter = setInterval(timer,1000);
			
			function timer(){
				document.getElementById("seconds").innerHTML=count;
				count--;
				if(count<=0){
					clearInterval(counter);
					location.href="<%=request.getContextPath()%>/logout.me";
				}
				
			}
		});
		function moveMain(){
			location.href = "<%=request.getContextPath()%>/logout.me";
		}
	</script>
</body>
</html>