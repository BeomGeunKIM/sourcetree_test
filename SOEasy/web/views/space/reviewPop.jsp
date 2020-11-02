
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#outer {
		border:3px solid #40a4b6;
		width:650px;
		height:500px;
	}
	
	.btn {
		width:70px;
		height:30px;
		background:#40a4b6;
		color:white;
		border:0;
		outline:0;
		border-radius:10px;
		font-size:15px;
	}
	
	#cancel {
		width:70px;
		height:30px;
		background:white;
		color:#40a4b6;
		border:0;
		outling:0;
		border-radius:10px;
		font-size:15px;
		border:2px solid #40a4b6;
	}
	
	#textArea {
		resize:none;
		border:2px solid #40a4b6;
		border-radius:10px;
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
		color: #40a4b6;
	}
	
	.rating .stars .star.no_to_rate:before {
		color: #d0e8f0;
	}

</style>
</head>
<body>

<section>
<div style="width:75%; margin-left:auto; margin-right:auto;">

	<form id="insertReview" action="<%= request.getContextPath()%>/insertReview" method="post">
	<div id="outer">
		<h1 align="center" style="color:#40a4b6;">리뷰 작성</h1>
		<table style="margin-right:auto; margin-left:auto;">
			<tr>
				<td width="90px">
					<button class="btn" align="center">
						별점
					</button>
					<input type ="hidden" id="spaceName">
				</td>
				<td>
          			<div class="rating left">
  						<div class="stars right">
    						<a class="star rated" id="star1" onclick="star1();"></a>
   						    <a class="star rated" id="star2" onclick="star2();"></a>
    						<a class="star rated" id="star3" onclick="star3();"></a>
    						<a class="star" id="star4" onclick="star4();"></a>
   							<a class="star" id="star5" onclick="star5();"></a>
   							<input type="hidden" name="rPoint" value="3" id="rpoint">
  						</div>
					</div>
          		</td>
			</tr>
			<tr>
				<td width="90px">
					<button class="btn" align="center" style="margin-bottom:280px;">
						내용
					</button>
				</td>
				<td>
					<textarea name="reviewContent" id="textArea" cols="50" rows="20"></textarea>
				</td>
			</tr>
		</table>
		
		<table align="center">
			<tr>
				<td><button onclick="submit();" class="btn" id="submit" style="cursor:pointer;">등록</button></td>
				<td><button onclick="self.close();" class="btn" id="cancel" style="cursor:pointer;">취소</button></td>
			</tr>	
		</table>
		
	</div>
	</form>
	
	<script>
	$(function(){
		var spaceName =opener.document.getElementById('hiddenSpaceName').value;
		$('#spaceName').val(spaceName);
		console.log($('#spaceName').val());
		
	});
	function submit() {
		
		$("#insertReview").submit();
	}
	
	//빈 내용시 알러트 띄우기
	$(document).ready(function(){
		$("#submit").click(function(){
			var textArea = $("#textArea").val();
			//왜 안돼
			if(textArea == "") {
				alert('내용을 작성해주세요.');  
			} else {
				alert('리뷰 등록이 완료되었습니다.');
				self.close();
			} 
		});
	}); 
	
	//별점 매기기
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
	
	function star1() {
		$('#rpoint').val(1);
	}
	
	function star2() {
		$('#rpoint').val(2);
	}
	
	function star3() {
		$('#rpoint').val(3);
	}
	
	function star4() {
		$('#rpoint').val(4);
	}
	
	function star5() {
		$('#rpoint').val(5);
	}
	
	</script>
	
	
</div>
</section>

</body>

</html>