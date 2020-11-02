<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
	<form id="hostReserveForm" action="/login/insertReserve.ho" method="post">
		<table>
			<tr>
				<td class="title"><b>예약 일정 선택   </b></td>
				<td colspan="2"><input name="startDate" type="date"/> ~ <input name="endDate" type="date"/></td>
			</tr>
			<tr>
				<td class="title"><b>예약 인원 선택</b></td>
				<td colspan="4">
					<input class=btn1 type=button value=&lt onclick="minusCount();">
					<input class=number type=text name=reservPersonCount value=1>
					<input class=btn1 type=button value=">" onclick="plusCount();">
				</td>
				
			</tr>
			<tr>
				<td class="title"><b>호실 선택</b></td>
				<td colspan="2" id="select">
					<select name="place">
						<option>=====선택=====</option>
						<option value="place1" label="센터1">1호실</option>
						<option value="place2" label="센터2">2호실</option>
						<option value="place3" label="센터3">3호실</option>
						<option value="place4" label="센터4">4호실</option>
						<option value="place5" label="센터5">5호실</option>
					</select>
				</td>
			</tr>
			<tr>
				<td rowspan="6" class="title" id="rInfo">예약자 정보<br><br><br><br><br><br></td>
			</tr>
			<tr>
				<td>예약자명</td>
				<td class="tInfo"><input type="text" class="info" id="name1" name="userName"></td>
			</tr>
			<tr><td></td></tr>
			<tr>
				<td>사용자명</td>
				<td class="tInfo"><input type="text" class="info" id="name2"><br>
				<input type="checkbox" id="reserSame">예약자와 동일</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td class="tInfo"><input type="tel" class="info" id="tel" name="userPhone"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td class="tInfo"><input type="email" class="info" id="email" name="userEmail"></td>
			</tr>
			<tr>
				<td class="title">요청사항</td>
				<td colspan="2"><textarea cols="37" rows="10" id="textarea" style="resize:none;" name="requestContent"></textarea></td>
			</tr>
		</table>
		<br>
   		<div align="center">
	      	<!-- <button class="btn2" id="btnL" type="submit">결제</button> -->
	      	<button class="btn2" id="btnL" onclick="window.open('/login/views/host/manageReserve/pay.jsp', 'PopupWin', 'width=500, height=450')">결제</button>
	      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	      	<button class="btn2" id="btnR" type="reset" onclick="self.close()">취소</button>
	      	<button class="btn2" type="button" id="submitButton();" onclick="submitButton();">확인</button>
  		</div>
  		
	</form>
	
	<script>
		//'예약자와 동일' 체크 시 사용자명 텍스트박스에 예약자명에 입력된 값 가져오기
		$(document).ready(function(){
			$("#reserSame").click(function(){
				if($("#reserSame").prop("checked")) {
					var reserNmVal = $("#name1").val();
					$("#name2").val(reserNmVal);
				} else {
					$("#name2").val("");
				}
			});
		});
		
		function submitButton(){
			$('#hostReserveForm').submit();
			
		}
		
		var count = 1;
		  function plusCount(){
	      count++;
	      $('input[name=reservPersonCount]').val(count);
	  }
	  function minusCount(){
	      count--;
	      if(count<0){
	          count=0;
	      }
	      $('input[name=reservPersonCount]').val(count);
	  }
	</script>
	
</div>
</body>
</html>