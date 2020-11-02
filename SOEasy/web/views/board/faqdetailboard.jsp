<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
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
	<nav><%@ include file="../common/aside.jsp"%></nav>
	<section>
	<div id="wrapper">
       
		<h2 class="logo" style="margin:0; font-size:30px; font-weight:bolder">자주 묻는 질문</h2>
		
		<br>
		<table id="searchWrap" height="25px">
			<tr>
			</tr>
		</table>
		<a href="faqboard.jsp" class="writeButton">이전으로</a> 
		<br>
				<table style = "width: 100%; border-collapse: collapse; " id="boardTable">
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th></th>
						</tr>
					<tr style="border-bottom: solid 1px  #60B4A6;">
							<td class="info" style="text-align: center;">1</td>
							<td class="info" style="text-align: center;">계정관련</td>
							<td class="info" style="text-align: center;"><a href="writeboard.jsp" style="text-decoration:none; color:black;">이용했던 곳을 다시 이용하려는데 리스트에 보이지 않아요</a></td>
							<td class="info" style="text-align: center;"><%=loginUser.getmId() %></td>
							<td class="info" style="text-align: center;">2020-06-26</td>
							<td class="info" style="text-align: center;">X</td>
						</tr>
						<tr> 
							<td colspan="6">
								<div style="width:94%; margin-left:auto; margin-right:auto; margin-top:20px;">
									<label class="aTitle">질문</label>
									<textArea style="width:100%; resize:none; border:none; color:gray; padding:10px" class="question" class="QandA" readonly ;></textArea>
								</div>
							</td>
						</tr>
				
						<tr>	
							<td colspan="6" >
								<div style="width:94%; margin-left:auto; margin-right:auto; margin-top:20px;">
									<p class="aTitle">답변 &nbsp; <label style="font-size: 15px; float:right; font-weight:bolder;">답변일자</label></p>
									<textArea style="width:90%; resize:none; border:none;"  class="answer" readonly class="QandA">안녕하세요 coding12님?문의주신 내용에 대해서 답변해드리겠습니다.현재 '역삼동 혼자사무실'의 호스트가 공간 삭제요청을 하여 삭제 처리하였습니다.다른 오피스를 이용 부탁드리겠습니다.</textArea>
									<div style="float:right;">
									<button type="button" onclick="startAnswer();" class="startBtn">답변하기</button>
									<button type="button" onclick="stopAnswer();" class="stopBtn">답변취소</button>
									</div>
								</div>
							</td>
						</tr>
				</table>
	</div>
	</section>
	<br><br>
	<footer><%@ include file="../common/footer.jsp"%></footer>
	
	
</body>
</html>