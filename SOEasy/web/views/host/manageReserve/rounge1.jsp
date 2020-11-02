<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.*"%>
<!DOCTYPE html>
<%
	ArrayList<HostReserve> list = (ArrayList<HostReserve>) request.getAttribute("list");
	for(HostReserve h : list) {
		System.out.println(h);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/login/css/layout.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>SO Easy</title>
<style>
	/* body {
		background-color:#ECECEC;
		
	} */
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
	.l2 {
		margin-left: 5%;
		margin-right: 5%;
		padding:0.05px;
		background-color: lightgray;
		font-weight: bolder;
	}
	.l1 {
		margin-left: 5%;
		margin-right: 5%;
		padding:0.05px;
		font-weight: bolder;
		font-size: 1.5em;
	}
	
	#box {
		margin-left: 5%;
		margin-right: 5%;
		background-color: white;
	}
	.roungeBtn {
		width: 120px;
		height: 90px;
		margin:1%;
		border: lightgrey 2px solid;
		/* background: white; */
		 
	}
	#day {
		margin:1%;
		width: 120px;
		height: 90px;
		border: lightgrey 2px solid;
		background-color: #A5C1DA;
	}
	#month {
		margin:1%;
		width: 120px;
		height: 90px;
		border: lightgrey 2px solid;
		background-color: white;
	}
	#exp {
		margin:1%;
		width: 120px;
		height: 90px;
		border: lightgrey 2px solid;
		background-color: pink;
		
	}
	#unpaid {
		margin:1%;
		width: 120px;
		height: 90px;
		border: lightgrey 2px dashed;
		background-color: white;
	}
	#dayT {
		margin:5px;
		border: lightgrey 2px solid;
		background-color: white;
	}
	#monthT {
		margin:5px;
		border: lightgrey 2px solid;
		background-color: #A5C1DA;
	}
	#expT {
		margin:5px;
		border: lightgrey 2px solid;
		background-color: pink;
		
	}
	#unpaidT {
		margin:5px;
		border: lightgrey 2px dashed;
		background-color: white;
	}
	.kind {
		align: right;
	}
	#select {
		margin-left: 5%;
	}
	
</style>
</head>
<body>
	<header><%@ include file="../../common/header.jsp"%></header>
	<nav>
		<%@ include file="../../common/aside.jsp"%>
		<div class="colMenu">
		<label class="colMenuTitle">공간 일정 관리</label>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/selectReserve.ho">예약 일정 관리</a>
		<a class="colMenuButton selectedButton" href="<%=request.getContextPath()%>/Select.ro">라운지 회원 관리</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/select.pr?hostNo=<%=loginUser.getMemberNo()%>">예약 승인 요청</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/selectTempSpace?memberNo=<%=loginUser.getMemberNo()%>">내 공간 관리</a>
	<br><br>
	</div>
	<hr style="margin : 0">
	</nav>
	
	
	<section>
	<br>
		<button class="reserve" id="reserve" onclick="window.open('/login/views/host/manageReserve/reserveModal1.jsp', 'PopupWin', 'width=500, height=550')">직접 예약</button>
		
		<div class="l1" align="center">
			라운지 이용고객 관리
		</div>
		<label id="select">공간선택</label>
			<select name="place" size="1" >
				<option value="place1">센터1</option>
				<option value="place2">센터2</option>
				<option value="place3">센터3</option>
				<option value="place4">센터4</option>
				<option value="place5">센터5</option>
			</select>
		<br>
		<br>
		<div class="l2" align="right">
			<textarea class="kind"  id="unpaidT" cols="6" rows="1" style="resize:none" readonly>미결제</textarea>
			<textarea class="kind" id="expT" cols="6" rows="1" style="resize:none" readonly>기간만료</textarea>
			<textarea class="kind" id="monthT" cols="6" rows="1" style="resize:none" readonly>월 회원</textarea>
			<textarea class="kind" id="dayT" cols="6" rows="1" style="resize:none" readonly>일 회원</textarea>
			
		</div>

		
		<div id="box">
		<% if(list != null) { 
			for(HostReserve h : list) { %>
			<button class="roungeBtn" style="
			<% if(h.getReserveStatus() == 4) { %>
				 background:pink;">
			<% } else {%>
				<% if(h.getStartDay().equals(h.getEndDay())) {%>
				 background:white;">
				<% } else {%>
				background:#A5C1DA;">
				<% } %>
			<% } %>
			<label><%= "1개월권" %></label><br>
			
			<label><%= h.getUserName() %></label><br>
			
			<label>라운지 이용</label><br>
			
			<label><%= h.getStartDay() %> ~ <%= h.getEndDay() %></label>
			
			</button>
			<% } %>
		<% } %>
		
		<!-- <button id="month">
		<label>1개월권</label><br>
		<label>이호정</label><br>
		<label>라운지 이용</label><br>
		<label>6/22~7/21</label>
		</button>
		
		<button id="exp">
		<label>1개월권</label><br>
		<label>고종현</label><br>
		<label>라운지 이용</label><br>
		<label>6/10~7/9</label>
		</button>
		
		<button id="unpaid">
		<label>1개월권</label><br>
		<label>김범근</label><br>
		<label>라운지 이용</label><br>
		<label>6/28~7/27</label>
		</button>
		
		<button id="day">
		<label>1일권</label><br>
		<label>장욱</label><br>
		<label>라운지 이용</label><br>
		<label>6/29</label>
		</button>
		
		
		<button id="month">
		<label>1개월권</label><br>
		<label>이호정</label><br>
		<label>라운지 이용</label><br>
		<label>6/22~7/21</label>
		</button>
		
		<button id="exp">
		<label>1개월권</label><br>
		<label>고종현</label><br>
		<label>라운지 이용</label><br>
		<label>6/10~7/9</label>
		</button>
		
		<button id="unpaid">
		<label>1개월권</label><br>
		<label>김범근</label><br>
		<label>라운지 이용</label><br>
		<label>6/28~7/27</label>
		</button>
		
		<button id="day">
		<label>1일권</label><br>
		<label>장욱</label><br>
		<label>라운지 이용</label><br>
		<label>6/29</label>
		</button>
		
		
		<button id="month">
		<label>1개월권</label><br>
		<label>이호정</label><br>
		<label>라운지 이용</label><br>
		<label>6/22~7/21</label>
		</button>
		
		<button id="exp">
		<label>1개월권</label><br>
		<label>고종현</label><br>
		<label>라운지 이용</label><br>
		<label>6/10~7/9</label>
		</button>
		
		<button id="unpaid">
		<label>1개월권</label><br>
		<label>김범근</label><br>
		<label>라운지 이용</label><br>
		<label>6/28~7/27</label>
		</button>
		
		<button id="day">
		<label>1일권</label><br>
		<label>장욱</label><br>
		<label>라운지 이용</label><br>
		<label>6/29</label>
		</button>
		
		
		<button id="month">
		<label>1개월권</label><br>
		<label>이호정</label><br>
		<label>라운지 이용</label><br>
		<label>6/22~7/21</label>
		</button>
		
		<button id="exp">
		<label>1개월권</label><br>
		<label>고종현</label><br>
		<label>라운지 이용</label><br>
		<label>6/10~7/9</label>
		</button>
		
		<button id="unpaid">
		<label>1개월권</label><br>
		<label>김범근</label><br>
		<label>라운지 이용</label><br>
		<label>6/28~7/27</label>
		</button>
		
		<button id="day">
		<label>1일권</label><br>
		<label>장욱</label><br>
		<label>라운지 이용</label><br>
		<label>6/29</label>
		</button> -->
		
		<div class="btn2" id="btn2"></div>
		
		
		</div>
		
		
		
		<script>
		function(){
			if(h)
			$(".btn3").css(style="border:lightgrey 2px dashed;");
		}
		</script>
	</section>

</body>
</html>