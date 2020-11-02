<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.*"%>
<%
	int placeQTY = 10;
	int pCompleteQTY = 10;
	int statement = 0;
	int sOC = (int)request.getAttribute("officeCount");
	int officeCount = 0;
	if(sOC != 0){
		officeCount = sOC;
	}
	ArrayList<HostReserve> list = (ArrayList<HostReserve>) request.getAttribute("list");
	for(int i = 0; i < list.size(); i++){
		
	}
	
	
	int officeInfo = 401;
	int startDay = 5;
	int term = 30;
	int reserveNo = 9;
	String name= "이호정";
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/login/css/layout.css">
<title>SO Easy</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/login/css/layout.css">
<style>
	/* #test {
		outline: 1px;
		border-style: solid;
	} */
	.table1 {
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	
	
	#table1 th, table td{
	    border: lightgrey 1px solid;
	    padding: .3em 0.6em;
	    /* padding: 2px 2px; */
	    
	}
	#dayT {
		text-align: center;
		margin:5px;
		border: #6087AA 1px solid;
		background-color: #DFF4FF;
	}
	#monthT {
		margin:5px;
		text-align: center;
		border: #6087AA 1px solid;
		background-color: #A5C1DA;
	}
	#expT {
		margin:5px;
		text-align: center;
		border: #6087AA 1px solid;
		background-color: #C4C4C4;
		
	}
	#reserve {
		background: #3DB6AE;
		width: 100px;
		height: 35px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
		font-size: 1.2em;
		margin-left: 5%;
	}
	#kind {
		margin-right: 5%;
	}
	#select {
		margin-left: 5%;
	}
	.dayBtn {
		background: #3DB6AE;
		width: 40px;
		height: 25px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
	}
	#bar1 {
		background: #3DB6AE;
		width: 400px;
		height: 25px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
	}
	.reserveBtn {
		background-color:transparent;
		width:100%;
		border:0px;		
	}
</style>
</head>
<body>
	<header><%@ include file="../../common/header.jsp"%></header>
	<nav>
		<%@ include file="../../common/aside.jsp"%>
		<div class="colMenu">
		<label class="colMenuTitle">공간 일정 관리</label>
		<a class="colMenuButton selectedButton" href="<%=request.getContextPath()%>/selectReserve.ho">예약 일정 관리</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/Select.ro">라운지 회원 관리</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/select.pr?hostNo=<%=loginUser.getMemberNo()%>">예약 승인 요청</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/selectTempSpace?memberNo=<%=loginUser.getMemberNo()%>">내 공간 관리</a>
	<br><br>
	</div>
	<hr style="margin : 0">
	</nav>

	
	<section>
	<br>
		<button class="reserve" id="reserve" onclick="window.open('/login/views/host/manageReserve/reserveModal1.jsp', 'Window2', 'width=500, height=550')">직접 예약</button>
		
		<br>

		<div align="center">
			<b>날짜 이동 :
				<button class="dayBtn" style="font-size: 12px;">&lt;</button>
			</b><input type="date" />
			<button class="dayBtn" style="font-size: 12px;">&gt;</button>
			<button class="dayBtn" style="font-size: 12px;">오늘</button>

		</div>
		<div align="right" id="kind">
			<textarea class="kind" id="expT" cols="9" rows="1" style="resize: none"
				readonly>이용 종료</textarea>
			<textarea class="kind" id="monthT" cols="9" rows="1" style="resize: none"
				readonly>월 회원</textarea>
			<textarea class="kind" id="dayT" cols="9" rows="1" style="resize: none"
				readonly>일 회원</textarea>


		</div>
		
		<form>
			<label id="select">공간선택</label> <select name="place" size="1" >
				<option value="place1" onclick=test1()>센터1</option>
				<option value="place2">센터2</option>
				<option value="place3">센터3</option>
				<option value="place4">센터4</option>
				<option value="place5">센터5</option>
			</select>

		</form>
		<br>
		<table align="center" id="table1">
			<tr>
				<td>호실</td>
				<% for(int i = 1; i <= 31; i++) {%>
					<td><%=i %></td>
				<% } %>
			</tr>
			<%-- <% for(int i = 0; i < list.size(); i++) { %> --%>
			<% for(HostReserve h : list) {%>
			<tr class="zone">
				<td><%= h.getOfficeNo() %>호실</td>
				<% for(int j = 1; j <= 31; j++) { %>
				<% if(j > 31) {break;} %>
				<td
				<% if(h.getOfficeNo() == (h.getOfficeNo())) {
					String jj = "" + j;
					if(j<10){
						jj = "0" + j;
					}
				
					%>
					
					<% if(h.getStartDay().equals("2020-07-"+ jj)) { 
					
					j += term -1; %>
					colspan="<%= term %>" style="background:#A5C1DA; color:white; text-align:center;"><button class="reserveBtn" name="<%= reserveNo %>" onclick="location.href='<%=request.getContextPath()%>/select.hr?reserveNo=' + '<%= h.getReserveNo() %>'"><%= h.getUserName() %></button>
					<% } else { %>
					>
					<% } %>
				<% } %>
				</td>
				<% } %>
			</tr>
			<% } %>
		</table>
	</section>
	<script>
	
	
	$("reserveBtn").onclick(function(){
		window.open("/views/host/manageReserve/reserveUpdate.jsp", 'Window2', 'width=500, height=550');
	});
	
	$('.zone:nth(3) ~ .zone:nth(5)').css("background","red");
	</script>
	
	
	
	
	
	<footer><%@ include file="../../common/footer.jsp" %></footer>
	


</body>
</html>