<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보 확인</title>
<script type="text/javascript">
	function pay(total){

		var id = "${sessionScope.memberInfo.id}";
		var url ="/trainProject/train/user/pay.do?form=&oseq=${viewList[0].oseq}"
		+"&point=${point}&total="+total+"&id="+id;
//			alert(url);
		window.location.href=url; 
	}
	function cancel(oseq){
		var url ="/trainProject/train/user/deleteReserve.do?oseq=${viewList[0].oseq}";
//				alert(url);
			window.location.href=url; 
	}

</script>
<style type="text/css">
	.field{
		text-align: center;
	}
	legend {
		font-size: 18px;
		font-weight: bold;
		color: #6B5B95;
}
	.th{
		font-size: 15px;
		font-weight: 900;
		border-bottom: 3px solid #6F9FD8 ;
		background-color: #DCDCDC;
	}
	.td{
		font-weight: 700;
		border-bottom: 1px solid gray ;
	}
	
	table{
			margin-top : 1em;
            border: 4px solid #E6E6FA;
            text-align: center;
            width: 48em;
	}
	.point{	
		padding:0.5em;
		text-align: left;
	}
	.pay{
			background-color: #034F84;
			color: white;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	}
	.cancel{
			background-color: #6F9FD8;
			color: white;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	}
	.button{
		text-align: center;
		margin: 1em;
	}
</style>
</head>
<body>
 	<c:choose>
 		<c:when test="${requestScope.resultDelete == null}">
			<script type="text/javascript">
					alert("5분이내 결제하셔야 승차권 구매가 완료됩니다.");
					function Close()
					{
						self.close();
					}
					setTimeout("Close()",290000);
			</script>
 		</c:when>
		<c:when test="${requestScope.resultDelete > -1}">
			<script type="text/javascript">
					alert("예약취소 성공하였습니다.");
	 	 		   	self.close();
			</script>
		</c:when>
		<c:when test="${requestScope.resultDelete == -1}">
			<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 예약취소 실패 \n다시 시도해 주십시오.");
						window.history.go(-1);
			</script>
		</c:when>
	</c:choose>
	<c:set var="total" value="0"/>
	<c:forEach var="list" items="${viewList }">
		<c:set value="${total+list.price3  }" var="total"/>
	</c:forEach>
	<fieldset class="field">
	<legend ><b>예약정보</b></legend>
	<div>
		<center>
		<table>
			<tr>
				<th class="th">
					승차일자 / 열차번호
				</th>
				<th class="th">
					열차종별
				</th>
				<th class="th">
					출발역
				</th>
				<th class="th">
					출발시간
				</th>
				<th class="th">
					도착역
				</th>
				<th class="th">
					도착시간
				</th>
				<th class="th">
					예약매수
				</th>
				<th class="th">
					총금액
				</th>
			</tr>
			<tr>
				<td class="td">
					${viewList[0].trainNum } 
				</td>
				<td class="td">
					${viewList[0].trainType } 
				</td>
				<td class="td">
					${viewList[0].startStation } 
				</td>
				<td class="td">
					${viewList[0].startTime } 
				</td>
				<td class="td">
					${viewList[0].endStation } 
				</td>
				<td class="td">
					${viewList[0].arriveTime } 
				</td>
				<td class="td">
					${viewList.size() } 
				</td>
				<td class="td">
					<fmt:formatNumber value="${total }"/>원
				</td>
			</tr>
		</table>
		</center>
	</div>
	<div>
		<center>
		<table>
			<tr>
				<th class="th">
					객실 등급
				</th>
				<th class="th">
					좌석 정보
				</th>
				<th class="th">
					승객 유형
				</th>
				<th class="th">
					운임 요금
				</th>
				<th class="th">
					할인 금액
				</th>
				<th class="th">
					영수 금액
				</th>
			</tr>
			<c:forEach var="viewList" items="${viewList }">
				<tr>
					<td class="td">
						${viewList.seatType }
					</td>
					<td class="td">
						${viewList.carriage }호차 ${viewList.seatLocation }
					</td>
					<td class="td">
						${viewList.cusType }
					</td>
					<td class="td">
						<fmt:formatNumber value="${viewList.price1 }"/>원
					</td>
					<td class="td">
						<fmt:formatNumber value="${viewList.price2 }"/>원
					</td>
					<td class="td">
						<fmt:formatNumber value="${viewList.price3 }"/>원
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="6" class="point">
						예상 적립 포인트 : 
						<fmt:formatNumber value="${point }"/>점
					</td>
				</tr>
		</table>
		</center>
	</div>
	</fieldset>
	<div class="button">
		<input type="button" value="결제하기" onclick="pay(${total });" class="pay">
		<input type="button" value="예약취소" onclick="cancel(${viewList[0].oseq });" class="cancel">
	</div>
</body>
</html>