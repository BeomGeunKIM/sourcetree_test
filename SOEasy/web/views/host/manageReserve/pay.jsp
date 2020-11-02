<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn1 {
	background: #3DB6AE;
	width: 60px;
	height: 20px;
	border-radius:5px;
	color: white;
	font-weight: border;
	border-color: #ECECEC38;
	padding:1px;
}
.span5 {
	 border:1px solid #3DB6AE;
	 background:#ffffff;
	 padding:4px;
}
</style>
</head>
<body>

	<div id="payment" tabindex="-1">
		<div>
			<h3><span id="payment_title"></span> :: 계산하기</h3>
		</div>
		<form id="fPayment" name="fPayment" action="#">
			<div id="paymentHtml" style="background:#3DB6AE;">
				<div  style="padding:0;margin:0;">
					<div class="span5">
						<h5 style="margin:0;font-weight:bold;">&lt;주문 내역&gt;</h5>
					</div>
					<div class="span7">
						<h5 style="margin:0;font-weight:bold;">&lt;청구 내역&gt;</h5>
					</div>
				</div>
				<div>
					<div class="span5">
						<table class="basic">
							<tr>
								<th>상품명</th>
								<th>수량</th>
								<th>단가<sup>(원)</sup></th>
								<th>총금액<sup>(원)</sup></th>
							</tr>
							<tbody id="payment_infos">
								<tr>
									<td colspan="4" align="center">주문내역 없음</td>
								</tr>
								<tr>
									
								</tr>
							</tbody>
						</table>
						
						<table class="nostyle" style="margin-top:20px;">
							<tr>
								<td style="height:40px;background:#3DB6AE;font-size:14px;font-weight:bold;text-align:center;">합계금액</td>
								<td style="height:40px;background:#3DB6AE;font-size:14px;font-weight:bold;color:white;text-align:right;"><span id="payment_totalMoney">0</span> 원&nbsp;</td>
							</tr>
						</table>
					</div>
					<div class="span7" style="border:1px solid #3DB6AE;background:#ffffff;padding:4px;">
						
						<table class="basic">
							<col width="160"><col width="*">
							<tr>
								<th style="padding:0 10px;text-align:left;">합계 금액</th>
								<td style="padding:0 10px;text-align:right;font-weight:bold;"></td>
							</tr>
							<tr>
								<th style="padding:0 10px;text-align:right;font-weight:normal;color:#666666;"><u>판매가</u></th>
								<td style="padding:0 10px;text-align:right;color:#999999;text-decoration:underline;"></td>
							</tr>
							<tr>
								<th style="padding:0 10px;text-align:right;font-weight:normal;color:#666666;">상품금액</th>
							<td style="padding:0 10px;text-align:right;color:#999999;"></td>
							</tr>
							<tr>
								<th style="padding:0 10px;text-align:right;font-weight:normal;color:#666666;">부가세</th>
								<td style="padding:0 10px;text-align:right;color:#999999;"></td>
							</tr>
							<tr>
								<th style="padding:0 10px;text-align:right;font-weight:normal;color:#666666;"><u>할인</u></th>
								<td tyle="padding:0 10px;text-align:right;color:#999999;text-decoration:underline;"></td>
							</tr>
							<tr>
								<td style="height:40px;background:#3DB6AE;font-size:14px;font-weight:bold;text-align:center;">최종 청구금액</td>
								<td style="height:40px;background:#3DB6AE;font-size:16px;font-weight:bold;color:white;text-align:right;">
									
										<span id="payment_result" style="font-size:14px;font-weight:normal;margin-right:15px;"></span>
									
									<span id="payment_resultMoney">0</span> 원&nbsp;
								</td>
							</tr>
						</table>
					</div> 
				</div>
			</div>
			<div class="footer" >
				<div style="float:left;margin-bottom: 5px;">
				</div>
				<div style="float:right;">
					<button type="button" class="btn1" onclick="self.close()">Cancel</button>
					<button type="button" class="btn1" style="">카드 결제</button>
					<button type="button" class="btn1" style="">통장 결제</button>
				</div>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<div id="paymentCard">
		<div class="header">
			<h3>카드 결제</h3>
		</div>
		<form action="#" class="form-horizontal" style="padding:0;margin:0;">
			<div style="background:#eeeeee;">
				<div style="display:none;">
					<div class="span12" style="border:1px solid red;padding:2px;margin-bottom:20px;">
						<table class="basic">
							<tr>
								<td colspan="3" align="center" style="padding:4px;">
									<input type="text" maxlength="19" 
										style="width:60%;text-align:center;font-size:16px;"/>
									&nbsp;&nbsp;&nbsp;
									<button>
										조회하기
									</button>
								</td>
							</tr>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div>
					<div class="span12" style="border:1px solid #dddddd;background:#ffffff;padding:4px;">
						<table class="basic">
							<col width="140"><col width="*">
							<tr>
								<th>결제금액</th>
								<td>
									<input type="text" name="resultMoney" readonly="readonly" style="width:80%;text-align:right;font-size:20px;"/> 원
								</td>
							</tr>
						</table>
						<table class="basic" style="margin-top:10px;">
							<col width="140"><col width="*">
							<tr>
								<th>할부개월</th>
								<td>
									<select name="inc_mon" style="width:110px;font-size:14px;">
										<option value="0">일시불</option>
										<option value="2">2개월</option>
										<option value="3">3개월</option>
										<option value="4">4개월</option>
										<option value="5">5개월</option>
										<option value="6">6개월</option>
										<option value="7">7개월</option>
										<option value="8">8개월</option>
										<option value="9">9개월</option>
										<option value="10">10개월</option>
										<option value="11">11개월</option>
										<option value="12">12개월</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>카드사 <span style="color:red;">*</span></th>
								<td>
									<select name="cardCompany" style="width:110px;font-size:14px;">
										<option value="">- 선택 -</option>
										
											<option value="IBK기업체크">IBK기업체크</option>
										
											<option value="IBK비씨GIFT">IBK비씨GIFT</option>
										
											<option value="IBK비씨체크">IBK비씨체크</option>
										
											<option value="IBK비씨카드">IBK비씨카드</option>
										
											<option value="KB국민">KB국민</option>
										
											<option value="KB국민기업">KB국민기업</option>
										
											<option value="KB국민체크">KB국민체크</option>
										
											<option value="KB국민카드">KB국민카드</option>
										
											<option value="KB마스타">KB마스타</option>
										
											<option value="KB법인체크">KB법인체크</option>
										
											<option value="KDB산업">KDB산업</option>
										
											<option value="KDB산업체크">KDB산업체크</option>
										
											<option value="NH기업체크">NH기업체크</option>
										
											<option value="NH기업카드">NH기업카드</option>
										
											<option value="NH채움">NH채움</option>
										
											<option value="NH체크">NH체크</option>
										
											<option value="NH체크카드">NH체크카드</option>
										
											<option value="NH카드">NH카드</option>
										
											<option value="SC비씨체크">SC비씨체크</option>
										
											<option value="SC비씨카드">SC비씨카드</option>
										
											<option value="SC제일은행">SC제일은행</option>
										
											<option value="개인레드">개인레드</option>
										
											<option value="광주은행">광주은행</option>
										
											<option value="국민비씨카드">국민비씨카드</option>
										
											<option value="국민비자체크">국민비자체크</option>
										
											<option value="국민플래티늄">국민플래티늄</option>
										
											<option value="농협비씨체크">농협비씨체크</option>
										
											<option value="농협비씨카드">농협비씨카드</option>
										
											<option value="대구비씨카드">대구비씨카드</option>
										
											<option value="롯데AMEX골드">롯데AMEX골드</option>
										
											<option value="롯데AMEX법인">롯데AMEX법인</option>
										
											<option value="롯데AMEX블루">롯데AMEX블루</option>
										
											<option value="롯데JCB">롯데JCB</option>
										
											<option value="롯데마스타">롯데마스타</option>
										
											<option value="롯데비자">롯데비자</option>
										
											<option value="롯데카드">롯데카드</option>
										
											<option value="부산비씨카드">부산비씨카드</option>
										
											<option value="비씨카드">비씨카드</option>
										
											<option value="삼성마스타">삼성마스타</option>
										
											<option value="삼성법인">삼성법인</option>
										
											<option value="삼성비자">삼성비자</option>
										
											<option value="삼성비자법인">삼성비자법인</option>
										
											<option value="삼성신용카드">삼성신용카드</option>
										
											<option value="삼성아멕스">삼성아멕스</option>
										
											<option value="삼성체크카드">삼성체크카드</option>
										
											<option value="삼성카드">삼성카드</option>
										
											<option value="새마을체크">새마을체크</option>
										
											<option value="수협">수협</option>
										
											<option value="수협카드">수협카드</option>
										
											<option value="신한VIP카드">신한VIP카드</option>
										
											<option value="신한개인신용">신한개인신용</option>
										
											<option value="신한법인">신한법인</option>
										
											<option value="신한법인체크">신한법인체크</option>
										
											<option value="신한비씨카드">신한비씨카드</option>
										
											<option value="신한은련개인">신한은련개인</option>
										
											<option value="신한은련법인">신한은련법인</option>
										
											<option value="신한체크">신한체크</option>
										
											<option value="신한체크카드">신한체크카드</option>
										
											<option value="신한카드">신한카드</option>
										
											<option value="신한프리미엄">신한프리미엄</option>
										
											<option value="신협">신협</option>
										
											<option value="씨티비씨체크">씨티비씨체크</option>
										
											<option value="씨티비씨카드">씨티비씨카드</option>
										
											<option value="씨티체크카드">씨티체크카드</option>
										
											<option value="씨티카드">씨티카드</option>
										
											<option value="외환카드">외환카드</option>
										
											<option value="우리비씨체크">우리비씨체크</option>
										
											<option value="우리비씨카드">우리비씨카드</option>
										
											<option value="우리체크카드">우리체크카드</option>
										
											<option value="우리카드">우리카드</option>
										
											<option value="우체국">우체국</option>
										
											<option value="우체국체크">우체국체크</option>
										
											<option value="유안타체크">유안타체크</option>
										
											<option value="전북은행">전북은행</option>
										
											<option value="제주은행">제주은행</option>
										
											<option value="조흥은행">조흥은행</option>
										
											<option value="카카오체크">카카오체크</option>
										
											<option value="코나카드">코나카드</option>
										
											<option value="토스체크카드">토스체크카드</option>
										
											<option value="하나(구외환)">하나(구외환)</option>
										
											<option value="하나SK">하나SK</option>
										
											<option value="하나SK비씨">하나SK비씨</option>
										
											<option value="하나비씨체크">하나비씨체크</option>
										
											<option value="하나체크카드">하나체크카드</option>
										
											<option value="하나카드">하나카드</option>
										
											<option value="해외마스터">해외마스터</option>
										
											<option value="해외비자">해외비자</option>
										
											<option value="해외아멕스">해외아멕스</option>
										
											<option value="현대">현대</option>
										
											<option value="현대로컬개인">현대로컬개인</option>
										
											<option value="현대로컬법인">현대로컬법인</option>
										
											<option value="현대마스타">현대마스타</option>
										
											<option value="현대비자">현대비자</option>
										
											<option value="현대체크">현대체크</option>
										
											<option value="현대카드">현대카드</option>
										
										<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<th>결제메모</th>
								<td>
									<input type="text" name="memo" value="" style="width:92%;"/>
								</td>
							</tr>
							<tr>
								<th>담당자</th>
								<td>
									<input type="text" name="memo" value="" style="width:92%;"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="footer" style="border-top:1px solid #666666;background:#dddddd;">
				<div style="float:right;">
					<button type="button" class="btn1" onclick="self.close()">Cancel</button>
					<button type="button" class="btn1">결제 완료하기</button>
				</div>
			</div>
		</form> 
	</div>
	<div id="paymentMoney">
		<div class="header">
			<h3>현금 결제</h3>
		</div>
		<form action="#" class="form-horizontal" style="padding:0;margin:0;">
			<input type="hidden" name="isMulti" value="false"/>
			<div class="body" style="background:#eeeeee;">
				<div  style="display:none;">
					<div class="span12" style="border:1px solid red;padding:2px;margin-bottom:20px;">
						<table class="basic">
							<tr>
								<td colspan="3" align="center" style="padding:4px;">
									<input type="text" maxlength="19" 
										style="width:60%;text-align:center;font-size:16px;"/>
									&nbsp;&nbsp;&nbsp;
									<button>
										조회하기
									</button>
								</td>
							</tr>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
				<div>
					<div class="span12" style="border:1px solid #dddddd;background:#ffffff;padding:4px;">
						<table class="basic">
							<col width="140"><col width="*">
							<tr>
								<th>결제금액</th>
								<td>
									<input type="text" name="resultMoney" 
										readonly="readonly" style="width:80%;text-align:right;font-size:20px;"/> 원
								</td>
							</tr>
						</table>
						<table class="basic" style="margin-top:10px;">
							<col width="140"><col width="*">
							<tr>
								<th>받은금액 <span style="color:red;">*</span></th>
								<td>
									<input type="text" name="inMoney" value=""
										style="width:80%;text-align:right;font-size:20px;"/> 원
								</td>
							</tr>
							<tr>
								<th>거스름돈</th>
								<td>
									<input type="text" name="outMoney" value="" readonly="readonly" style="width:80%;text-align:right;font-size:20px;"/> 원
								</td>
							</tr>
							<tr>
								<th>결제메모</th>
								<td>
									<input type="text" name="memo" value="" style="width:92%;"/>
								</td>
							</tr>
							<tr>
								<th>담당자</th>
								<td>
									<input type="text" name="memo" value="" style="width:92%;"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="footer" style="border-top:1px solid #666666;background:#dddddd;">
				<div style="float:right;">
					<button type="button" class="btn1" onclick="self.close()">Cancel</button>
					<button type="button" class="btn1">결제 완료하기</button>
				</div>
			</div>
		</form> 
	</div>
	<div>
		<div class="header">
			<h3>통장 결제</h3>
		</div>
		<form action="#" class="form-horizontal" style="padding:0;margin:0;">
			<input type="hidden" name="isMulti" value="false"/>
			<div id="paymentBankHtml" class="body" style="background:#eeeeee;">
				<div  style="display:none;">
					<div class="span12" style="border:1px solid red;padding:2px;margin-bottom:20px;">
						<table class="basic">
							<tr>
								<td colspan="3" align="center" style="padding:4px;">
									&nbsp;&nbsp;&nbsp;
									<button>
										조회하기
									</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div >
					<div class="span12" style="border:1px solid #dddddd;background:#ffffff;padding:4px;">
						<table class="basic">
							<col width="140"><col width="*">
							<tr>
								<th>결제금액</th>
								<td>
									<input type="text" name="resultMoney" readonly="readonly" style="width:80%;text-align:right;font-size:20px;"/> 원
								</td>
							</tr>
						</table>
						<table class="basic" style="margin-top:10px;">
							<col width="140"><col width="*">
							<tr>
								<th>통장 입금일자 <span style="color:red;">*</span></th>
								<td>
									<div>
										<input type="text" name="bankdate" value="" readonly="readonly" style="font-size:12px;width:70px;"/>
									</div>
								</td>
							</tr>
							<tr>
								<th>결제메모</th>
								<td>
									<input type="text" name="memo" value="" style="width:92%;"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="footer" style="border-top:1px solid #666666;background:#dddddd;">
				<div style="float:right;">
					<button type="button" class="btn1" onclick="self.close()">Cancel</button>
					<button type="button" class="btn1">결제 완료하기</button>
				</div>
			</div>
		</form> 
	</div>
</body>
</html>