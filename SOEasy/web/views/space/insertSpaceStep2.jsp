<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.login.space.model.vo.*" %>
<%
	SpaceInfo si = (SpaceInfo) session.getAttribute("spaceInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SO Easy - 공간등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/layout.css">
<style>

	.space-insert tr td input[type=text]{
		width: 100%;
		word-break:break-all;
	}
	textarea{
		border: 1px solid black;
		border-radius: 10px;
		width: 100%;
		resize: none;
	}
	.warning{
		font-size: 10px;
		text-align: right;
		color: red;
		margin: 0;
		padding: 0;
	}
	.space-insert tr td {
		padding: 5px;
	}
	.text-limit{
		text-align: right;
	}
	input{
		height: 30px;
		border: 1px solid black;
		border-radius: 10px;
	}
	.refund-area input{
		text-align: center;
	}
	select {
		width: 100px;
		height: 33px;
		padding: .5em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('../../images/icon/arrow.jpg') no-repeat 95% 50%;
		border-radius: 10px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	
	select::-ms-expand {
	    display: none;
	}
	
	#optime-table tr td {
		text-align: center;
	}
</style>
</head>
<body>
	<header><%@ include file="../common/header.jsp"%></header>
	<%
		if(userStatus == 0 || loginUser==null){
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,response);
		}
	%>
	<nav><%@ include file="../common/aside.jsp"%></nav>
	<section>
		<div>
			<h1 align="center" style="margin:0;">가격 정보</h1>
			<br><br>
		</div>
		<form action="<%= request.getContextPath() %>/insertSpaceStep2" method="post">
			<table class="space-insert" align="center" width="70%">
				<tr>
					<td></td>
					<td></td>
					<td><pre style="text-align:right;">기본 가격은 VAT를 포함해야 합니다.</pre></td>
					<td></td>
				</tr>
				<tr>
					<td width="5%"></td>
					<td width="20%">단위별 예약 금액 *</td>
					<td width="40%" align="center">
						<fieldset>
							<table align="center" width="90%">
								<tr>
									<td width="30%">월 단위</td>
									<td width="60%">
										<input type="text" name="month-pay" size="30%" onclick="this.select();" style="text-align:center;">
									</td>
									<td>원</td>
								</tr>
								<tr>
									<td width="30%">일 단위</td>
									<td width="60%">
										<input type="text" name="day-pay" size="30%" onclick="this.select();" style="text-align:center;">
									</td>
									<td>원</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td width="5%"></td>
				</tr>
				<!-- <tr>
					<td></td>
					<td></td>
					<td align="right"><p class="text-limit" id="policy-limit">0 / 300</p></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>가격 정책</td>
					<td>
						<textarea rows="5" maxlength="300" name="policy-intro" id="policy-intro"></textarea>
					</td>
					<td></td>
				</tr> -->
				<tr>
					<td>
						
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr class="space-optime" id="space-optime">
					<td></td>
					<td style="vertical-align:top;"><br><br>운영 시간 *</td>
					<td>
						<fieldset>
							<br>
							<table id="optime-table" align="center" width="100%">
								<br>
								<tr>
									<td width="20%">월</td>
									<td width="30%">
										<input type="checkbox" name="mon-open-check" id="mon24hr" value="open" style="height:15px;"><label for="mon24hr"> 24시간</label>
										<input type="checkbox" name="mon-open-check" id="monclosed" value="closed" style="height:15px;"><label for="monclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="mon-open-check" value="open">
										<select name="mon-start-time" id="mon-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="mon-end-time" id="mon-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="10%">화</td>
									<td width="30%">
										<input type="checkbox" name="tue-open-check" id="tue24hr" value="open" style="height:15px;"><label for="tue24hr"> 24시간</label>
										<input type="checkbox" name="tue-open-check" id="tueclosed" value="closed" style="height:15px;"><label for="tueclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="tue-open-check" value="open">
										<select name="tue-start-time" id="tue-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="tue-end-time" id="tue-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="10%">수</td>
									<td width="30%">
										<input type="checkbox" name="wed-open-check" id="wed24hr" value="open" style="height:15px;"><label for="wed24hr"> 24시간</label>
										<input type="checkbox" name="wed-open-check" id="wedclosed" value="closed" style="height:15px;"><label for="wedclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="wed-open-check" value="open">
										<select name="wed-start-time" id="wed-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="wed-end-time" id="wed-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="10%">목</td>
									<td width="30%">
										<input type="checkbox" name="thu-open-check" id="thu24hr" value="open" style="height:15px;"><label for="thu24hr"> 24시간</label>
										<input type="checkbox" name="thu-open-check" id="thuclosed" value="closed" style="height:15px;"><label for="thuclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="thu-open-check" value="open">
										<select name="thu-start-time" id="thu-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="thu-end-time" id="thu-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="10%">금</td>
									<td width="30%">
										<input type="checkbox" name="fri-open-check" id="fri24hr" value="open" style="height:15px;"><label for="fri24hr"> 24시간</label>
										<input type="checkbox" name="fri-open-check" id="friclosed" value="closed" style="height:15px;"><label for="friclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="fri-open-check" value="open">
										<select name="fri-start-time" id="fri-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="fri-end-time" id="fri-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="10%">토</td>
									<td width="30%">
										<input type="checkbox" name="sat-open-check" id="sat24hr" value="open" style="height:15px;"><label for="sat24hr"> 24시간</label>
										<input type="checkbox" name="sat-open-check" id="satclosed" value="closed" style="height:15px;"><label for="satclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="sat-open-check" value="open">
										<select name="sat-start-time" id="sat-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="sat-end-time" id="sat-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="10%">일</td>
									<td width="30%">
										<input type="checkbox" name="sun-open-check" id="sun24hr" value="open" style="height:15px;"><label for="sun24hr"> 24시간</label>
										<input type="checkbox" name="sun-open-check" id="sunclosed" value="closed" style="height:15px;"><label for="sunclosed"> 휴무</label>
									</td>
									<td width="60%">
										<input type="hidden" name="sun-open-check" value="open">
										<select name="sun-start-time" id="sun-start-time">
											<option value="00" selected>00:00</option>
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
										</select>
										&nbsp;~&nbsp;
										<select name="sun-end-time" id="sun-end-time">
											<option value="01">01:00</option>
											<option value="02">02:00</option>
											<option value="03">03:00</option>
											<option value="04">04:00</option>
											<option value="05">05:00</option>
											<option value="06">06:00</option>
											<option value="07">07:00</option>
											<option value="08">08:00</option>
											<option value="09">09:00</option>
											<option value="10">10:00</option>
											<option value="11">11:00</option>
											<option value="12">12:00</option>
											<option value="13">13:00</option>
											<option value="14">14:00</option>
											<option value="15">15:00</option>
											<option value="16">16:00</option>
											<option value="17">17:00</option>
											<option value="18">18:00</option>
											<option value="19">19:00</option>
											<option value="20">20:00</option>
											<option value="21">21:00</option>
											<option value="22">22:00</option>
											<option value="23">23:00</option>
											<option value="24" selected>24:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr class="refund-area" id="refund-area">
					<td></td>
					<td style="vertical-align:top;"><br><br>환불 기준 *</td>
					<td>
						<fieldset>
							<br>
							<table align="center" width="80%">
								<tr>
									<td width="30%">8일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day8-rate" id="day8-rate" size="30%" value="100" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">7일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day7-rate" id="day7-rate" size="30%" value="100" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">6일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day6-rate" id="day6-rate" size="30%" value="90" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">5일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day5-rate" id="day5-rate" size="30%" value="90" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">4일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day4-rate" id="day4-rate" size="30%" value="90" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">3일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day3-rate" id="day3-rate" size="30%" value="80" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">2일 전</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day2-rate" id="day2-rate" size="30%" value="80" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">예약 전일</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day1-rate" id="day1-rate" size="30%" value="80" readonly>
									</td>
									<td width="10%">%</td>
								</tr>
								<tr>
									<td width="30%">예약 당일</td>
									<td width="60%">
										<input type="text" class="refund-input" name="day0-rate" id="day0-rate" size="30%" value="환불 불가" readonly>
									</td>
									<td width="10%"></td>
								</tr>
							</table>
							<div class="check-area">
								<table>
									<tr>
										<td width="50%"></td>
										<td><input type="checkbox" name="refund-policy" id="soeasy" value="soeasy" checked><label for="soeasy">SOEasy 환불정책</label></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="checkbox" name="refund-policy" id="personal" value="personal"><label for="personal">직접 입력</label></td>
									</tr>
								</table>
							</div>
						</fieldset>
					</td>
					<td></td>
				</tr>
			</table>
			<div class="btnArea" align="center">
				<br><br><br><br><br><br>
				<button type="button" onclick="callBack();">이전으로</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="gonext">다음으로</button>
				<br><br><br><br><br><br>
			</div>
		</form>
	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
	<script>
	
		var checkUnload = true;
	    $(window).on("beforeunload", function(){
	        if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다."
	    });

		$("#gonext").click(function(){
			checkUnload = false;
			$("form").submit();
		});
		
		$(function(){
			$(".warning").show();
		});
		//가격 정책 입력시 글자 수 표시
		/* $("#policy-intro").on("keyup", function(){
			var si = $("#policy-intro").val();
			var len = si.length;
			var maxlen = 300;
			$("#policy-limit").text(len + " / " + maxlen);
		}).on("keypress", function(){
			var si = $("#policy-intro").val();
			var len = si.length;
			var maxlen = 300;
			$("#policy-limit").text(len + " / " + maxlen)
		}); */
		
		//환불정책 선택
		$("#soeasy").click(function() {
			
			if($("#soeasy").is("checked") == true){
				$("#soeasy").prop("checked", true);
			} else {
				$("#soeasy").prop("checked", true);
				$("#personal").prop("checked", false);
				$("#day8-rate").val(100).prop("readonly", true);
				$("#day7-rate").val(100).prop("readonly", true);
				$("#day6-rate").val(90).prop("readonly", true);
				$("#day5-rate").val(90).prop("readonly", true);
				$("#day4-rate").val(90).prop("readonly", true);
				$("#day3-rate").val(80).prop("readonly", true);
				$("#day2-rate").val(80).prop("readonly", true);
				$("#day1-rate").val(80).prop("readonly", true);
			}
		});
		
		
		$("#personal").click(function() {
			$(".refund-input").prop("readonly", false);
			if($("#personal").is("checked") == true){
				$("#personal").prop("checked", true);
			} else {
				$("#personal").prop("checked", true);
				$(".refund-input").prop("readonly", false);
				$("#soeasy").prop("checked", false);
			}
		});
		
		$(".refund-input").on("keyup", function(){
			var test = RegExp(/[0-9]$/);
			var rate = $(this).val();
			if(!test.test(rate) || rate < 0 || rate > 100){
				alert("0부터 100사이 값만 입력하실 수 있습니다.");
				$(this).val("");
			}
		});
		
		$("#mon24hr").is(":checked", function(){
			$("#mon-start-time option[value=00]").prop("selected", true);
		});
		
	</script>
</body>
</html>