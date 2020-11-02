<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.login.space.model.vo.*" %>
<%
	SpaceInfo si = new SpaceInfo();
	session.setAttribute("spaceInfo", si);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SO Easy - 공간등록</title>
<link rel="stylesheet" href="../../css/layout.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function goPopup(){
		var pop = window.open("<%=request.getContextPath()%>/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		$("#roadFullAddr").val(roadFullAddr);
	}
</script>
<style>

	.space-insert tr td input[type=text]{
		width: 100%;
		word-break:break-all;
	}
	#roadFullAddr{
		width: 80%
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
	input[type=checkbox]{
		cursor: pointer;
	}
	img{
		max-width: 100%;
		max-height: 100%;
		margin: auto;
	}
	.box-file-input label{
	    display:inline-block;
	    background:#23a3a7;
	    color:#fff;
	    padding:0px 15px;
	    line-height:35px;
	    cursor:pointer;
	}
	
	.box-file-input label:after{
	    content:"파일등록";
	}
	
	.box-file-input .file-input{
	    display:none;
	}
	
	.box-file-input .filename{
	    display:inline-block;
	    padding-left:10px;
	}
	.filename{
		border: 1px solid black;
		border-radius: 10px;
		height: 30px;
	}
	#cal-email1{
		width: 35%;
	}
	#cal-email2{
		width: 50%;
	}
	#cal-phone1{
		text-align: center;
		width: 20%;
	}
	#cal-phone2, #cal-phone3{
		text-align: center;
		width: 30%;
	}
	select {
		width: 200px;
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
			<h1 align="center" style="margin: 0px;">정산 정보</h1>
			<br><br>
		</div>
		<form action="<%= request.getContextPath() %>/insertSpaceStep3" method="post" encType="multipart/form-data">
			<table class="space-insert" align="center" width="70%">
				<tr>
					<td></td>
					<td></td>
					<td align="right"><p class="text-limit" id="bsns-name-limit">0 / 20</p></td>
					<td></td>
				</tr>
				<tr>
					<td width="5%"></td>
					<td width="20%">상호명 *</td>
					<td width="40%">
						<input type="text" maxlength="20" name="bsns-name" id="bsns-name">
					</td>
					<td width="5%"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="5%"></td>
					<td width="20%">대표자명 *</td>
					<td width="40%">
						<input type="text" maxlength="20" name="bsns-represent-name" id="bsns-represent-name" style="width:61%;">
					</td>
					<td width="5%"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td style="vertical-align:top;">사업자등록번호 *</td>
					<td>
						<input type="text" name="bsns-license-no" id="bsns-license-no" style="width:61%;">
						<br><br>
						<div class="box-file-input">
							<p class="filename" style="width: 60%;">파일을 선택해주세요.</p>
							<label style="align:right;"><input type="file" class="file-input" name="bsns-license-img" id="bsns-license-img" accept="image/*,.pdf"></label>
						</div>
					</td>
					<td></td>
				</tr>
				<tr class="check-type" id="check-type">
					<td></td>
					<td style="vertical-align:top;">사업자 유형 *</td>
					<td>
						<fieldset>
							<table align="center" width="90%">
								<tr>
									<td width="40%" style="text-align:center;">
										<input type="radio" name="bsns-type" id="bsns-type1" value="1">
									</td>
									<td width="60%">
										<label for="bsns-type1">간이 과세자</label>
									</td>
									<td></td>
								</tr>
								<tr>
									<td width="40%" style="text-align:center;">
										<input type="radio" name="bsns-type" id="bsns-type2" value="2">
									</td>
									<td width="60%">
										<label for="bsns-type2">일반 과세자</label>
									</td>
									<td></td>
								</tr>
								<tr>
									<td width="40%" style="text-align:center;">
										<input type="radio" name="bsns-type" id="bsns-type3" value="3">
									</td>
									<td width="60%">
										<label for="bsns-type3">법인 과세자</label>
									<td></td>
								</tr>
								<tr>
									<td width="40%" style="text-align:center;">
										<input type="radio" name="bsns-type" id="bsns-type4" value="4">
									</td>
									<td width="60%">
										<label for="bsns-type4">면세 사업자</label>
									</td>
									<td></td>
								</tr>
								<tr>
									<td width="40%" style="text-align:center;">
										<input type="radio" name="bsns-type" id="bsns-type5" value="5">
									</td>
									<td width="60%">
										<label for="bsns-type5">기타 사업자</label>
									</td>
									<td></td>
								</tr>
							</table>
						</fieldset>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>주 업태 *</td>
					<td>
						<input type="text" name="bsns-condition" style="width:40%;" onclick="this.select();">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>주 종목 *</td>
					<td>
						<input type="text" name="bsns-event" style="width:40%;" onclick="this.select();">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>사업장 주소 *</td>
					<td>
						<input type="text" placeholder="사업장 주소를 입력하세요." id="roadFullAddr"  name="bsns-address" readonly>&nbsp;&nbsp;
						<button type="button" onclick="goPopup();">검색</button>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>정산용 이메일 *</td>
					<td>
						<div>
							<input type="text" class="email" name="cal-email1" id="cal-email1">
							&nbsp;@&nbsp;
							<input type="text" class="email" name="cal-email2" id="cal-email2">
						</div>
					</td>
					<td>
						<select class="select-email" id="select-email">
							<option id="naver">naver.com</option>
							<option id="daum">daum.net</option>
							<option id="gmail">gmail.com</option>
							<option id="nate">nate.com</option>
							<option id="self" selected>직접 입력</option>
						</select>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>정산용 연락처 *</td>
					<td>
						<div>
							<input type="text" class="phone" name="cal-phone1" id="cal-phone1" maxlength="3">
							&nbsp;-&nbsp;
							<input type="text" class="phone" name="cal-phone2" id="cal-phone2" maxlength="4">
							&nbsp;-&nbsp;
							<input type="text" class="phone" name="cal-phone3" id="cal-phone3" maxlength="4">
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td style="vertical-align: top;"><br>계좌 정보 *</td>
					<td>
						<table width="100%">
							<tr>
								<td>은행명</td>
								<td>
									<select name="cal-bank">
										<option selected>은행 선택</option>
										<option value="shinhan">신한은행</option>
										<option value="kb">KB국민은행</option>
										<option value="woori">우리은행</option>
										<option value="hana">하나은행</option>
										<option value="kakao">카카오뱅크</option>
										<option value="kbank">케이뱅크</option>
										<option value="kdb">KDB산업은행</option>
										<option value="ibk">IBK기업은행</option>
										<option value="nh">NH농협은행</option>
										<option value="suhyup">수협은행</option>
										<option value="daegu">대구은행</option>
										<option value="busan">부산은행</option>
										<option value="kn">경남은행</option>
										<option value="jb">전북은행</option>
										<option value="kwangju">광주은행</option>
										<option value="jeju">제주은행</option>
										<option value="post">우체국은행</option>
										<option value="kfcc">새마을금고</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>예금주</td>
								<td>
									<input type="text" name="cal-acct-holder" style="width:50%;">
								</td>
							</tr>
							<tr>
								<td>계좌번호</td>
								<td>
									<input type="text" name="cal-acct-no">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<div class="btnArea" align="center">
				<br><br><br><br><br><br>
				<button type="button" onclick="callBack();">이전으로</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="gonext">저장하기</button>
				<br><br><br><br><br><br>
			</div>
		</form>
	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
</body>
	<script>
		/* function sameAddr(){
			
		} */
		$(function(){
			initSet();
			initEvent();
		});
		
		function initSet(){
			$(".warning").show();
		}
	
		function initEvent(){
			$("#bsns-name").on("keyup", function(){
				var bn = $("#bsns-name").val();
				var len = bn.length;
				var maxlen = 20;
				$("#bsns-name-limit").text(len + " / " + maxlen);
			}).on("keypress", function(){
				var si = $("#bsns-name").val();
				var len = si.length;
				var maxlen = 20;
				$("#bsns-name-limit").text(len + " / " + maxlen)
			});
		}//initEvent initEvent
		
		
		$(".select-email").change(function(){
			if($(this).val() == "직접 입력"){
				$("#cal-email2").val("");
			} else {
				$("#cal-email2").val($(this).val());
			}
		});
		
	    $(".file-input").on("change", function(){
	        $filename = $(this).val();
	        if($filename == "")
	            $filename = "파일을 선택해주세요.";
	        $(".filename").text($filename);
	    });
	    
	    $(".phone").on("keyup", function(){
			var test = RegExp(/[0-9]/);
			var rate = $(this).val();
			if(!test.test(rate)){
				alert("숫자만 입력해주세요.");
				$(this).val("");
			}
		});
		
	    var checkUnload = true;
	    $(window).on("beforeunload", function(){
	        if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
	    });
	    
	    $("#gonext").click(function(){
			checkUnload = false;
			$("form").submit();
		});
	</script>
</html>