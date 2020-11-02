<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.space.model.vo.*" %>
<%
   ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("introList");
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
    <style>
        .visual {
            position: relative;
            width: 100%;
            margin-left: auto;
            margin-right: auto;
        }
        .visual button {
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
        .visual button:before {
            font-family: 'xeicon';
            color: #fff;
            font-size : 45px;
        }
        .visual button.slick-prev {
            left: 50px;
            font-size : 0;
            color : transparent;
        }
        .visual button.slick-prev::before {
            content:"\e93d";
            font-family: 'xeicon';
        }

        .visual button.slick-next {
            right: 50px;
            font-size : 0;
            color : transparent;
        }

        .visual button.slick-next::before {
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
        
        .slick-list {
           width: 100%;
        }
        
        #reserBtn {
           background:#40b4a6;
           width:70px;
           height:30px;
           font-size: 15px;
           outline:0;
           border:0;
           color:white;
           border-radius:5px;
           cursor:pointer;
        }
        
        #qndBtn {
           color:white; 
           background:#40a4b6; 
           border:0; 
           outline:0; 
           border-radius:5px; 
           font-size:15px; 
           width:60px; 
           height:30px; 
           float:right;
        }

    </style>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
  
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
<title>SO Easy</title>
<meta charset="utf-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/layout.css">

</head>
<body>
      <header><%@ include file="../common/header.jsp" %></header>
      <%-- <nav><%@ include file="../common/aside.jsp" %></nav> --%>
      <br><br><!--  -->
      <section>
      <div style="width:75%; margin-left:auto; margin-right:auto;">
      <!-- <div style="width:90%;"> -->
      <!-- </div> -->
      <table id="titleTb">
         <tr>
            <td>
               <p id="title" style="color:#40a4b6;  font-weight: bolder; margin-top:0; font-size:30px;"><%= si.getSpaceName() %></p>
            </td>
         </tr>
      </table>
      <table id="priceTb">
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
            <td width="100px;"><button id="reserBtn" onclick="test1();" style="float:right;">예  약</button></td>
         </tr>
      </table>
      <table id="iconTb">
         <tr>
            <td id="share" style="padding:10px;"><img src="<%=request.getContextPath() %>/images/icon/share.png" style="width:35px;"></td>
            <td id="heart" style="padding:10px;"><img src="<%=request.getContextPath() %>/images/icon/heart.png" style="width:35px;"></td>
         </tr>
      </table>
      <br>
        <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
      <div class="visual">

         <% for (Image i : imgList) { 
         	String asd = request.getContextPath() + i.getFilePath() +"/"+ i.getChangeName();
         	System.out.println(asd);%>

            <div style="background-image: url(<%= request.getContextPath() + i.getFilePath() + "/" + i.getChangeName()%>); display: block; width: 500px; height: 700px; background-repeat : no-repeat; background-size: cover;"></div>
         <% } %>

      </div>
      
      <br><br>
      <p id="subTitle" style="font-size:30px;">
         <%= si.getSpaceShortIntro() %>
      </p>
      <hr>
      <p id="intro" style="color:#40a4b6; font-size:20px;"><b>
         소개
      </b></p>
      <p id="introInfo">
         <%= si.getSpaceIntro() %>
      </p>
      <br>
      <p id="opTime" style="color:#40a4b6; font-size:20px;"><b>
         운영시간
      </b></p>
      <table id="opTimeTb" style="border-spacing:15px;">
         <tr>
            <td id="mon" style="padding:20px;"><b>월 </b><%= si.getStartTimes()[0] %> ~ <%= si.getEndTimes()[0] %> 시</td>
            <td id="sat" style="padding:20px;"><span style="color:blue;"><b>토 </b></span><%= si.getStartTimes()[5] %> ~ <%= si.getEndTimes()[5] %> 시</td>
         </tr>
         <tr>
            <td id="tue" style="padding:20px;"><b>화 </b><%= si.getStartTimes()[1] %> ~ <%= si.getEndTimes()[1] %> 시</td>
            <td id="sun" style="padding:20px;"><span style="color:red;"><b>일 </b></span><%= si.getStartTimes()[6] %> ~ <%= si.getEndTimes()[6] %> 시</td>
         </tr>
         <tr>
            <td id="wed" style="padding:20px;"><b>수 </b><%= si.getStartTimes()[2] %> ~ <%= si.getEndTimes()[2] %> 시</td>
            <td style="padding:20px;"></td>
         </tr>
         <tr>
            <td id="thu" style="padding:20px;"><b>목 </b><%= si.getStartTimes()[3] %> ~ <%= si.getEndTimes()[3] %> 시</td>
            <td style="padding:20px;"></td>
         </tr>
         <tr>
            <td id="fri" style="padding:20px;"><b>금 </b><%= si.getStartTimes()[4] %> ~ <%= si.getEndTimes()[4] %> 시</td>
            <td style="padding:20px;"></td>
         </tr>
      </table>
      <br><br>
      
      <p id="plus" style="color:#40a4b6; font-size:20px;"><b>
         추가정보
      </b></p>
      <table id="plusTb" style="border-spacing:15px;">
         <tr>
         <% if (si.getSpaceKind() == 2) { %>
            <td id="seatType" style="padding:20px;"><b>좌석유형</b></td>
            <td id="seatTypeInfo" style="padding:20px;">총 좌석수 <%= si.getTotalSeat() %> / 자유석 <%= si.getUnfixSeat() %> / 고정석 <%= si.getFixSeat() %></td>
         <%} else { %>
            <td style="padding:20px;"><b>좌석유형</b></td>
            <td style="padding:20px;"> -</td>
         <%} %>
         </tr>
         <tr>
            <% if (si.getSpaceKind() == 2) { %>
               <td id="accPer" style="padding:20px;"><b>예약 가능 인원</b></td>
               <td id="accperInfo" style="padding:20px;"><%= si.getMaxReserv() %></td>
            <% } else { %>
               <td id="accPer" style="padding:20px;"><b>수용인원</b></td>
               <td id="accperInfo" style="padding:20px;"><%= si.getSpaceContainCount() %></td>
            <% } %>
         </tr>
         <tr>
            <% if (si.getSpaceKind() == 1) { %>
               <td id="stock" style="padding:20px;"><b>재고</b></td>
               <td id="stockInfo" style="padding:20px;"><%= si.getSpaceRoomCount() %></td>
            <% } else { %>
               <td></td>
               <td></td>
            <% } %>
         </tr>
         <tr>
            <% if (si.getSpaceKind() == 1) { %>
               <td id="stock" style="padding:20px;"><b>넓이</b></td>
               <td id="stockInfo" style="padding:20px;"><%= si.getSpaceSize() %></td>
            <% } else { %>
               <td></td>
               <td></td>
            <% } %>
         </tr>
      </table>
      <br><br>
      
      <p id="amenity" style="color:#40a4b6; font-size:20px;"><b>
         편의시설
      </b></p>
      
      <!-- 편의시설 사진들 넣기 -->
      <table id="amenityTb" style="border-spacing:15px;">
         <tr>
            <td style="padding:22px;"><img id="24h" src="<%=request.getContextPath() %>/images/icon/24h.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="365days" src="<%=request.getContextPath() %>/images/icon/365days.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="airCon" src="<%=request.getContextPath() %>/images/icon/airCon.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="animal" src="<%=request.getContextPath() %>/images/icon/animal.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="beam" src="<%=request.getContextPath() %>/images/icon/beam.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="board" src="<%=request.getContextPath() %>/images/icon/board.png" width="100px" style="opacity:0.2;"></td>
         </tr>
         <tr>
            <td style="padding:22px;"><img id="cafe" src="<%=request.getContextPath() %>/images/icon/cafe.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="copyPrint" src="<%=request.getContextPath() %>/images/icon/copyPrint.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="delivery" src="<%=request.getContextPath() %>/images/icon/delivery.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="doorLock" src="<%=request.getContextPath() %>/images/icon/doorLock.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="fax" src="<%=request.getContextPath() %>/images/icon/fax.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="heater" src="<%=request.getContextPath() %>/images/icon/heater.png" width="100px" style="opacity:0.2;"></td>
         </tr>
         <tr>
            <td style="padding:22px;"><img id="kitchen" src="<%=request.getContextPath() %>/images/icon/kitchen.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="locker" src="<%=request.getContextPath() %>/images/icon/locker.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="mail" src="<%=request.getContextPath() %>/images/icon/mail.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="parking" src="<%=request.getContextPath() %>/images/icon/parking.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="rounge" src="<%=request.getContextPath() %>/images/icon/rounge.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="snack" src="<%=request.getContextPath() %>/images/icon/snack.png" width="100px" style="opacity:0.2;"></td>
         </tr> 
         <tr>
            <td style="padding:22px;"><img id="terrace" src="<%=request.getContextPath() %>/images/icon/terrace.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="tv" src="<%=request.getContextPath() %>/images/icon/tv.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="wareHouse" src="<%=request.getContextPath() %>/images/icon/wareHouse.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="waterMachine" src="<%=request.getContextPath() %>/images/icon/waterMachine.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="wifi" src="<%=request.getContextPath() %>/images/icon/wifi.png" width="100px" style="opacity:0.2;"></td>
            <td style="padding:22px;"><img id="plug" src="<%=request.getContextPath() %>/images/icon/plug.png" width="100px" style="opacity:0.2;"></td>
         </tr>
      </table>
     

      <br><br>   
      <p id="usePeriod" style="color:#40a4b6; font-size:20px;"><b>
         환불 정책
      </b></p>
      
      <table id="usePeriodTb">
         <tr>
            <td id="8ago" style="padding:20px;"><b>이용 8일 전</b></td>
            <td id="8agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[8] %> %</td>
         </tr>
         <tr>
            <td id="7ago" style="padding:20px;"><b>이용 7일 전</b></td>
            <td id="7agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[7] %> %</td>
         </tr>
         <tr>
            <td id="6ago" style="padding:20px;"><b>이용 6일 전</b></td>
            <td id="6agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[6] %> %</td>
         </tr>
         <tr>
            <td id="5ago" style="padding:20px;"><b>이용 5일 전</b></td>
            <td id="5agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[5] %> %</td>
         </tr>
         <tr>
            <td id="4ago" style="padding:20px;"><b>이용 4일 전</b></td>
            <td id="4agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[4] %> %</td>
         </tr>
         <tr>
            <td id="3ago" style="padding:20px;"><b>이용 3일 전</b></td>
            <td id="3agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[3] %> %</td>
         </tr>
         <tr>
            <td id="2ago" style="padding:20px;"><b>이용 2일 전</b></td>
            <td id="2agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[2] %> %</td>
         </tr>
         <tr>
            <td id="1ago" style="padding:20px;"><b>이용 1일 전</b></td>
            <td id="1agoInfo" style="padding:20px;"><%= (int)si.getSpaceRefundPolicy()[1] %> %</td>
         </tr>
         <tr>
            <td id="dday" style="padding:20px;"><b>이용 당일</b></td>
            <td id="ddayInfo" style="padding:20px;"><b style="color:red;"><%= (int)si.getSpaceRefundPolicy()[0] %> %</b></td>
         </tr>
      </table>
      <br><br>
                  
      <!-- 카카오맵 api -->
      <p style="margin-top:-12px">
       <em class="link">
        
       </em>
      </p>
      <div id="map" style="width:100%;height:500px;"></div>
      
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8753867c52cc1b48e8686d5c651e256d&libraries=services"></script>
      <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
              level: 3 // 지도의 확대 레벨
          };  
      
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      geocoder.addressSearch('<%=roadAddrPart1%>', function(result, status) {
      
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div style="width:150px;text-align:center;padding:6px 0;"><%= si.getSpaceName()%></div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
      });  
      </script>
      <br>
      <hr>
      
      <p style="font-size:30px;"><b>
         Q & A&nbsp;&nbsp;&nbsp;<span id="qnaCount" style="color:#40a4b6;">1개</span>
      </b></p>
      
      <table>
             <tr>
                <td id="profilePic" rowspan="2"><img src="<%=request.getContextPath() %>/images/etc/lingard.png" style="width:50px;"></td>
                <td id="name"><h3>&nbsp;&nbsp;이호정&nbsp;&nbsp;</h3></td>
             </tr>
             <tr>
                <td id="userQ" colspan="3">&nbsp;&nbsp;고정석으로 개인 데스크탑 비치 가능한가요? 와이파이 외에 개별 Lan선이 있는지도 궁금합니다</td>
             </tr>
             <tr>
                <td></td>
                <td id="userDate" colspan="3"><p style="font-size: 15px; color:#c4c4c4;">&nbsp;&nbsp;2020. 06. 18</p></td>
             </tr>
             <tr>
                <td></td>
                <td id="hostAnswer" colspan="3">&nbsp;&nbsp;<b style="color:#40a4b6; font-size:20px;">호스트의 답</b>&nbsp;&nbsp;</td>
             </tr>
             <tr>
                <td></td>
                <td id="hostA" colspan="3">&nbsp;&nbsp;안녕하세요! 1개월 이상 이용시 고정석 이용(데스크탑 설치가능, 개별 유선랜 1GB속도)가능합니다.</td>
             </tr>
             <tr>
                <td></td>
                <td id="hostDate" colspan="3"><p style="font-size: 15px; color:#c4c4c4;">&nbsp;&nbsp;2020. 06. 18</p></td>
             </tr>
        </table>
      
      <!-- qKind 1 -->
      <div style="width:580px;">
          <h3 style="color:#40a4b6;">큐앤에이 작성</h3>
          <div>
             <textarea rows="4" cols="80" style="resize:none;"></textarea>
            <button type="submit" id="qndBtn">등록</button>
          </div>
      </div>
      
      <br><br>

      <p id="review" style="font-size:30px;"><b>
         이용후기&nbsp;&nbsp;&nbsp;<span id="reviewCount" style="color:#40a4b6;">1개</span>
      </b><span id="avrStar" style="font-size:20px;"><b>&nbsp;&nbsp;&nbsp;평균평점</b></span><span id="avrStarCount" style="color:#40a4b6; font-size:20px;">&nbsp;&nbsp;5</span></p>

      <table id="reviewTb">
             <tr>
                <td id="profilePic" rowspan="2"><img src="<%=request.getContextPath() %>/images/etc/soeasyProf.png" style="width:50px;"></td>
                <td id="userName"><h3>&nbsp;&nbsp;이호정&nbsp;&nbsp;</h3></td>
                <td>
                   <i class="fa fa-star-o reviews" aria-hidden="true"></i>
                   <i class="fa fa-star-o reviews" aria-hidden="true"></i>
                   <i class="fa fa-star-o reviews" aria-hidden="true"></i>
                   <i class="fa fa-star-o reviews" aria-hidden="true"></i>
                   <i class="fa fa-star-o reviews" aria-hidden="true"></i>
                </td>
                <td id="registerBtn" onclick="register();" style="cursor:pointer;"><h5>&nbsp;&nbsp;&nbsp;신고하기</h5></td>
             </tr>
             <tr>
                <td id="reviewInfo" colspan="3">&nbsp;&nbsp;잘썼습니다~~~~</td>
             </tr>
             <tr>
                <td></td>
                <td id="reviewDate" colspan="3"><p style="font-size: 15px; color:#c4c4c4;">&nbsp;&nbsp;2020. 06. 18</p></td>
             </tr>
        </table>
      <br><br><br>
      </div>      
      </section>
      
      <footer><%@ include file="../common/footer.jsp"%></footer>
      <script>
         function test1() {
            location.href="<%=request.getContextPath()%>/intoReservation?spaceNo=<%= si.getSpaceNo()%>";
         }
         
         function register() {
            window.open('registerPop.jsp', 'window팝업', 'width=700px, height=700px, menubar=no, status=no, resizable=no, toolbar=no');  
         }
         
         $('.visual').slick({
              infinite: true,
              speed: 500,
              fade: true,
              cssEase: 'linear',
              autoplay: true,
              autoplaySpeed: 2000,
         });
         
         $(function(){
			<% for (int i = 0; i < si.getConv().length; i++) {%>
 				
        		var conv = "<%=si.getConv()[i]%>";
        				
        		switch(conv) {
        			case '24h' : $("#24h").css({"opacity":"0.9"}); break;
        			case '365days' : $("#365days").css({"opacity":"0.9"}); break;
        			case 'airCon' : $("#airCon").css({"opacity":"0.9"}); break;
        			case 'animal' : $("#animal").css({"opacity":"0.9"}); break;
        			case 'beam' : $("#beam").css({"opacity":"0.9"}); break;
        			case 'board' : $("#board").css({"opacity":"0.9"}); break;
        			case 'cafe' : $("#cafe").css({"opacity":"0.9"}); break;
        			case 'copyPrint' : $("#copyPrint").css({"opacity":"0.9"}); break;
        			case 'delivery' : $("#delivery").css({"opacity":"0.9"}); break;
        			case 'doorLock' : $("#doorLock").css({"opacity":"0.9"}); break;
        			case 'fax' : $("#fax").css({"opacity":"0.9"}); break;
        			case 'heater' : $("#heater").css({"opacity":"0.9"}); break;
        			case 'kitchen' : $("#kitchen").css({"opacity":"0.9"}); break;
        			case 'locker' : $("#locker").css({"opacity":"0.9"}); break;
        			case 'mail' : $("#mail").css({"opacity":"0.9"}); break;
        			case 'parcking' : $("#parcking").css({"opacity":"0.9"}); break;
        			case 'rounge' : $("#rounge").css({"opacity":"0.9"}); break;
        			case 'snack' : $("#snack").css({"opacity":"0.9"}); break;
        			case 'terrace' : $("#terrace").css({"opacity":"0.9"}); break;
        			case 'tv' : $("#tv").css({"opacity":"0.9"}); break;
        			case 'wareHouse' : $("#wareHouse").css({"opacity":"0.9"}); break;
        			case 'waterMachine' : $("#waterMachine").css({"opacity":"0.9"}); break;
        			case 'wifi' : $("#wifi").css({"opacity":"0.9"}); break;
        			case 'plug' : $("#plug").css({"opacity":"0.9"}); break;
        		}
        	<% } %>
         });
        
      </script>
</body>
</html>



    