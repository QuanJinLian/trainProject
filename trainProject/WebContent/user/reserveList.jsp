<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 리스트</title>
<script type="text/javascript">
	function pay(oseq,total,point){

		var id = "${sessionScope.memberInfo.id}";
		var url ="/trainProject/train/user/pay.do?form=&oseq="+oseq
		+"&point="+point+"&total="+total+"&id="+id;
//			alert(url);
		window.open(url, 
				'child', 'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=450, top=300, left=300');		
// 		window.location.href=url; 
	}
	function cancel(oseq){
		var url ="/trainProject/train/user/deleteReserve.do?form=onlyDelete&oseq="+oseq;
//				alert(url);
		window.location.href=url;;
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
</style>
</head>
<body>
	<jsp:include page="Header.jsp" />
 	<c:choose>
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
		<c:when test="${requestScope.resultDelete == -3}">
			<script type="text/javascript">
						alert("이미 결제완료 혹은 취소된 예약내용입니다. \n확인 부탁드립니다.");
						window.location.reload;
			</script>
		</c:when>
	</c:choose>

	<div class="list">
		<table class="table" >
			<tr>
				<th colspan="7"  class="th">
					승차권 예약현황
				</th>
				<th colspan="2"  class="th">
					승차권 구매 현황
				</th>
			</tr>
			<tr>
				<th rowspan="2"  class="th">
					여정
				</th>
				<th rowspan="2"  class="th">
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
				<th rowspan="2"  class="th">
					승차권<br>
					금액
				</th>
				<th rowspan="2"  class="th">
					예약<br>
					매수
				</th>
				<th  rowspan="2"  class="th">
					승차권 결제
				</th>
				<th  rowspan="2"  class="th">
					취소/반환
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
				<c:when test="${requestScope.lists.size()>0 }">
					<c:forEach var="lists" items="${lists }">
						<tr>
							<td   rowspan="2"  class="td">
								편도
							</td>
							<td  rowspan="2"   class="td">
								<fmt:formatDate value="${lists.date }"/>
							</td>
							<td  class="tdd">
								${lists.trainType }
							</td>
							<td  class="tdd">
								${lists.startStation }
							</td>
							<td  class="tdd">
								${lists.endStation }
							</td>
							<td  rowspan="2"  class="td">
								<fmt:formatNumber value="${lists.price3 }"/>원
							</td>
							<td  rowspan="2"  class="td">
								${lists.price1 }
							</td>
							<td  rowspan="2"  class="td">
								<span class="time">
								<fmt:formatDate  pattern="HH시mm분까지"   value="${lists.indate }"/><br>
								</span>
								<input type="button" class="pay" value="결제하기"  id="${lists.oseq }" onclick="pay(this.id,${lists.price3 },${lists.price2 });"/>
							</td>
							<td  rowspan="2"  class="td">
								<input type="button" class="cancel" value="예약취소"  onclick="cancel(${lists.oseq });">
							</td>
						</tr>
						<tr>
							<td  class="td">
								${lists.trainName }
							</td>
							<td  class="td">
								${lists.startTime }
							</td>
							<td  class="td">
								${lists.arriveTime }
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" class="nono">
						    발권 / 취소 할 내용이 없습니다.
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<jsp:include page="Footer.jsp" />
</body>
</html>