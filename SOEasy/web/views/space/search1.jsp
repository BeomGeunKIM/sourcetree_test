<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.*"%>
<% 
	String search = (String)request.getAttribute("search");
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	String url = (String)request.getAttribute("url");
	String root = (String)request.getAttribute("root"); 
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int requestCount = pi.getRequestCount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
section {
	min-height: 90%;
	font-family: 'NanumSquare', sans-serif;
	background: #ECECEC38;
	font-weight: bolder;
	width: 100%;
}
.photobox {
	padding: 15px;
	padding-bottom: 10px;
}

.space-title-photo {
	border-radius: 10px;
	margin: 0 auto;
	padding: 0;
	display: block;
	width: 400px;
	height: 265px;
}

.visual {
	position: relative;
	width: 100%;
}

#searchResult {
	position: absolute;
	top: 40%;
	left: 28%;
	font-size: 40px;
	font-weight: bolder;
	color: black;
	text-align: center;
}
.filter-bg {
	background: white;
	width: 100%;
	height: 115px;
}
.filter {
	vertical: center;
	width: 70%;
	height: 20px;
	align: center;
	border-collapse: collapse;
	border-spacing: 0;
	vartical-align: middle;
}

/* .filter select {
	width: 90%;
	height: 30px;
	border: 1px solid lightgray;
} */
.spaceKind {
	width: 60%;
	height: 30px;
	border: 1px solid lightgray;
}
.location {
	width: 90%;
	height: 30px;
	border: 1px solid lightgray;
}
.term {
	width: 90%;
	height: 30px;
	border: 1px solid lightgray;
}
.sort {
	width: 90%;
	height: 30px;
	border: 1px solid lightgray;
}
.typeBox {
	margin-left: 5%;
}

.price-box {
	width: 95%;
	height: 40px;
	background: white;
	border: 1px solid lightgray;
}

.price {
	margin: 4.5px;
	width: 35%;
	height: 30px;
	border: 1px solid lightgray;
}
	.spaceBoardArea {
		width:90%;
		margin:0 auto;
	}

   .spaceBoard {
   		border:1px solid white;
   		display:inline-block;
   		margin: 10px;
   		align:center;
   		
   }
   .spaceBoard:hover {
   		cursor:pointer;
   		opacity:0.8;
   		transient:2s;
   }
   .text {
   		background: white;
   }

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/web/css/layout.css">
<title>SO Easy</title>

</head>
<body>
	<header><%@ include file="../common/header.jsp"%></header>
	<%-- <nav><%@ include file="../common/aside.jsp"%></nav> --%>

	<section>

		<div class="visual">
			<div
				style="background-image: url(../../images/area/area22-4.png); display: block; height: 300px; width: 100%; background-repeat: no-repeat; background-size: cover; filter: blur(8px); -webkit-filter: blur(8px);">
			</div>
			<div id="searchResult">
				<p style="text-shadow: 1px 2px 2px #ffffff;">
					<b id="searchKeyword" style="color: #40a4b6;"><%= search %></b> (으)로 검색한 결과입니다.<br>
				</p>
			</div>
		</div>
		<br>
		<div style="width: 90%; margin-left: auto; margin-right: auto;">

			<!-- <div style="display: inline-block; width: 30%; background : #EBEBEB; border-radius:5px;" id="localList">
			
		</div> -->
		</div>
		<div class="filter-box">
		<div class="filter-bg">
			<br>
			<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
			<form action="/login/select.fi" method="get" id="filterForm">
			<table align="center" class="filter">
				<tr>
					<td rowspan="2">필터</td>
					<td><select class="spaceKind" name="spaceKind">
							<option value=null>==공간유형==</option>
							<option value="1">독립오피스</option>
							<option value="2">코워킹스페이스</option>
					</select>
<!-- 					 바로예약 여부 <input type="checkBox" name="didHostOk" value=3> DID_HOST_OK 3번 바로예약-->					
 					</td>
					<td><select class="location" name="location">
							<option value=null>==지역유형==</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="부천">부천</option>
							<option value="춘천">춘천</option>
							<option value="강원">강원</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="경남">경남</option>
							<option value="대구">대구</option>
							<option value="경북">경북</option>
							<option value="전주">전주</option>
							<option value="전북">전북</option>
							<option value="광주">광주</option>
							<option value="전남">전남</option>
							<option value="청주">청주</option>
							<option value="충북">충북</option>
							<option value="대전">대전</option>
							<option value="충남">충남</option>
							<option value="제주">제주</option>
					</select></td>
					<td><select class="term" name="term">
							<option value=null>==이용유형==</option>
							<option value="DAY_PAY">1일권</option>
							<option value="MONTH_PAY">1개월권</option>
							<!-- <option value="week">1주일권</option> -->
					</select></td>
					<td rowspan="2"><input type="text" name="filterSearchKeyword" hidden="<%=search%>" value="<%=search%>"><button type="button"
							style="background: #40a4b6; color: white; border: 0px; border-radius: 10px; width: 90px; height: 40px;" id="filterSearch" onclick="letsFilter();">검색</button></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="price-box">
							가격
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" name="lowPrice" class="price" value="0" placeholder="0">~<input type="text" name="highPrice" class="price" value="100000000">
						</div>
						
					</td>
					<td><select class="sort" name="sort">
							<option value=null>==정렬==</option>
							<option value="lowPriceSort">가격 낮은순</option>
							<option value="highPriceSort">가격 높은순</option>
					</select></td>
					<td></td>
				</tr>
				
			</table>
			</form>
		</div>
		
			<br>
			<br>
			<div class="typeBox">
				<input class="sType" type="button" value="코워킹 스페이스"
					style="background-color: transparent; border: 0px transparent solid; font-size: 20px; font-weight: bolder;">
				<input class="sType" type="button" value="독립오피스"
					style="background-color: transparent; border: 0px transparent solid;">
			</div>
			<p style="margin-left:7%;">검색 결과 총 <%= listCount %>개</p>
			<!-- Space Board Area -->
			<div class="spaceBoardArea">
			<% if(list != null) {
			for (int i = 0; i < list.size(); i++) {
				HashMap<String, Object> hmap = list.get(i);
				%>
				<div class="spaceBoard" align="center">
					<input type="hidden" class="sendSpaceNo" value="<%=hmap.get("spaceNo") %>">
					<%-- <% System.out.println("spaceNo"); %> --%>
					<div class="text">
						<img src="<%=request.getContextPath()+ hmap.get("filePath")+"/"+hmap.get("changeName") %>" width="380" height="240">
					<p><%= hmap.get("spaceName") %></p>
					<p><%= hmap.get("spaceShortIntro") %>
					<!-- 가 -->
					<p><% if(hmap.get("monthPay") != null && !hmap.get("monthPay").equals(0)) { %>
					가격 : <%= hmap.get("monthPay") %> / 개월 
					<% } %>
					<% if(hmap.get("dayPay") != null && !hmap.get("dayPay").equals(0)) { %>
					가격 : <%= hmap.get("dayPay") %> / 일
					<% } %>
					</p>
					<%-- <% 
					int cut = hmap.get("spaceLocationFilter").indexOf(",");
					String realFilter = hmap.get("spaceLocationFilter").substring(cut);
					%> --%>
					<p style="font-size:9px">지역 : <%= hmap.get("spaceLocationFilter") %></p>
					<br>
					</div>
					
				</div>
				<% } %>
			<% } %>
			<% if(listCount == 0){ %>
					<div>
						<div align="center" style="background:white; height:100px;">검색 결과가 없습니다.</div>
					</div>
				<% } %>
			</div>
		</div>
	</section>
	<br>
	<!-- 페이징처리 버튼 -->
		<div class = "pagingArea" align="center">
      	<button onclick="location.href='<%=root+url%>currentPage=1'"><<</button>
      	
      	<% if(currentPage <= 1) { %>
      	<button disabled><</button>
      	<% } else { %>
      	<button onclick="location.href='<%=root+url%>currentPage=<%=currentPage - 1%>'"><</button>
      	<% } %>
      	
      	<% for(int p = startPage; p <= endPage; p++) {
      			if(p == currentPage) {		
      	%>
      				<button disabled><%= p %></button>	
      	<% 		} else {	%>
      				<button onclick="location.href='<%=root+url%>currentPage=<%= p %>'"><%= p %></button>
      	<% 		} %>
      	
      	<% } %>
      	
      	
      	<% if(currentPage >= maxPage) { %>
      	<button disabled>></button>
      	<% } else { %>
      	<button onclick="location.href='<%=root+url%>currentPage=<%=currentPage + 1%>'">></button>
      	<% } %>
      	
      	<button onclick="location.href='<%=root+url%>currentPage=<%=maxPage%>'">>></button>
      	</div>

	<script>
	
		function letsFilter(){
			$('#filterForm').submit();
		}
	
		$(function(){
	           $(".spaceBoard").click(function() {
	               //var num = $(this).children().children().eq(0).val();
	               var num = $(this).find(".sendSpaceNo").val();
	               console.log(num);
	               
				location.href="<%=request.getContextPath()%>/selectOneSpaceInfo?spaceNo=" + num;
			});
		});
		
		<%-- $(function(){
			$("#filterSearch").click(funciton() {
				var searchKeyword = $(this).find("#searchKeyword").val();
				console.log(num);
				
				location.href="<%=request.getContextPath()%>/select.fi?searchKeyword=" + searchKeyword;
				
			})
		}); --%>
	
	</script>
	<br><br>
	<footer><%@ include file="/views/common/footer.jsp" %></footer>
</body>
</html>