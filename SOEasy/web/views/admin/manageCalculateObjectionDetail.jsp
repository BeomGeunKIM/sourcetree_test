<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

   * { margin: 0; padding: 0; }
   .outer{
      width:900px;
      height:500px;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }

.toggle{
      margin-left: 740px;
}
dt.on .toggle { 
      transform:rotate(180deg);
   }

dt, dd { 
   padding: 10px; 
   }
dt { 
   background-color: #ffffff; 
   margin-bottom: 5px; 
   }

dd { 
   background-color: #E9E9E9; 
   margin-bottom: 5px; 
   display: none; 
   }
a{
   font-size: 12px;
   color: #B9B9B9;
}
#name{
   color : #DE7270;
   font-size: 36px;
}

</style>
<title>공지사항</title>
</head>
<body>
   <%@ include file="/views/common/header.jsp" %>

   <div class="outer">
   <p id="name">공지사항</p>
      
   <br><br><br>
      <dl>
          <dt>이거시바로공지<span><img src="/semiproject/images/toggle.png" class="toggle"><br><a>2020-07-24</a></span></dt>
          <dd>몰ㄹ라아리단모ㅗ양이은러ㅣㅓ니</dd>
         
          <dt>이거슨과거공지<span><img src="/semiproject/images/toggle.png" class="toggle"><br><a>2020-07-22</a></span></dt>
          <dd>웅앵웅</dd>
          
      </dl>
      
      <!-- search area start -->
      <div class="searchArea" align="center">
         <select id="searchCondition" name="searchCondition">
            <option value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
         </select>
         <input type="search">
         <button type="submit">검색하기</button>
      </div>
      <!-- search area end -->
   </div>
   

   
   <script>
   $('dt').on('click', function () {

       if ($(this).hasClass('on')) {
           slideUp();
       } else {
           slideUp();
           $(this).addClass('on').next().slideDown();
       }
       function slideUp() {
           $('dt').removeClass('on').next().slideUp();
       };
   })
   </script>

   <%@ include file="/views/common/footer.jsp" %>
</body>
</html>