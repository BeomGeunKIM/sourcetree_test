<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.login.host.manageReserve.model.vo.*" %>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.photobox {
	padding: 20px;
	padding-bottom: 10px;
}

h1 {
	margin: 0 auto;
}

.space-title-photo {
	border-radius: 10px;
	margin: 0 auto;
	padding: 0;
	display: block;
	width: 400px;
	height: 265px;
}



#themeList button{
	width: 200px;
	height :150px;
	background :#E9F6FD;
	margin-left: 10px;
	border-radius : 5px;
	border-style: none;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);
	font-size : 20px;
	font-weight: bolder;
}
#themeList button:hover{
	background : #75CDFF;
	color : white;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);
}
#localList table tr td button {
	font-size: 20px;
	font-weight : bolder;
	border:none;
	background: none;
	
}
#localList table tr td button:hover{
	color:#3DB6AE;
}

#localList table tr td button:focus{
	border:none;
	outline: none;
	
}
#localList table{
	margin-left:auto;
	margin-right: auto;
	margin-bottom:20px;
}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="/login/css/layout.css">




</head>
<body>


	<header>
		<%@ include file="../common/header.jsp"%>
	</header>
		
	<section>

		  


		<%@ include file="../common/slider.jsp" %>
		<br>
		<div style="width:90%; margin-left:auto; margin-right:auto;">
		<h1>테마전!</h1>
		<div style="display:inline-block; width:60%;" id="themeList" >
			<button type="button" class="themeButton" value="코워킹스페이">외근이 잦아요!<br> 코워킹 스페이스</button>
			<button type="button" class="themeButton" value="오피스">직원이 많아요!<br>임대사무실</button>
			<button type="button" class="themeButton" value="라운지">하루만 이용!<br> 코워킹라운지</button>
			<br><br>
		</div>
		
		<div style="display: inline-block; width: 30%; background : #EBEBEB; border-radius:5px;" id="localList">
			
			<table align="center" style=" width:90%; ">
			
				<tr>
					<th colspan="4" style="text-align:center" ><p style="font-size:20px; font-weight:bolder;">지역별 검색</p></th>
				</tr>
				<tr>
					<td><button type="button" value="종로구" class="localButton">종로구</button></td>
					<td><button type="button" value="강남구" class="localButton">강남구</button></td>
					<td><button type="button" value="서초구" class="localButton">서초구</button></td>
					<td><button type="button" value="관악구" class="localButton">관악구</button></td>
				</tr>
				<tr>
					<td><button type="button" value="동작구" class="localButton">동작구</button></td>
					<td><button type="button" value="송파구" class="localButton">송파구</button></td>
					<td><button type="button" value="마포구" class="localButton">마포구</button></td>
					<td><button type="button" value="구로구" class="localButton">구로구</button></td>
				</tr>
				<tr>
					<td><button type="button" value="용산구" class="localButton">용산구</button></td>
					<td><button type="button" value="은평구" class="localButton">은평구</button></td>
					<td><button type="button" value="강북구" class="localButton">강북구</button></td>
					<td><button type="button" value="중구" class="localButton">중구</button></td>
				</tr>
				<tr>
					<td><button type="button" value="인천시" class="localButton">인천시</button></td>
					<td><button type="button" value="성남시" class="localButton">성남시</button></td>
					<td><button type="button" value="수도권" class="localButton">수도권</button></td>
					<td><button type="button" value="기타지역" class="localButton">기타지역</button></td>
				</tr>
			
			</table>
		</div>
		<br><br>
		
		<h1>NOW 인기 공간</h1>
		<%
		String search = (String)request.getAttribute("search");
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
		
		PageInfo pi = (PageInfo) request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		int requestCount = pi.getRequestCount();
		int limit = pi.getLimit();
	    String url = (String)request.getAttribute("url");
		String root = (String)request.getAttribute("root"); 
		ArrayList <Integer> spaceNoArr = new ArrayList<>();
		ArrayList <String> filePathArr = new ArrayList<>();
		ArrayList <String> changeNameArr = new ArrayList<>();
		ArrayList <String> spaceNameArr = new ArrayList<>();
		ArrayList <String> spaceShortIntroArr = new ArrayList<>();
		ArrayList <String> spacePriceArr = new ArrayList<>();
		ArrayList <String> location = new ArrayList<>();
		
		for(HashMap<String,Object>hmap : list){
			
			spaceNoArr.add((int)hmap.get("spaceNo"));
			filePathArr.add((String)hmap.get("filePath"));
			changeNameArr.add((String)hmap.get("changeName"));
			spaceNameArr.add((String)hmap.get("spaceName"));
			spaceShortIntroArr.add((String)hmap.get("spaceShortIntro"));
			
			int price = (int)hmap.get("monthPay");
			String unit = "/ 개월";	
			if(price == 0){
				price = (int)hmap.get("dayPay");
				unit = "/ 일";
			}
			spacePriceArr.add(price+unit);
			String locateEx = (String)hmap.get("spaceLocationFilter");
			String[] locateArr = locateEx.split(",");
			String locate = "";
			for(int i=1; i<locateArr.length; i++){
				if(i==1){
				 locate +=locateArr[i];
				}else{
					locate +=" "+locateArr[i];
				}	
			}
			location.add(locate);
			
		}
		
		
		
		%>
		<table align="center"  id="spaceBoard">
		
			<tr>
			<%int col = 4;
		  for( int i = 0; i<list.size(); i++){
			  
		
			  %>
			  <%if(i%3==0){ %>
			  </tr><tr>
			  <% } %>
					<td class="photobox">
						<article>
							<form  action=/login//selectOneSpaceInfo>
								<input type="hidden" name="spaceNo"
									value=<%=spaceNoArr.get(i)%>>
							</form>
							<img class="space-title-photo"
								src="<%=request.getContextPath() + filePathArr.get(i)+"/" + changeNameArr.get(i)%>"
								width="400" height="265">
							<p><%=spaceNameArr.get(i)%></p>
							<p><%=spaceShortIntroArr.get(i)%></p>
							<p>
								가격 :
								<%=spacePriceArr.get(i)%></p>
								
								<p style="font-size:10px">지역 :
								<%= location.get(i) %></p>
						</article>
					</td>

					<% } %>	
		 	
			</tr>
		</table>
			
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
	</section>
	<br><br><br>
	<footer><%@ include file="../common/footer.jsp"%></footer>
	<script>
		// 게시물이 클릭하면  게시물 쿼리스트링이 붙은 소개글 페이지로 이동
		$('article').click(function(){
			var spaceNo = $(this).children('form').children('input').val();
			console.log(spaceNo);
			$(this).children('form').submit();
		})
		
		//
		$('.localButton').click(function(){
			var value = $(this).val();
			console.log(value);
			$('#searchBar').val(value);
			$('#searchForm').submit();
		});
		
		$('.themeButton').click(function(){
			var value = $(this).val();
			console.log(value);
			$('#searchBar').val(value);
			$('#searchForm').submit();
		});
	</script>


</body>
</html>