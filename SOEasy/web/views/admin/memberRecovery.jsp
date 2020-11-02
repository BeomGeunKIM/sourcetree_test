<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.PageInfo,
    com.kh.login.member.model.vo.RecoverMember"
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
       #wrapper h1{
       	font-size : 30px;
       	font-weight: bolder;
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
.pCompleteInfo p{
	font-size: 17px;
	font-weight: bolder;
	font-family: 'nanumSquare';
}

.rStatus{
	width: 100%;
	border: none;
	appearence : none;
	text-align-last : center;
	font-size : 17px;
	font-weight : bolder;
	font-family: 'nanumSquare';
	
}


#openModal {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
}

#modalTable p{ 
	font-size: 25px;
	font-weight: bolder;
	
	
}
#modalTable p label{
	color : #3DB6AE;

}
#processType{
	display: block;
	width: 100%;
	height :30px;
	font-size: 20px;
	font-weight : bolder;
	font-family: 'nanumSquare';
	text-align-last : center;
	border-color: gray;
	border-radius: 10px;
}
#modalTable tr{
	height: 50px;
}

#buttonZone button{
	background : #3DB6AE;
	border-radius: 10px;
	border: none;
	width: 100px;
	height: 40px;
	font-size: 25px;
	font-weight: bolder;
}
#buttonZone button:focus{
	outline: none;
	border: none;
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
	<% if (userStatus < 3 || loginUser==null || !loginUser.getmStatus().equals("Y")) {
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else{

			ArrayList<RecoverMember> list = (ArrayList<RecoverMember>) request.getAttribute("recoverList");
			PageInfo pi = (PageInfo) request.getAttribute("pi");
			 String url = (String)request.getAttribute("url");
			String root = (String)request.getAttribute("root"); 
			
			int listCount = pi.getListCount();
			int currentPage = pi.getCurrentPage();
			int maxPage = pi.getMaxPage();
			int startPage = pi.getStartPage();
			int endPage = pi.getEndPage();
			ArrayList<Integer> memNoArr = new ArrayList<>();
			ArrayList<Integer> rNumArr = new ArrayList<>();
			ArrayList<String> idArr = new ArrayList<>();
			ArrayList<String> contents = new ArrayList<>();
			ArrayList<String> emailArr = new ArrayList<>();
			ArrayList<String> requestDate = new ArrayList<String>();
			ArrayList<String> rstatusArr = new ArrayList<String>();
			
			for(RecoverMember rm: list){
				memNoArr.add(rm.getMemberNo());
				rNumArr.add(rm.getrNum());
				idArr.add(rm.getUserId());
				contents.add(rm.getDropReason());
				emailArr.add(rm.getEmail());
				requestDate.add(rm.getRequestDate().toString());
				switch(rm.getrStatus()){
				case 1:rstatusArr.add("대기");break;
				case 2:rstatusArr.add("복구완료");break;
				case 3:rstatusArr.add("거절됨");break;
				}
			}	
			%>
	<nav><%@ include file = "/views/common/aside.jsp" %></nav>
	<section>
		<br>
		<div id="wrapper">
		
			<div id="modalArea" class="modalArea">
				<div id="modalBg" class="modalBg"></div>
				<div class="modalWrapper">
					<div class="modalContents">
						<div style="background: #E4EEFA; text-align: center; width: 100%;">
							<h1 style="margin: 0;">회원 복구</h1>
						</div>
						<br>
						<form>
						<table align="center" id ="modalTable">
							<tr>
								<td> <p align="center" style="font-size: 30px;" id="ment"></p></td>
							</tr>
							<tr>
								<td><p align="center">전달할 이메일 : <label id="userEmail"></label></p></td>
							</tr>
							<tr>
								<td>
									<select id="processType">
										<option disabled="disabled" selected="selected">처리방식 선택</option>
										<option value=2>복구승인</option>
										<option value=3>거절</option>
									</select>
								</td>
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
			
		<br>
		<h1 style="margin : 0;">회원 복구 신청 내역</h1>
		<form action="/login/searchRstatus.me" id="searchRstatusForm">
		<select name="rStatus" id="statusSearch">
		<option value=4>복구 처리 여부 : 전체</option>
		<option value=1>복구 처리 여부 : 대기</option>
		<option value=2>복구 처리 여부 : 완료</option>
		<option value=3>복구 처리 여부 : 거절</option>
		</select>
		</form>
		<br><br>
		
		<table align="center"  style="margin:0; width:100%;"  >
				<tr>
					<th height="40px">처리번호</th>
					<th height="40px">아이디</th>
					<th height="40px">회원 탈퇴 사유</th>
					<th height="40px">복구 안내 이메일</th>
					<th height="40px">복구 요청 일</th>
					<th height="40px">복구 처리 여부</th>
					
				</tr>
				

				<%for(int i=0; i<list.size(); i++) {%>
				<tr class="pCompleteInfo">
					<td style="font-size:13px;"><p><%=rNumArr.get(i)%></p></td>
					<td><p><%=idArr.get(i) %></p></td>
					<td><p><%=contents.get(i)%></p></td>
					<td><p><%=emailArr.get(i)%></p></td>
					<td><p><%=requestDate.get(i)%></p></td>
					<td>
						<select class="rStatus">
							<option><%=rstatusArr.get(i)%></option>
							<option>복구요청 처리</option>
						</select>
						<input type="hidden" value=<%=idArr.get(i)%> class="hiddenId">
						<input type="hidden" value=<%=emailArr.get(i)%> class="hiddenEmail">
						<input type="hidden" value=<%=memNoArr.get(i)%> class="hiddenMemNo"> 
					</td>

				</tr>
				
				<script>
					$(function() {
						var sen = $('.rStatus:nth(<%=i%>)').val();
						switch (sen) {
						case "대기":
							$('.rStatus:nth(<%=i%>)').css("color", "purple");
							$('.rStatus:nth(<%=i%>) option:nth(1)').css("color","black");
							break;
						case "복구완료":
							$('.rStatus:nth(<%=i%>)').css({color: "blue",appearance:"none" }).attr("disabled", true);
							break;
						case "거절됨":
							$('.rStatus:nth(<%=i%>)').css({color: "red",appearance:"none" }).attr("disabled", true);
							break;
						}
					});
					/* appearance:none; */
			  		
					
				</script>
				<%
					}
				%>
			</table>
				<br>
			
		
				
			<div class = "pagingArea" align="center">
			<% if(currentPage == 1) { %>
			<button disabled><</button>
			<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=1'"> << </button>
			<% } %>
			<% if(currentPage == 1) { %>
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
		<% } %>
	</section>
	<br><br>
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
	<script>
	$('#statusSearch').change(function(){
		$('#searchRstatusForm').submit();
	})
	
	var userId;
	var userEmail
	var userNo
	$('.rStatus').change(function(){
		$(this).children('option:nth(0)').prop('selected',"true");
			 userId = $(this).next().val();
			 userEmail= $(this).next().next().val();
			 userNo = $(this).next().next().next().val();
			
			$('#ment').html(userId+"님의 회원 복구를 진행합니다");
			$('#userEmail').text(userEmail);
			 $('#modalArea').fadeIn();
			 
			 $('#closeModal , #modalBg').click(function(){
				    $('#modalArea').fadeOut();
				  });
	});
	
	function closeModal(){
		 $('#modalArea').fadeOut();
	}
	
	$('#processType').change(function(){
		$('#mailResource').text("");
		if($('#processType').val() ==2){
			$('#ordinaryMent option:nth(1)').text("고객님의 회원 복구가 완료 되었으니 사용하셔도 됩니다.").val("고객님의 회원 복구가 완료 되었으니 사용하셔도 됩니다.");
			$('#ordinaryMent option:nth(2)').text("다시 SO EASY의 회원이 되어주셔서 감사합니다.").val("다시 SO EASY의 회원이 되어주셔서 감사합니다.");
			$('#ordinaryMent option:nth(3)').text("문의사항이 있으시면 admin@soeasy.com으로 연락주세요").val("문의사항이 있으시면 admin@soeasy.com으로 연락주세요");
		}
		else{
			$('#ordinaryMent option:nth(1)').text("죄송하지만 고객님의 계정은 복구가 불가능 합니다.").val("죄송하지만 고객님의 계정은 복구가 불가능 합니다.");
			$('#ordinaryMent option:nth(2)').text("다시 한번 고객님의 요청에 만족 시키지 못하여 죄송합니다.").val("다시 한번 고객님의 요청에 만족 시키지 못하여 죄송합니다.");
			$('#ordinaryMent option:nth(3)').text("문의사항이 있으시면 admin@soeasy.com으로 연락주세요").val("문의사항이 있으시면 admin@soeasy.com으로 연락주세요");
		}
	});
	
	$('#ordinaryMent').change(function(){
		var ment = $(this).val();
		
		var resource = $('#modalTable textarea').val();
		$('#modalTable textarea').html(resource+ment+"\n");
	});
	
	function solveRequest(){
		
		var emailContent = $('#mailResource').val();
		var processType = $('#processType').val();
		console.log(userId);
		console.log(userEmail);
		console.log(processType);
		console.log(emailContent);
		console.log(userNo)
		$.ajax({
			url : "/login/recoverHandling.me",
			data: { userNo : userNo,
					userId : userId,
					userEmail : userEmail,
					processType: processType,
					emailContent: emailContent},
			success: function(data){
				console.log(data);
				if(data=="success"){
					alert("요청 처리가 완료되었습니다.");
					location.reload(true); //새로고침
				}else{
					alert("복구 처리에 문제가 발생했습니다. 다시 시도해 주세요.");
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