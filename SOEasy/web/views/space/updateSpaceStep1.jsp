<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.space.model.vo.*" %>
<%
	ArrayList<HashMap<String,Object>> siList = (ArrayList<HashMap<String,Object>>) session.getAttribute("siList");
	HashMap<String, Object> hmap = siList.get(0);
	
	SpaceInfo si = (SpaceInfo) hmap.get("spaceInfo");
	
	ArrayList<Image> imgList = (ArrayList<Image>) hmap.get("imgList");
	ArrayList<Review> reviewList = (ArrayList<Review>) hmap.get("reviewList");
	ArrayList<QnA> qnaList = (ArrayList<QnA>) hmap.get("qnaList");
	
	String roadAddrPart1 = si.getSpaceLocationFilter().split(",")[0];
	String siNm = si.getSpaceLocationFilter().split(",")[1];
	String sggNm = si.getSpaceLocationFilter().split(",")[2];
	String emdNm = si.getSpaceLocationFilter().split(",")[3];
	
	//System.out.println("왜 안들어오냐? : "+si.getHostNo());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SO Easy - 공간 정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/layout.css">
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
	.check-distinct input[type=text]{
		text-align: center;
	}
	.select-space{
		width: 40%;
		height: 55px;
		display: inline-block;
		border: 1px solid black;
		border-radius: 10px;
		cursor: pointer;
		margin: 10px;
	}
	.space-descrip{
		margin: 50px;
	}
	.detail-descrip{
		font-size: 10px;
		text-align: right;
		margin: 0;
		padding: 0;
	}
	.warning{
		font-size: 10px;
		text-align: right;
		color: red;
		margin: 0;
		padding: 0;
	}
	.check-distinct{
		display: none;
		height: 250px;
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
	/* #add-tag{
		width: 60%;
	}
	#space-tag{
		width: 350px;
		height: 200px;
		border: 1px solid black;
		border-radius: 10px;
	} */
	.thumbnail-in, #capital-img{
		max-width: 100%;
		max-height: 100%;
		margin: auto;
	}
	.thumbnail{
		border: 1px solid black;
		border-radius: 10px;
		display: inline-block;
		text-align: center;
		vertical-align: middle;
	}
	#cap{
		border: 1px solid black;
		border-radius: 10px;
		text-align: center;
	}
	#capital-img{
		text-align: center;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<header><%@ include file="../common/header.jsp"%></header>
	<%
		if(userStatus == 0 || loginUser == null || loginUser.getMemberNo() != si.getHostNo()){
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request,response);
		}
	%>
	<nav><%@ include file="../common/aside.jsp"%></nav>
	<section>
		<div>
			<h1 align="center" style="margin:0;">공간 등록</h1>
			<br>
			<br>
		</div>
		<form action="<%= request.getContextPath() %>/updateSpaceStep1" method="post" encType="multipart/form-data">
			<table class="space-insert" align="center" width="70%">
				<tr>
					<td width="5%"></td>
					<td width="20%" style="text-align:left;">공간 종류 *</td>
					<td width="40%" align="center">
						<span class="select-space" id="office" style="">
							<br>독립 오피스
						</span>
						
						<span class="select-space" id="cowork">
							<br>코워킹 스페이스
						</span>
					</td>
					<td width="5%"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td width="auto" style="word-break:break-all"><div id="space-descrip"></div></td>
					<td></td>
				</tr>
				<tr class="check-distinct" id="office-check">
					<td></td>
					<td></td>
					<td>
						<fieldset>
							<table align="center" width="90%">
								<tr>
									<td width="30%">공간 사이즈*</td>
									<td width="60%">
										<input type="text" name="space-size" id="space-size" size="30%" onclick="this.select();">
										<p></p>
									</td>
									<td style="vertical-align: top;"><p style="margin-top: 6px;">m<sup>2</sup></p></td>
								</tr>
								<tr>
									<td>공간 재고*</td>
									<td><input type="text" name="space-room-count" id="space-room-count" size="30%" onclick="this.select();">
									<p class="detail-descrip">서비스 가능한 방의 갯수를 의미합니다.</p>
									</td>
									<td style="vertical-align: top;"><p style="margin-top: 6px;">실</p></td>						
								</tr>
								<tr>
									<td>수용인원*</td>
									<td><input type="text" name="space-contain-count" id="space-contain-count" size="30%" onclick="this.select();">
									<p class="detail-descrip">제공된 공간을 기준으로 합니다.</p></td>
									<td style="vertical-align: top;"><p style="margin-top: 6px;">명</p></td>	
								</tr>
							</table>
						</fieldset>
					</td>
					<td></td>
				</tr>
				<tr class="check-distinct" id="cowork-check">
					<td></td>
					<td></td>
					<td>
						<fieldset>
							<table align="center" width="80%">
								<tr>
									<td width="30%">자유석</td>
									<td width="60%">
										<input type="text" name="unfix-seat" id="unfix-seat" size="30%" value="0" onkeyup="countSeat();" onclick="this.select();">
									</td>
									<td width="10%">석</td>
								</tr>
								<tr>
									<td>지정석</td>
									<td><input type="text" name="fix-seat" id="fix-seat" size="30%" value="0" onkeyup="countSeat();" onclick="this.select();"></td>
									<td>석</td>
								</tr>
								<tr>
									<td>좌석 수</td>
									<td><input type="text" name="total-seat" id="total-seat" size="30%" readonly></td>
									<td>석</td>
								</tr>
								<tr>
									<td>예약 가능 인원*</td>
									<td><input type="text" name="max-reserv" id="max-reserv" size="30%" onclick="this.select();">
									<p class="detail-descrip">제공된 공간을 기준으로 합니다.</p></td>
									<td style="vertical-align: top;"><p style="margin-top: 6px;">명</p></td>
								</tr>
							</table>
						</fieldset>
						<input type="hidden" name="kinds" id="kinds">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><p class="warning" id="warning-space-name">공간명을 입력하셔야 합니다.</p></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>공간명 *</td>
					<td><input type="text" maxlength="20" name="space-name" id="space-name" value="<%=si.getSpaceName()%>"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>공간 한줄 소개 *</td>
					<td><input type="text" maxlength="20" name="space-short-intro" id="space-short-intro" value="<%=si.getSpaceShortIntro()%>"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td align="right"><p class="text-limit" id="intro-limit">0 / 800</p></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>공간 소개 *</td>
					<td>
						<textarea rows="8" maxlength="800" name="space-intro" id="space-intro"><%=si.getSpaceIntro()%></textarea>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<!-- <tr>
					<td></td>
					<td>공간 태그</td>
					<td><input type="text" id="add-tag" onclick="this.select();">&nbsp;&nbsp;<button type="button" onclick="addTag();">추가하기</button></td>
					<td></td>
				</tr> -->
				<!-- <tr>
					<td></td>
					<td></td>
					<td><div id="space-tag"></div></td>
					<td></td>
				</tr> -->
				<tr>
					<td></td>
					<td style="vertical-align: top;"><br>편의시설 *</td>
					<td>
						<table style="border-spacing:15px; text-align:center;">
							<tr>
								<td><label for="24h"><img src="<%=request.getContextPath()%>/images/icon/24h.png" width="100px"><br><input type="checkbox" name="conv" id="24h" value="24h"></label></td>
								<td><label for="365days"><img src="<%=request.getContextPath()%>/images/icon/365days.png" width="100px"><br><input type="checkbox" name="conv" id="365days" value="365days"></label></td>
								<td><label for="airCon"><img src="<%=request.getContextPath()%>/images/icon/airCon.png" width="100px"><br><input type="checkbox" name="conv" id="airCon" value="airCon"></label></td>
								<td><label for="animal"><img src="<%=request.getContextPath()%>/images/icon/animal.png" width="100px"><br><input type="checkbox" name="conv" id="animal" value="animal"></label></td>
							</tr>
							<tr>
								<td><label for="beam"><img src="<%=request.getContextPath()%>/images/icon/beam.png" width="100px"><br><input type="checkbox" name="conv" id="beam" value="beam"></label></td>
								<td><label for="board"><img src="<%=request.getContextPath()%>/images/icon/board.png" width="100px"><br><input type="checkbox" name="conv" id="board" value="board"></label></td>
								<td><label for="cafe"><img src="<%=request.getContextPath()%>/images/icon/cafe.png" width="100px"><br><input type="checkbox" name="conv" id="cafe" value="cafe"></label></td>
								<td><label for="copyPrint"><img src="<%=request.getContextPath()%>/images/icon/copyPrint.png" width="100px"><br><input type="checkbox" name="conv" id="copyPrint" value="copyPrint"></label></td>
							</tr>
							<tr>
								<td><label for="delivery"><img src="<%=request.getContextPath()%>/images/icon/delivery.png" width="100px"><br><input type="checkbox" name="conv" id="delivery" value="delivery"></label></td>
								<td><label for="doorLock"><img src="<%=request.getContextPath()%>/images/icon/doorLock.png" width="100px"><br><input type="checkbox" name="conv" id="doorLock" value="doorLock"></label></td>
								<td><label for="fax"><img src="<%=request.getContextPath()%>/images/icon/fax.png" width="100px"><br><input type="checkbox" name="conv" id="fax" value="fax"></label></td>
								<td><label for="heater"><img src="<%=request.getContextPath()%>/images/icon/heater.png" width="100px"><br><input type="checkbox" name="conv" id="heater" value="heater"></label></td>
							</tr>
							<tr>
								<td><label for="kitchen"><img src="<%=request.getContextPath()%>/images/icon/kitchen.png" width="100px"><br><input type="checkbox" name="conv" id="kitchen" value="kitchen"></label></td>
								<td><label for="locker"><img src="<%=request.getContextPath()%>/images/icon/locker.png" width="100px"><br><input type="checkbox" name="conv" id="locker" value="locker"></label></td>
								<td><label for="mail"><img src="<%=request.getContextPath()%>/images/icon/mail.png" width="100px"><br><input type="checkbox" name="conv" id="mail" value="mail"></label></td>
								<td><label for="parking"><img src="<%=request.getContextPath()%>/images/icon/parking.png" width="100px"><br><input type="checkbox" name="conv" id="parking" value="parking"></label></td>
							</tr>
							<tr>
								<td><label for="rounge"><img src="<%=request.getContextPath()%>/images/icon/rounge.png" width="100px"><br><input type="checkbox" name="conv" id="rounge" value="rounge"></label></td>
								<td><label for="snack"><img src="<%=request.getContextPath()%>/images/icon/snack.png" width="100px"><br><input type="checkbox" name="conv" id="snack" value="snack"></label></td>
								<td><label for="terrace"><img src="<%=request.getContextPath()%>/images/icon/terrace.png" width="100px"><br><input type="checkbox" name="conv" id="terrace" value="terrace"></label></td>
								<td><label for="tv"><img src="<%=request.getContextPath()%>/images/icon/tv.png" width="100px"><br><input type="checkbox" name="conv" id="tv" value="tv"></label></td>
							</tr>
							<tr>
								<td><label for="wareHouse"><img src="<%=request.getContextPath()%>/images/icon/wareHouse.png" width="100px"><br><input type="checkbox" name="conv" id="wareHouse" value="wareHouse"></label></td>
								<td><label for="waterMachine"><img src="<%=request.getContextPath()%>/images/icon/waterMachine.png" width="100px"><br><input type="checkbox" name="conv" id="waterMachine" value="waterMachine"></label></td>
								<td style="display:none;"><input type="checkbox" name="conv" value="wifi" checked></td>
								<td style="display:none;"><input type="checkbox" name="conv" value="plug" checked></td>
							</tr>
						</table>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;</td>
					<!-- <td class="warning" id="capital-img-not" style="text-align:right;">대표 이미지를 추가하셔야 합니다.</td> -->
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style="vertical-align: top;"><br>대표 이미지 *</td>
					<td>
						<div id="cap" style="width: 450px; height: 250px; overflow: hidden;">
							<img id="capital-img" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;</td>
					<!-- <td class="warning" id="thumbnail-img-not" style="text-align:right;">상세 이미지를 추가하셔야 합니다.</td> -->
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style="vertical-align: top;"><br>상세 이미지 *</td>
					<td class="thumbnail-area">
						<div class="thumbnail" style="width: 220px; height: 150px; overflow: hidden;">
							<img class="thumbnail-in" id="thumnail-1" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>&nbsp;
						<div class="thumbnail" style="width: 220px; height: 150px; overflow: hidden;">
							<img class="thumbnail-in" id="thumnail-2" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>
						<br><br>
						<div class="thumbnail" style="width: 220px; height: 150px; overflow: hidden;">
							<img class="thumbnail-in" id="thumnail-3" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>&nbsp;
						<div class="thumbnail" style="width: 220px; height: 150px; overflow: hidden;">
							<img class="thumbnail-in" id="thumnail-4" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>
						<br><br>
						<div class="thumbnail" style="width: 220px; height: 150px; overflow: hidden;">
							<img class="thumbnail-in" id="thumnail-5" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>&nbsp;
						<div class="thumbnail" style="width: 220px; height: 150px; overflow: hidden;">
							<img class="thumbnail-in" id="thumnail-6" src="<%=request.getContextPath()%>/images/icon/addImg.png">
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td>공간 주소 *</td>
					<td><input type="text" placeholder="공간 주소를 입력하세요." id="roadFullAddr"  name="space-address" value="<%=si.getSpaceAddress()%>" readonly>&nbsp;&nbsp;<button type="button" onclick="goPopup();">검색</button></td>
					<td>
						<input type="hidden" id="siNm"  name="siNm" value="<%=siNm%>"/>
						<input type="hidden" id="sggNm"  name="sggNm" value="<%=sggNm%>" />
						<input type="hidden" id="emdNm"  name="emdNm" value="<%=emdNm%>" />
						<input type="hidden" id="roadAddrPart1"  name="roadAddrPart1" value="<%=roadAddrPart1%>" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td style="vertical-align: top;"><br>공간 필수 기능 *</td>
					<td>
						<input type="checkbox" class="rule" id="rule1" name="rule1" value="wifi" style="height:15px;"><label for="rule1">  쾌적하고 빠른 WIFI</label>
						<br>
						<br>
						<input type="checkbox" class="rule" id="rule2" name="rule2" value="concent" style="height:15px;"><label for="rule2">  넉넉한 콘센트</label>
						<br>
						<br>
						<input type="checkbox" class="rule" id="rule3" name="rule3" value="wifi" style="height:15px;"><label for="rule3">  철저한 예약관리</label>
						<br>
						<br>
						<br>
						<input type="checkbox" class="rule" id="rule4" name="rule4" value="wifi" style="height:15px;"><label for="rule4">  전체 동의</label>
					</td>
					<td></td>
				</tr>
			</table>
			<div class="btnArea" align="center">
				<br><br><br><br><br><br>
				<button id="goList" type="button">내 공간 목록으로</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="gonext" type="button">다음으로</button>
				<br><br><br><br><br><br>
			</div>
			<div id="fileArea">
				<input type="file" id="cap-img" name="thumbnailImg0" onchange="load(this);" accept="image/*">
				<input class="thumb" type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this, 1);" accept="image/*">
				<input class="thumb" type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this, 2);" accept="image/*">
				<input class="thumb" type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this, 3);" accept="image/*">
				<input class="thumb" type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this, 4);" accept="image/*">
				<input class="thumb" type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this, 5);" accept="image/*">
				<input class="thumb" type="file" id="thumbnailImg6" name="thumbnailImg6" onchange="loadImg(this, 6);" accept="image/*">
			</div>
		</form>
	</section>
	<footer>
		<%@ include file="../common/footer.jsp"%>
	</footer>
	<script>
		
		function goPopup(){
			var pop = window.open("../../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
	
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			$("#roadFullAddr").val(roadFullAddr);
			$("#siNm").val(siNm);
			$("#sggNm").val(sggNm);
			$("#emdNm").val(emdNm);
			$("#roadAddrPart1").val(roadAddrPart1);
		}
		console.log("스크립트");
		$(document).ready(function(){
			console.log("제발");
		});
	
		$(function(){
			initSet();
			initEvent();
			console.log("여기는 요?");
		});
		
		function initSet(){
			$(".warning").show();
			
			var spaceKindCheck = <%=si.getSpaceKind()%>;
			console.log(spaceKindCheck);
			if(spaceKindCheck == 1){
				$("#office-check").show();
				$("#kinds").val("office");
				$("#cowork").css("background", "white");
				$("#office").css("background", "#3DB6AE");
				$("#office-check").show();
				$("#space-descrip").show();
				$("#space-descrip").css({"width":"auto", "height":"50px", "margin":"10px"}).html("개인 또는 한 팀이 프라이빗하게 이용할 수 있는 입주형 사무공간.");
				$("#space-size").val(<%=si.getSpaceSize()%>);
				$("#space-room-count").val(<%=si.getSpaceRoomCount()%>);
				$("#space-contain-count").val(<%=si.getSpaceContainCount()%>);
			} else if(spaceKindCheck == 2){
				$("#cowork-check").show();
				$("#kinds").val("cowork");
				$("#office").css("background", "white");
				$("#cowork").css("background", "#3DB6AE");
				$("#cowork-check").show();
				$("#space-descrip").show();
				$("#space-descrip").css({"width":"auto", "height":"50px", "margin":"10px"}).html("개방된 공간에 개인 또는 여러 팀이 함께 이용할 수 있는 형태의 사무공간"+ '<br><br>' + "공간 운영방식에 따라 자유석또는 지정석으로 이용 가능");
				$("#unfix-seat").val(<%=si.getUnfixSeat()%>);
				$("#fix-seat").val(<%=si.getFixSeat()%>);
				$("#max-reserv").val(<%=si.getMaxReserv()%>);
			}
			
			var si = $("#space-intro").val();
			var len = si.length;
			var maxlen = 800;
			$("#intro-limit").text(len + " / " + maxlen);
			
			var str = $("#space-name").val();
			var len = str.length;
			if(len > 0){
				$("#warning-space-name").hide();
			}else{
				$("#warning-space-name").show();
			}
			

			<% for (int i = 0; i < si.getConv().length; i++) {%>
			
			var conv = "<%=si.getConv()[i]%>";
			
			switch(conv) {
			case '24h' : $("#24h").prop("checked",true); break;
			case '365days' : $("#365days").prop("check",true); break;
			case 'airCon' : $("#airCon").prop("checked",true); break;
			case 'animal' : $("#animal").prop("checked",true); break;
			case 'beam' : $("#beam").prop("checked",true); break;
			case 'board' : $("#board").prop("checked",true); break;
			case 'cafe' : $("#cafe").prop("checked",true); break;
			case 'copyPrint' : $("#copyPrint").prop("checked",true); break;
			case 'delivery' : $("#delivery").prop("checked",true); break;
			case 'doorLock' : $("#doorLock").prop("checked",true); break;
			case 'fax' : $("#fax").prop("checked",true); break;
			case 'heater' : $("#heater").prop(":checked",true); break;
			case 'kitchen' : $("#kitchen").prop("checked",true); break;
			case 'locker' : $("#locker").prop("checked",true); break;
			case 'mail' : $("#mail").prop("checked",true); break;
			case 'parcking' : $("#parcking").prop("checked",true); break;
			case 'rounge' : $("#rounge").prop("checked",true); break;
			case 'snack' : $("#snack").prop("checked",true); break;
			case 'terrace' : $("#terrace").prop("checked",true); break;
			case 'tv' : $("#tv").prop("checked",true); break;
			case 'wareHouse' : $("#wareHouse").prop("checked",true); break;
			case 'waterMachine' : $("#waterMachine").prop("checked",true); break;
			case 'wifi' : $("#wifi").prop("checked",true); break;
			case 'plug' : $("#plug").prop("checked",true); break;
			}
			<% } %>

			$("#capital-img").attr("src", "<%=request.getContextPath() + imgList.get(0).getFilePath() + "/" + imgList.get(0).getChangeName()%>");
			<% for(int i = 1; i < 7; i++) { 
				for(int j = 0; j < imgList.size(); j++) {
					if(imgList.get(j).getFileLevel() == i) { %>
						$("#thumnail-<%=i%>").attr("src", "<%=request.getContextPath() + imgList.get(j).getFilePath() + "/" + imgList.get(j).getChangeName()%>");
			<%		} else {
				
					}
				}
			}	%>
			
			countSeat();
		}
			
			
			
		
	
		function initEvent(){
			//경고메세지 출력 | 가리기
			$("#space-name").on("keyup", function(){
				var str = $("#space-name").val();
				var len = str.length;
				if(len > 0){
					$("#warning-space-name").hide();
				}else{
					$("#warning-space-name").show();
				}
			});
			
			$("#office").click(function(){
				if($("#office-check").is(":visible")){
					$("#office").css("background", "white");
					$(".check-distinct").hide();
					$("#space-descrip").hide();
				} else if($("#cowork-check").is(":visible")){
					$("#kinds").val("office");
					$(".check-distinct").hide();
					$("#space-descrip").hide();
					$("#cowork").css("background", "white");
					$("#office").css("background", "#3DB6AE");
					$("#office-check").show();
					$("#space-descrip").show();
					$("#space-descrip").css({"width":"auto", "height":"50px", "margin":"10px"}).html("개인 또는 한 팀이 프라이빗하게 이용할 수 있는 입주형 사무공간.");
				} else {
					$("#kinds").val("office");
					$("#cowork").css("background", "white");
					$("#office").css("background", "#3DB6AE");
					$("#office-check").show();
					$("#space-descrip").show();
					$("#space-descrip").css({"width":"auto", "height":"50px", "margin":"10px"}).html("개인 또는 한 팀이 프라이빗하게 이용할 수 있는 입주형 사무공간.");
				}
			});
			$("#cowork").click(function(){
				if($("#cowork-check").is(":visible")){
					$("#cowork").css("background", "white");
					$(".check-distinct").hide();
					$("#space-descrip").hide();
				} else if($("#office-check").is(":visible")) {
					$("#kinds").val("cowork");
					$(".check-distinct").hide();
					$("#space-descrip").hide();
					$("#office").css("background", "white");
					$("#cowork").css("background", "#3DB6AE");
					$("#cowork-check").show();
					$("#space-descrip").show();
					$("#space-descrip").css({"width":"auto", "height":"50px", "margin":"10px"}).html("개방된 공간에 개인 또는 여러 팀이 함께 이용할 수 있는 형태의 사무공간"+ '<br><br>' + "공간 운영방식에 따라 자유석또는 지정석으로 이용 가능");
				} else {
					$("#kinds").val("cowork");
					$("#office").css("background", "white");
					$("#cowork").css("background", "#3DB6AE");
					$("#cowork-check").show();
					$("#space-descrip").show();
					$("#space-descrip").css({"width":"auto", "height":"50px", "margin":"10px"}).html("개방된 공간에 개인 또는 여러 팀이 함께 이용할 수 있는 형태의 사무공간"+ '<br><br>' + "공간 운영방식에 따라 자유석또는 지정석으로 이용 가능");
				}
			});
			//좌석수 입력시 조건
			$("#unfix-seat").click(function(){
				if($(this).val == 0){
					$(this).val("");
				}
			});
			$("#fix-seat").click(function(){
				if($(this).val == 0){
					$(this).val("");
				}
			});
			
			//공간 소개 입력시 글자 수 표시
			$("#space-intro").on("keyup", function(){
				var si = $("#space-intro").val();
				var len = si.length;
				var maxlen = 800;
				$("#intro-limit").text(len + " / " + maxlen);
			}).on("keypress", function(){
				var si = $("#space-intro").val();
				var len = si.length;
				var maxlen = 800;
				$("#intro-limit").text(len + " / " + maxlen)
			});
			
		}//initEvent initEvent
		
		//약관 전체 동의
		$("#rule4").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#rule4").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$(".rule").prop("checked", true);
				// 전체선택 체크박스가 해제된 경우 
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$(".rule").prop("checked", false);
			}
		});
		

		// 좌석 수 = 자유석 + 지정석
		function countSeat(){
			/* console.log("되는건맞니?") */
			var unfixSeat = Number($("#unfix-seat").val());
			var fixSeat = Number($("#fix-seat").val());
			var totalSeat = unfixSeat + fixSeat;
			
			$("#total-seat").val(totalSeat);
			$("#max-reserv").val(totalSeat);
		};
		
		<%-- var count = 0;
		$(".thumb").on("change", function(){
			for(var i = 1; i <= 6; i++){
				if($("#thumbnailImg" + i).val() != "<%=request.getContextPath()%>/images/icon/addImg.png"){
					count ++;
					console.log(count);
					break;
				}
			}
			if(count >= 4){
				$("#thumbnail-img-not").hide();
			}
		}); --%>
		
		
		//태그 추가하기
		/* function addTag(){
			var tag = $("#add-tag").val();
			var tags = $("#space-tag");
			
			var tag_input = $("<input>");
			tag_input.attr("name", "space-tag");
			tag_input.attr("class", "space-tag");
			tag_input.attr("type", "button");
			tag_input.attr("style", "padding:8px; height:40px;")
			tag_input.attr("value", "#"+tag);
			tag_input.attr("onclick","clickHash();");
			
			tags.append(tag_input);
			$("#add-tag").val("");
		}; */
		
		
		//이미지 추가하기
		$(function(){
			
			$("#fileArea").hide();
			
			$("#capital-img").click(function(){
				$("#cap-img").click();
			});
			$("#thumnail-1").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#thumnail-2").click(function(){
				$("#thumbnailImg2").click();
			});
			$("#thumnail-3").click(function(){
				$("#thumbnailImg3").click();
			});
			$("#thumnail-4").click(function(){
				$("#thumbnailImg4").click();
			});
			$("#thumnail-5").click(function(){
				$("#thumbnailImg5").click();
			});
			$("#thumnail-6").click(function(){
				$("#thumbnailImg6").click();
			});
		});
		
		function load(value) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e) {
					$("#capital-img").attr("src", e.target.result);
					if(e.target.result !== "<%=request.getContextPath()%>/images/icon/addImg.png"){
						$("#capital-img-not").hide();
					}
				}
				
				reader.readAsDataURL(value.files[0]);
			}
		};
		
		function loadImg(value, num) {
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e) {
					
					switch(num){
					case 1 :
						$("#thumnail-1").attr("src", e.target.result);
						break;
					case 2 : 
						$("#thumnail-2").attr("src", e.target.result); 
						break;
					case 3 : 
						$("#thumnail-3").attr("src", e.target.result); 
						break;
					case 4 : 
						$("#thumnail-4").attr("src", e.target.result);
						break;
					case 5 : 
						$("#thumnail-5").attr("src", e.target.result); 
						break;
					case 6 : 
						$("#thumnail-6").attr("src", e.target.result); 
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		};
		
		$(".rule").on("change", function(){
			if($("#rule1").is(":checked") == true && $("#rule2").is(":checked") == true && $("#rule3").is(":checked") == true){
				$("#rule4").prop("checked", true);
			} else {
				$("#rule4").prop("checked", false);
			}
		});
		
		$("#gonext").click(function(){
			if($(".warning").is("visible") == true || $("#space-intro").val() == "" || $("#roadFullAddr").val() == "" || $("#rule4").is(":checked") == false){
				alert("필수사항을 모두 입력하세요");
			} else {
				$("form").submit();
			}
		});
		
		$("#goList").click(function(){
			history.go(-1);
		});
	</script>
</body>
</html>