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
	   .modalArea {
  display: none;
  position: fixed;
  z-index: 10; 
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.modalBg {
  width: 100%;
  height: 100%;
  background-color: rgba(30,30,30,0.9);
}

.modalWrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
  width: 70%;
  
  max-width: 500px;
  padding: 10px 30px;
  background-color: #fff;
}




#openModal {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
}

#email{
	display:block;
	margin-left: auto;
	margin-right: auto;
	width : 80%;
	text-align : center;
	border-radius: 10px;
	border-color: lightgray;
	outline:none;
}
#modalTable tr{
	height: 50px;
}

#modalTable p {
	margin : 0;
	font-size: 20px;
	font-weight : bolder;
}
#modalTable button{
	background : #3DB6AE;
	border-radius: 10px;
	border: none;
	height : 40px;
	font-size: 18px;
	font-weight: bolder;
	font-family: 'nanumSquare'
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
		<!--  modal 스타트 -->
				<div id="modalArea" class="modalArea">
					<div id="modalBg" class="modalBg"></div>
					<div class="modalWrapper">
						<div class="modalContents">
							<div
								style="background: #E4EEFA; text-align: center; width: 100%;">
								<h1 style="margin: 0; font-weight: bolder;">복구 요청 작성</h1>
							</div>
							<br>
							<form>
								<table align="center" id="modalTable">
								<tr>
								<td><p>복구 여부를 안내받을 이메일을 입력해주세요</p></td>
								</tr>
								<tr>
								<td><input type="email" name="email" id="email"></td>
								</tr>
								
									<tr>
										<td><div
												style="width: 50%; margin-left: auto; margin-right: auto; align: center;"
												id="buttonZone">
												<button  type="button" style="margin-right: 10%;" onclick="sendRequestRecover();">복구요청
													전송</button>
												<button  type="button" onclick="closeModal();">취소</button>
											</div></td>
									</tr>
								</table>
							</form>
							
						</div>

					</div>
				</div>
				<!--  modal 끝 -->
			
			<h1 align="center" style="line-height:60px; margin:0">삭제된 아이디</h1>
		</div>
		<br><br><br>
		<h2 style="text-align: center"><%=loginUser.getmId()%>는 탈퇴된 계정입니다<br> <label id="couldRecover" style="font-size:25px; font-weight:bolder;"></label></h2>
		<br><br><br>
		<div align="center">
		<button type="button" class="moveButton" onclick="moveMain();">메인 화면으로 이동</button>
		<button type="button" class="moveButton" onclick="onModal();" id="recoverButtons">복구 요청</button>
		</div>
		</div>
	</section>
	<footer><%@ include file="../common/footer.jsp"%></footer>
	<script>
		
	
		//에이잭스를 이용하여 서버에 복구요청기록 업데이트 하기
		function sendRequestRecover(){
			var memberNo  = "<%=loginUser.getMemberNo()%>";
			var email = $('#email').val();
			$.ajax({
				url : "/login/requestRecover.me",
				data:{memberNo : memberNo,
				 	  email : email
				     },
				type: 'post',
				success: function(data){
					console.log(data);
					if(data=="success"){
						alert("복구 요청이 정상적으로 접수 되었습니다. 처리후 등록하신 이메일로 안내해드리겠습니다");
						location.href="/login/logout.me";
					}else{
						alert("복구 요청 실패! 담당자에게 연락하세요");
						closeModal();
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		}
	$(function(){
		var user = "<%=loginUser.getmId()%>";
		var userNo = "<%=loginUser.getMemberNo()%>";
		$.ajax({
			url : "/login/canRecover.me",
			data: {user: user,
				   userNo: userNo
				  },
			success:function(data){
				console.log(data);
				switch(data){
				case 'able': $('#couldRecover').text("복구 요청 하시겠습니까?"); break;
				case 'disable':$('#recoverButtons').hide(); break;
				case 'error': alert("에러가 발생했습니다 메인화면으로 이동합니다"); location.href="/login/logout.me";
				case 'yet': $('#couldRecover').text("복구 심사 대기중입니다.");
					  $('#recoverButtons').hide(); break;
				}
			},
			error:function(data){
				console.log("결과 실패");
			}
		});
		
	});
		 $('#closeModal , #modalBg').click(function(){
		    $('#modalArea').fadeOut();
		  });
		 
		 //모달을 끄는 함수
		 function closeModal(){
			 $('#modalArea').fadeOut();
		 }
	
		//메인 페이지로 이동하는 함수 
		function moveMain(){
			location.href = "<%=request.getContextPath()%>/logout.me";
		}
		
		function onModal() {
			$('#modalArea').fadeIn();
		}
	</script>
</body>
</html>