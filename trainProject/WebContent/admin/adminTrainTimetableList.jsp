<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <%@ page import="java.util.*"    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열차 리스트</title>
<style type="text/css">
	table{margin : 50px;}
	ol {
            display: flex;
            flex-flow: row nowrap;
            justify-content: center;
        }
	ol li{	 
            list-style: none;
            border: 2px solid #161EE8FF;
            text-align: center;
            line-height: 10px;
            padding: 5px;
            height: 10px;
            width: 10px;
            margin: 10px;}
    th{text-align: center;
		padding-left: 1em;
		padding-right: 1em;
    }
    td{text-align: center;
		padding-left: 1em;
		padding-right: 1em;}
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<c:set var="timetables" value="${requestScope.timetables}" />
	<c:set var="no" value="0"/>
	
		<center>
		<table border="1">
			<tr>
				<td colspan="7" >
				<h2 align="center">열차 리스트</h2>
				<p align="right" >총 갯수 : ${timetables.size()}</p>
				</td>
			</tr>
			<tr>
					<th>
					No
					</th>
					<th>
					열차 번호
					</th>
					<th>
					출발역
					</th>
					<th>
					도착역
					</th>
					<th>
					출발시간
					</th>
					<th>
					도착시간
					</th>
					<th>
					삭제
					</th>
			</tr>
			<c:choose>
				<c:when test="${timetables.size()>0 }">
						<c:forEach var="timetables" items="${timetables}">
						<c:set var="no" value="${no+1 }"/>
							<tr>
								<td>${no }</td>
<%-- 								<td><a href="/trainProject/train/admin/updateTrainTimetable.do?ttseq=${timetables.ttseq}">${timetables.trainNum}</a></td> --%>
								<td><a href="/trainProject/train/admin/viewTrainTimetable.do?trainNum=${trainNum}&ttseq=${timetables.ttseq}">${timetables.trainNum}</a></td>
								<td>${timetables.startStationName}</td>
								<td>${timetables.endStationName}</td>
								<td>${timetables.startTime}</td>
								<td>${timetables.arriveTime}</td>
								<td><a href="/trainProject/train/admin/deleteTrainTimetable.do?ttseq=${timetables.ttseq}">[삭제]</a></td>
							</tr>
						</c:forEach>
					</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7" style="width:30em; font-size: 2em; color: #FFE4E1; text-align:center ; ">
							아직 등록된 시간표가 없습니다.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>

	</table>
	<table>
			<tr>
			<td colspan="8" align="center">
				 	<input type="button" value="배차 추가"  onclick="location.href='/trainProject/train/admin/TrainList.do?to=timetable'"
				 	style="height: 100% ;width: 100% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;">
				 	&nbsp;
				 	<input type="button" value="돌아가기"  onclick="location.href='/trainProject/train/admin/trainPageForm.do'"
				 	style="height: 100% ;width: 100% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;">
			</td>
			</tr>
	</table>
	</center>
	
	
	
	
</body>
</html>