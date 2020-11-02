<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String nickName = "wooah94";
String name = "이호빵";
String phone = "010-9999-4444";
String email = "wooah94@gmail.com";
String content = "내용~~~~~~~~~";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/login/css/layout.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>SO Easy</title>
<style>
	body {
		font-family: 'NanumSquare', sans-serif;
	}
	#moHead {
		padding:0.05px;
		background-color: lightgray;
		font-weight: bolder;
		text-align:left;
	}
	.title {
		font-weight: bolder;
		color:#40A6B4;	
		
	}
	#select {
		align:left;
	}
	#number {
		border:2px solid lightgray;
		border-radius: 5px;
	}
	input, textarea, select {
		border:2px solid lightgray;
		border-radius: 5px;
		
	}
	
	#rinfo {
		text-align: top;
		display: table-cell;
    	vertical-align: top;
    	margin-top:0;
	}
	.info {
		width:245px;
		height:20px;
		align:right;
	}
	.number {
		width:200px;
		height:20px;
		text-align:center;
	}
	.tInfo {
		align:right;
	}
	.btn1 {
		background: #3DB6AE;
		width: 40px;
		height: 25px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
	}
	.btn2 {
		background: #3DB6AE;
		width: 70px;
		height: 30px;
		border-radius: 5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
	}
</style>
</head>
<body>

<div align="center" id="moHead"><p id="moText1">&nbsp;&nbsp;&nbsp;&nbsp;직접 예약</p></div>
<div align="center">
	<form>
		<table>
			<tr>
				<td class="title"><b>예약 일정 선택   </b></td>
				<td colspan="2"><input type="date"/> ~ <input type="date"/></td>
			</tr>
			<tr>
				<td class="title"><b>예약 인원 선택</b></td>
				<td colspan="4">
					<input class=btn1 type=button value="<" onClick="javascript:this.form.amount.value--;">
					<input class=number type=text name=amount value=1 readonly>
					<input class=btn1 type=button value=">" onClick="javascript:this.form.amount.value++;">
				</td>
			</tr>
			<tr>
				<td class="title"><b>공간 선택</b></td>
				<td colspan="2" id="select">
					<select name="place">
						<option>=====선택=====</option>
						<option value="place1" label="센터1">센터1</option>
						<option value="place2" label="센터2">센터2</option>
						<option value="place3" label="센터3">센터3</option>
						<option value="place4" label="센터4">센터4</option>
						<option value="place5" label="센터5">센터5</option>
					</select>
				</td>
			</tr>
			<tr>
				<td rowspan="6" class="title" id="rInfo">예약자 정보<br><br><br><br><br><br></td>
			</tr>
			<tr>
				<td>예약자명</td>
				<td class="tInfo"><input type="text" class="info" id="name1" value="<%=nickName%>"></td>
			</tr>
			<tr><td></td></tr>
			<tr>
				<td>사용자명</td>
				<td class="tInfo"><input type="text" class="info" id="name2" value="<%=name%>"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td class="tInfo"><input type="tel" class="info" id="tel" value="<%=phone%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="tInfo"><input type="email" class="info" id="email" value="<%=email%>"></td>
			</tr>
			<tr>
				<td class="title">요청사항</td>
				<td colspan="2"><textarea cols="37" rows="10" id="textarea" style="resize:none;"><%= content %>
				</textarea></td>
			</tr>
		</table>
		<br>
   		<div align="center">
	      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<button class="btn2" id="btnR" type="reset" onclick="self.close()">취소</button>
	      	<button class="btn2" id="btnR" type="submit" onclick="self.close()">확인</button>
  		</div>
  		
	</form>
</div>
</body>
</html>