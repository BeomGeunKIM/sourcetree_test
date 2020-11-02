<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "린가드";
	int placeQTY = 10;
	int pCompleteQTY = 10;
	
	int[] arr = new int[31];
		for(int i=0; i<31; i++){
			arr[i]=(int)(Math.random()*100)+1;
			System.out.println(arr[i]);
		}
	
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
section h1 label {
	font-size: 30px;
	color: #3DB6AE;
	font-weight: bolder;
}

#titleWrap {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

#visualWrap {
	background: linear-gradient(180deg, #968E8E 0%, rgba(255, 255, 255, 0)
		100%), rgba(0, 0, 0, 0.1);
	width: 100%;
}

.visual {
	position: relative;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

.visual button {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	width: 71px;
	height: 71px;
	border: none;
	border-radius: 100%;
	background: rgba(0, 0, 0, .5);
}

.visual button:before {
	font-family: 'xeicon';
	color: #fff;
	font-size: 45px;
}

.visual button.slick-prev {
	left: 50px;
	font-size: 0;
	color: transparent;
}

.visual button.slick-prev::before {
	content: "\e93d";
	font-family: 'xeicon';
}

.visual button.slick-next {
	right: 50px;
	font-size: 0;
	color: transparent;
}

.visual button.slick-next::before {
	content: "\e940";
	font-family: 'xeicon';
}

.visual article p {
	font-size: 20px;
	font-weight: bolder;
}

.spacePrice {
	color: #979797;
}

th {
	background: #E4EEFA;
	width: 6.2%;
	font-size: 13px;
	font-weight: bolder;
}

#total td {
	background: #3DB6AE;
	font-size: 12px;
	text-align: center;
	height: 20px;
}

#chartWrap {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

#PGFee {
	width: 15%;
}

.pCompleteInfo td {
	text-align: center;
	height: 30px;
	background: #fff;
	font-size: 13px;
}

#chartWrap table {
	width: 100%;
}

#visualWrap article {
	width: 100%;
	resize: none;
}


</style>
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="../../common/header.jsp"%></header>
	
	<nav><%@ include file="../../common/aside.jsp" %>
	<div class="colMenu">
		<label class="colMenuTitle">공간 정산</label>
		<a class="colMenuButton selectedButton" href="/login/views/host/balance/predict.jsp">예상 수익</a>
		<a class="colMenuButton" href="/login/views/host/balance/calculate.jsp">정산 조회</a>
		<a class="colMenuButton" href="/login/views/host/balance/problemCalculate.jsp">이의 신청</a>
	<br><br>
	</div>
	<hr style="margin : 0">
	</nav>
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<section>
		<br>

		<div id="titleWrap">
			<h1 style="font-size: 25px; font-weight:bolder;"><%=name%>님의 <label>7월</label> 예상 수익 입니다.
			</h1>
			<br>
			<br>
			<h2 style="font-weight:bolder;">
				등록된 공간 :
				<%=placeQTY%>개
			</h2>
		</div>
		<div id="visualWrap">
			<div class="visual">
				<br> <br>
				<%
					for (int i = 1; i <= placeQTY; i++) {
				%>

				<article>
					<img src="/login/images/area/area<%=i%>-1.png" height="200px"
						width="300px" style="margin: 0px; resize: none;">
					<p>
						<%=i%>번째 공간
					</p>
					<p class="spacePrice"><%=i * 1000%>원/일
					</p>
				</article>
				<% } %>
				<article>
					<img src="/login/images/etc/totalService.png" height="200px"
						width="300px" style="margin: 0px; resize: none;">
					<p>
						통합 예상 수익 조회
					</p>
					
				</article>
			</div>
		</div>

		<div id="chartWrap">
			<h1 style="font-size: 25px; font-weight:bolder;">
				이번 달 결제 완료 건 :
				<%= pCompleteQTY %>건
			</h1>
			<br>
			<table>
				<tr>
					<th rowspan="2" height="40px">예약일자</th>
					<th rowspan="2" height="40px">결제일자</th>
					<th rowspan="2" height="40px">결제수단</th>
					<th colspan="2" height="20px">결제금액</th>
					<th rowspan="2" height="40px">환불일자</th>
					<th rowspan="2" height="40px">결제 공간 명</th>
					<th rowspan="2" height="40px">결제자 명</th>
					<th colspan="2" height="40px">결제 유형(기간)</th>
					<th rowspan="2" height="40px" id="PGFee">취소 PG수수료액(1.98%)</th>
					<th colspan="3" height="40px">공간 사용 완료 여부</th>
					<th rowspan="2" height="40px">취소한 주체</th>





				</tr>
				<tr>
					<th height="20px">총액</th>
					<th height="20px">환불액</th>
					<th height="20px">월별</th>
					<th height="20px">일별</th>
					<th height="20px">사용완료</th>
					<th height="20px">사용중</th>
					<th height="20px">사용예정</th>
				</tr>

				<tr id="total">
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<%for(int i=1; i<=pCompleteQTY; i++) {%>
				<tr class="pCompleteInfo">
					<td><%=i+1000%></td>
					<td><%="2020.07."+i %></td>
					<td>우리카드</td>
					<td class="price"><%=i*10000 %> \</td>
					<td class="refundCharge"><%=1*(i-1) %></td>
					<td></td>
					<td><%=i%> 번째 공간</td>
					<td>린가드<%=i%></td>
					<td class="monthType">1</td>
					<td class="dayType">0</td>
					<td class="PGFeeCount">0</td>
					<td class="completeUse">1</td>
					<td class="using">0</td>
					<td class="yetUse">0</td>
					<td></td>
				</tr>
				<%
					}
				%>
			</table>
			<br>
			<br>
			<div id="chartZone">
				<h1 style="font-weight:bolder;">차트</h1>
				<canvas id="myChart" width="80%" height="30"></canvas>
			</div>
			<br><br><br><br>
		</div>
	</section>

		
	
	<footer><%@ include file="../../common/footer.jsp" %></footer>
	<script>
		//차트 로직
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['2020-07-01', '2020-07-02', '2020-07-03', '2020-07-04', '2020-07-05', '2020-07-06','2020-07-07',
		        	'2020-07-08','2020-07-09','2020-07-10','2020-07-11','2020-07-12','2020-07-13','2020-07-14',
		        	'2020-07-15','2020-07-16','2020-07-17','2020-07-18','2020-07-19','2020-07-20','2020-07-21',
		        	'2020-07-22','2020-07-23','2020-07-24','2020-07-25','2020-07-26','2020-07-27','2020-07-28',
		        	'2020-07-29','2020-07-30','2020-07-31'],
		        datasets: [{
		            label: '# of Votes',
		        
		            data: [
		            	<%for(int a : arr){%>
		            	 <%=a%>,		
		            	
		            	<%	} %>
		            	
		            	
		          	
		            ],
		            backgroundColor: [
		            	<%for (int i=0; i<31; i++){ %>
		            	'#3DB6AE',
		            	<%} %>
		           
		            	
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
		});
		
		
		$(document).ready(function(){
			var tPrice = 0;//결제금액 총액을 구하는 변수
			var tRefundCharge = 0;//결제금액 총 환불액을 구하는 변수
			var tMonthType = 0;//결제 유형이 월 단위 인 결제 건의 합
			var tDayType = 0; //결제 유형이 일 단위 인 결제 건의 합
			var tPGFeeCount = 0; //카드 취소 수수료의 합
			var tCompleteUse = 0; //사용완료된 결제 건의 합 
			var tUsing = 0; //사용중인 결제 건의 합
			var tYetUse = 0; //사용 전인 결제 건의 합
			
			//결제 금액 총액을 구하는 로직
			$('.price').each(
			       function(){
			           tPrice += parseInt($(this).text());
			           console.log($(this).text());
			       }
			);
			$('#total td:nth-child(4)').text(tPrice+ " \\");
			
		
			//결제 금액의 총 환불액을 구하는 로직
			$('.refundCharge').each(
				       function(){
				           tRefundCharge += parseInt($(this).text());
				           console.log($(this).text());
				       }
				);
				$('#total td:nth-child(5)').text(tRefundCharge+ " \\");
				
			//결제 유형중 월단위인 결제 건의 합을 구하는 로직
			$('.monthType').each(
				       function(){
				    	   tMonthType += parseInt($(this).text());
				           console.log($(this).text());
				       }
				);
				$('#total td:nth-child(9)').text(tMonthType);
				
			//결제 유형중 일단위인 결제 건의 합을 구하는 로직
			$('.dayType').each(
				       function(){
				    	   tDayType += parseInt($(this).text());
				           console.log($(this).text());
				       }
				);
				$('#total td:nth-child(10)').text(tDayType);
			
		
			//결제 건 전체에서 발생한 카드 취소 수수료의 합을 구하는 로직			
			$('.PGFeeCount').each(
				       function(){
				    	   tPGFeeCount += parseInt($(this).text());
				           console.log($(this).text());
				       }
				);
				$('#total td:nth-child(11)').text(tPGFeeCount+ " \\");
							
			//결제 건 전체에서 사용완료가 된 건의 합을 구하는 로직
				$('.completeUse').each(
					       function(){
								    	   tCompleteUse += parseInt($(this).text());
								           console.log($(this).text());
								       }
								);
								$('#total td:nth-child(12)').text(tCompleteUse);
						
			//결제 건 전체에서 사용중인 건의 합을 구하는 로직	
				$('.using').each(
					       function(){
					    	   tUsing += parseInt($(this).text());
					           console.log($(this).text());
					       }
					);
					$('#total td:nth-child(13)').text(tUsing);
			
			//결제 건 전체에서 사용예정 건의 합을 구하는 로직		
				$('.yetUse').each(
					       function(){
					    	   tYetUse += parseInt($(this).text());
					           console.log($(this).text());
					       }
					);
					$('#total td:nth-child(14)').text(tYetUse);
			
			//결제 건	중 환불액이 있는 경우 빨간 색으로 표시하는 로직	
				var pCompleteQTY = <%=pCompleteQTY %>;
					for(var i=0; i<pCompleteQTY; i++){
					var num = parseInt($('.refundCharge:nth('+i+')').text());
			   		 if(num !== 0){
						 $('.price:nth('+i+')').css("color","red");
						}else{
						$('.price:nth('+i+')').css("color","black");
						}
						console.log("num" +i+"번째:"+num);
					}
								
		});

		$('.visual').slick({
			
			  infinite: false,
			  speed: 300,
			  slidesToShow: 4,
			  slidesToScroll: 4,
			  responsive: [
			    {
			      breakpoint: 1024,
			      settings: {
			        slidesToShow: 3,
			        slidesToScroll: 3,
			        infinite: true,
			        dots: true
			      }
			    },
			    {
			      breakpoint: 600,
			      settings: {
			        slidesToShow: 2,
			        slidesToScroll: 2
			      }
			    },
			    {
			      breakpoint: 480,
			      settings: {
			        slidesToShow: 1,
			        slidesToScroll: 1
			      }
			    }
			    // You can unslick at a given breakpoint now by adding:
			    // settings: "unslick"
			    // instead of a settings object
			  ]
			});
		</script>
</body>
</html>