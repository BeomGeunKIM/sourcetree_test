<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int placeQTY = 10;
	int pCompleteQTY = 10;
	int calcStatement = 1;
	String state = null;
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<meta charset="UTF-8">
<style>
#wrapper {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

#wrapper select {
	float: right;
}

th {
	background: #E4EEFA;
	width: 13%;
	font-size: 17px;
	font-weight: bolder;
	clear: both;
}

.pCompleteInfo td {
	text-align: center;
	height: 30px;
	background: #fff;
}

.pCompleteInfo td a {
	text-decoration: underline;
	color: black;
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
</style>
<title>Insert title here</title>
</head>
<body>
	<%-- <header><%@ include file="/views/common/adminHeader.jsp" %></header> --%>
	<nav>
		<%@ include file="/views/common/aside.jsp"%>
		<div class="colMenu">
			<label class="colMenuTitle">정산 관리</label> <a
				class="colMenuButton selectedButton"
				href="/login/views/admin/manageCalculate.jsp">정산 내역 관리</a> <a
				class="colMenuButton"
				href="/login/views/admin/manageCalculateObjection.jsp">재정산 요청 관리</a>
			<br>
			<br>
		</div>
		<hr style="margin: 0">
	</nav>
		
	<section>
		<div id="wrapper">
			<br>
			<h1 style="margin: 0;">정산 내역</h1>
			<select class="select">
				<option>== 정산 상태 ==</option>
				<option>정산 상태: 미확인
					</optiyon>
				<option>정산 상태: 확인</option>
				<option>정산 상태: 마감</option>
			</select> <select class="select">
				<option>== 공간 종류 ==</option>
				<option>공간 종류 : 코워킹 스페이스</option>
				<option>공간 종류 : 독립오피스</option>
			</select>
			<!-- <select class="select">
			<option>== 월별 선택 ==</option>
			<option>2020년 7월</option>
			<option>2020년 6월</option>
			<option>2020년 5월</option>
		</select> -->
			<br>
			<br>

			<table align="center" class="tableArea" style="margin: 0; width: 100%;">
				<tr>
					<th rowspan="2" colspan="1" height="40px">정산 번호</th>
					<th rowspan="2" height="40px">호스트 아이디</th>
					<th colspan="2" height="40px">정산 진행 상태</th>
					<th rowspan="2" height="40px">공간종류</th>
					<th rowspan="2" height="40px">정산 상태</th>
					<th rowspan="2" height="40px">비고</th>
				</tr>
				<tr>
					<th height="20px">정산 단위기간</th>
					<!-- <th height="20px">정산 단위기간 마감</th> -->
					<th height="20px">정산 일자</th>
				</tr>

				<%for(int i=1; i<=pCompleteQTY; i++) {%>
				<tr class="pCompleteInfo">
					<td style="font-size: 13px;"><%=(i+257)%></td>
					<td><%="wooah"+i %></td>
					<td class="price"><%="2020.07."+(i+10)%> ~ <%="2020.08."+(i+0)%></td>
					<td><%="2020.07."+(i+11)%></td>
					<td>코워킹 스페이스</td>
					<td id="ok">
						<% switch(calcStatement) {
						case 0 : state = "미확인"; break;
						case 1 : state = "확인"; break;
						case 2 : state = "진행중"; break;
						case 3 : state = "완료"; break;
						}
						%> <%= state %>
					</td>
					<td class="goDetail"><a href="/views/admin/calculateDetail.jsp">자세히
							보기</a></td>
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
	<br>
	<br>
	<footer><%@ include file="/views/common/footer.jsp"%></footer>
</body>
</html>