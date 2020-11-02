<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int reserveQTY = 10;
%>
<html>
<head>
<meta charset="UTF-8">
<style>
	#reviewWrap{
		width: 70%;
		margin-left : auto;
		margin-right: auto;
	}

	
	.right {
  		float: right;
	}

.left {
  float: left;
}

.rating .stars {
  margin-right: 15px;
}

.rating .stars .star {
  float: left;
  padding: 5px 2px;
  cursor: pointer;
}

.rating .stars .star:before {
  font-family: 'FontAwesome';
  content: '\f005';
  color: #d0e8f0;
  font-size: 2em;
}

.rating .stars .star:hover:before,
.rating .stars .star.to_rate:before,
.rating .stars .star.rated:before {
  color: #80c1d5;
}

.rating .stars .star.no_to_rate:before {
  color: #d0e8f0;
}
</style>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../css/layout.css">
</head>
<body>
<header><%@ include file="../../views/common/header.jsp" %></header>
<nav><%@ include file="../../views/common/aside.jsp" %>
	<div class="colMenu">
		<label class="colMenuTitle">예약 목록</label>
		<a class="colMenuButton" href="/login/views/guest/reserveList.jsp">예약 내역 리스트</a>
		<a class="colMenuButton" href="/login/views/guest/pick.jsp">찜 리스트</a>
		<a class="colMenuButton selectedButton"  href="/login/views/guest/myReview.jsp">리뷰 목록</a>
		<br><br>
	</div>
	<hr style="margin : 0;">
</nav>
<section>
	<br><br>
	<div id="reviewWrap">
	<% for (int i =1; i<=reserveQTY; i++){ %>
	  <div class="reserveBox">
	  		<table class="spaceInfoBox" style="border : solid 1px; border-color:lightgray; width:100%; margin-bottom: 50px;" >
	  			<tr>
	  			<td width="40%"><img src="/login/images/area/area<%=i%>-1.png" style="width: 400px; height: 300px;">
	  			<p><%=i %>번째 공간</p>
	  			<p><%=i*10000 %>원/1개월</p></td>
	  			<td colspan="3" align="left">
	  				<div class="rating left">
  						<div class="stars right">
    						<a class="star rated"></a>
   						    <a class="star rated"></a>
    						<a class="star rated"></a>
    						<a class="star"></a>
   							 <a class="star"></a>
  						</div>
					</div>
					<br>
					&nbsp;&nbsp;<p>2020.07.08</p>
					<br>
					<textarea style="width: 80%; height:150px; display:inline-block; border-radius:10px; font-size:15px; "readonly >축황 린가드</textarea>
					&nbsp;&nbsp;<a href="#" style="color :#C4C4C4; font-size:20px;">삭제하기</a>
					<br><br><br>
					

	  				
	  			</td>
	  			</tr>
	  		</table>
	  </div>
	<%} %>
	</div>
</section>
<footer><%@ include file="../../views/common/footer.jsp" %></footer>
</body>
<script>
jQuery(document).ready(function($) {
	  $('.rating .star').hover(function() {
	    $(this).addClass('to_rate');
	    $(this).parent().find('.star:lt(' + $(this).index() + ')').addClass('to_rate');
	    $(this).parent().find('.star:gt(' + $(this).index() + ')').addClass('no_to_rate');
	  }).mouseout(function() {
	    $(this).parent().find('.star').removeClass('to_rate');
	    $(this).parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate');
	  }).click(function() {
	    $(this).removeClass('to_rate').addClass('rated');
	    $(this).parent().find('.star:lt(' + $(this).index() + ')').removeClass('to_rate').addClass('rated');
	    $(this).parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate').removeClass('rated');
	  
	  });
	});
</script>
</html>