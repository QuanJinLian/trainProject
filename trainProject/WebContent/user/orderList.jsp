<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 리스트</title>
<script type="text/javascript">
  		function refund(oseq,date,startTime){
  			try{
  				var dates = date.split(" ");
  	  			var day = new Date(dates[0]);
  	  			var now = new Date();
				var time = startTime.split(":");
// 				alert(time[0]+time[1]+time[2]);
				day.setHours(time[0]);
				day.setMinutes(parseInt(time[1])-30);
				day.setSeconds(time[2]);
//   	  			alert("day - " +day);
//   	  			alert("now - " +now);
  	  			if(now > day){
  	  				alert("열차 출발 30분까지 환불이 가능합니다. \n불편을 드려 대단히 죄송합니다.");
  	  			}else{
	  	  			if(!confirm('환불하시면 해당 좌석 다시 예약하실수 없을 수 도 있습니다.\n정말 환불하시겠습니까?')){
	  	  			
		  	  		}else{
		  	  			var url = "/trainProject/train/user/UserRefund.do?oseq="+oseq;
		  	   	 		window.location.href=url;
		  	  		}
  	  			}
  			}catch (e) {
				alert(e);
			}
  		}
  		function ticketView(oseq){
			var url ="/trainProject/train/user/ticketView.do?oseq="+oseq;
// 			alert(url)
			window.open(url, 
					'child', 'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=450, top=300, left=300');		
//	 		window.location.href=url; 
  		}
</script>
<style type="text/css">
	.list{
			margin-top : 2em;
	}
	.table{
			margin-top : 2em;
            border: 4px solid #E6E6FA;
            text-align: center;
            width: 90em;
	}
	.th{
		font-size: 18px;
		font-weight: 900;
		border-bottom: 3px solid #6F9FD8 ;
		background-color: #DCDCDC;
	}
	.thd{
		font-size: 18px;
		font-weight: 900;
		border-bottom: 1px solid gray ;
		background-color: #DCDCDC;
	}
	.td{
		font-weight: 500;
		border-bottom: 1px solid gray ;
	}
	.tdd{
		font-weight: 500;
	}
	.time{
		font-weight: 700;
		color: red;
	}

	.nono{
		font-size: 30px;
		font-weight: 900;
		color:#6B5B95;
		border-bottom: 3px solid #6F9FD8 ;
	}
	
	.refund{
			background-color: #6F9FD8;
			color: white;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	}
	.refunding{
		font-size: 18px;
		font-weight: bold;
		color: tomato;
	}
	.processing{
		font-size: 18px;
		font-weight: bold;
		color: #DAA520;
	}
	.complete{
		font-size: 18px;
		font-weight: bold;
		color: green;
	}
	.ticket{
			background-color: #6B5B95;
			color: white;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	
	}
	

</style>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.result_cancle > -1}">
		<script type="text/javascript">
			alert("환불신청 성공!!");
			var url ="/trainProject/train/user/orderList.do?form=";
	   	 		window.location.href=url;
		</script>
	</c:when>
	<c:when test="${requestScope.result_cancle == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 환불신청 실패");
						window.history.go(-1);
		</script>
	</c:when>
</c:choose>

	<jsp:include page="Header.jsp" />

	<div class="list">
		<table class="table" >
			<tr>
				<th colspan="7"  class="th">
					승차권 주문현황
				</th>
				<th  class="th" colspan="2">
					승차권 구매현황
				</th>
			</tr>
			<tr>
				<th rowspan="2" class="th">
					여정
				</th>
				<th rowspan="2" class="th">
					승차일
				</th>
				<th  class="thd">
					열차종별
				</th>
				<th  class="thd">
					출발역
				</th>
				<th  class="thd">
					도착역
				</th>
				<th rowspan="2" class="th">
					승차권<br>
					금액
				</th>
				<th rowspan="2" class="th">
					예약<br>
					매수
				</th>
				<th  rowspan="2" class="th">
					결제일
				</th>
				<th  rowspan="2" class="th">
					승차권
				</th>
			</tr>
			<tr>
				<th  class="th">
					열차이름
				</th>
				<th  class="th">
					출발시간
				</th>
				<th  class="th">
					도착시간
				</th>
			</tr>
			<c:choose>
				<c:when test="${requestScope.lists.size()>0  }">
					<c:forEach var="lists" items="${lists }">
						<tr>
							<td   rowspan="2" class="td">
								편도
							</td>
							<td  rowspan="2" class="td">
								<fmt:formatDate value="${lists.date }"/>
							</td>
							<td class="tdd">
								${lists.trainType }
							</td>
							<td class="tdd">
								${lists.startStation }
							</td>
							<td class="tdd">
								${lists.endStation }
							</td>
							<td  rowspan="2" class="td">
								<fmt:formatNumber value="${lists.price3 }"/>
							</td>
							<td  rowspan="2" class="td">
								${lists.price1 }
							</td>
							<td  rowspan="2" class="td">
								<fmt:formatDate   value="${lists.indate }"/><br>
								<c:choose>
									<c:when test="${lists.cancelyn == 'n' }">
										<input type="button" class="refund" value="환불하기"  id="${lists.date }" name="${lists.startTime }"  onclick="refund(${lists.oseq},this.id,this.name );">
									</c:when>
									<c:when test="${lists.cancelyn == 'y' }">
										 <span class="refunding" >환불신청중.....</span>
									</c:when>
									<c:when test="${lists.cancelyn == 'p' }">
										 <span class="processing" >환불처리중.....</span>
									</c:when>
									<c:when test="${lists.cancelyn == 'c' }">
										 <span class="complete" >환불처리완료!!</span>
									</c:when>
								</c:choose>
							</td>
							<td  rowspan="2" class="td">
										<input type="button" class="ticket" value="승차권 보기"  onclick="ticketView(${lists.oseq} );" 
											${lists.cancelyn == 'n' ? "" : "disabled style='background-color: gray'" }  >
							</td>
						</tr>
						<tr>
							<td class="td">
								${lists.trainName }
							</td>
							<td class="td">
								${lists.startTime }
							</td>
							<td class="td">
								${lists.arriveTime }
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" class="nono">
							구매 내역이 없습니다 ㅠㅠ <br>
							얼른 구매해 주세욧!!
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<jsp:include page="Footer.jsp" />

</body>
</html>