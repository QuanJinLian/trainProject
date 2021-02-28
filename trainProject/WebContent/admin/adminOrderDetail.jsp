<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 디테일</title>
<style type="text/css">

  form{text-align: center;
  			float : center; 
  			margin-left: 5em;
  			margin-right: 5em;}
	ol {
            display: flex;
            flex-flow: row nowrap;
            justify-content: center;
  			float : center; 
  			padding-right: 22em;
        }
	ol li{	 
            list-style: none;
            border: 4px solid #E6E6FA;
            text-align: center;
            line-height: 10px;
            padding: 5px;
            height: 30px;
            width: 30px;
            margin: 10px;}			
	
</style>
<script type="text/javascript">
	function update_oseq(){
		try{
			var radioValues = [];
			var seatIds = [];
			var radios = document.getElementById("radios").getElementsByTagName("input");
				for(var i =0; i < radios.length; i++){
					if(radios[i].checked ==true){
						radioValues.push(radios[i].value);
					}
					if(i ==0 || i %4 ==0){
						if(radios[i].value != "수정하기"){
							seatIds.push(radios[i].value);
						}
					}
				} 
// 				alert(radioValues);
// 				alert(odseqs);
// 				alert("${orderDatail[0].oseq}");
				var url ="/trainProject/train/admin/orderUpdate.do?oseq=${orderDetail[0].oseq}&results="+radioValues+"&seatIds="+seatIds;
// 	 			var url ="/trainProject/train/admin/orderUpdate.do?oseq=${orderDatail[0].oseq}&rusults="+radioValues+"&seatIds="+seatIds;
		    	var b = encodeURI(url);
	 			window.location.href=b; 
		}catch (e) {
			alert(e);
		}
	}
</script>
</head>
<body  >
	<c:choose>
	<c:when test="${requestScope.result_update > -1}">
		<script type="text/javascript">
			alert("상태 수정 성공!!");
			var url = "/trainProject/train/admin/orderDetail.do?oseq=${oseq}";
			window.location.href=url; 
		</script>
	</c:when>
	<c:when test="${requestScope.result_update == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 상태 수정 실패");
						window.history.go(-1);
		</script>
	</c:when>
	</c:choose>
	<jsp:include page="adminHeader.jsp" />
	<form action="" >
<c:set var="size" value="${orderDetail.size()+1 }"/>
		<table>
			<tr>
				<th  colspan="6"  style="font-size: 25px; color: purple; text-align: left; border-bottom: 3px solid gray; width: 40em; height: 3em;">
					주문 정보
				</th>
			</tr>
			<tr>
				<th style="font-size: 18px; border-bottom: 1px solid gray; ">
					승차일
				</th>
				<th style="font-size: 18px; border-bottom: 1px solid gray; ">
					열차종별<br>
					열차이름
				</th>
				<th style="font-size: 18px; border-bottom: 1px solid gray; ">
					출발역<br>
					출발시간
				</th>
				<th style="font-size: 18px; border-bottom: 1px solid gray; ">
					도착역<br>
					도착시간
				</th>
				<th style="font-size: 18px; border-bottom: 1px solid gray; ">
					구매 아이디
				</th>
				<th style="font-size: 18px; border-bottom: 1px solid gray; ">
					결제날짜
				</th>
			</tr>
			<tr>
			<td>
				<fmt:formatDate value="${orderDetail[0].date }"/>
			</td>
			<td>
				${orderDetail[0].trainType }<br>
				${orderDetail[0].trainName }
			</td>
			<td>
				${orderDetail[0].startStation }<br>
				${orderDetail[0].startTime }
			</td>
			<td>
				${orderDetail[0].endStation }<br>
				${orderDetail[0].arriveTime }
			</td>
			<td>
				<a href="/trainProject/train/admin/UserUpdate.do?id=${orderDetail[0].id }">
				${orderDetail[0].id }</a>
			</td>
			<td>
				${orderDetail[0].indate }
			</td>
			</tr>
			<tr>
				<td style="font-size: 18px; border-top: 3px solid gray; ">
				</td>
				<td style="font-size: 18px; border-top: 3px solid gray; ">
				</td>
				<td style="font-size: 18px; border-top: 3px solid gray; ">
				</td>
				<td style="font-size: 18px; border-top: 3px solid gray; ">
				</td>
				<td style="font-size: 18px; border-top: 3px solid gray; ">
				</td>
				<td style="font-size: 18px; border-top: 3px solid gray; ">
				</td>
			</tr>
		</table>
	<table  id="radios">	
			<tr >
				<th colspan="5" style="font-size: 30px; color: purple; text-align: left; border-bottom: 1px solid gray;">
				Detail
				</th>
			</tr>
			<tr   style="font-weight: 900; color: black;">
			<th  colspan="5" style="font-size: 8px; color: purple;">
			&nbsp;
			</th>
			</tr>
			<tr>
				<th   style="width:8em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					열차호차
				</th>
				<th   style="width:8em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					좌석번호
				</th>
				<th   style="width:10em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					고객유형
				</th>
				<th style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					결제 금액
				</th>
				<th style="width:30em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">				
					환불 처리 상황
				</th>
				
			</tr>
			<c:forEach var="orderDetail" items="${requestScope.orderDetail }">
			<tr>
					<td>
						${orderDetail.carriage }
					</td>
					<td>
					<input type="hidden" value="${orderDetail.seatId }">
					${orderDetail.seatLocation }
					</td>
					<td>
					${orderDetail.cusType }
					</td>
					<td>
								<fmt:formatNumber value="${orderDetail.price3 }"/>원
					</td>
					<td>
					<input type='radio'  name="${orderDetail.seatId }" value='y'  ${orderDetail.cancelyn == "y" ? "checked" : ""}>미처리
										&nbsp;&nbsp;
					<input type='radio'  name="${orderDetail.seatId }" value='p'  ${orderDetail.cancelyn == "p" ? "checked" : ""} />처리중
										&nbsp;&nbsp;
					<input type='radio'  name="${orderDetail.seatId }" value='c'  ${orderDetail.cancelyn == "c" ? "checked" : ""} />처리완료

					</td>
					
					</tr>
					
				</c:forEach>
					<tr>
						<td colspan="5" style="border-top: 3px solid purple;" >
						<p>
				 	<input type="button" value="수정하기"  onclick="update_oseq();"
				 	style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;">
					&nbsp;
				 	<input type="button" value="취소" style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="self.close()">
					</tr>
		</table>
			
	</form>
</body>
</html>