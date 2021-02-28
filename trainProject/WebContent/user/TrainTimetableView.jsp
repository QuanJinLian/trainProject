<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 정보</title>
<style type="text/css">
	form{text-align: center;
			float: center
			}
	.center{text-align: center;
			font-size: 0.5em;
			font-weight: bold;}
	.right{text-align: right;
			font-size: 0.5em;
			font-weight: bold;}
	.left{text-align: left;}
	.title{font-size: 1.5em;
			font-weight: 900;}
	table{text-align: center;
			margin-top: 5em;
			font-size: 0.8em;
			width: 70em;}
	input{font-size: 1.2em;}
	.button{
				width: 7%;
				height: 100%;
				font-size: 18px;
				font-weight: bold;}
	select {font-size: 0.5em;
			width: 15em;
	}
	textarea {
	font-size: 0.5em;
}
	.bt{
	width: 50em;
	height: 2em;
	
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<form action="" method="post"   >
	<c:set var="tt" value="${requestScope.tt }" />
	<c:set var="timetables" value="${requestScope.timetables }" />
<center>
		<table id="timetable" border="1" >
			<tr class="title">
				<th colspan="11" class="title" >
					열차 배차 정보
				</th>
			<tr>
				<th class="left" colspan="10">
					열차 번호
				</th>
				<th class="left" colspan="1">
					${tt.trainNum }
				</th>
			</tr>
			<c:forEach var="timetables" items="${timetables }">
				<tr>
					<td colspan="11" class="left">
						${timetables.stopId +1 } 	&nbsp;-	&nbsp; 출발역 : ${timetables.startStationName }	&nbsp;	&nbsp;
															 출발시간 : ${timetables.startTime }	&nbsp;	&nbsp;
															 도착역 : ${timetables.endStationName }	&nbsp;	&nbsp;
															 도착시간 : ${timetables.arriveTime }	&nbsp;	&nbsp;
															 가격 : ${timetables.price }	&nbsp;	&nbsp;
															 정차시간 : ${timetables.stopTime }	
					</td> 
				</tr>
			</c:forEach>
		</table>
		<table class="bt">
			<tr>
				<td colspan="11"  >
				 	<input type="button" value="돌아가기" style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8;border-radius: 12px; cursor:pointer;" onclick="self.close()">
				</td>
			</tr>
		</table>
	</center>
	</form>
</body>
</html>