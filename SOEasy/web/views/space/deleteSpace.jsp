<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/layout.css">
<style>
	#deleteFrom{
		width: 90%;
		margin-left : auto;
		margin-right : auto;
	}
	#deleteTitle{
		font-size:30px;
		font-weight: bolder;
		display : inline;
	}
	#explainBox{
		background : #C4C4C4;
		width : 1100px;
		height : 300px;
		
		
	
	
	}
	
	#explainBox p{
			margin-left : 30px; 
			margin-bottom : 10px;
			font-weight : normal; 	
			
			
	}
	textarea{
		width : 70%;
		height : 100px;
		border : solid 3px lightgray;
		border-radius: 10px;
	}
	
	textarea:focus{
		outline : none;
	}
	input[type=password]{
		border : solid 3px lightgray;
		border-radius: 10px;
	
	}
	
	input[type=password]:focus{
		outline : none;
	}
	#deleteInfoBox div{
		width: 500px;
		
	}
	
	#deleteButton{
		width: 310px;
		height : 80px;
		background : #FF5B5B;
		outline : none;
		border-style : none;
		border-radius: 10px;
		font-size : 30px;
		font-weight : bold;
		
	}
	#deleteInfoBox input{
		width : 300px;
		height : 30px;
	}
	#deleteInfoBox select{
		height: 30px;
	}
	
	deleteInfoBox div :nth-child(2){
		line-height:  100px;
	}
</style>
<title>SO Easy</title>
</head>
<body>
	<header><%@include file="../common/header.jsp" %></header>
	<nav><%@include file="../common/aside.jsp" %>
		<div class="colMenu">
		<label class="colMenuTitle">공간 정보 관리</label>
		<a class="colMenuButton" href="/login/views/member/updateMember.jsp">공간 정보 수정</a>
		<a class="colMenuButton" href="/login/views/space/insertSpaceStep1.jsp">공간 추가 등록</a>
		<a class="colMenuButton selectedButton" href="/login/views/space/deleteSpace.jsp">공간 삭제 요청</a>
		<br><br>
	</div>
	<hr style="margin:0">
	</nav>
	<section>
		<br>
		<form action="" method="post" id="deleteForm">
		<table align="center">
			<tr>
				<td colspan = "4"><p id="deleteTitle">공간 삭제 요청</p></td>
			</tr>
			
			<tr>
				<td><br><div id="explainBox">
						<br><br>
						<p style="font-size : 20px; font-weight:bolder">그동안 SO Easy에 공간을 제공해 주셔서 감사합니다.</p>
						<br>
						<p>공간 삭제 요청은 자사와의 계약을 해지하는 것을 의미하며</p>
						<p>등록된 공간의 정보는 모두 제거 되며 더이상 수익이 발생 되지 않습니다.</p>
						<p>공간 삭제로 등록된 공간이 0개 이하 일시 게스트로 전환되며 기존 호스트의 권한에 접근 할 수 없습니다</p>
						<p>공간 삭제 요청전 정산 정보를 모두 백업해 두십시오 추후 문제 발생시 자료의 부재건은 책임지지 않습니다.</p>
						
					</div></td>
			</tr>
			
			</table>
			<br><br>
			<div align="center" id="deleteInfoBox">
				<div style="display: inline-block;" >
					<h1>삭제사유 
					<select>
					<option>공간 명</option>
					<option>린가드 코워킹 스페이스</option>
					<option>제라드 오피스</option>
					
					</select></h1>
					<p>사유 남겨주시어 보완하여 더 좋은 서비스가 되도록 하겠습니다.</p>
					<br>
					<textarea style="resize: none;">삭제 사유를 입력하시오.</textarea>
				</div> 

				<div style="display:inline-block;">
					
					<h1>비밀번호</h1>
				
					<input type="password" name="userPwd" placeholder="비밀번호를 입력하세요" align="">
					<br><br>
					<button id="deleteButton">탈퇴하기</button>
					<br><br><br>
				</div>

			</div>




		</form>
	</section>
	<footer><%@ include file="../common/footer.jsp" %></footer>
	
</body>
</html>