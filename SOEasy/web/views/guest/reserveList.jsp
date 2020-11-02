<%@page import="com.kh.login.host.manageReserve.model.vo.PaymentRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* ,com.kh.login.guest.model.vo.*, com.kh.login.host.manageReserve.model.vo.PageInfo, java.text.SimpleDateFormat" %>
<!DOCTYPE html>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">

<meta charset="UTF-8">
<style>
#wrapper {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

#wrapper select {
	float: right;
}

th {
	background: #E4EEFA;
	width: 8%;
	font-size: 17px;
	font-weight: bolder;
	clear: both;
}

.pCompleteInfo td {
	text-align: center;
	height: 30px;
	background: #fff;
}

.pCompleteInfo td a {
	text-decoration: none;
	color: black;
	font-size: 15px;
	font-weight: bolder;
}

#wrapper h1 {
	font-size: 30px;
	font-weight: bolder;
}

.pCompleteInfo td label {
	
	font-size: 15px;
	font-weight: bolder;
	padding: 5px;
}

.cancle {

	background: orangered;
	border-radius: 10px;
	color: white;
	outline: none;
	border: none;
}

.pCompleteInfo td:last-child {
	width: 3%;
	background: transparent;
}
</style>
<title>SO Easy</title>
</head>
<body>
	<header><%@ include file="../../views/common/header.jsp" %></header>
	
	
	<%if ( loginUser==null || !loginUser.getmStatus().equals("Y")) {
		request.setAttribute("msg", "잘못된 경로입니다.");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	}else{
		ArrayList<ReserveHistory> reserveList = (ArrayList<ReserveHistory>) request.getAttribute("reserveList");
		String msg = (String) request.getAttribute("msg");
		PageInfo pi = (PageInfo) request.getAttribute("pi");
		String url = (String) request.getAttribute("url");
		String root = (String) request.getAttribute("root");
		String userName  = (String)request.getAttribute("userName");
		int memberNo = (int)request.getAttribute("memberNo");

		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		ArrayList<String> acceptTypeArr = new ArrayList<String>();
		ArrayList<String> reserveStatusArr = new ArrayList<String>();
		ArrayList<String> payStatusArr = new ArrayList<>();
		ArrayList<String> seatTypeArr = new ArrayList<>();
		ArrayList<String> startUseArr = new ArrayList<>();
		ArrayList<String> endUseArr = new ArrayList<>();
		ArrayList<String> hasReviewArr = new ArrayList<>();
		ArrayList<String> reserveDate = new ArrayList<>();
		ArrayList<String> spaceTypeArr = new ArrayList<>();

		for (ReserveHistory rh : reserveList) {
			switch (rh.getAcceptStatus()) {
			case 1:
				acceptTypeArr.add("승인필요");
				break;
			case 2:
				acceptTypeArr.add("승인완료");
				break;
			case 3:
				acceptTypeArr.add("바로예약");
				break;
			case 4:
				acceptTypeArr.add("예약거절");
				break;
			}

			switch (rh.getPayStatus()) {
			case -1:
				payStatusArr.add("결제대기");
				break;
			case 1:
				payStatusArr.add("결제완료");
				break;
			case 2:
				payStatusArr.add("호스트취소");
				break;
			case 3:
				payStatusArr.add("본인취소");
				break;
			}
			if(rh.getSeatType() == null){
				seatTypeArr.add("");
			} else {
				switch (rh.getSeatType()) {
				case "U":
					seatTypeArr.add("자유석");
					break;
				case "F":
					seatTypeArr.add("지정석");
					break;
				}
			}

			switch (rh.getSpaceType()) {
			case 1:
				spaceTypeArr.add("독립오피스");
				break;
			case 2:
				spaceTypeArr.add("코워킹스페이스");
				break;
			}

			startUseArr.add(rh.getStartUse().toString());
			endUseArr.add(rh.getEndUse().toString());
			reserveDate.add(rh.getReserveDate().toString());

			String startDate = rh.getStartUse().toString();
			String endDate = rh.getEndUse().toString();
			
			
			SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
			Date time = new Date();
			String today = format1.format(time);
			Date startDates = format1.parse(startDate);
			Date endDates = format1.parse(endDate);
			Date todays = format1.parse(today);
		 	long nowUse = (startDates.getTime() - todays.getTime()) / (24*60*60*1000);
		 	long useEnd  =(endDates.getTime() - todays.getTime())/(24*60*50*1000);
		 	int reserveStatus = rh.getAcceptStatus();
			int payStatus = rh.getPayStatus();
		 	if (reserveStatus == 1 || reserveStatus == 4 || payStatus == -1 || payStatus == 2 || payStatus == 3) {
				reserveStatusArr.add("결제미완료");
			}
		 	else{
		 	if(rh.getReserveStatus()==2){
		 		reserveStatusArr.add("예약취소");
		 	}else{
		 	
		 	if(nowUse<0){
		 		if(useEnd>0){
		 			reserveStatusArr.add("사용중");
		 		}else{
		 			reserveStatusArr.add("사용완료");
		 		}
		 	}else{
		 		
			
					reserveStatusArr.add("사용전");
				
		 	}
		 	
			
		 	}
		 	}
			
			switch (rh.getHasReview()) {
			case "WAIT":
				hasReviewArr.add("작성대기");
				break;
			case "ABLE":
				hasReviewArr.add("작성가능");
				break;
			case "COMP":
				hasReviewArr.add("작성완료");
				break;
			} 

		}
	%>
	<nav><%@ include file="../../views/common/aside.jsp" %>
		<div class="colMenu">
			<label class="colMenuTitle">예약 목록</label>
			 <a class="colMenuButton selectedButton" href="/login/views/guest/reserveList.jsp">예약 내역 리스트</a>
			 <a class="colMenuButton" href="/login/views/guest/pick.jsp">찜 리스트</a>
			 <a class="colMenuButton" href="/login/views/guest/myReview.jsp">리뷰 목록</a>
			 <br><br>
		</div>
		<hr style="margin: 0">
	</nav>
	<section>
		<br>
		<div id="wrapper">
		<br>
		<h1 style="margin : 0;"><%=userName+"님의 " +msg %></h1>
		<br><br>
		<table align="center"  style="margin:0; width:100%;"  >
				<tr>
					<th height="40px">공간명</th>
					<th height="40px">공간종류</th>
					<th height="40px">사용 시작 날짜</th>
					<th height="40px">사용 종료 날짜</th>
					<th height="40px">예약 인원</th>
					<th height="40px">결제 금액</th>
					<th height="40px">결제 수단</th>
					<th height="40px">결제 여부</th>
					<th height="40px">승인 처리 여부</th>
					<th height="40px">예약 상태</th>
					<th height="40px">나의 후기</th>
				</tr>
				<%for(int i=0; i<reserveList.size(); i++) {%>
				<tr class="pCompleteInfo">
					<td style="font-size:13px;" class="spaceNames"><%=reserveList.get(i).getSpaceName() %></td>
					<td><%=spaceTypeArr.get(i) %></td>
					<td><%=startUseArr.get(i)%></td>
					<td><%=endUseArr.get(i)%> </td>
					<td><%=reserveList.get(i).getPersonCount()%></td>
					<td class="spaceCharge"><%=reserveList.get(i).getCharge()%></td>
					<td><%=reserveList.get(i).getPayMethod() %>
						
					</td>
					<td><label class="payProgress"></label></td>
					<td><label class="agreeProgress"></label></td>
					<td class="reserveSpace"><label class="reserveStatus"></label><input type="hidden" class="reserveNumber" value=<%=reserveList.get(i).getReserveNo() %>></td>
					<td><p  class="reviewExistance" style="margin : 0"></p></td>
					<td class="cancleZone"><button type="button" class="cancle" >취소</button></td>
				</tr>
				
			
		<script>
		$(document).ready(function(){
		
			var pNum = "<%=payStatusArr.get(i)%>"
			switch(pNum){
			case "결제대기": $('.payProgress:nth(<%=i%>)').text(pNum).css({bordercolor:"none", color:"blue"}); break;
			case "결제완료": $('.payProgress:nth(<%=i%>)').text(pNum).css({bordercolor:"none", color:"red"}); break;
			case "호스트취소": $('.payProgress:nth(<%=i%>)').text(pNum).css({bordercolor:"none", color:"purple"}); break;
			case "본인취소": $('.payProgress:nth(<%=i%>)').text(pNum).css({bordercolor:"none", color:"gray"}); break;
			}
			var aNum = "<%=acceptTypeArr.get(i)%>"
			switch(aNum){
			case "승인필요": $('.agreeProgress:nth(<%=i%>)').text(aNum).css({bordercolor:"none", color:"blue"}); break;
			case "승인완료": $('.agreeProgress:nth(<%=i%>)').text(aNum).css({bordercolor:"green", color:"green"}); break;
			case "바로예약": $('.agreeProgress:nth(<%=i%>)').text(aNum).css({bordercolor:"gray", color:"gray"}); break;
			case "예약거절": $('.agreeProgress:nth(<%=i%>)').text(aNum).css({bordercolor:"red", color:"red"}); break;
			
			}
			var rNum = "<%=reserveStatusArr.get(i)%>"
			switch(rNum){
			case "사용전": $('.reserveStatus:nth(<%=i%>)').text(rNum).css({bordercolor:"blue", color:"blue"}); break;
			case "예약취소": $('.reserveStatus:nth(<%=i%>)').text(rNum).css({bordercolor:"red", color:"red"}); break;
			case "사용중": $('.reserveStatus:nth(<%=i%>)').text(rNum).css({bordercolor:"gray", color:"gray"}); break;
			case "사용완료": $('.reserveStatus:nth(<%=i%>)').text(rNum).css({bordercolor:"purple", color:"purple"}); break;
			case "결제미완료": $('.reserveStatus:nth(<%=i%>)').text(rNum).css({bordercolor:"brown", color:"brown"}); break;
			}
			
			var rvNum = "<%=hasReviewArr.get(i)%>"
			console.log(rvNum);
			switch(rvNum){
			case "작성대기": $('.reviewExistance:nth(<%=i%>)').text("-"); break;
			case "작성가능": $('.reviewExistance:nth(<%=i%>)').text("작성하기").addClass('popReview'); break;
			case "작성완료": $('.reviewExistance:nth(<%=i%>)').text("보러가기").css({color:"#3DB6AE"}).attr("onclick", "showMyReviews();"); break;
			
			}
			if((aNum=="승인완료" || aNum=="바로예약") && rNum=="사용전" &&pNum=="결제완료"){
				$('.cancle:nth(<%=i%>)').text("취소").removeClass('letsPay').show();				
			}else if(aNum=="승인완료"&& pNum =="결제대기" ){
				$('.cancle:nth(<%=i%>)').show().text("결제").addClass('letsPay');
			}else if(aNum=="승인완료" && rNum=="사용전" &&pNum =="결제대기"){
				$('.cancle:nth(<%=i%>)').show().text("예약취소").removeClass('letsPay').show();
			}else{
				$('.cancle:nth(<%=i%>)').hide();
			}
			
			
		});
		</script>
				<%
					}
				%>
		<script>
		var reserv={};
		</script>
		 <%	int reserveNum=0;
		 	for (int i=0; i<reserveStatusArr.size(); i++){
			switch(reserveStatusArr.get(i)){
			case "사용전": reserveNum=1; break; 
			case "예약취소": reserveNum=2; break; 
			case "사용중" : reserveNum=3; break;
			case "사용완료": reserveNum=4; break;
			case "결제미완료": reserveNum=5; break;
			}
		
		%> 
		<script>
		var hasReview = "<%=hasReviewArr.get(i)%>";
		var countLength = 0;
		if(hasReview != "COMP"){
		reserv['reserv<%=i%>'] = "<%=reserveNum%>";
		reserv['reservNo<%=i%>'] = "<%=reserveList.get(i).getReserveNo()%>";
		countLength++;	
		}
		</script>
		<%}%>
		
		
		

		
		
			</table>
			<form id="payInfo" action="<%=request.getContextPath()%>/payments/complete" method="post">
				<input type="hidden" id="amount" name="amount">
				<input type="hidden" id="payNo" name="payNo">
				<input type="hidden" id="reservNo" name="reserveNo">
				<input type="hidden" id="methodCode" name="methodCode">
			</form>
			
			<input type = "hidden" id= "hiddenSpaceName">
			<input type = "hidden" id= "hiddenSpaceNo">
		</div>
	</section>
	<% } %>
	<footer><%@ include file="../../views/common/footer.jsp" %></footer>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
	<script>
		$(function(){
			var userStatus =parseInt("<%=loginUser.getpType()%>");
		
			if(userStatus == 3){
				$('.cancleZone').hide();
				$('.letsPay').hide();
				$('.reviewExistance').hide();
			}
			var windowObj = null;
			$('.popReview').click(function(){
				
				console.log("작동됨");
			 	var spaceNames = $(this).parent().siblings('.spaceNames').text();
					
					console.log(spaceNames);
					$('#hiddenSpaceName').val(spaceNames); 
				 windowObj = window.open('<%=request.getContextPath()%>/views/space/reviewPop.jsp', 'window팝업', 'width=830px, height=500px, menubar=no, status=no, resizable=no, toolbar=no');  
			});
			
			
			
			reserv["length"] = countLength;	
			console.log(reserv);
			$.ajax({
				url : "<%=request.getContextPath()%>/updateRstatus",
				data : reserv,
				success: function(data){
					console.log(data);
				},
				error: function(data){
					console.log("실패!");
				}
			});
			
			IMP.init('imp14313139'); // 아임포트 관리자 페이지의 "시스템 설정" > "내 정보" 에서 확인 가능
			$('.letsPay').click(function(){
				var spaceName = $(this).parent().siblings('.spaceNames').text();
				var charge = $(this).parent().siblings('.spaceCharge').text();
				var reserveNum = $(this).parent().siblings('.reserveSpace').children('.reserveNumber').val();
				 
				console.log(spaceName);
				console.log(reserveNum);
				IMP.request_pay({
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : spaceName,
				    amount : charge/1000,
				    buyer_email : "<%=loginUser.getmEmail()%>",
				    buyer_name : "<%=loginUser.getmName()%>",
				    buyer_tel : "<%=loginUser.getmPhone()%>",
				}, function(rsp) {
					
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        msg += '결제 수단  :'+rsp.pay_method;
				       /*  $.ajax({
				        	url:"login/insertPayHistory",
				        	data: {payId : rsp.merchant_uid,
				        			payCharge : rsp.paid_amount,
				        			cardApplyNum : rsp.apply_num
				        	}
				        }); */
				        $('#amount').val(rsp.paid_amount);
				        $('#payNo').val(rsp.merchant_uid);
				        $('#methodCode').val(rsp.pay_method);
				        $('#reservNo').val(reserveNum); 
				        console.log(rsp.pay_method)
				        alert("결제가 완료 되었습니다 "+msg);
				        $('#payInfo').submit();
				      } else {
				        alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
				      }
				    });
				        
				   
				});
			
			});
			
			
				
		
		
	
		
	
		
	</script>
</body>
</html>