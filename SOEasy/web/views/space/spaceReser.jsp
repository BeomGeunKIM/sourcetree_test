<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.login.space.model.vo.*, java.util.*" %>
    
<%

	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) session.getAttribute("introList");

	HashMap<String, Object> hmap = list.get(0);

	SpaceInfo si = (SpaceInfo) hmap.get("spaceInfo");

	ArrayList<Image> imgList = (ArrayList<Image>) hmap.get("imgList");
	ArrayList<Review> reviewList = (ArrayList<Review>) hmap.get("reviewList");
	ArrayList<QnA> qnaList = (ArrayList<QnA>) hmap.get("qnaList");

	String roadAddrPart1 = si.getSpaceLocationFilter().split(",")[0];  

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


<style>
        .visual{
            position: relative;
            width: 100%;
            margin-left: auto;
            margin-right: auto;
        }
        
        .visual button{
            position : absolute;
            z-index: 10;
            top: 50%;
            transform: translateY(-50%);
            width : 71px;
            height : 71px;
            border: none;
            border-radius: 100%;
            background: rgba(0,0,0,.5);
        }
        
        .visual button:before{
            font-family: 'xeicon';
            color: #fff;
            font-size : 45px;
        }
        
        .visual button.slick-prev {
            left: 50px;
            font-size : 0;
            color : transparent;
		
        }
        
        .visual button.slick-prev::before{
            content:"\e93d";
            font-family: 'xeicon';
        }
		
        .visual button.slick-next{
            right: 50px;
            font-size : 0;
            color : transparent;
        }
		
        .visual button.slick-next::before{
            content:"\e940";
            font-family: 'xeicon';
        }
		
        .visual div p {
            position : absolute;
     	  	 top: 35%;
           	left: 30%;
            font-size: 60px;
            font-weight: bolder;
            color : black;
        }
       	
        .visual div p label {
            font-weight: bolder;
			font-size : 30px;
        }
        
        .slick-list{
        	width: 100%;
        }
        
        #choosePer {
        	border: 1.5px solid #40a4b6;
        }
        
        #lastPrice {
        	text-align:right; 
        	float:right;
        	font-size:30px; 
        	color:#40a4b6;
        	border: 0px;
        	outline: 0px;
        }
        
        #realPays {
        	float:right;
        	color:#40a4b6;
        	font-size:30px;
        }
        
    </style>
</head>
<body>
	<header><%@ include file="../common/header.jsp"%></header>
		<%
		if(userStatus == 0 || loginUser == null || !loginUser.getmStatus().equals("Y")){
			response.sendRedirect(request.getContextPath() + "/views/member/loginForm.jsp");
		} else{
		
		%>
	<br><br>
	<section>
	<div style="width:75%; margin-left:auto; margin-right:auto;">

	<%-- <input type="hidden" name="spaceNo" value="<%= si.getSpaceNo()%>"> --%>
	
	<!-- 공간명 / 가격 -->
	<table>
		<tr>
			<td id="title">
				<p style="color:#40a4b6;  font-weight: bolder; margin-top:0; font-size:30px;"><%= si.getSpaceName() %></p>
				<input type="hidden" value=5 name="officeNo">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td id="price" style="color:#c4c4c4; font-size:25px;">
				<% if (si.getDayPay() == 0) { %>
					월 / <%= si.getMonthPay() %>원
				<% } else if (si.getMonthPay() == 0) { %>
					일 / <%= si.getDayPay() %>원
				<% } else if (si.getDayPay() != 0 && si.getMonthPay() != 0) { %>
					일 <%= si.getDayPay() %>원 / 월 <%= si.getMonthPay() %>원
				<% } %>
			</td>
		<tr>
	</table>
	<br><br>
	
	<!-- 사진 가운데정렬 -->
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<div class="visual">

			<% for (Image i : imgList) { 
				String url = request.getContextPath()+i.getFilePath()+ "/" +  i.getChangeName();
			
				System.out.println(url);
			%>
				<div style="background-image: url(<%=url%>); display:block; width:500px; height:700px; background-repeat:no-repeat; background-size:cover;"></div>
			<% } %>
		</div>
	<br><br>
	
	<!-- 공간 소개 창 --> 
	<div align="center">
		<div id="spaceIntroInfo" style="border-radius:10px; width:700px; background:white; border:3px solid lightgray; text-align:left; padding:20px;">
			<%= si.getSpaceIntro() %>
		</div>
	</div>
	<Br><br>

	
	<!-- 운영시간 -->
	<p id="opTime" style="color:#40a4b6; font-size:20px;"><b>
		운영시간
	</b></p>
		
		<table id="opTimeTb" style="border-spacing:15px;">
			<tr>
				<td id="mon" style="padding:10px;"><b>월 </b><%= si.getStartTimes()[0] %> ~ <%= si.getEndTimes()[0] %></td>
				<td id="sat" style="padding:10px;"><span style="color:blue;"><b>토 </b></span><%= si.getStartTimes()[5] %> ~ <%= si.getEndTimes()[5] %></td>
			</tr>
			<tr>
				<td id="tue" style="padding:10px;"><b>화 </b><%= si.getStartTimes()[1] %> ~ <%= si.getEndTimes()[1] %></td>
				<td id="sun" style="padding:10px;"><span style="color:red;"><b>일 </b></span><%= si.getStartTimes()[6] %> ~ <%= si.getEndTimes()[6] %></td>
			</tr>
			<tr>
				<td id="wed" style="padding:10px;"><b>수 </b><%= si.getStartTimes()[2] %> ~ <%= si.getEndTimes()[2] %></td>
				<td style="padding:10px;"></td>
			</tr>
			<tr>
				<td id="thu" style="padding:10px;"><b>목 </b><%= si.getStartTimes()[3] %> ~ <%= si.getEndTimes()[3] %></td>
				<td style="padding:10px;"></td>
			</tr>
			<tr>
				<td id="fri" style="padding:10px;"><b>금 </b><%= si.getStartTimes()[4] %> ~ <%= si.getEndTimes()[4] %></td>
				<td style="padding:10px;"></td>
			</tr>
		</table>
		<br>
		
		<!-- 공간 주소 / 공간 유형 / 예약가능인원 / 예약일정설정 -->
		<table id="plusTb" align="center" width="800">
			<tr>
				<td id="add" width="180px;" height="50px;" style="color:#40a4b6; font-size:20px;"><b>공간주소</b></td>
				<td id="addInfo"><%= si.getSpaceAddress() %></td>
			</tr>
			<tr>
				<td id="spaceType" width="180px;" height="50px;" style="color:#40a4b6; font-size:20px;"><b>공간 유형</b></td>
				<td id="spaceTypeInfo">
					<% if (si.getSpaceKind() == 1) { %>
						독립오피스
					<% } else if (si.getSpaceKind() == 2) { %>
						코워킹스페이스
					<% } %>
				</td>
			</tr>
			<tr>
				<td id="accPer" width="180px;" height="50px;" style="color:#40a4b6; font-size:20px;"><b>예약 가능 인원</b></td>
				<td id="accPerInfo"><%= si.getMaxReserv() %></td>
			</tr>
		</table>
		<br><br>
		
		<form id="insertReservation" action="<%= request.getContextPath()%>/insertReservationInfo" method="post">
		
		<!-- 날짜 ~부터 ~까지 -->
		<table align="center" width="800">
			<tr>
				<td style="color:#40a4b6; font-size:20px; width:200px;"><b>예약 일정 설정</b></td>
				<td style="width:400px;" colspan="2"><input id="date1" name="startDate" style="border: 1.5px solid #40a4b6;" type="date"> 부터</td>
				<td style="width:400px;"><input id="date2" name="endDate" style="border: 1.5px solid #40a4b6;" type="date"> 까지</td>
			</tr>
		</table>
		<br><br>
		
		<!-- 예약 인원 선택 -->
		<table align="center" width="800">
			<tr>
				<td style="color:#40a4b6; font-size:20px; width:200px;"><b>예약 인원 선택</b></td>
				<td style="width:200px;" colspan="2"><input type="number" onclick="this.select();" id="choosePer" value="1" min="1" name="reservPersonCount"></td>
				<td style="width:400px;">명</td>
			</tr>
		</table>
		<br><br>
		
		<!-- 코워킹스페이스/독립오피스일경우 자유석지정석 호실 선택하는거 -->
		<table align="center" width="800">
			<tr>
				<% if (si.getSpaceKind() == 1) { %>
					<!-- 독립오피스 호실 가져오기 -->
					<td style="color:#40a4b6; font-size:20px; width:200px;"><b>호실</b></td>
					<td>
						<select name="officeNo" style="width:175px; border: 1.5px solid #40a4b6;">
							<% for (int i = 0; i < si.getOfficeNo().length; i++) { %>
								<option value="<%= si.getOfficeNo()[i]%>"><%= si.getOfficeNo()[i] %></option>
							<% } %>
						</select>
					</td>
				<% } else if (si.getSpaceKind() == 2) { %>
					<!-- 코워킹스페이스 또 if문 돌려야함 -->
					<td style="color:#40a4b6; font-size:20px; width:200px;"><b>좌석</b></td>
					<% if (si.getUnfixSeat() > 0 && si.getFixSeat() > 0) { %>
						<td>
							<input type="radio" id="rdBtn1" value="F" name="seat" checked><label for="rdBtn1">지정석</label>
							<input type="radio" id="rdBtn2" value="U" name="seat"><label for="rdBtn2">자유석</label>
						</td>
					<% } else if (si.getUnfixSeat() == 0) { %>
						<td>
							지정석<input type="hidden" name="seat" value="F">
						</td>
					<% } else if (si.getFixSeat() == 0) { %>
						<td>
							자유석<input type="hidden" name="seat" value="U">
						</td>
					<% } %>
				<% } %>
			</tr>
		</table>
		<br><br>
		
		<!-- 예약자 정보 -->
		<table align="center" width="800px">
			<tr>
				<td style="color:#40a4b6; font-size:20px; width:200px; height:50px;"><b>예약자 정보</b></td>
				<td width="150px"><b >예약자명</b></td>
				<td id="reserName" width="200px"><input style="border: 1.5px solid #40a4b6;" type="text" id="reserNm" name="reservName" value="<%= loginUser.getmName() %>" readonly></td>
				<td width="200px"></td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td width="150px"><b>사용자명</b></td>
				<td id="userName"><input style="border: 1.5px solid #40a4b6;" type="text" placeholder="사용자명을 입력하세요" id="userNm" name="userName"></td>
				<td><label for="reserSame"><input type="checkbox" id="reserSame">예약자와 동일</label></td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td width="150px"><b>연락처</b></td>
				<td id="tel"><input  style="border: 1.5px solid #40a4b6;"type="tel" name="userPhone"></td>
				<td></td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td width="150px"><b>이메일</b></td>
				<td id="email"><input  style="border: 1.5px solid #40a4b6;"type="email" name="userEmail"></td>
				<td></td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td width="150px"><b>요청사항</b></td>
				<td id="request"><textarea cols="30" rows="10" style="resize:none; border: 1.5px solid #40a4b6;" placeholder="요청사항을 입력하세요" name="requestContent"></textarea></td>
				<td></td>
			</tr>
		</table>
		<br><br>
		
		<!-- 호스트 정보 -->
		<table align="center" width="800px">
			<tr>
				<td style="color:#40a4b6; font-size:20px; width:200px; height:50px;"><b>호스트 정보</b></td>
				<td width="110px"><b>상호명</b></td>
				<td id="storeNm">
					<% if (si.getBsnsName() == null || si.getBsnsName() == "") { %>
						-
					<% } else { %>
						<%= si.getBsnsName() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td id="chairmanNm" width="110px"><b>대표자명</b></td>
				<td>
					<% if (si.getRepresentName() == null || si.getRepresentName() == "") { %>
						-
					<% } else { %>
						<%= si.getRepresentName() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td width="110px"><b>소재지</b></td>
				<td id="address">
					<% if (si.getBsnsAddress() == null || si.getBsnsAddress() == "") { %>
						-
					<% } else { %>
						<%= si.getBsnsAddress() %>
					<% } %>
				</td>
			</tr>
			<tr>
				<td width="200px" height="50px"></td>
				<td width="110px"><b>사업자번호</b></td>
				<td id="busOpNum">
					<% if (si.getBsnsLicenseNo() == null || si.getBsnsLicenseNo() == "") { %>
						-
					<% } else { %>
						<%= si.getBsnsLicenseNo() %>
					<% } %>
				</td>
			</tr>
			<tr> 
				<td width="200px" height="50px"></td>
				<td width="110px"><b>연락처</b></td>
				<td id="comm">
					<% if ((si.getCalPhone() == null && si.getCalEmail() == null) || (si.getCalPhone() == "" && si.getCalEmail() == "")) { %>
						-
					<% } else { %>
						<%= si.getCalPhone() %> / <%= si.getCalEmail() %>
					<% } %>
				</td>
			</tr>
		</table>
		<br><br>
		
		<!-- 환불 정책 -->
		<table align="center" width="800px">
			<tr>
				<td style="color:#40a4b6; font-size:20px; width:200px; height:50px;"><b>환불 정책</b></td>
				<td id="8ago" width="200px"><b>이용 8일 전</b></td>
				<td id="8agoInfo"><%= (int)si.getSpaceRefundPolicy()[8] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="7ago" width="200px"><b>이용 7일 전</b></td>
				<td id="7agoInfo"><%= (int)si.getSpaceRefundPolicy()[7] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="6ago" width="200px"><b>이용 6일 전</b></td>
				<td id="6agoInfo"><%= (int)si.getSpaceRefundPolicy()[6] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="5ago" width="200px"><b>이용 5일 전</b></td>
				<td id="5agoInfo"><%= (int)si.getSpaceRefundPolicy()[5] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="4ago" width="200px"><b>이용 4일 전</b></td>
				<td id="4agoInfo"><%= (int)si.getSpaceRefundPolicy()[4] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="3ago" width="200px"><b>이용 3일 전</b></td>
				<td id="3agoInfo"><%= (int)si.getSpaceRefundPolicy()[3] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="2ago" width="200px"><b>이용 2일 전</b></td>
				<td id="2agoInfo"><%= (int)si.getSpaceRefundPolicy()[2] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="1ago" width="200px"><b>이용 1일 전</b></td>
				<td id="1agoInfo"><%= (int)si.getSpaceRefundPolicy()[1] %> %</td>
			</tr>
			<tr>
				<td height="50px"></td>
				<td id="dday" width="200px"><b>이용 당일</b></td>
				<td id="ddayInfo" style="color:red;"><%= (int)si.getSpaceRefundPolicy()[0] %> %</td>
			</tr>
		</table>
		<br><br>
		
		<!-- 예약결과, 서비스 동의 -->
		<div align="center">
			<div style="border-radius:10px; width:700px; height:600px; background:white; border:3px solid lightgray;">
				
				<!-- 예약결과 -->
				<table width="650">
					<tr>
						<td style="color:#40a4b6; font-size:20px; width:150px; height:50px;"><b>예약 결과</b></td>
						<td><b>예약 날짜</b></td>
						<td id="stDate" style="text-align:center;">----년 --월 --일 부터</td>
						<td id="finDate" style="text-align:center;">----년 --월 --일 까지</td>
					</tr>
					<tr>
						<td width="150px" height="50px"></td>
						<td><b>예약 인원</b></td>
						<td  style="text-align:center;"><p id="reserPerCount">1</p></td>
						<td style="text-align:left;">명</td>
					</tr>
					<tr>
						<td width="150px" height="50px"></td>
						<td></td>
						<td id="priceInfo" colspan="2" style="text-align:right; font-size:20px; color:gray;">
							<% if (si.getDayPay() == 0) { %>
								월 / <%= si.getMonthPay() %>원
							<% } else if (si.getMonthPay() == 0) { %>
								일 / <%= si.getDayPay() %>원
							<% } else if (si.getDayPay() != 0 && si.getMonthPay() != 0) { %>
								일 <%= si.getDayPay() %>원 / 월 <%= si.getMonthPay() %>원
							<% } %>
						</td>
					</tr>
					<tr>
						<td width="150px" height="50px"></td>
						<td></td>
						<td colspan="2" id="reservPay" style=" "><input type="text" id="lastPrice"  value=
							"<% if (si.getDayPay() == 0) { %>
								<%= si.getMonthPay() %>
							<% } else if (si.getMonthPay() == 0) { %>
								<%= si.getDayPay() %>
							<% } %>" readonly>
							</td>
					</tr>
					<tr>
						<td width="150px" height="50px"></td>
						<td style="float:right;"></td>
						<td colspan="2" style="text-align:right; font-size:15px; color:#c4c4c4;">VAT 포함 가격</td>
					</tr>
				</table>
				<br>
				
				<!-- 서비스 동의 -->
				<table width="650">
					<tr>
						<td style="color:#40a4b6; font-size:20px; width:150px; height:50px;"><b>서비스 동의</b></td>
						<td id="agreeAll"><label for="allAgr"><input type="checkbox" id="allAgr"><b>전체 동의</b></label></td>
					</tr>
					<tr>
						<td height="50px"></td>
						<td id="agree1"><label for="agr1"><input type="checkbox" id="agr1">위 공간의 예약조건 확인 및 결제 진행 동의</label></td>
					</tr>
					<tr>
						<td height="50px"></td>
						<td id="agree2"><label for="agr2"><input type="checkbox" id="agr2">환불 정책 안내에 대한 동의</label></td>
					</tr>
					<tr>
						<td height="50px"></td>
						<td id="agree3"><label for="agr3"><input type="checkbox" id="agr3">개인정보 제3자 제공 동의</label></td>
					</tr>
					<tr>
						<td height="50px"></td>
						<td id="agree4"><label for="agr4"><input type="checkbox" id="agr4">개인정보 수집 및 이용 동의</label></td>
				</table>
			</div>
			<input type="hidden" id="realPayment" name="expectPay">
		</form>
		</div>
		</section>
		<br><br>
		
		<!-- 예약 버튼 -->
		<div align="center">
			<button id="reserBtn" onclick="push();" style="color:white; background:#40a4b6; width:120px; height:50px; font-size:20px; border:0; border-radius:10px; cursor:pointer;">예약 하기</button>
		</div>
		
		
		<% } %>
		
		
		<br><br><br>
	<footer><%@ include file="../common/footer.jsp" %></footer>

	<script>
	 
		//인원 선택한거 예약결과에 보여지게 하기
		$("#choosePer").change(function(){
			var chooseMem = $("#choosePer").val();
			$('#reserPerCount').text(chooseMem);
		});
		
		
		//날짜1 예약결과에 보여지게 하기
		$("#date1").change(function(){
			var date1 = $("#date1").val() + " 부터";
			$("#stDate").text(date1);
		});
		
		
		//날짜2 예약결과에 보여지게 하기
		$("#date2").change(function(){
			var date2 = $("#date2").val() + " 까지";
			$("#finDate").text(date2);
		});
		
		
		//'예약자와 동일' 체크 시 사용자명 텍스트박스에 예약자명에 입력된 값 가져오기
		$(document).ready(function(){
			$("#reserSame").click(function(){
				if($("#reserSame").prop("checked")) {
					var reserNmVal = $("#reserNm").val();
					$("#userNm").val(reserNmVal);
				} else {
					$("#userNm").val("");
				}
			});
		});
		
		
		//전체동의 버튼 눌렀을 때 밑에 체크항목들도 다 체크되는 것
		$(document).ready(function(){
			$("#allAgr").click(function(){
				if($("#allAgr").prop("checked")) {
					$("#agr1").prop("checked", true);
					$("#agr2").prop("checked", true);
					$("#agr3").prop("checked", true);
					$("#agr4").prop("checked", true);
				} else {
					$("#agr1").prop("checked", false);
					$("#agr2").prop("checked", false);
					$("#agr3").prop("checked", false);
					$("#agr4").prop("checked", false);
				}
			});
			
			
		});
		
		
		//동의사항 네개 체크안하면 다음으로 못넘어가게 하기
		//입력 안한 칸 있으면 못넘어가게 하기
		
		//결제버튼 눌렀을때	
		function push() {
		
			$("#insertReservation").submit();
		};
		
		
		//공간사진 슬라이드
		$('.visual').slick({
			  infinite: true,
			  speed: 500,
			  fade: true,
			  cssEase: 'linear',
			  autoplay: true,
			  autoplaySpeed: 2000,
		});
		var personCount = 1;
	
		var monthPay = parseInt("<%=si.getMonthPay()%>");
		var dayPay = parseInt("<%=si.getDayPay()%>");
		
		var realPay;
			
			
	
		$('#choosePer').change(function(){
		 
			personCount  = parseInt($('#choosePer').val());
			var startDate = $('#date1').val();
			var endDate = $('#date2').val();
			var ar1 = startDate.split('-');
		    var ar2 = endDate.split('-');
		    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
		    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
			var howlongDays =(Math.ceil((da2-da1)/(1000*3600*24))) + 1;
			console.log(startDate);
			console.log(endDate);
			console.log(personCount);
			console.log(dayPay);
			console.log(monthPay);
			console.log(howlongDays);
	
		
		 if(howlongDays % 30 == 0){
			 realPay = personCount *monthPay*(howlongDays/30);
		 }else{
			 realPay = personCount * dayPay * howlongDays;
		 }
		console.log('realpay :'+realPay);
	
		 $('#reservPay').html('<p id="realPays" >'+realPay+'원'+ '</p>');
		 $('#realPayment').val(realPay);
			
		});
		
	</script>
	
</body>
</html>















