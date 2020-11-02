<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/login/css/layout.css">
<title>SO Easy</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="/login/css/layout.css">
<script type="text/javascript"
	src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script type="text/javascript"
	src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.fint.js?cacheBust=56"></script>
<style>
	/* #test {
		outline: 1px;
		border-style: solid;
	} */
	.table1 {
	    border-collapse: collapse;
	    border-spacing: 0;
	}
	
	
	#table1 th, table td{
	    border: lightgrey 1px solid;
	    padding: .3em 0.6em;
	    /* padding: 2px 2px; */
	    
	}
	#dayT {
		text-align: center;
		margin:5px;
		border: #6087AA 1px solid;
		background-color: #DFF4FF;
	}
	#monthT {
		margin:5px;
		text-align: center;
		border: #6087AA 1px solid;
		background-color: #A5C1DA;
	}
	#expT {
		margin:5px;
		text-align: center;
		border: #6087AA 1px solid;
		background-color: #C4C4C4;
		
	}
	#reserve {
		background: #3DB6AE;
		width: 100px;
		height: 35px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
		font-size: 1.2em;
		margin-left: 5%;
	}
	#kind {
		margin-right: 5%;
	}
	#select {
		margin-left: 5%;
	}
	.dayBtn {
		background: #3DB6AE;
		width: 40px;
		height: 25px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
	}
	#bar1 {
		background: #3DB6AE;
		width: 400px;
		height: 25px;
		border-radius:5px;
		color: white;
		font-weight: border;
		border-color: #ECECEC38;
		vertical-align: top;
	}
	.reserveBtn {
		background-color:transparent;
		width:100%;
		border:0px;		
	}
</style>
<script type="text/javascript"> 
FusionCharts.ready(function(){
	var fusioncharts = new FusionCharts({ 
		type: 'gantt', 
		renderAt: 'chart-container', 
		width:'80%', 
		height: '500', 
		dataFormat: 'json', 
		dataSource: { 
			"chart": { 
			"dateformat": "yyyy/mm/dd", 
			"seriesname": "Real Time",
			"caption": "역삼코워킹스페이스", 
			"slackFillColor": "#CC0000", "theme": "fint", 
			"canvasBorderAlpha": "40" 
		}, 
		"datatable": { 
			"headervalign": "bottom", 
			"datacolumn": [{ 
				"headertext": "호실", 
				"headerfontsize": "18", 
				"headervalign": "bottom", 
				"headeralign": "left", 
				"align": "left", 
				"fontsize": "12",
				"text": [
					{"label": "301호"}, 
					{"label": "401호"}, 
					{"label": "402호"}, 
					{"label": "403호"}, 
					{"label": "501호"}, 
					{"label": "502호"}, 
					{"label": "503호"},
					{"label": "504호"}, 
					{"label": "601호"}, 
					{"label": "602호"}] 
			}] 
		}, 
		"categories": [{ 
			"category": [{ 
				"start": "2020/07/01", 
				"end": "2020/07/30/",  
				"label": "2020년 07월" 
				}] 
		}, { 
			"category": [
				{ 
				"start": "2020/07/01", 
				"end": "2020/07/01", 
				"label": "1일" 
			}, { 
				"start": "2020/07/02", 
				"end": "2020/07/02", 
				"label": "2일" 
			}, { 
				"start": "2020/07/03", 
				"end": "2020/07/03", 
				"label": "3일" 
			}, { 
				"start": "2020/07/04", 
				"end": "2020/07/04", 
				"label": "4일" 
			}, { 
				"start": "2020/07/05", 
				"end": "2020/07/05", 
				"label": "5일" 
			}, { 
				"start": "2020/07/06", 
				"end": "2020/07/06", 
				"label": "6일" 
			}, { 
				"start": "2020/07/07", 
				"end": "2020/07/07", 
				"label": "7일" 
			}, { 
				"start": "2020/07/08", 
				"end": "2020/07/08", 
				"label": "8일" 
			}, { 
				"start": "2020/07/09", 
				"end": "2020/07/09", 
				"label": "9일" 
			}, { 
				"start": "2020/07/10", 
				"end": "2020/07/10", 
				"label": "10일" 
			}, { 
				"start": "2020/07/11", 
				"end": "2020/07/11", 
				"label": "11일" 
			}, { 
				"start": "2020/07/12", 
				"end": "2020/07/12", 
				"label": "12일" 
			}, { 
				"start": "2020/07/13", 
				"end": "2020/07/13", 
				"label": "13일" 
			}, { 
				"start": "2020/07/14", 
				"end": "2020/07/14", 
				"label": "14일" 
			}, { 
				"start": "2020/07/15", 
				"end": "2020/07/15", 
				"label": "15일" 
			}, { 
				"start": "2020/07/16", 
				"end": "2020/07/16", 
				"label": "16일" 
			}, { 
				"start": "2020/07/17", 
				"end": "2020/07/17", 
				"label": "17일" 
			}, { 
				"start": "2020/07/18", 
				"end": "2020/07/18", 
				"label": "18일" 
			}, { 
				"start": "2020/07/19", 
				"end": "2020/07/19", 
				"label": "19일" 
			}, { 
				"start": "2020/07/20", 
				"end": "2020/07/20", 
				"label": "20일" 
			}, { 
				"start": "2020/07/21", 
				"end": "2020/07/21", 
				"label": "21일" 
			}, { 
				"start": "2020/07/22", 
				"end": "2020/07/22", 
				"label": "22일" 
			}, { 
				"start": "2020/07/23", 
				"end": "2020/07/23", 
				"label": "23일" 
			}, { 
				"start": "2020/07/24", 
				"end": "2020/07/24", 
				"label": "24일" 
			}, { 
				"start": "2020/07/25", 
				"end": "2020/07/25", 
				"label": "25일" 
			}, { 
				"start": "2020/07/26", 
				"end": "2020/07/26", 
				"label": "26일" 
			}, { 
				"start": "2020/07/27", 
				"end": "2020/07/27", 
				"label": "27일" 
			}, { 
				"start": "2020/07/28", 
				"end": "2020/07/28", 
				"label": "28일" 
			}, { 
				"start": "2020/07/29", 
				"end": "2020/07/29", 
				"label": "29일" 
			}, { 
				"start": "2020/07/30", 
				"end": "2020/07/30", 
				"label": "30일" 
			}, { 
				"start": "2020/07/31", 
				"end": "2020/07/31", 
				"label": "31일" 
			}] 
		}], 
		"processes": { 
			"fontsize": "12"
			, "isbold": "1"
			, "align": "left"
			, "headerText": " "
			, "headerFontSize": "20"
			, "headerVAlign": "bottom"
			, "headerAlign": "left"
			, "process": [
				{ "label": "역삼코워킹스페이스", "id": "301" }, 
				{ "label": "역삼코워킹스페이스", "id": "401" }, 
				{ "label": "역삼코워킹스페이스" }, 
				{ "label": "역삼코워킹스페이스" }, 
				{ "label": "역삼코워킹스페이스" }, 
				{ "label": "역삼코워킹스페이스" }, 
				{ "label": "역삼코워킹스페이스" }, 
				{ "label": "역삼코워킹스페이스" }, 
				{ "label": "역삼코워킹스페이스" }]
		}, 
		"tasks": { 
			"task": [{ 
				"start": "2020/07/01", 
				"end": "2020/07/14"
				
			}, { 
				"start": "2020/07/04", 
				"end": "2020/07/14" 
			}, { 
				"processid": "401",
				"start": "2020/07/01", 
				"end": "2020/07/03" 
			}, { 
				"start": "2020/07/03", 
				"end": "2020/07/05" 
			}, { 
				"start": "2020/07/06", 
				"end": "2020/07/08" 
			}, { 
				"start": "2020/07/09",
				"end": "2020/07/14" 
			}, { 
				"start": "2020/07/12", 
				"end": "2020/07/15" 
			}, { 
				"start": "2020/07/17", 
				"end": "2020/07/20", 
				"percentComplete": "20" 
			}, { 
				"start": "2020/07/20",
				"end": "2020/07/24" 
			}, { 
				"start": "2020/07/23",
				"end": "2020/07/26",
				"text": "asdfs",
				"label": "이거 뭐지"
			}, { 
				"start": "2020/07/28", 
				"end": "2020/07/30" 
				}] 
			} 
		} 
	 }
	 ); 
	 	fusioncharts.render();
});
</script>
			
			
</head>
<body>
	<header><%@ include file="../../common/header.jsp"%></header>
	<nav>
		<%@ include file="../../common/aside.jsp"%>
		<div class="colMenu">
		<label class="colMenuTitle">공간 일정 관리</label>
		<a class="colMenuButton selectedButton" href="<%=request.getContextPath()%>/selectReserve.ho">예약 일정 관리</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/Select.ro">라운지 회원 관리</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/select.pr">예약 승인 요청</a>
		<a class="colMenuButton" href="<%=request.getContextPath()%>/selectTempSpace?memberNo=<%=loginUser.getMemberNo()%>">내 공간 관리</a>
	<br><br>
	</div>
	<hr style="margin : 0">
	</nav>
	
	<br>
		<button class="reserve" id="reserve" onclick="window.open('/login/views/host/manageReserve/reserveModal1.jsp', 'Window2', 'width=500, height=550')">직접 예약</button>
		
		<br>

		<div align="center">
			<b>날짜 이동 :
				<button class="dayBtn" style="font-size: 12px;">&lt;</button>
			</b><input type="date" />
			<button class="dayBtn" style="font-size: 12px;">&gt;</button>
			<button class="dayBtn" style="font-size: 12px;">오늘</button>

		</div>
		<div align="right" id="kind">
			<textarea class="kind" id="expT" cols="6" rows="1" style="resize: none"
				readonly>이용 종료</textarea>
			<textarea class="kind" id="monthT" cols="6" rows="1" style="resize: none"
				readonly>월 회원</textarea>
			<textarea class="kind" id="dayT" cols="6" rows="1" style="resize: none"
				readonly>일 회원</textarea>


		</div>
		
		<form>
			<label id="select">공간선택</label> <select name="place" size="1" >
				<option value="place1" onclick=test1()>센터1</option>
				<option value="place2">센터2</option>
				<option value="place3">센터3</option>
				<option value="place4">센터4</option>
				<option value="place5">센터5</option>
			</select>

		</form>
	
	
	<div align="center" id="chart-container">마이페이지 로딩중</div>
	
	<br><br><br>
	<footer><%@ include file="../../common/footer.jsp" %></footer>
	
</body>
</html>






































