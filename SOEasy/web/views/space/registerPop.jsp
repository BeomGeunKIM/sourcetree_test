<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용후기 신고</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#outer {
		border:3px solid #40a4b6;
		width:500px;
		height:550px;
	}
	
	#regi td {
		height:35px;
	}
	
	#btn1 {
		color:white;
		background:#40a4b6;
		border:0; 
		border-radius:10px; 
		cursor:pointer;
		width:80px;
		height:25px;
	}
	
	#btn2 {
		color:#40a4b6;
		background:white;
		border:solid #40a4b6;
		border-radius:10px;
		cursor:pointer;
		width:80px;
		height:25px;
	}
	
</style>
</head>
<body>
	<div align="center">
		<div id="outer">
		
			<!-- 신고 사유 -->
			<h2 align="center" style="color:#40a4b6;">신고 사유</h2>
			
			<!-- 신고사항 체크박스 -->
			<table id="regi">
				<tr>
					<td>
						<label for="reason1"><input type="checkbox" id="reason1">단순 비방 내용</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="reason2"><input type="checkbox" id="reason2">음란, 욕설 등 부적절한 내용</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="reason3"><input type="checkbox" id="reason3">상업적 홍보</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="reason4"><input type="checkbox" id="reason4">저작권 불법 도용</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="reason5"><input type="checkbox" id="reason5">개인정보 누출 위험</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="reason6"><input type="checkbox" id="reason6">후기 취지에 어긋난 글</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="reason7"><input type="checkbox" id="reason7">기타</label>
					</td>
				</tr>
				<tr>
					<td>
						<textarea id="textArea" cols="30" rows="10" placeholder="기타 신고사유를 입력하세요" style="border:1.5px solid #40a4b6;"></textarea>
					</td>
				</tr>
			</table>
			
			<!-- 신고, 닫기 버튼 -->
			<div>
				<button id="btn1" class="btn">신고하기</button>
				<button onclick="self.close()" id="btn2" class="btn">취소하기</button>
			</div>
		</div>
	</div>
	
	<script>
	
	$(document).ready(function(){
		$("#btn1").click(function(){
			if(($("#reason1").is(":checked") == false) && ($("#reason2").is(":checked") == false) && ($("#reason3").is(":checked") == false)
				&& ($("#reason4").is(":checked") == false) && ($("#reason5").is(":checked") == false) && ($("#reason6").is(":checked") == false)
				&& ($("#reason7").is(":checked") == false)){
				alert('신고사항을 하나 이상 체크해주세요');
			} else {
				alert('신고가 접수되었습니다.');
				self.close();
			}
		});
	});
	
	</script>
</body>
</html>













