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
<script type="text/javascript">
	function seatInsert(id){
		
		url = "/trainProject/train/admin/insertSeats.do?id="+id;
		window.location.href=url; 
	}

</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<c:set var="trains" value="${requestScope.trains}" />
	<c:set var="seatsCnts" value="${requestScope.seatsCnts}" />
	<c:set var="no" value="0"/>
	
		<center>
		<table border="1">
			<tr>
				<td colspan="9" >
				<h2 align="center">열차 리스트</h2>
				<p align="right" >총 갯수 : ${trains.size()}</p>
				</td>
			</tr>
			<tr>
					<th>
					No
					</th>
					<th>
					열차 아이디
					</th>
					<th>
					열차 이름
					</th>
					<th>
					열차 타입
					</th>
					<th>
					열차 상태
					</th>
					<th>
					열차 등록일
					</th>
					<th>
					열차 운영 중단일
					</th>
					<th>
					자릿수
					</th>
					<th>
					삭제
					</th>
			</tr>
			<c:choose>
				<c:when test="${trains.size()>0 }">
						<c:forEach var="trains" items="${trains}"  varStatus="loop">
						<c:set var="no" value="${no+1 }"/>
							<tr>
								<td>${no }</td>
								<td>${trains.id}</td>
								<td><a href="/trainProject/train/admin/updateTrain.do?id=${trains.id}">${trains.name}</a></td>
								<td>${trains.type}</td>
								<td>${trains.stmt}</td>
								<td>${trains.start_date}</td>
								<td>${trains.end_date}</td>
                 				<td>
                 					<c:choose>
                 						<c:when test="${seatsCnts[loop.count-1] == 0}">
                 							<input type="button" value="자리 설정Go"  id="${trains.id}" onclick="seatInsert(this.id);">
                 						</c:when>
                 						<c:otherwise>
                 							${seatsCnts[loop.count-1]}
                 						</c:otherwise>
                 					</c:choose>
                 				</td>
								<td><a href="/trainProject/train/admin/deleteTrain.do?id=${trains.id}">[삭제]</a></td>
							</tr>
						</c:forEach>
					</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" style="width:30em; font-size: 2em; color: #FFE4E1; text-align:center ; ">
							아직 등록된 기차가 없습니다.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>

	</table>
	<table>
			<tr>
			<td colspan="8" align="center">
				 	<input type="button" value="열차 추가"  onclick="location.href='/trainProject/train/admin/addTrain.do'"
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