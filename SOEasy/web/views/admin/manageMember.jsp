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
	#wrapper a{
		text-decoration: none;
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
       
      #adminMemo{
       
       	width: 100%;
       	outline : none;
       	border: none;
       	margin: 0px;
       	height: 30px;
       	text-align: center;
      
       
       }
       #wrapper h1{
       	font-size : 30px;
       	font-weight: bolder;
       }
       
        .stage{
   		display: block;
   		appearance:none;
  		-webkit-appearance:none;
   		background : transparent;
   		border: none;
  		outline: none;
		margin-right:auto;
		
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
#searchZone{
	border: 2px solid gray;
	border-radius: 10px;
	padding: 2px;
	
	border-collapse: collapse;
	
}
#searchId{
	
	width: 200px;
	border:none;
	outline:none;
	background : none;

}
#searchZone input[name=transfer]{
	border-radius : 10px;
	border: none;
	outline: none;
	
	
	
	
	
}
</style>
<title>SO Easy</title>

</head>
<body>
	
	<header><%@ include file="/views/common/header.jsp" %></header>
 	<%
		if (userStatus < 3 || loginUser==null || loginUser.getmStatus().equals("N")) {
			request.setAttribute("msg", "잘못된 경로입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else{

			ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("memberList");
			PageInfo pi = (PageInfo) request.getAttribute("pi");
			 String url = (String)request.getAttribute("url");
			String root = (String)request.getAttribute("root"); 
			
			int listCount = pi.getListCount();
			int currentPage = pi.getCurrentPage();
			int maxPage = pi.getMaxPage();
			int startPage = pi.getStartPage();
			int endPage = pi.getEndPage();
			ArrayList<String> idArr = new ArrayList<>();
			ArrayList<String> nameArr = new ArrayList<>();
			ArrayList<String> typeArr = new ArrayList<>();
			ArrayList<String> isActiveArr = new ArrayList<>();
			ArrayList<String> phoneArr = new ArrayList<>();
			ArrayList<String> emailArr = new ArrayList<>();
			for (Member m : list) {
				System.out.println(m);
				idArr.add(m.getmId());
				nameArr.add(m.getmName());
				switch (m.getpType()) {
				case 1:
					typeArr.add("게스트");
					break;
				case 2:
					typeArr.add("호스트");
					break;
				case 3:
					typeArr.add("관리자");
					break;
				}
				switch (m.getmStatus()) {
				case "Y" : isActiveArr.add("활성화"); break;
				case "X" : isActiveArr.add("정지"); break;
				case "N" : isActiveArr.add("탈퇴"); break;
				case "W" : isActiveArr.add("복구요청"); break;
				} 
				
				phoneArr.add(m.getmPhone());
				emailArr.add(m.getmEmail());
			}
			System.out.println("startpage: " + startPage);
			System.out.println("endPage : " + endPage);
			
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
							<h1 style="margin: 0;">경고</h1>
						</div>
						<br>
						<p align="center" style="font-size: 30px;" id="blockMan"></p>
						<div
							style="width: 50%; margin-left: auto; margin-right: auto; align: center;"
							id="buttonZone">
							<button style="margin-right: 10%;" onclick="blockMember();">네</button>
							<button onclick="closeModal();">아니오</button>
						</div>
					</div>

				</div>
			</div>
			<br>
		<h1 style="margin : 0;">회원 목록</h1>
		<br>
			
		<form action="searchOption.me">
		<button style="float:right; height:20px; line-height:20px;"type="submit" id="searchOption">조회</button>
		<select name="isActive">
		<option value=1>계정 활성화 여부: 전체</option>
		<option value=2>계정 활성화 여부: 활성</option>
		<option value=3>계정 활성화 여부: 비활성</option>
		</select>
		<select name="power">
		<option value=1>권한 : 전체</option>
		<option value=2>권한 : 게스트</option>
		<option value=3>권한 : 호스트</option>
		</select>
	
		</form>
		
				<form action="searchId.me"  id="searchFormes">
				<label>아이디 검색</label>
				<span  id="searchZone">
				<input type="search" name="keyword" id="searchId">
				<input type="button" name="transfer" value="검색" onclick="searchMembers();">
				</span>
				</form>
			
		<br><br>
		
			
		<table align="center"  style="margin:0; width:100%;"  >
				<tr>
					<th height="40px">아이디</th>
					<th height="40px">이름</th>
					<th height="40px">권한</th>
					<th height="40px">계정 활성화 여부</th>
					<th height="40px">연락처</th>
					<th height="40px">이메일</th>
					<th height="40px">예약 내역 보기</th>
				</tr>
				

				<%for(int i=0; i<list.size(); i++) {%>
				<tr class="pCompleteInfo">
					<td>
						<select class="stage" name="block">
							<option value=1><%=idArr.get(i)%></option>
							
							<option value=2>영구 정지</option>
						</select>
					</td>
					<td><%=nameArr.get(i)%></td>
					<td><%=typeArr.get(i) %></td>
					<td><%=isActiveArr.get(i)%> </td>
					<td><%=phoneArr.get(i) %></td>
					<td><%=emailArr.get(i) %>
					<td><p style="margin :0;" class="showMemberReserve">보기</p>
						<form class="transMemNo" action = "<%=request.getContextPath()%>/adminFindReserve.ad" method ="post">
							<input type= hidden name ="memberNo" value=<%=list.get(i).getMemberNo() %>>
							<input type= hidden name ="userName" value=<%=list.get(i).getmName() %>>
						</form>
					</td>
				</tr>
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
		<%} %>
	</section>
	<br><br>
	<footer><%@ include file = "/views/common/footer.jsp" %></footer>
	<script>
	$('.showMemberReserve').click(function(){
		$(this).siblings('.transMemNo').submit();
	});
	
	
	
	var blockDays; //정지 일자
	var blockUser; //정지당할 사람
	function closeModal(){
		 $('#modalArea').fadeOut();
	}
	
	function blockMember(){
		
		
		  $.ajax({
			 url:"/login/blockMember.me",
			 data:{
				 	blockUser:blockUser
			 	  },
			 success: function(data){
				 console.log(data);
				 if(data=="ok"){
				
				 alert("해당 회원이 정지 되었습니다");
				 $('#modalArea').fadeOut();
				 location.reload(true); //새로고침
				 }else{
					 alert("알수없는 오류로 정지에 실패하였습니다.");
					 $('#modalArea').fadeOut();
				 }
			 },
			 error: function(data){
				 console.log("실패");
			 }
		  	 
		 }) 
		
		 
	}
	
	function searchMembers(){
		var userId = $('#searchId').val
		
		if(userId==""){
			location.reload(true);
		}else{
			$('#searchFormes').submit();
		}
		
	
	}
		
	$(function(){
		
		
		$('.stage').change(function(){
			
			var num = $(this).val();
			blockDays = num;
			blockUser = $(this).children('option:nth(0)').text();
			$(this).children('option:nth(0)').prop('selected',"true");
			if(num >1){
				$('#blockMan').html(blockUser+"님을 정말 영구 정지 <br>하시겠습니까?");
				 $('#modalArea').fadeIn();
				 
				 $('#closeModal , #modalBg').click(function(){
					    $('#modalArea').fadeOut();
					  });
			
			}
		});
		
	});
	</script>
	
	
</body>
</html>