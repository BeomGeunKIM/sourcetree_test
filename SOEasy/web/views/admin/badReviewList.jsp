<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "린가드";
	int placeQTY = 10;
	int pCompleteQTY = 10;
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<meta charset="UTF-8">
<style>
	#wrapper{
		width : 90%;
		margin-left: auto;
		margin-right : auto;
	}
	#wrapper select{
		float : right;
		height: 24px;
	}
	      
     	th{
     		background: #E4EEFA;
     		width: 13%;
     		font-size: 17px;
     		font-weight: bolder; 
     		clear:both;
     	}
     	
       .pCompleteInfo td{
       	text-align: center;
       	height : 30px;
       	background : #fff;
       }
   
       .pCompleteInfo td a{
       	text-decoration: underline;
       	color : black;
       }
       #wrapper h1{
       	font-size : 30px;
       	font-weight: bolder;
       }
   
       .stage{
       	
       		display: block;
       		appearance:none;
       		background : transparent;
       		border: none;
       		outline: none;
       		-webkit-appearance:none;
			margin-right:auto;
			font-weight: bolder;
			font-size: 15px; 
			text-align: center;
			width: 100%;
			text-align-last: center;
			      	
        
       }
     
       #resultBadReview{
       	
       		
       		
       }
</style>
<title>SO Easy</title>
</head>
<body>
	<header><%@ include file="/views/common/header.jsp" %></header>
	<nav><%@ include file = "/views/common/aside.jsp" %>
	<br><br><br>
	<hr style="margin:0;">
	
	</nav>
	<section>
		<br>
		<div id="wrapper">
		<br>
		<h1>악성 후기 신고 내역</h1>
		<select>
		<option>신고 처리 결과: 전체</option>
		<option>신고 처리 결과: 대기중</option>
		<option>신고 처리 결과: 기각</option>
		<option>신고 처리 결과: 조치완료</option>
		</select>
		<select>
		<option>공간 종류 : 전체</option>
		<option>공간 종류 : 코워킹 스페이스</option>
		<option>공간 종류 : 독립 오피스</option>
		</select>
	<input type="date" name=date style="float:right;" id="dateSelect"> 
		
		<br><br>
		
		<table align="center"  style="margin:0; width:100%; "  >
				<tr>
					<th height="40px">공간명</th>
					<th height="40px">공간종류</th>
					<th height="40px">요청자 아이디</th>
					<th height="40px">요청 날짜</th>
					<th height="40px">신고 받은 아이디</th>
					<th height="40px">신고 사유</th>
					<th height="40px">신고 처리 결과</th>
					<th height="40px">비고</th>
				</tr>
				

				<%for(int i=1; i<=pCompleteQTY; i++) {%>
				<tr class="pCompleteInfo" >
					<td style="font-size:13px;"><a href="이 공간의 소개글"><%="린가드 "+i+"코워킹 스페이스"%></a></td>
					<td>코워킹 스페이스</td>
					<td><a href="이 아이디로 검색된 회원 목록 페이지"><%="lingard"+i %></a></td>
					<td><%="2020.07."+i%> </td>
					<td><a href="이 아이디로 검색된 회원 목록 페이지"><%="pogba"+(i+10)%></a></td>
					<td>광고</td>
					<td id="resultBadReview"><select class="stage">
							<option selected="selected" value=1 style="text-align:center;">대기중</option>
							<option value=2>기각</option>
							<option value=3>조치완료</option>
							
							
						</select>
					</td>
					<td><a href="자세한 신고 내용">자세히 보기</a></td>
				</tr>
			
				<%
					}
				%>
			</table>
		</div>
	</section>
	<br><br>
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
	<script>
	 document.getElementById('dateSelect').value = new Date().toISOString().substring(0, 10);
		$(function(){
		
			$('.stage').change(function(){
				var num = $(this).val();
				if(num ==2 || num==3){
					window.prompt("신고자에게 한마디!");
					$(this).prop('disabled',true);
					if(num==2){
						$(this).css("color","red");
					}else{
						$(this).css("color","blue");
					}
				}
			});
			
		});
	</script>
		
			
	
	
</body>
</html>