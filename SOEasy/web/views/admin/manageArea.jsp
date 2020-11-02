<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.PageInfo" %>
<%
	String name = "린가드";
	int placeQTY = 10;
	int pCompleteQTY = 10;
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
<meta charset="UTF-8">
<style>
	#wrapper{
		width : 90%;
		margin-left: auto;
		margin-right : auto;
	}
	#wrapper select{
		float : right;
		height: 24px;
	}
	      
    th{
   		background: #E4EEFA;
    	width: 13%;
     	font-size: 17px;
     	font-weight: bolder; 
     	clear:both;
     	}
	       
    .pCompleteInfo td{
       	text-align: center;
       	height : 30px;
       	background : #fff;
    }
   
    .pCompleteInfo td a{
       	text-decoration: underline;
       	color : black;
    }
    
    .stage{
   		display: block;
   		appearance:none;
   		background : transparent;
   		border: none;
  		outline: none;
  		-webkit-appearance:none;
		margin-right:auto;
		font-weight: bolder;
		font-size: 15px; 
		text-align: center;
		width: 100%;
		text-align-last: center;
    }
    .stage,
    .stage option{
    	font-family: 'nanumSquare'
    }
    
    .pCompleteInfo  td a{
    	text-decoration: none;
    }
    .modalArea {
  display: none;
  position: fixed;
  z-index: 10; 
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.modalBg {
  width: 100%;
  height: 100%;
  background-color: rgba(30,30,30,0.9);
}

.modalWrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
  width: 70%;
  max-width: 500px;
  padding: 10px 30px;
  background-color: #fff;
}
#openModal {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
}

#modalTable textarea{
	display: block;
	width: 100%;
	height : 100px;
	
}
#ordinaryMent{
	display: block;
	width : 100%;
}




    
    
</style>
<title>Insert title here</title>
</head>
<body>
	<header><%@ include file="/views/common/header.jsp" %></header>
		<%
		if (userStatus < 3 || loginUser==null || loginUser.getmStatus().equals("N")) {
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else{
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
			PageInfo pi = (PageInfo) request.getAttribute("pi");
			 String url = (String)request.getAttribute("url");
			String root = (String)request.getAttribute("root"); 
			
			int listCount = pi.getListCount();
			int currentPage = pi.getCurrentPage();
			int maxPage = pi.getMaxPage();
			int startPage = pi.getStartPage();
			int endPage = pi.getEndPage();
	%>
	<nav><%@ include file = "/views/common/aside.jsp" %></nav>
	<section>
		<div id="wrapper">
		<br>
		<div id="modalArea" class="modalArea">
				<div id="modalBg" class="modalBg"></div>
				<div class="modalWrapper">
					<div class="modalContents">
						<div style="background: #E4EEFA; text-align: center; width: 100%;">
							<h1 style="margin: 0;">검수 처리</h1>
						</div>
						<br>
						<form>
						<table align="center" id ="modalTable">
							<tr>
								<td> <p align="center" style="font-size: 30px;" id="ment"></p>
								<input type="hidden" id="hiddenProcess">
								</td>
							</tr>
							<tr>
								<td><p align="center">전달할 이메일 : <label id="userEmail"></label></p></td>
							</tr>
							
							<tr>
								<td>
									<select id="ordinaryMent">
											<option selected disabled>자주 쓰는 문구</option>
											<option></option>
											<option></option>								
											<option></option>								
									</select>
								</td>
							</tr>
							<tr>
								<td><textarea placeholder="메일 내용을 입력하세요" id="mailResource"></textarea></td>
							</tr>
							
							<tr>
								<td>
									<div style="width: 50%; margin-left: auto; margin-right: auto;" id="buttonZone">
										<button type="button" style="margin-right: 10px;" onclick="solveRequest();">완료</button>
										<button type="button" onclick="closeModal();">취소</button>
									</div>
								</td>
							</tr>
						</table>
						</form>
						
					</div>

				</div>
			</div>
		<h1 style="margin : 0; font-weight: bolder;">전체 공간 관리 </h1>
		<select>
		<option>검수 결과: 전체</option>
		</select>
		<select>
		<option>공간 종류 : 전체</option>
		</select>
		<input type="date" name=date style="float:right;" id="dateSelect"> 
		<br><br>
		
		<table align="center"  style="margin:0; width:100%;"  >
				<tr>
					<th rowspan="2" colspan="2" height="40px">공간명</th>
					<th rowspan="2" height="40px">공간종류</th>
					<th rowspan="2" height="40px">호스트 아이디</th>
					<th rowspan="2" height="40px">호스트 이메일</th>
					<th rowspan="2" height="40px">호스트 연락처</th>
					<th rowspan="2" height="40px">등록 상태</th>
					<th rowspan="2" height="40px">등록서 보기</th>
				</tr>
				<tr>
				</tr>

				<%for(int i=0; i<list.size(); i++) {%>
				<tr class="pCompleteInfo">
					<td  class="spaceNameZone" style="font-size:13px;"><a href="<%=request.getContextPath()%>/selectOneSpaceInfo?spaceNo=<%=list.get(i).get("spaceNo")%>"><%=list.get(i).get("spaceName")%></a>
					<input type = hidden value=<%=list.get(i).get("spaceNo")%> class="hiddenSpaceNo">
					</td>
					<td colspan="2"><%=list.get(i).get("spaceKind") %></td>
					<td class="userIdZone"><a href="<%=request.getContextPath()%>/searchId.me?keyword=<%=list.get(i).get("userId")%>"><%=list.get(i).get("userId") %></a></td>
					<td class="emailZones"><%=list.get(i).get("userEmail")%> </td>
					<td><%=list.get(i).get("userPhone")%></td>
					
					<td id="result">
						<select class="stage">
							<option selected="selected"  style="text-align:center;"><%=list.get(i).get("status")%></option>
							<option value=1 style="color: blue;">검수 거절</option>
							<option value=2 style="color : red;">검수 완료</option>
						</select>
						<form action="">
						<input type = hidden value=<%=list.get(i).get("memberNo") %>>
						</form>
					</td>
					<td><a href="공간 등록서 보기">자세히 보기</a></td>
				</tr>
				<script>
					var status = $('.stage option:nth(<%=i%>)').text();
					if(status != "검수 대기중"){
						$('.stage:nth(<%=i%>)').attr("disabled",true);
					}
					switch(status){
					case "검수 대기중" : $('.stage:nth(<%=i%>)').css("color","purple"); break;
					case "삭제 대기중" : $('.stage:nth(<%=i%>)').css("color","red"); break;
					default : break;
					}
				</script>
				<%
					}
				%>
			</table>
			<br><br>
			<div class = "pagingArea" align="center">
			<% if(currentPage <= 1) { %>
				<button disabled><</button>
			<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=1'"> << </button>
				<% } %>
			<% if(currentPage <= 1) { %>
			<button disabled><</button>
			<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=<%=currentPage -1 %>'"><</button>
			<% } %>
			
			<% for(int p = startPage; p<= endPage; p++){ 
				if(p == currentPage){
			%>	
					<button disabled><%= p %></button>
			<% 	} else { %>
					<button onclick="location.href='<%=root+url%>currentPage=<%=p%>'"><%=p %></button>
			<% 	  }
			   }	
				%>
			
			<% if(currentPage >= maxPage) { %>
			<button disabled>></button>
			<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=<%=currentPage +1 %>'">></button>
			<% } %>
			
				<% if(currentPage >= maxPage) { %>
				<button disabled>></button>
				<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=<%=maxPage%>'">>></button>
				<% } %>
		</div>
		</div>
	</section>
	<% } %>
	<br><br>
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
	<script>
	 document.getElementById('dateSelect').value = new Date().toISOString().substring(0, 10);
	 var processStyle;
	 var processValue;
		var userEmail
		var spaceNo 
		
		var userId
		var spaceName
		$('.stage').change(function(){
				spaceName = $(this).parent().siblings(".spaceNameZone").children('a').text();
				userId = $(this).parent().siblings(".userIdZone").children('a').text();
				processStyle = $(this).children('option:selected').text(); 
				processValue = $(this).children('option:selected').val();
				spaceNo = $(this).parent().siblings(".spaceNameZone").children('input').val();
				$('#hiddenProcess').val(processValue);
			$(this).children('option:nth(0)').prop('selected',"true");
				 userEmail= $(this).parent().siblings('.emailZones').text();
				 console.log(userEmail);
				 
				
				$('#ment').html(userId+"님의 <br>"+spaceName+" 공간의 <br>"+processStyle+"를 진행합니다");
				$('#userEmail').text(userEmail);
				$('#mailResource').text("");
				if( processStyle=="검수 완료"){
					$('#ordinaryMent option:nth(1)').text("고객님의 공간 검수가 승인 되었습니다.").val("고객님의 공간 검수가 승인 되었습니다.");
					$('#ordinaryMent option:nth(2)').text("SO EASY의 호스트가 되어주셔서 감사합니다.").val("SO EASY의 호스트가 되어 주셔서 감사합니다.");
					$('#ordinaryMent option:nth(3)').text("문의사항이 있으시면 admin@soeasy.com으로 연락주세요").val("문의사항이 있으시면 admin@soeasy.com으로 연락주세요");
				}
				else if(processStyle == "검수 거절"){
					$('#ordinaryMent option:nth(1)').text("죄송하지만 고객님의 공간 검수가 거절 되었습니다.").val("죄송하지만 고객님의 공간 검수가 거절 되었습니다.");
					$('#ordinaryMent option:nth(2)').text("누락된 정보가 있는지 파악하시어 다시 등록 부탁드립니다.").val("누락된 정보가 있는지 파악하시어 다시 등록 부탁드립니다.");
					$('#ordinaryMent option:nth(3)').text("문의사항이 있으시면 admin@soeasy.com으로 연락주세요").val("문의사항이 있으시면 admin@soeasy.com으로 연락주세요");
				}
				
				$('#modalArea').fadeIn();
				 
				 
				 
				 $('#closeModal , #modalBg').click(function(){
					    $('#modalArea').fadeOut();
					  });
		});
		
		function closeModal(){
			 $('#modalArea').fadeOut();
		}
		
		$('#processType').change(function(){
			
		});
		
		$('#ordinaryMent').change(function(){
			var ment = $(this).val();
			
			var resource = $('#modalTable textarea').val();
			$('#modalTable textarea').html(resource+ment+"\n");
		});
		
		function solveRequest(){
			
			var emailContent = $('#mailResource').val();
			var processType = $('#hiddenProcess').val();
			console.log(userId);
			console.log(userEmail);
			console.log(processType);
			console.log(emailContent);
			
			$.ajax({
				url : "/login/waitHandling.ad",
				data: { 
						userId : userId,
						spaceNo : spaceNo,
						userEmail : userEmail,
						processType: processType,
						emailContent: emailContent},
				success: function(data){
					console.log(data);
					if(data=="success"){
						alert("요청 처리가 완료되었습니다.");
						location.reload(true); //새로고침
					}else{
						alert("검수 처리에 문제가 발생했습니다. 다시 시도해 주세요.");
						 $('#modalArea').fadeOut();
					}
				},
				error: function(data){
					console.log("실패");
				}
			});
		}
	</script>
</body>
</html>