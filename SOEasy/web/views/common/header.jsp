 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.login.member.model.vo.Member"%>
<%
	Member loginUser =(Member)session.getAttribute("loginUser");
	int userStatus=0;
	if(loginUser!=null && loginUser.getmStatus().equals("Y")){
		userStatus = loginUser.getpType();
		System.out.println(userStatus);
	} 

	
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<style>


#headerWrap input {
	height: 10%;
	display: inline;
}

.subMenu {
	
	display: inline-block;
	width: 120px;
	height: 60px;
	margin: 0 auto;
	
	align: center;
	font-size: 20px;
	font-weight: bold;
	float: right;
	
}
.subMenu a{
	
	text-decoration : none;
	color: black;
	text-align: center;
	display: inline;
	font-family: 'NanumSquare', sans-serif;
	
}

#logo {
	width: 58px;
	height: 58px;
	display: inline;
	float: left;
}


#searchBar {
	display: block;
	width: 450px;
	height: 100px;
	margin: 0 auto;
	margin-left: 10px;
	border: none;
	padding: 16px;
	/* text-align: center; */
	font-size: 20px;
	font-family: 'NanumSquare', sans-serif;
}
#searchBar:focus {
	border-style: none;
	outline: none;
}



#searchOn {
	vertical-align: middle;
	background: none;
	outline: none;
	border: none;
	
}

#headerWrap form {
	display: inline-block;
	width: 550px;
	border-style: solid;
	border-width: 2px;
	border-radius: 10px;
	clear:both;
}

.sub:hover {
	font-size: 1.3em;
}

</style>
<body>
	<div id="headerWrap">
		<span class="subMenu"><br>
		<a href="/login/views/member/join.jsp" class="sub" id="firstHeaderMenu">회원가입</a></span> <span
			class="subMenu"><br>
		<a href="/login/views/member/loginForm.jsp" class="sub" id="secondHeaderMenu">로그인</a></span> <span
			class="subMenu"><br>
		<a href="/login/views/space/insertSpaceStep1.jsp" class="sub" align="center" id="thirdHeaderMenu">공간 등록</a></span> <span class="subMenu"><br>

		<a href="/login/selectList.no" class="sub" align="center" id="fourthHeaderMenu">공지 사항</a></span> &nbsp;&nbsp;
		<form action="/login/select.se" method="get" id="searchForm"> 


			<input type="search" name="search" id="searchBar" placeholder="검색어를 입력하세요">
			 <button type="submit" id="searchOn"><img src="/login/images/icon/search.png" width="40px" height="40px"></button>	
			
		</form>
		<img src="/login/images/logo/logo1.png" alt="로고 사진" id="logo"
			onclick="location.href='<%=request.getContextPath()%>'">


	</div>
	<script>
		 var userStatus = <%=userStatus%>;
		$(function(){
			switch(userStatus){
			case 1:$('#firstHeaderMenu').attr("href","<%=request.getContextPath()%>/logout.me").text("로그아웃");
		    $('#secondHeaderMenu').attr("href","/login/views/member/updateMember.jsp").text("마이페이지"); break;
			case 2: $('#firstHeaderMenu').attr("href","<%=request.getContextPath()%>/logout.me").text("로그아웃");
				    $('#secondHeaderMenu').attr("href","<%=request.getContextPath()%>/selectReserve.ho").text("마이페이지"); break;
					
			case 3: $('#firstHeaderMenu').attr("href","<%=request.getContextPath()%>/logout.me").text("로그아웃");
					$('#secondHeaderMenu').attr("href","<%=request.getContextPath()%>/selectAll.me").text("회원관리"); 
					$('#thirdHeaderMenu').attr("href","/login/adminHome.ad").text("관리자홈"); break; 
			
			default: break;
				
			}
			
		});
		/* $(function(){
			$("#searchOn").click(function(){
				var value = $("#searchBar").val();
				
				$.ajax({
					url: "select.se",
					type: "get",
					data: {value: value},
					success: function(data) {
						console.log(data);
						console.log("서버 전송 성공");
					},
					error: function(error) {
						console.log("실패");
					},
					complete: function(){
						console.log("asdfsa");
					}
				});
			});
		}); */
	</script>


</body>