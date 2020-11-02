<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.*"%>
<%
	int placeQTY = 10;
	int pCompleteQTY = 10;
	int statement = 0;
	
	ArrayList<PaymentRequest> list = (ArrayList<PaymentRequest>) request.getAttribute("list");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int requestCount = pi.getRequestCount();
	//int requestCount = 2;
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
</style>
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../../common/header.jsp"%></header>
	<nav>
		<%@ include file="../../common/aside.jsp"%>
		<div class="colMenu">
		<label class="colMenuTitle">공간 일정 관리</label>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/selectReserve.ho">예약 일정 관리</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/Select.ro">라운지 회원 관리</a>
		<a class="colMenuButton selectedButton" href="<%=request.getContextPath()%>/select.pr?hostNo=<%=loginUser.getMemberNo()%>">예약 승인 요청</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/selectTempSpace?memberNo=<%=loginUser.getMemberNo()%>">내 공간 관리</a>
	<br><br>
	</div>
	<hr style="margin : 0">
	</nav>
	<section>
		<br>
		<div id="wrapper">
		<br>
		<h1 style="margin : 0;">예약 승인 요청</h1>
		<!-- <h3>플랫폼을 통해 예약 승인 대기중인 건이 <%= requestCount %> 건 있습니다</h3> -->
		
		<!-- <select>
		<option>==센터 선택==</option>
		<option>센터 1</option>
		<option>센터 2</option>
		<option>센터 3</option>
		<option>센터 4</option>
		<option>센터 5</option>
		<option>센터 6</option>
		</select> -->
		<br><br>
		
		<table align="center"  style="margin:0; width:100%;"  >
				<tr>
					<th width="6%" height="40px">예약번호</th>
					<th height="40px">아이디</th>
					<th height="40px">이름</th>
					<th height="40px">사용 일자</th>
					<th height="40px">예약 인원</th>
					<th height="40px">센터명</th>
					<th height="40px">공간명</th>
					<th height="40px">결제예상금액</th>
					<th height="40px">옵션(완료 미표시)</th>
					<th height="40px">진행도</th>
				</tr>
				<% if(list != null) {
					for(PaymentRequest h : list) {%>
					<tr class="pCompleteInfo">
					<td><%= h.getReserveNo() %></td>
					<td><%= h.getGuestId() %></td>
					<td><%= h.getGuestName() %></td>
					<td style="font-size:13px;" class="date"><%= h.getStartDay() + " ~ " + h.getEndDay() %></td>
					<td style="font-size:13px;"><%= h.getReservePersonCount() %></td>
					<td style="font-size:13px;"><%= h.getSpaceName() %></td>
					<td style="font-size:13px;"><%= h.getOfficeNo() %></td>
					<td style="font-size:13px;"><%= h.getExpectPay() %></td>
					<td style="font-size:13px;" id="option">
					<% int rs = h.getDidHostOk(); %>
					<% if(rs == 1) { %>
						<button style="border:1px solid red;background:white;color:red" onclick="location.href='<%=request.getContextPath()%>/update.pr?num=<%=2%>&reserveNo=<%= h.getReserveNo() %>'">승인</button>
						<button style="border:1px solid blue;background:white;color:blue" onclick="location.href='<%=request.getContextPath()%>/update.pr?num=<%=4%>&reserveNo=<%= h.getReserveNo() %>'">거절</button>
					<% } else if(rs == 2) { %>
						승인 완료
					<% } else if(rs == 3) { %>
						바로 예약
					<% } else if(rs == 4) {  %>
						예약 거절
					<% } else { %>
						에러
					<% } %>
					</td>
					<% if(statement == 0) { %>
					<td style="font-size:12px;"><%= "예약 요청" %></td>
					<% } %>
					
				 <% } %>
				</tr>
				
				<% } %>
				<% if(requestCount < 1){ %>
					<tr>
						<!-- <td colspan="10" align="center" style="background:white; height:100px;">예약 승인 요청건이 없습니다.</td> -->
					</tr>
				<% } %>
			</table>
		</div>
		
		<!-- 페이징처리 버튼 -->
		<div class = "pagingArea" align="center">
      	<button onclick="location.href='<%=request.getContextPath()%>/select.pr?currentPage=1'"><<</button>
      	
      	<% if(currentPage <= 1) { %>
      	<button disabled><</button>
      	<% } else { %>
      	<button onclick="location.href='<%=request.getContextPath()%>/select.pr?currentPage=<%=currentPage - 1%>'"><</button>
      	<% } %>
      	
      	<% for(int p = startPage; p <= endPage; p++) {
      			if(p == currentPage) {		
      	%>
      				<button disabled><%= p %></button>	
      	<% 		} else {	%>
      				<button onclick="location.href='<%=request.getContextPath()%>/select.pr?currentPage=<%= p %>'"><%= p %></button>
      	<% 		} %>
      	
      	<% } %>
      	
      	
      	<% if(currentPage >= maxPage) { %>
      	<button disabled>></button>
      	<% } else { %>
      	<button onclick="location.href='<%=request.getContextPath()%>/select.pr?currentPage=<%=currentPage + 1%>'">></button>
      	<% } %>
      	
      	<button onclick="location.href='<%=request.getContextPath()%>/select.pr?currentPage=<%=maxPage%>'">>></button>
      	</div>
      	
		
	</section>
	<br><br>
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
</body>
</html>