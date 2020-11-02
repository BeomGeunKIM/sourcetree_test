<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String successCode = (String) request.getAttribute("successCode"); 
	System.out.println(successCode);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		(function(){
			var successCode = "<%= successCode %>";
			
			var successMessage = "";
			var movePath = "";
			
			switch(successCode){
			case "insertMember" :
				successMessage = "회원가입이 성공하셨습니다.!";
				movePath = "<%= request.getContextPath()%>";
				break;
			}
			console.log(movePath);
			console.log(successMessage);
			alert(successMessage);
			
			location.href = movePath;
			
		})();
	</script>
</body>
</html>