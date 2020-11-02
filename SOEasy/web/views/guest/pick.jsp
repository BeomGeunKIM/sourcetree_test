<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int col = 16;
	int row = 4;
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<style>
	#pickWrap{
		width: 90%;
		margin-left: auto;
		margin-right: auto;
	}
	.photobox {
	padding: 20px;
	padding-bottom: 10px;
	}
	.space-title-photo{
		border-radius: 10px;
		margin: 0 auto;
		padding: 0;
		display: block;
		width: 400px;
		height: 265px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../../views/common/header.jsp"%></header>
	<nav><%@ include file="../../views/common/aside.jsp"%>
		<div class="colMenu">
			<label class="colMenuTitle">예약 목록</label>
			 <a class="colMenuButton" href="/login/views/guest/reserveList.jsp">예약 내역 리스트</a>
			 <a class="colMenuButton selectedButton" href="/login/views/guest/pick.jsp">찜 리스트</a>
			 <a class="colMenuButton" href="/login/views/guest/myReview.jsp">리뷰 목록</a>
			 <br><br>
		</div>
		<hr style="margin: 0">
	</nav>

	<section>
		<div id="pickWrap">
		<br><br><br>
		<table align="center"  id="spaceBoard">

		</table>
		</div>
	</section>
	<footer><%@ include file="../../views/common/footer.jsp" %></footer>
	<script>
	$(this).ready(function() {
		var col =<%=col%>;
		var row =<%=row%>;
		$('#spaceBoard').append(function() {
			var sentence = "";
			for (var i = 1; i <= col;) {
			sentence += "<tr>";
			for (var j = 1; j <= row; i++, j++) {
			if (i > col) {
			break;
			}
			sentence += ' <td class="photobox">'
			+ '<article>'
			+ '<img class="space-title-photo"'+ 'src="../../images/area/area'+i+'-1.png"> '
			+ '<p> 코워킹 스페이스'+i+'번째 공간<br><br>'
			+ '가격 '
			+ (i* 10000) + '원 /개월'+ '</p>'
			+ '<button>삭제하기</button>'
			+ '</article>'
			+ '</td>'
				}
				sentence += "</tr>"
					}
			return sentence;
				});
			});
	</script>
</body>
</html>