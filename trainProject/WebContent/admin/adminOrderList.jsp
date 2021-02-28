<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
<style type="text/css">

  form{text-align: center;
  			float : center; 
   			margin-left: 10em; 
   			margin-right: 10em;
  			}
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
    .list{
		font-size: 15px; 
		text-align: center ; 
		border-bottom: 1px solid gray;
    }		
	
</style>
<script type="text/javascript">
	function view(oseq){
		var url = "/trainProject/train/admin/orderDetail.do?oseq="+oseq;
// 		alert(url);
		window.open(url, 
				'child', 'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=400, top=300, left=300');	
	}
</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<form action="">
			<c:set var="size" value="${lists.size()+1 }"/>
	<table>	
			<tr >
				<th colspan="10" style="font-size: 30px; color: purple; text-align: left; border-bottom: 1px solid gray;">
				OrderList
				</th>
			</tr>
			<tr   style="font-weight: 900; color: black;">
			<th  colspan="10" style="font-size: 8px; color: purple;">
			&nbsp;
			</th>
			</tr>
			<tr>
				<th   style="width:8em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					여정
				</th>
				<th   style="width:18em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					승차일
				</th>
				<th   style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					열차종별<br>
					열차이름
				</th>
				<th style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					출발역<br>
					출발시간
				</th>
				<th   style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					도착역<br>
					도착시간
				</th>
				<th   style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					승차권 금액
				</th>
				<th   style="width:8em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					예약<br>
					매수
				</th>
				<th   style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					결제일
				</th>
				<th   style="width:15em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					구매 아이디
				</th>
				<th   style="width:8em; font-size: 18px; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					조회
				</th>
				
			</tr>
			<c:choose>	
				<c:when test="${lists.size() ==0 }">
				<tr>
					<th colspan="10" style="font-size: 50px; color: #FFE4E1; text-align:center ; border-bottom: 3px solid purple;">
					내용이 없습니다.
					</th>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="lists" items="${requestScope.lists }">
					<tr>
							<td class="list">
								편도
							</td>
							<td class="list">
							<fmt:formatDate value="${lists.date }"/>
							</td>
							<td class="list">
										${lists.trainType }<br>
										${lists.trainName }
							</td>
							<td class="list">
										${lists.startStation }<br>
										${lists.startTime }
							</td>
							<td class="list">
										${lists.endStation }<br>
										${lists.arriveTime }
							</td>
							<td class="list">
								<fmt:formatNumber value="${lists.price3 }"/>
							</td>
							<td class="list">
									${lists.price1 }
							</td>
							<td class="list">
										<fmt:formatDate   value="${lists.indate }"/>
							</td>
							<td class="list">
									${lists.id }
							</td>
							<td class="list">
							<span id="${lists.oseq }" onclick="view(this.id);" style="cursor:pointer">조회</span>
							</td>
							</tr>
						</c:forEach>
				
				</c:otherwise>
			</c:choose>
		</table>
			
	</form>
</body>
</html>