<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int placeQTY = 10;
	int pCompleteQTY = 10;
	String name = "최우아";
	String phone = "010-9999-4444";
	String space = "코워킹 스페이스";
	String term = "2020.07.11 ~ 2020.08.1";
	String content = "예약번호 1874번 이호빵 고객 결제건  환불건임에도 불구하고 결제완료 처리 되어있습니다 확인 부탁드립니다.";
	String objectionFile = "";
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
     .hide{
     	visibility: hidden;
     	display: none;
     	opacity: 0;
     }
     
     .show{
     	visibility: visible;
     	display: block;
     	opacity: 1;
     }
     .select {
	width: 120px;
	height: 30px;
	border: 1px solid lightgray;
	margin: 5px;
	}
	.searchArea {
		margin:10px;
	}
	#popInput {
		background: white;
	}
	#popInput table{
		
		width: 90%;
		text-align : left;
	}
	
	#popInput table label{
		display : inline-block;
		width : 100px;
		height: 30px;
		background:  #40A6B4;
		text-align: center;
		border-radius: 3px;
		line-height: 30px;
		color : white;
		font-size : 15px;
		font-weight : bolder;
	}
	
	#popInput table select,
	#popInput table input{
		width: 300px;
		height : 25px;
		margin : 0;
		
	
	}
	
	
	
	#resourceZone input[type="file"] {
		width: 90%;
		height: 300px;
		align-content: center; border-style : solid;
		border-color: #40A6B4;
		border-style: solid;
	}
	#resourceMenu {
		width: 90%;
		height : 50px;
		text-align: left;
		line-height : 50px;
		background : #40A6B4;
		margin-left : auto;
		margin-right: auto;
		color : white;
		font-weight : bolder;
		font-size : 20px;
	}
	
	.box-file-input{
		width: 90%;
		margin-left: auto;
		margin-right: auto;
		border-style: solid;
		border-width: 1px;
		border-radius: 3px;
		border-color: gray;
		
	}
	.box-file-input label {
		display: inline-block;
		background: #40A6B4;
		color: #fff;
		padding: 0px 15px;
		line-height: 100px;
		cursor: pointer;
		height: 100px;
		text-align : center;
		font-weight : bolder;
		
	}
	
	.box-file-input label:after {
		content: "답변";
	}
	
	.box-file-input .file-input {
		display: none;
	}
	
	.box-file-input .filename {
		display: inline-block;
		padding-left: 10px;
		
		
	}
	.goDetail {
		background: #40A6B4;
		color: #fff;
		height: 30px;
		border-radius: 5px;
		text-align : center;
		font-weight : bolder;
		border: 0px;
		margin: 10px;
		align="center";
		
	}
	.addReply {
		background: #40A6B4;
		border:0px;
		color: white;
		height: 40px;
		width: 100px;
		font-weight : bolder;
		border-radius: 5px;
		
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<%-- <header><%@ include file="/views/common/adminHeader.jsp" %></header> --%>
	<nav>
		<%@ include file="/views/common/aside.jsp"%>
		<div class="colMenu">
		<label class="colMenuTitle">정산 관리</label>
		<a class="colMenuButton" href="/login/views/admin/manageCalculate.jsp">정산 내역 관리</a>
		<a class="colMenuButton selectedButton" href="/login/views/admin/manageCalculateObjection.jsp">재정산 요청 관리</a>
	<br><br>
	</div>
	<hr style="margin : 0">
	</nav>
	<section>
		<div id="wrapper">
		<br>
		<h1 style="margin : 0;">재정산 요청 관리</h1>
		<select class="select">
		<option>== 정산 상태 ==</option>
		<option>정산 상태: 미확인</optiyon>
		<option>정산 상태: 확인</option>
		<option>정산 상태: 마감</option>
		</select>
		<br><br>
		
		<table id="tableArea" align="center"  style="margin:0; width:100%;">
				<tr>
					<th height="40px">의뢰 번호</th>
					<th height="40px">정산 일자</th>
					<th height="20px">정산 단위기간</th>
					<th height="40px">공간명</th>
					<th height="40px">호스트 아이디</th>
					<th height="40px">정산 상태</th>
				</tr>
				<tr>
					<!-- <th height="20px">정산 단위기간 마감</th> -->
				</tr>

				<%for(int i=1; i<=pCompleteQTY; i++) {%>
				<tr class="pCompleteInfo" class="tr1" id='<%="tr" + i %>'>
					
					<td style="font-size:13px;"><%=(i+257)%></td>
					<td><%="2020.07."+(i+11)%></td>
					<td class="price"><%="2020.07."+(i+10)%> ~ <%="2020.08."+(i+0)%></td>
					<td>코워킹 스페이스</td>
					<td><%="wooah"+i %></td>
					<td id="ok">확인</td>
				</tr>
				<tr class="tr2" id='<%="trHide" + i %>'>
					<td colspan="6" style="font-size:13px;">
						<div id="popInput"><br>
							<table align="center">
								<tr>
									<td><label>성함</label>&nbsp;&nbsp;<input type="text" name="userName" value="<%=name%>" readonly></td>
									<td><label>연락처</label>&nbsp;&nbsp;<input type="tel" name="phone" value="<%=phone%>" readonly></td>
								</tr>
								<tr>
									<td><label>공간 명</label>&nbsp;&nbsp;<input type="text" name="userName" value="<%=space%>" readonly></td>
									<td><label>단위 기간</label>&nbsp;&nbsp;<input type="text" name="userName" value="<%=term%>" readonly></td>
								</tr>
							</table>
							<div id="resourceZone">
								<div id="resourceMenu">
									<p>&nbsp;오류 내용</p>
								</div>
								<br>
								<div align="center">
								
								<div align="right" style="margin-right:8%;">첨부파일</div>
								</div>
								<br>
								<div align="center">
								<textarea class="textBox" style="width : 90%; height:200px; font-size:16px; resize:none; border:0px" readonly><%= content %></textarea>
								</div>
								<br><br>
								<div class="box-file-input" align="left">
									<label> <input type="file"
										name="files" class="file-input"
										accept="image/*" >
									</label>
									<div class="filename">
										<%-- <img id="objectionFile" class="detailImg"
											src="<%=request.getContextPath()%>/file_uploadFiles/<%=objectionFile.getChangeName()%>">
										<button onclick="">다운로드</button> --%>
									</div>
									
								</div>
								
								<br>
								<div align="center">
								<button class="goDetail" onclick="window.open('login/views/admin/calculateDetail.jsp', 'Window2', 'width=500, height=550')">정산내역 보러가기</button>
								<button class="goDetail">답변 작성 완료</button>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<div class="searchArea" align="center">
			<select id="searchCondition">
				<option value="category">카테고리</option>
				<option value="writer">호스트 아이디</option>
				<option value="title">정산일</option>
				<option value="content">내용</option>
			</select> <input type="search">
			<button type="submit">검색하기</button>
		</div>
	</section>
	<br><br>
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
	<script>
		$('.tr2').hide();
		
		$(function(){
			$("#tableArea tr").click(function(){
			    $(this).next('.tr2').show();
			});
		});
		
		$(".tr2").click(function(){
			$(this).hide();
		});
		
		/* $(function(){
			$('#hideBtn').click(function(){
				$(this).('.tr2').hide();
			});
		}); */
		
   </script>
</body>
</html>