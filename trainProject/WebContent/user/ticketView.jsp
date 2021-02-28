<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓 정보</title>
<style type="text/css">
	div{
		margin: 120px ;
	}
	table {
		background-image: url(/trainProject/user/img/trian.jpg) ;
		font-weight: 700;
		margin: 80px ;
 	    border-collapse: collapse;
     	border: 3px solid #000;
	}
	.tt {
			background-color: #DCDCDC;
			text-align: center;
			height: 2em;
	}
	.small{
			font-size: 12px;
			color: #4169E1;
	}
	.smallRight{
			font-size: 12px;
			color: #4169E1;
			text-align: right;
	}
	.title{
			font-size: 18px;
			font-weight: 900;
			padding-left: 4em;
	}
	.notice{
			background-color: #DCDCDC;
			color: #4169E1;
	}
	.station{
		text-align:  center;
	}

</style>
<!-- <script type="text/javascript"> -->
<!--  	alert("티켓예약성공"); -->
<!-- </script> -->
</head>
<body>
	<div>
	<c:forEach var="viewList" items="${viewList }">
		<table>
			<tr>
				<th colspan="5" class="title" >
					열차승차권  
				</th>
				<td  class="smallRight">
				예약일시 <fmt:formatDate value="${viewList.indate }"/> 
				</td>
			</tr>
			<tr>
				<td class="tt" >출발일</td>
				<td colspan="5">
					<fmt:formatDate value="${viewList.date }"/>
				</td>
			</tr>
			<tr>
				<td class="tt" >출발 → 도착 </td>
				<td class="station"> 
					${viewList.startStation }<br>
					${viewList.startTime }
				</td>
				<td class="station">
					▶▶▶▶▶
				</td>
				<td colspan="3"  > 
					&nbsp;&nbsp;${viewList.endStation }<br>
					${viewList.arriveTime }
				</td>
			</tr>
			<tr>
				<td class="tt" >열차번호 </td>
				<td colspan="5">
					${viewList.trainType }
				</td>
			</tr>
			<tr>
				<td rowspan="2" class="tt" >좌석번호 </td>
				<td colspan="2">
					${viewList.carriage }호차 ${viewList.seatLocation }석
				</td>
				<td class="small" colspan="3">
				승객 유형 : ${viewList.cusType }
				</td>
			</tr>
			<tr>
				<td colspan="5" class="notice">
				 ※타는 곳 번호는 역에서 확인하시기 바랍니다.
				</td>
			</tr>
			<tr>
				<td class="tt" >영수액 </td>
				<td colspan="3"> 
					<fmt:formatNumber value="${viewList.price3 }"/>원
				</td>
				<td class="tt" >운임요금(할인금액)</td>
				<td>
					<fmt:formatNumber value="${viewList.price1 }"/>원(<fmt:formatNumber value="${viewList.price2 }"/>원)
				</td>
			</tr>
			<tr>
				<td colspan="6">
					예약자 : ${viewList.id }<br>
					<span class="small">
						승차권 이용 및 반환에 대한 자세한 내용은 홈페이지의 여객운송 약관을 참고하시기 바랍니다.<br>
						철도 고객 센터 | 1588-0000
					</span>
				</td>
			</tr>
		</table>
	</c:forEach>
	</div>
</body>
</html>