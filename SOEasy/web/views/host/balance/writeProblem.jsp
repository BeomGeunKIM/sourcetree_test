<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#popWrap {
	width: 100%;
	text-align: center;
	margin:0;
}
#popHeader {
	width: 100%;
	height: 100px;
	background: #40A6B4;
	line-height: 100px;
}
#popInput table{
	width: 90%;
	text-align : left;
}

#popInput table label{
	display : inline-block;
	width : 100px;
	height: 30px;
	background:  #40A6B4;
	text-align: center;
	border-radius: 3px;
	line-height: 30px;
	color : white;
	font-size : 15px;
	font-weight : bolder;
}

#popInput table select,
#popInput table input{
	width: 300px;
	height : 25px;
	margin : 0;
	

}



#resourceZone input[type="file"] {
	width: 90%;
	height: 300px;
	align-content: center; border-style : solid;
	border-color: #40A6B4;
	border-style: solid;
}
#resourceMenu {
	width: 90%;
	height : 50px;
	text-align: left;
	line-height : 50px;
	background : #40A6B4;
	margin-left : auto;
	margin-right: auto;
	color : white;
	font-weight : bolder;
	font-size : 20px;
}

.box-file-input{
	width: 90%;
	margin-left: auto;
	margin-right: auto;
	border-style: solid;
	border-width: 1px;
	border-radius: 3px;
	border-color: gray;
	
}
.box-file-input label {
	display: inline-block;
	background: #40A6B4;
	color: #fff;
	padding: 0px 15px;
	line-height: 100px;
	cursor: pointer;
	height: 100px;
	text-align : center;
	font-weight : bolder;
	
}

.box-file-input label:after {
	content: "파일등록";
}

.box-file-input .file-input {
	display: none;
}

.box-file-input .filename {
	display: inline-block;
	padding-left: 10px;
	
	
}

#problemButton{
	width : 200px;
	height : 55px;
	font-weight : bolder;
	border-radius : 10px;
	border : none;
	background : #40A6B4;
	color : white;
	font-size : 20px;
	
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div id="popWrap">

		<div id="popHeader">
			<h1 style="margin:0;">정산 오류 내용을 작성해 주세요</h1>
		</div>
		<br>
		<br>

		<div id="popInput">
			<form>

				<table align="center">
					<tr>
						<td><label>성함</label>&nbsp;&nbsp;<input type="text" name="userName"></td>
						<td><label>연락처</label>&nbsp;&nbsp;<input type="tel" name="phone"></td>
					</tr>
					<tr>
						<td><label>공간 명</label>&nbsp;&nbsp;<select><option>공간 명</option></select></td>
						<td><label>단위 기간</label>&nbsp;&nbsp; <select><option>단위 기간</option></select></td>
					</tr>
				</table>
				<div id="resourceZone">
					<div id="resourceMenu">
						<p>&nbsp;오류 내용</p>
					</div>
					<br>
					<textarea style="width : 90%; height:200px; font-size:13px;"></textarea>
					<br><br>
					<div class="box-file-input" align="left">
						<label> <input type="file"
							name="files" class="file-input"
							accept="image/*">
						</label><div class="filename">파일을 선택해주세요.</div>
					</div>
					<br>
					<button id="problemButton">확인</button>

				</div>
				
			</form>
		</div>
	</div>
	<script>
	   $(document).on("change", ".file-input", function(){
		     
	        $filename = $(this).val();

	        if($filename == "")
	            $filename = "파일을 선택해주세요.";

	        $(".filename").text($filename);

	    })
	</script>
</body>
</html>