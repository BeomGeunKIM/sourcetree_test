<%@page import="com.kh.login.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.login.board.model.vo.Board" %>
<% Board board = (Board) request.getAttribute("board"); %>

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
#boardTable tr th{

  background:#60B4A6;
  color: white;
  text-align: center;
​
}
#boardTable tr{
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
	 <div class="colMenu" style="margin-top: 20px;">
		<a class="colMenuButton selectedButton"	href="/login/views/board/board.jsp">공지사항</a>
		<a class="colMenuButton" href="/login/views/board/faqboard.jsp">자주 묻는 질문</a> 
		<a class="colMenuButton" href="/login/views/board/mtmboard.jsp">1대1문의</a>
	</div>
	<hr style="margin: 0">
	<br>
	
	<section>
	<br>
	<label><font size="6" color="gray" style=text-align:>공지사항 수정</font></label>
	
	<br>
	
	<form method="post"  id="updateForm"  name="updateForm">
	<% if(loginUser !=null && loginUser.getmId().equals("admin")) { %>
	<table width:700 border="3" bordercolor="lightgray" align="center">
			<tr>
			<td style="text-align:center; background:#60B4A6">
				제목
			</td>
			<td>
				<input name="title" type="text" size="70" maxlength="100" value="<%= board.getnTitle() %>" >
				<input type="hidden" name="nno" value="<%= board.getNoticeNo() %>">
			</td>		
		</tr>
		<tr>
			<td style=text-align:center style="text-align:center; background:#60B4A6">
			<select class="category" name="category" id="category" style="text-align:center; background:#60B4A6 ">
					<option class="category" style="text-align:center"><%= board.getnCategory() %></option>
					<option class="category" value="1">시스템관련</option>
					<option class="category" value="2">계정관련</option>
					<option class="category" value="3">결제관련</option>
					<option class="category" value="4">이용관련</option>
					<option class="category" value="5">자주묻는게시판</option>
				</select>
			</td>
				
		</tr>
		<tr>
			<td style="text-align:center; background:#60B4A6">
				내 용
			</td>
			<td>
				<textarea name="content" cols="72" rows="20" style="resize:none;" ><%= board.getnContent() %></textarea>			
			</td>		
		</tr>

		<tr align="center" valign="middle" style="text-align:center; background:#60B4A6">
			<td colspan="5">
			<button style="text-align:center; background:#60B4A6" onclick="deleteboard();">삭제</button>
				<button style="text-align:center; background:#60B4A6" onclick="complete();">수정완료</button>
				<button style="text-align:center; color:white; background:#60B4A6" type="button" id="post" onclick="posting();" >최종게시</button>
				<button style="text-align:center; color:white; background:#60B4A6" id="downPost" type="button" onclick="downPosting();" >내리기</button>
			<%}  %>
			</td>
		</tr>
	</table>	
	</form>
	</section>
	 <%@ include file="../common/footer.jsp"%> 

	<script>
	$(function(){
		var status = '<%=board.getnStatus()%>';
			if(status == 'Y'){
				$("#post").hide();
				$("#downPost").show();
			} else {
				$("#post").show();
				$("#downPost").hide();
			}
		});
		
		function complete(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/updateBoard.no");
		}
		function deleteboard(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/delete.no");
		}
		
		function posting(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/post.no").submit();
		}
		function downPosting(){
			$("#updateForm").attr("action", "<%=request.getContextPath()%>/downpost.no").submit();
			}
	</script>


</body>
</html>	