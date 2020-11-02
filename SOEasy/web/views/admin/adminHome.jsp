<%@page import="com.kh.login.member.model.vo.RecoverMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.admin.model.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<style>
	#wrapper{
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	article{
		display:inline-block;
		width: 49%;
		border: 0.5px solid black;
		border-radius: 3px;
		border-collapse: collapse;
	}
	#research1{
		width: 100%;
		border-color: #3DB6AE;
		border-width: 4px;
		
		
	}
	#research2{
		width: 100%;
		border-color: #3DB6AE;
		border-width: 2px;
		border-collapse: collapse;
		
		margin-right: 3%;
	}
	#recent{
		display: inline-block;
		 width:80%;
		 margin-left: 10px;
		 margin-top: 10px;
		 height: 300px;
		 margin-right: 10px;
		 border-color: #3DB6AE;
	}
	#recent table tr td{
		width: 20%;
	}
	#synthesis{
		display: inline-block;
		width:15%;
		border-left :solid 4px #3DB6AE;
		height: 350px;
		float: right;
		clear: both;
		
	}
	#synthesis table{
		margin-top: 20%; 
	
		border-right: none;
	
	}
	#synthesis table tr td{
		width: 20%;
	}
	#synthesis table tr td p{
		margin: 0;
		margin-bottom: 15px;
		font-size: 18px;
		font-weight: bolder;
	}
	.synValue{
		text-align: right;
	}
	.recentTitle{
		
		font-size: 20px;
		border:3px solid #3DB6AE;
		
		
	}
	
	
	
	#banner{
		font-size: 40px;
		font-weight: bolder;
	}
	#recent table tr td{
		text-align : center;
	}
	#result td div{
		border: 1px solid  #3DB6AE;
		width: 100px;
		height: 100px;
		border-radius: 100%;
		margin-left: auto;
		margin-right: auto;
		background : #3DB6AE;
	}
	#result td div p{
		font-size: 30px;
	
	}
	
	.adminTitles{
		margin: 0;
		width: 100%;
		height: 60px;
		line-height: 60px;
		background : #3DB6AE;
	}
	
	.hide1,
	.hide2,
	.hide3,
	.hide4
	 {
		visibility:hidden;
		display: none;
		opactiy : 0;
		transition: 0.5s;
	}
	
	
	.show{
		visibility : visible;
		display: block;
		opacity : 1;
	}
	.seeMore{
		width: 100px;
		height: 40px;
		float: right;
		clear: both;
		font-size: 15px;
		font-weight:bolder;
		background: #3DB6AE;
		border: none;
		border-radius: 10px;
		
	}
	.adminPreview table tr th,
	.adminPreview table tr td{
		width: 150px;
		text-align: center;
	}
	.adminPreview table tr th{
		background: #3DB6AE;
		height: 30px;
		color: white;
		font-size: 15px;
		font-weight: bolder;
	}
	.adminTitles h1{
		font-weight: bolder;
	}
</style>
<title>SO Easy</title>
</head>
<body>
	<header><%@ include file="../../views/common/header.jsp" %></header>
	<%
	
	%>
	<nav><%@ include file="../../views/common/aside.jsp" %>
	<%
		HashMap<String,Object> hmap = (HashMap<String,Object>)request.getAttribute("adminInfo");
		ArrayList<RecoverMember> recoverList =(ArrayList<RecoverMember>)hmap.get("recoverList");
		Synthesis synth = (Synthesis)hmap.get("synth");
		ArrayList<HashMap<String,Object>> deleteList = (ArrayList<HashMap<String,Object>>)hmap.get("deleteList");
		ArrayList<HashMap<String,Object>> waitList = (ArrayList<HashMap<String,Object>>)hmap.get("waitList");

	%>
	<br><br><br>
	<hr style="margin:0px;">
	</nav>

	
	<section>
		<br>
		<div id="wrapper">
			<p style="margin:0px; font-size: 25px; font-weight: bolder;">SO Easy 관리자 메뉴</p>
			<br>
			<article id="research1">
		
				<div id="recent" align="center">
					<table>
						<tr>
							<td colspan="3"><div align="center" id="banner" style="background:#3DB6AE;" ><p style="margin-bottom: 0;">Today</p></div></td>
						</tr>
						<tr>
							<td><p class="recentTitle">새로 등록된 공간</p></td>
							<td><p class="recentTitle">오늘 가입한 회원</p></td>
							<td><p class="recentTitle">오늘의  수익</p></td>
						</tr>
						<tr id="result">
							<td align="center"><div><p><%=synth.getTodayAcceptSpace() %></p></div></td>
							<td><div><p><%=synth.getTodayJoinMembers() %></p></div></td>
							<td><div><p><%=synth.getTodaysBenefit() %></p></div></td>
						</tr>
					</table>
				</div><!-- 
				 --><div id="synthesis">
					<table>
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr>
							<td><p>회원</p></td>
							<td colspan="4"><p class="synValue"><%=synth.getMemberQTY() %>명</p></td>
						</tr>
						<tr>
							<td><p>공간 </p></td>
							<td colspan="4"><p class="synValue"><%=synth.getSpaceQTY()%>개</p></td>
						</tr>
						<tr>
							<td><p>호스트</p></td>
							<td colspan="4"><p class="synValue"><%=synth.getHostQTY()%>명</p></td>
						</tr>
						<tr>
							<td><p>첨부 파일</p></td>
							<td colspan="4"><p class="synValue"><%=synth.getImagesQty()%>개</p></td>
						</tr>
						
					</table>
				</div>
				
			</article><!-- 
		--><div id="research2">
		 		<div class="adminTitles">
			 		<h1 align="center" style="margin:0; margin-top:10px;">공간 삭제 요청 건</h1>
		 		</div>
		 		<div class="hide1 adminPreview">
		 			<p>가장 최근 올라온 공간 삭제 요청 입니다.</p>
		 			<table align="center">
		 				<tr>
		 					<th colspan="2">공간명</th>
		 					<th>공간종류</th>
		 					<th>호스트ID</th>
		 					<th>호스트이메일</th>
		 					<th>호스트 연락처</th>
		 					<th>삭제 처리 결과</th>
		 					
		 				</tr>
		 				<% for(int i=0; i<deleteList.size(); i++){%>
		 					<tr>
		 						<td colspan="2"><%=deleteList.get(i).get("spaceName") %></td>
		 						<td><%=deleteList.get(i).get("spaceKind") %></td>
		 						<td><%=deleteList.get(i).get("userId") %></td>
		 						<td><%=deleteList.get(i).get("userEmail") %></td>
		 						<td><%=deleteList.get(i).get("userPhone") %></td>
		 						<td><%=deleteList.get(i).get("status") %></td>
		 					</tr>
		 				<%} %>
		 			</table>
		 			<button class="seeMore" type="button" onclick ="location.href ='<%=request.getContextPath()%>/adminDeleteAreaRequest.ad' ">자세히 보기</button>
		 			<br><br>
		 		</div>
			</div>
		 	
	  		<div id="research2">
		 		<div class="adminTitles">
			 		<h1 align="center" style="margin:0; margin-top:10px;">회원 복구 요청 건</h1>
		 		</div>
		 		<div class="hide2 adminPreview">
		 			<p><%=recoverList.size() %>개의 새로운 복구 요청 건이 있습니다.</p>
		 			<table align="center">
		 				<tr>
		 					<th>처리 번호</th>
		 					<th>아이디 </th>
		 					<th>탈퇴 사유</th>
		 					<th>복구 안내 이메일 </th>
		 					<th>복구 요청 일</th>
		 					
		 					
		 				</tr>
		 				<% int maximum;  
		 				if(recoverList.size()>5){
		 					maximum = 5;
		 				}else{
		 					maximum = recoverList.size();
		 				}
		 					for(int i=0; i<maximum; i++){%>
		 					<tr>
		 						<td><%=recoverList.get(i).getrNum() %></td>
		 						<td><%=recoverList.get(i).getUserId() %></td>
		 						<td><%=recoverList.get(i).getDropReason() %></td>
		 						<td><%=recoverList.get(i).getEmail() %></td>
		 						<td><%=recoverList.get(i).getRequestDate().toString() %></td>
		 					
		 					</tr>
		 				<%} %>
		 			</table>
		 			<button class="seeMore" type="button" onclick ="location.href ='<%=request.getContextPath()%>/selectRecover.me' ">자세히 보기</button>
		 			<br><br>
		 		</div>
			</div>
			
			<div id="research2">
		 		<div class="adminTitles">
			 		<h1 align="center" style="margin:0; margin-top:10px;">검수 대기 건</h1>
		 		</div>
		 		<div class="hide3 adminPreview">
		 			<p><%=waitList.size()%>개의 검수 대기 건이 있습니다.</p>
		 			<table align="center">
		 				<tr>
		 					<th>공간명</th>
		 					<th>공간 종류</th>
		 					<th>호스트 아이디</th>
		 					<th>호스트 이메일</th>
		 					<th>호스트 연락처</th>
		 					<th>등록 상태</th>
		 					
		 					
		 				</tr>
		 				<%if(waitList.size()>5){
		 					maximum = 5;
		 				} else{
		 					maximum = waitList.size();
		 				}
		 				
		 				for(int i=0; i<maximum; i++){%>
		 					<tr>
		 						<td><%=waitList.get(i).get("spaceName") %></td>
		 						<td><%=waitList.get(i).get("spaceKind") %></td>
		 						<td><%=waitList.get(i).get("userId") %></td>
		 						<td><%=waitList.get(i).get("userEmail") %></td>
		 						<td><%=waitList.get(i).get("userPhone") %></td>
		 						<td><%=waitList.get(i).get("status") %></td>
		 					</tr>
		 				<%} %>
		 			</table>
		 			<button class="seeMore" onclick ="location.href ='<%=request.getContextPath()%>/selectAllWaitSpace.ad' ">자세히 보기</button>
		 			<br><br>
		 		</div>
			</div>
			
			<div id="research2">
		 		<div class="adminTitles">
			 		<h1 align="center" style="margin:0; margin-top:10px;">악성 신고 건</h1>
		 		</div>
		 		<div class="hide4 adminPreview">
		 			<p>2개의 새로운 악성 신고 건이 있습니다.</p>
		 			<table align="center">
		 				<tr>
		 					<th>공간명</th>
		 					<th>공간 종류</th>
		 					<th>요청자 아이디</th>
		 					<th>요청 날짜</th>
		 					<th>신고 받은 아이디</th>
		 					<th>신고 사유</th>
		 					<th>신고 처리 결과</th>
		 					
		 					
		 				</tr>
		 				<% for(int i=0; i<3; i++){%>
		 					<tr>
		 						<td>린가드</td>
		 						<td>린가드</td>
		 						<td>린가드</td>
		 						<td>린가드</td>
		 						<td>린가드</td>
		 						<td>린가드</td>
		 						<td>린가드</td>
		 					
		 					</tr>
		 				<%} %>
		 			</table>
		 			<button class="seeMore">자세히 보기</button>
		 			<br><br>
		 		</div>
			</div>
		 	
		
			
		</div>
		<br><br><br><br>
	</section>
	
	<footer><%@ include file="../../views/common/footer.jsp" %></footer>
	<script>
		
		$(".adminTitles:nth(0)").click(function(){
			$(".hide1").toggleClass('show');
		});
		$(".adminTitles:nth(1)").click(function(){
			$(".hide2").toggleClass('show');
		});
		$(".adminTitles:nth(2)").click(function(){
			$(".hide3").toggleClass('show');
		});
		$(".adminTitles:nth(3)").click(function(){
			$(".hide4").toggleClass('show');
		});
	</script>
</body>
</html>