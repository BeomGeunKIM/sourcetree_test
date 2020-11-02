<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "린가드";
	int placeQTY = 10;
	int pCompleteQTY = 10;
	int problemRequestQTY = 5;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="/login/css/layout.css">
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>


<style>
	section h1 label{
		font-size : 30px;
		color : #3DB6AE;
	}
	#titleWrap{
		width : 80%;
		margin-left: auto;
		margin-right: auto;
		
	}


        .spacePrice{
        	color : #979797;
        	
        }
      
     	th{
     		
     		width: 6.2%;
     		font-size: 13px;
     		font-weight: bolder; 
     		
     	}
     	
     	
     	#chartWrap{
     		width: 80%;
     		margin-left: auto;
     		margin-right : auto;
     	}
     	#PGFee{
     		width: 15%;
     	}
	       
       .pCompleteInfo td{
       	text-align: center;
       	height : 30px;
       	background : #fff;
       }
       #chartWrap table{
       	width: 100%;
       }
       #visualWrap article{
       	width: 100%;
       	resize: none;
       }
       
      
       
       #howReport p label{
       	color : #3DB6AE;
       }
       #howReport p{
       	font-size: 14px;
       }
       
      
       #reportBox{
       
       	margin-top : 50px;
       	width: 80%;
       	margin-right: auto;
       	margin-left: auto;
       	  	background : white;
       	border-radius: 15px;
       	
       }
       #reportBox table tr td label{
       	font-size : 20px;
       	color : #40A6B4;
       	font-weight : bolder;
       }
       #reportBox table tr td:nth-child(2){
       	text-align: right;
       }
       #reportBox table tr{
       	height: 10px;
       	
       }
       #reportBox table tr td h1{
       	margin: 0;
       	margin-bottom : 10px;
       	font-weight: bolder;
       }
       
       #checkCalExplain{
       	display : inline-block;
       	width: 60%;
       }
       
       #checkCalSubmit{
       	width: 180px;
       	height: 60px;
       	background : #40A6B4;
       	border-radius: 20px;
       	font-weight : bolder;
       	font-size : 20px;
       	border: none;
       }
   
       
       #problemRequestList table tr td{
       	text-align: center;
       	font-size: 13px;
       }
       
       #problemRequestList table tr th{
       	text-align: center;
       	font-size: 15px;
       }
       #problemRequestList table tr:first-child{
       	background : #40A6B4;
       
       }
       
        #problemRequestList table tr:not(first-child){
       	border-bottom: solid 2px;
       	border-bottom-color: #40A6B4;
       	height: 40px;
       
       }
       
        #problemRequestList table tr th{
        	margin : 0;
        	color : white;
        	font-weight: bolder;
        	width: 250px;
        	height : 50px;
        	
        }
        .selector{
        	width: 100px;
        	height : 30px;
        }
        
        #reportBox table tr td h1{
        	font-size : 18px;
        }

        
</style>
<title>SO Easy</title>
</head>
<body>
	<header>	<%@ include file="../../common/header.jsp"%></header>
	<nav><%@ include file="../../common/aside.jsp" %>
		<div class="colMenu">
			<label class="colMenuTitle">공간 정산</label>
			<a class="colMenuButton" href="/login/views/host/balance/predict.jsp">예상 수익</a>
			<a class="colMenuButton" href="/login/views/host/balance/calculate.jsp">정산 조회</a>
			<a class="colMenuButton selectedButton" href="/login/views/host/balance/problemCalculate.jsp">이의 신청</a>
			<br><br>
	</div>
	<hr style="margin : 0">
	</nav>
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<section>
		
		<br>
		<div id="titleWrap">
		<!--  정산 금액 조회  시작-->
		<div id="howReport" style="width: 50%; display: inline-block">

			<h1 style="font-size:25px; font-weight:bolder; margin:0"  >정산이 이상한가요?</h1>
			<p>정산 이의신청을 해주세요!</p>
			<br>
			<p>정산금액은 다음과 같이 계산 됩니다.</p>
			<p>판매액수-환불액 =&nbsp; <label>판매 총액</label></p>
			<p>환불이 없는 경우 중개 수수료 액 = 판매총액 X 중개수수료(0.1)&nbsp;<label>수수료액1</label></p>
			<p>환불건인 경우 중개 수수료 액=환불수수료 X[중개수수료+PG사 수수료](0.1198)&nbsp;<label>수수료액2</label></p>
			<p>현금 결제 건은 PG사 수수료가 발생하지 않습니다.</p>
			<p>호스트의 개인 사정으로 환불 진행시 1.98%의 수수료가 호스트에게 청구됩니다.</p>
			<p>수수료는 게스트회원이  "회사"의 예약 및 결제시스템을 이용하여 호스트 회원의 공간을</p>
			<p>결제 함으로써 호스트회원이 "회사"에 지불하는 수수료이며, 이는 VAT를 포함한 금액입니다.</p>
			<br>
			<h2 style="font-size : 20px;">정산액은 매월 10일에 입금됩니다</h2>
		</div><!-- 
		
	 --><div id="reportZone" style="width: 50%; display:inline-block;">
			<div style="width:80%; margin-left:auto; margin-right: auto;">
				
				<h1 style="font-size:25px;font-weight: bolder;">정산 금액을 확인해 보세요.</h1>
				<p style="font-size: 13px;" >단위 기간 및 공간을 선택하세요.</p><br>
				<select class="selector" align="center">
					<option>단위 기간</option>
				</select>
				<select class="selector">
					<option>공간 명</option>
				</select>
				</div>
				<div id="reportBox">
				
				
				<table align="center" style="width: 80%;">
					<tr height="20px">
						<td><h1>판매 총액 :</h1></td>
						<td><label>1,802,000</label></td>
						<td><h1>\</h1></td>
					</tr>
					<tr height="5px">
						<td><h1>수수료액1 :</h1></td>
						<td><label>160,000</label></td>
						<td><h1>\</h1></td>
					</tr>
					<tr height="5px;">
						<td><h1>수수료액2 :</h1></td>
						<td><label>24,199</label></td>
						<td><h1>\</h1></td>
					</tr>
					<tr></tr>
					<tr>
						<td><h1>최종 정산액 : </h1>
					</tr>
					<tr>
						<td></td>
						<td><label style="font-size : 20px">1,617,802</label></td>
						<td><h1>\</h1></td>
					</tr>
				</table>
				<br><br>
				</div>
				<br><br>
				<button id="checkCalSubmit" style="float:right;" type="button" onclick="requestProblem();">재정산 요청</button>
			</div>
			<br><br><br>
			<div id="problemRequestList">
			<h1 style="font-size:25px; font-weight:bolder">재정산 요청 목록 &nbsp; <label><%=problemRequestQTY%>개</label></h1>
			<table style=" border-collapse: collapse; border-spacing: 0;">
				<tr>
					<th>의뢰번호</th>
					<th>요청일</th>
					<th colspan="2">단위 정산 기간</th>
					<th colspan="2">공간명</th>
					<th>진행경과</th>
				</tr>
			
				<% for(int i=1; i<=problemRequestQTY; i++){ %>
				<tr>
					<td>린가두</td>
					<td>호날두</td>
					<td colspan="2">램파두</td>
					<td colspan="2">제라두</td>
					<td><label>야나두</label></td>
				</tr>
				<% } %>
			</table>
			</div>
		</div>
	
	</section>
	<br><br><br><br>
	<footer><%@ include file="../../common/footer.jsp" %></footer>
	<script>
		function requestProblem(){
			window.open('writeProblem.jsp', 'window팝업', 'width=1000px, height=800px, menubar=no, status=no, toolbar=no');  

		
			
		}
	</script>
</body>
</html>