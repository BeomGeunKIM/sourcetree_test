<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String) request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SO Easy</title>
<link rel="stylesheet" href="/login/css/layout.css">
<style>
#infoBox {
	width: 40%;
	margin-left: auto;
	margin-right: auto;
	border: solid 1px lightgray;
	height: 400px;
}

.moveButton {
	height: 50px;
	background: #3DB6AE;
	color: white;
	font-weight: bolder;
	font-size: 20px;
	border: none;
}

.moveButton:active {
	outline: none;
}
</style>
</head>
<body>
	<header><%@ include file="/views/common/header.jsp"%></header>
	<section>
		<br> <br> <br>
		<h1
			style="margin-left: auto; margin-right: auto; margin-top: 0; font-size: 60px; font-weight: bolder;"
			align="center">SO EASY</h1>
		<br>
		<div id="infoBox">

			<div
				style="width: 100%; height: 60px; background: #3DB6AE; margin: 0;">

				<h1 align="center" style="line-height: 60px; margin: 0; font-size:40px;">SO EASY</h1>
			</div>
			<br> <br> <br>
			<h1 style="text-align: center"><%=msg%></h1>
			<br> <br> <br>
			<div align="center">
			
				<button type="button" class="moveButton" onclick="moveMain();">메인메뉴로
					이동</button>
			</div>
		</div>
	</section>
	<footer><%@ include file="/views/common/footer.jsp"%></footer>
	<script>
		function moveMain(){
			location.href = "<%=request.getContextPath()%>/main.sp";
		}
	</script>
</body>
</html>