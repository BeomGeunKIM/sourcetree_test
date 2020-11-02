<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.login.board.model.vo.Board"%>
    <% Board board = (Board)request.getAttribute("board"); %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/layout.css">
​
<style>
#wrapper{
  width: 80%;
  margin-left: auto;
  margin-right: auto;
​
}
.writeButton{
	
  text-decoration: none;
  color : black;
  float: right;
  background : #60B4A6;
  border-radius: 10px;
  padding : 10px;
  clear : both;
  
}
#boardTable{
	border : solid 2px #60B4A6;
}
#boardTable tr th{
  background: #60B4A6;
  color: white;
  text-align: center;
​
}
#boardTable tr{
	height : 50px;
	border-bottom : solid 1px #60B4A6;
}
​
#boardTable tr textarea{
	border: none;
	height: 200px;
	resize: none;
	font-size: 15px;
	background: transparent;
	
}
​
.answerButtons{
	float: right;
	background : #60B4A6;
	font-size: 25px;
	font-weight : bolder;
	border-radius: 5px;
	height : 50px;
	margin-left : 10px;
	border : none;
}
.answerButtons:hover{
​
	color : white;
}
.answerButtons:focus{
	outline : none;
	color : white;
}
.aTitle{
	font-size: 25px;
	font-weight: bolder;
}
​
#searchWrap{
	
	width: 30%;
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
​
}
#searchWrap tr td button:focus{
	outline: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../common/header.jsp"%></header>
	<section>
	<div id="wrapper">
       
		<h2 class="logo" style="margin:0; font-size:30px; font-weight:bolder">공지사항</h2>
		
		<br>
		<table id="searchWrap" height="25px">
			<tr>
			</tr>
		</table>
		<a href="board.jsp" class="writeButton">이전으로</a> 
		<br>	
				<table style = "width: 100%; border-collapse: collapse; " id="boardTable">
						<tr>
					<td>제목</td>
					<td colspan="6">
						<input type="text" size="50" name="title" value="공지사항" readonly>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="6">
						<input type="text" name="writer" value="ㅅㄱ" readonly>
					</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td colspan="6">
						<input type="date" name="date" value="날짜" readonly>
					</td>
				</tr>
				<tr>
					<td>내용</td>
				</tr>
				<tr>
					<td colspan="6">
					<textarea name="content" rows="15" cols="60" style="resize:none;" readonly></textarea>
				</tr>
			</table>
			<br>
			<div align="center">
				<button onclick="location.href='<%= request.getContextPath()%>/selectList.no'">메뉴로 돌아가기</button>
				<% if(loginUser != null && loginUser.getmId().equals("admin")) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectNotice.no?num=<%= board.getNoticeNo() %>'">수정하기</button>
				<% } %>
			</div>
		</div>
	</section>
	<br><br>
	<footer><%@ include file="../common/footer.jsp"%></footer>
<%-- 	<script>
	 var userStatus = <%=userStatus%>;
		 $(function(){
			switch(userStatus){
			case 1: if(userStatus === "admin")
			case 2: $('.restartBtn').hide()
					$('.deleteBtn').hide(); break;
			case 3:	$('.restartBtn').hide();
					$('.deleteBtn').hide();  break;
			default : $('.restartBtn').hide();
					$('.deleteBtn').hide();  break;
			}
		});
		 
		 checkNullLogin();
		 
		 
 </script> --%>
</body>
</html>