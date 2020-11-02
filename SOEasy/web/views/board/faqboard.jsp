<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*, com.kh.login.board.model.vo.*,
	com.kh.login.host.manageReserve.model.vo.*"	%>
<% ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list"); 
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
​
<style>
​
#wrapper{
  width: 80%;
  margin-left: auto;
  margin-right: auto;
}

.writeButton{
  text-decoration: none;
  color : black;
  float: right;
  background : #60B4A6;
  border-radius: 10px;
  padding : 10px;
}
#faqTable tr th{

  background:#60B4A6;
  color: white;
  text-align: center;
​
}
#faqTable tr{
	height : 50px;
}
#searchWrap{
	
	width: 40%;
	border: solid 1px #60B4A6;
	border-radius: 30px;
}
#searchWrap tr td input{
	display: inline-block;
	border: none;
	background: transparent;
	width: 100%;
	height: 100%;
}
#searchWrap tr td input:focus{
	outline: none;
}
#searchWrap tr td button{
	background : transparent;
	border: none;
	float: right;
}
#searchWrap tr td button:focus{
	outline: none;
}
​#th{
	border : 1px solid #60B4A6;
}
.logo{
	color:#60B4A6
}
</style>
<title>SO Easy</title>
</head>
<body>
	 <header><%@ include file="../common/header.jsp"%></header>
	<div class="colMenu" style=margin-top:20px;>
		<a class="colMenuButton" href="/login/selectList.no">공지사항</a>
		<a class="colMenuButton selectedButton" href="/login/selectList.faq">자주 묻는 질문</a>
			<% if(loginUser != null) { %>
		<a class="colMenuButton" href="/login/select.mtm">1대1문의</a>
		<% } %>	
	<br><br>
	</div>
	<hr style="margin : 0">
	 <br>
	
	<section>
    <div id="wrapper">
		<h2 class="logo" style="margin:0; font-size:30px; font-weight:bolder">자주 묻는 질문</h2>
			<% if(loginUser != null && loginUser.getmId().equals("admin")) { %>
			<a href="/login/views/board/writeboard.jsp" id="writeButton" class="writeButton">글쓰기</a>
				<% } %>	 
		<table style="width: 100%; border-collapse: collapse" id="faqTable" >
		<tr>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th></th>
				</tr>
				<% for(Board b : list) { 
					String category = "";
				if(b.getnCategory() == 1) {
					category = "시스템관련";					
				}else if(b.getnCategory() == 2){
					category = "계정관련";
				}else if(b.getnCategory() == 3 ){
					category = "결제관련";
				}else if(b.getnCategory() == 4) {
					category = "이용관련";
				}else {
					category = "자주묻는 질문";
				}
				%>
				<tr>
					<td class="info" style="text-align: center;"><%= b.getNoticeNo() %></td>
					<td class="info" style="text-align: center;"><%= category %></td>
					<td class="info" style="text-align: center;"><%= b.getnTitle() %></td>
					<td class="info" style="text-align: center;"><%= b.getmNick() %></td>
					<td class="info" style="text-align: center;"><%= b.getnDate() %></td>
					<% if(loginUser != null && loginUser.getmId().equals("admin")) { %>
					<td class="info" style="text-align: center; color:green"><%=b.getnStatus() %></td>
						<% } %>
				</tr>
				<% } %>
			</table>
		</div>
		<div class="pagingArea" align="center">
         <button onclick="location.href='<%=request.getContextPath()%>/selectList.faq?currentPage=1'"><<</button>
         
         <% if(currentPage <= 1) { %>
         <button disabled><</button>
         <% } else { %>
         <button onclick="location.href='<%=request.getContextPath()%>/selectList.faq?currentPage=<%=currentPage - 1%>'"><</button>
         <% } %>
         
         <% for(int p = startPage; p <= endPage; p++) { 
               if(p == currentPage) {
         %>
                  <button disabled><%= p %></button>
         <%      } else { %>
                  <button onclick="location.href='<%=request.getContextPath()%>/selectList.faq?currentPage=<%=p%>'"><%= p %></button>
         <%  
                 }
            }
         %>
         <% if(currentPage >= maxPage) { %>
         <button disabled>></button>
         <% } else { %>
         <button onclick="location.href='<%=request.getContextPath()%>/selectList.faq?currentPage=<%=currentPage + 1%>'">></button>
         <% } %>
         <button onclick="location.href='<%=request.getContextPath()%>/selectList.faq?currentPage=<%=maxPage%>'">>></button>
      </div>
	</section>
	 <%@ include file="../common/footer.jsp"%> 

	<script>
		 var userStatus = <%=userStatus%>;
		$(function(){
			switch(userStatus){
			case 1: break;
			case 2: break;
			case 3: $('.writeButton').show(); break;
			default: $('#writeButton').hide(); break;
			}
			$("#faqTable td").mouseenter(function() {
				$(this).parent().css({"background" : "#60B4A6", "cursor" : "pointer"});
			}).mouseout(function() {
				$(this).parent().css({"background" : "white"});
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/detail.no?num=" + num;
			})
		});
	</script>
	
	
	​
​
	
				
			
</body>
</html>