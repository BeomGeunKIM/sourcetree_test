<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.kh.login.board.model.vo.*,
   com.kh.login.host.manageReserve.model.vo.*"%>
   
   <% ArrayList<Qna> list = (ArrayList<Qna>) request.getAttribute("list"); 
   PageInfo pi = (PageInfo) request.getAttribute("pi");
   
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/login/css/layout.css">
 
<style>
 
#wrapper{
  width: 80%;
  margin-left: auto;
  margin-right: auto;
}
.writeButton{
  text-decoration: none;
  color : black;
  float: right;
  background : #60B4A6;
  border-radius: 10px;
  padding : 10px;
}
#mtmTable tr th{
  background:#60B4A6;
   color:white;
  text-align: center;
}
#mtmTable tr{
   height : 50px;
}
#searchWrap{
   
   width: 40%;
   border: solid 1px #60B4A6;
   border-radius: 30px;
}
#searchWrap tr td input{
   display: inline-block;
   border: none;
   background: transparent;
   width: 100%;
   height: 100%;
}
#searchWrap tr td input:focus{
   outline: none;
}
#searchWrap tr td button{
   background : transparent;
   border: none;
   float: right;
}
#searchWrap tr td button:focus{
   outline: none;
}
 #th {
   border: 1px solid #60B4A6;
}
.logo{
   color:#60B4A6
}
</style>
<title>1대1문의</title>
</head>
<body>
    <header><%@ include file="../common/header.jsp"%></header>
   <div class="colMenu" style=margin-top:20px;>
      <label class="colMenuTitle"></label>
      <a class="colMenuButton" href="/login/selectList.no">공지사항</a>
      <a class="colMenuButton" href="/login/selectList.faq">자주 묻는 질문</a>
      <a class="colMenuButton selectedButton" href="/login/select.mtm">1대1문의</a>
   <br><br>
   </div>
    <br>
   
   <section>
    <div id="wrapper">
      <h2 class="logo" style="margin:0; font-size:30px; font-weight:bolder">1대1문의</h2>
      <a href="/login/views/board/writemtm.jsp" id="writeButton" class="writeButton">문의하기</a> 
      <table style="width: 100%; border-collapse: collapse" id="mtmTable" >
      <tr>
            <tr>
               <th style=color:white;>번호</th>
               <th style=color:white;>분류</th>
               <th style=color:white;>제목</th>
               <th style=color:white;>작성자</th>
               <th style=color:white;>작성일자</th>
            </tr>
               <% for(Qna qna : list) { %>
               <%if(loginUser.getMemberNo() == qna.getQmember()) { %>
            <tr>
               <td class="info" style="text-align: center;"><%= qna.getQno() %></td>
               <td class="info" style="text-align: center;"><%= qna.getQkind() %></td>
               <td class="info" style="text-align: center;"><%= qna.getQtitle() %></td>
               <td class="info" style="text-align: center;"><%= qna.getqMnick() %></td>
               <td class="info" style="text-align: center;"><%= qna.getQdate() %></td>
            </tr>
               <% } else if(loginUser.getMemberNo() == 1) {  %>
            <tr>
               <td class="info" style="text-align: center;"><%= qna.getQno() %></td>
               <td class="info" style="text-align: center;"><%= qna.getQkind() %></td>
               <td class="info" style="text-align: center;"><%= qna.getQtitle() %></td>
               <td class="info" style="text-align: center;"><%= qna.getqMnick() %></td>
               <td class="info" style="text-align: center;"><%= qna.getQdate() %></td>
            </tr>
                  <% } %>
               <% } %>
         
         </table>
 <!-- 페이징 처리 버튼 -->
      <div class="pagingArea" align="center">
         <button onclick="location.href='<%=request.getContextPath()%>/select.mtm?currentPage=1'"><<</button>
         <% if(currentPage <= 1) { %>
         <button disabled><</button>
         <% } else { %>
         <button onclick="location.href='<%=request.getContextPath()%>/select.mtm?currentPage=<%=currentPage - 1%>'"><</button>
         <% } %>
         
         <% for(int p = startPage; p <= endPage; p++) { 
               if(p == currentPage) {
         %>
                  <button disabled><%= p %></button>
         <%      } else { %>
                  <button onclick="location.href='<%=request.getContextPath()%>/select.mtm?currentPage=<%=p%>'"><%= p %></button>
         <%  
                 }
            }
         %>
         
         <% if(currentPage >= maxPage) { %>
         <button disabled>></button>
         <% } else { %>
         <button onclick="location.href='<%=request.getContextPath()%>/select.mtm?currentPage=<%=currentPage + 1%>'">></button>
         <% } %>
         <button onclick="location.href='<%=request.getContextPath()%>/select.mtm?currentPage=<%=maxPage%>'">>></button>
      </div>
      
      </div>
   </section>
    <%@ include file="../common/footer.jsp"%> 
     <script>
       var userStatus = <%=userStatus%>;
      $(function(){
         $("#mtmTable td").mouseenter(function() {
            $(this).parent().css({"background" : "#60B4A6", "cursor" : "pointer"});
         }).mouseout(function() {
            $(this).parent().css({"background" : "white"});
         }).click(function() {
            var num = $(this).parent().children().eq(0).text();
            location.href="<%=request.getContextPath()%>/detail.mm?num=" + num;
         })
      });
   </script>
         
</body>
</html>