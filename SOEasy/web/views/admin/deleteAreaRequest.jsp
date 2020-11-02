<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.PageInfo" %>

	

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
		height: 25px;
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
       	text-decoration:none;
       	color : black;
    }
    #wrapper h1{
     	font-size : 30px;
       	font-weight: bolder;
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
	<%
		if (userStatus < 3 || loginUser==null || loginUser.getmStatus().equals("N")) {
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else{ 
			ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>)request.getAttribute("list");
			PageInfo pi = (PageInfo) request.getAttribute("pi");
			 String url = (String)request.getAttribute("url");
			String root = (String)request.getAttribute("root"); 
			
			int listCount = pi.getListCount();
			int currentPage = pi.getCurrentPage();
			int maxPage = pi.getMaxPage();
			int startPage = pi.getStartPage();
			int endPage = pi.getEndPage();
			System.out.println("listSize : "+list.size());
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
							<h1 style="margin: 0;">공간 삭제</h1>
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
										<option value=1>공간삭제</option>
										<option value=2>삭제보류</option>
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
		
		<h1 style="margin : 0;">공간 삭제 요청 내역</h1>
		<form action = "searchDeleteStatus.ad" id="searchDeleteStatus.ad">
		
		<select name ="dStatus" id="dStatus">
		<option value=1>삭제 처리 결과: 전체</option>
		<option value=2>삭제 처리 결과: 대기중</option>
		<option value=3>삭제 처리 결과: 삭제완료</option>
		</select>
		<button style="float:right; height:24px; line-height:20px; margin-right:10px;"type="submit" id="searchOption">조회</button>
		</form>
		<br><br>
		
		
		<table align="center"  style="margin:0; width:100%;"  >
				<tr>
					<th height="40px">공간명</th>
					<th height="40px">공간종류</th>
					<th height="40px">호스트 아이디</th>
					<th height="40px">호스트 이메일</th>
					<th height="40px">호스트 연락처</th>
					<th height="40px">삭제 상태</th>
				</tr>
				

				<%for(int i=0; i<list.size(); i++) {%>
				<tr class="pCompleteInfo">
					<td style="font-size:13px;"><%=list.get(i).get("spaceName")%></td>
					<td><%=list.get(i).get("spaceKind") %></td>
					<td><a href="<%=request.getContextPath()%>/searchId.me?keyword=<%=list.get(i).get("userId")%>"><%=list.get(i).get("userId") %></a></td>
					<td><%=list.get(i).get("userEmail")%> </td>
					<td><%=list.get(i).get("userPhone")%></td>
					<td id="result">
						<select class="stage">
							<option class="statusZone" selected="selected" value=1 style="text-align:center;"><%=list.get(i).get("status") %></option>
							<option>처리하기</option>
						</select>
						<input type=hidden value="<%=list.get(i).get("spaceNo")%>">
					</td>
					
				</tr>
				<script>
				$(function(){
					var text = $('.statusZone:nth(<%=i%>)').text();
					console.log(text);
					if(text == "삭제 완료" ){
						$('.stage:nth(<%=i%>)').attr('disabled',true).css("color","blue");
					}
				});
				</script>
				<%
				
					}
				%>
			</table>
			<br>
			<div class = "pagingArea" align="center">
			<% if(currentPage <= 1) { %>
				<button disabled><</button>
			<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=1'"> << </button>
				<% } %>
			<% if(currentPage <= 1) { %>
			<button disabled><</button>
			<% } else { %>
			<button onclick="location.href='<%=root+url%>currentPage=currentPage=<%=currentPage -1 %>'"><</button>
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
		<%} %>
		<br><br>
	</section>
	
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
	<script>
	
	var userId
	var userEmail
	 var userNo 
	 var spaceName
		$('.stage').change(function(){
			$(this).children('option:nth(0)').prop('selected',"true");
				 userId = $(this).parent().prev().prev().prev().text();
				 userEmail= $(this).parent().prev().prev().text();
			  spaceNo = $(this).siblings('input').val();
				 spaceName = $(this).parent().prev().prev().prev().prev().prev().text();
				 console.log(userId);
				 console.log(userEmail);
				 console.log(userNo);
				 console.log(spaceName);
				
				$('#ment').html(userId+"님의 공간 삭제를 진행합니다");
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
				$('#ordinaryMent option:nth(1)').text("고객님께서 요청하신 "+spaceName+"의 공간 삭제 요청이 정상적으로 처리 되었습니다").val("고객님께서 요청하신 "+spaceName+"의 공간 삭제 요청이 정상적으로 처리 되었습니다");
				$('#ordinaryMent option:nth(2)').text("그동안 SO Easy에 공간을 제공해주셔서 감사합니다.").val("그동안 SO Easy에 공간을 제공해주셔서 감사합니다.");
				$('#ordinaryMent option:nth(3)').text("문의사항이 있으시면 admin@soeasy.com으로 연락주세요").val("문의사항이 있으시면 admin@soeasy.com으로 연락주세요");
			}
			else{
				$('#ordinaryMent option:nth(1)').text("죄송하지만 고객님께서 요청하신 "+spaceName+"의 공간 삭제가 어렵습니다").val("죄송하지만 고객님께서 요청하신 "+spaceName+"의 공간 삭제가 어렵습니다");
				$('#ordinaryMent option:nth(2)').text("해당 공간에 정산 정보를 확인하시어 삭제 요청 취소 후  다시한번 요청해주세요.").val("해당 공간에 정산 정보를 확인하시어 삭제 요청 취소 후  다시한번 요청해주세요.");
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
				url : "/login/deleteSpaceHandling.ad",
				data: { spaceNo : spaceNo,
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
						alert("공간 삭제 처리에 문제가 발생했습니다. 다시 시도해 주세요.");
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