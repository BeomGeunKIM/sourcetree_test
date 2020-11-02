<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/layout.css">
<style>
	#pwQuestBox{
		display :block;
		width : 600px;
		margin-left : auto;
		margin-right : auto;
		margin-left : auto;
		padding : 0;
		
	}
	#pwQuestBox h1 {
		font-size : 60px;
		font-weigth : bolder;
	}
	#pwQuestBox h2{
		font-size : 50px;
		font-weight : bolder;
	}
	
	input[name=userPwd]{
		height: 20px;
		width : 250px;
		margin-bottom : 80px;
		
	}
	#pwQuestBox form button{
		width: 290px;
		height: 75px;
		background : #3DB6AE;
		font-size : 25px;
		font-weight: bolder;
		outline : none;
		border : none;
		border-radius : 10px;
	}
   
</style>
<title>SO Easy</title>
</head>
<body>

	<header><%@ include file="../common/header.jsp"%></header>
	<%
		if(userStatus ==0 || loginUser==null){
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,response);
		}
		%>

	
	<nav><%@ include file="../common/aside.jsp"%>
		
	<div class="colMenu">
		<label class="colMenuTitle">개인 정보 관리</label>
		<a class="colMenuButton selectedButton" href="/login/views/member/updateMember.jsp">개인 정보 수정</a>
		<a class="colMenuButton" href="/login/views/member/deleteMember.jsp">회원 탈퇴</a>
		<a class="colMenuButton" id="selectTempSpace">내 공간 관리</a>
		<br><br>
	</div>
	<hr style="margin:0">
	</nav>
	<section>
		<br>
		<div id="pwQuestBox" align="center">
			<h1>SO EASY</h1>
			<h2>개인정보 수정</h2>
			<hr>
			<br><br>
			<form>
				<label style="font-size : 20px;">비밀번호</label>&nbsp;&nbsp;&nbsp;
				<input type ="password" name="password" placeholder="비밀번호를 입력하세요.">
				<br><br>
				<button type="button" onclick="checkPassword();">개인정보 수정하기</button>
			</form>
		</div>
	
	</section>
	
	<footer> <%@ include file="../common/footer.jsp"%></footer>
	
	<script>
	function checkPassword(){
		var password = "<%=loginUser.getmPassword()%>";
			var inputPassword =$("input[name=password]").val();
			var userId ="<%=loginUser.getmId()%>";
			$.ajax({
				url:"/login/isCorrectPassword.me",
				data:{userId: userId,
					password: inputPassword	
				},
				type: "post",
				success: function(data){
					 if(data=="fail" || typeof data =="undefined"){
						alert("비밀번호가 일치하지 않습니다!");
						
					}else{
						location.href="<%=request.getContextPath()%>/views/member/updateMember2.jsp";
					} 
					console.log(data);
					
				},
				error: function(data){
					console.log("비밀번호 일치여부 확인 실패!");
				}
				
			});
			
			
	}
	$("#selectTempSpace").click(function(){
		var userNo ="<%=loginUser.getMemberNo()%>";
		$.ajax({
			url:"/login/haveTempSpaceInfo",
			data:{userNo:userNo},
			type:"post",
			success: function(data){
				if(data == "fail"){
					alert("등록된 공간 정보가 없습니다!");
				} else {
					location.href="<%=request.getContextPath()%>/selectTempSpace?memberNo="+userNo;
				}
			},
			error: function(data){
				console.log("공간 관리 진입 실패!");
			}
		});
	});
	</script>
	
		
</body>
</html>