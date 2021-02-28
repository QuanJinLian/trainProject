<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <%@ page import = "java.util.*"  %>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<script type="text/javascript">
	var selected  ;
	function changeCarriage(carriage){
			var url ="/trainProject/train/user/seatView.do?trainId=${trainId}&tdseq1=${tdseq1}&tdseq2=${tdseq2}&carriage="+carriage
			+"&adult=${adult}&disabled=${disabled}&children=${children}&old=${old}";
// 			alert(url);
			window.location.href=url; 
	}
	
	
	function selectSeat(seatLocation, seatId){
		
		var btn = document.getElementById(seatLocation);
		var x = document.getElementsByClassName("active");
		var peoplesCnt = parseInt("${adult}")+parseInt("${disabled}")
									+parseInt("${children}")+parseInt("${old}");
	
			 if(btn.className=="active"){ //说明已经是选中状态
				    btn.className = 'able';//清空class。
					view();
			}else{
				if(x.length >= peoplesCnt){
					alert("요청하신 승객수를 초과하여 좌석을 선택할 수 없습니다.");
				}else{
					btn.className = "active";//否则选中它，给它添加active样式
					view();
				}
			}
	}
	function view(){
		selected = "선택한 좌석번호 : " ;
		var x = document.getElementsByClassName("active");
		for(var i = 0 ; i < x.length ; i++){
			selected += x[i].id + "  ";
		}
		document.getElementById("selected").innerHTML = selected;
	}
	function reserve(){
		var ids = [];
		var x = document.getElementsByClassName("active");
		var peoplesCnt = parseInt("${adult}")+parseInt("${disabled}")
		+parseInt("${children}")+parseInt("${old}");

		for(var i = 0 ; i < x.length ; i++){
			ids.push(x[i].name);
		}
		var id = "${sessionScope.memberInfo.id}";
		if(id == ""){
			alert("로그인을 하신 후 사용하세요.");
		}else{
			if(x.length < peoplesCnt){
				alert("요청하신 승객수["+peoplesCnt+"]와 선택하신 좌석수["+x.length+"]가 일치하지 않습니다.");
			}else{
				var url ="/trainProject/train/user/seatReserve.do?trainId=${trainId}&tdseq1=${tdseq1}&tdseq2=${tdseq2}"
					+"&adult=${adult}&disabled=${disabled}&children=${children}&old=${old}&seatIds="+ids+"&id="+id;
// 	 		 		alert(url);
	 				window.location.href=url; 
			}
		}
		
	}

</script>
<style type="text/css">
	ol {
            display: flex;
            flex-flow: row nowrap;
            justify-content: center;
        }
	ol li{	 
            list-style: none;
            text-align: center;
            line-height: 10px;
            padding: 5px;
            padding-left : 1em;
            height: 50px;
            width: 70px;
            margin: 10px;}
 	.check{
 		background-color: #6F9FD8;
 		padding: 0.5em;
 		font-weight: 900;
 	}
 	.nocheck{
 		background-color: #808080;
 		color: white;
 		padding: 0.5em;
 		font-weight: 900;
 	}
 	button.able{
 		background-color: #5F9EA0;
 		margin-left: 5em;
 		margin-top: 0.5em;
 	}
 	button.active{
 		background-color: #DC143C;
 		margin-left: 5em;
 		margin-top: 0.5em;
 	}
 	.unable {
 		background-color:  gray;
 		margin-left: 5em;
 		margin-top: 0.5em;
 	}
 	.selected{
 		font-size: 18px;
 		font-weight: bold;
 		margin-top: 1em;
 		margin-left: 1em;
 	}
 	.reserve{
 		background-color: #6F9FD8;
 		font-size: 18px;
 		font-weight: bold;
 		margin-top: 1em;
 		margin-left: 1em;
 	}
</style>
</head>
<body>
	<div>
	<ol>
		<c:forEach var="carriage" items="${carriages }">
			<li>
			 	<input type="button" value="${carriage.carriage } 호차 (${carriage.seatType } )" ${carriage.carriage == carriageNum ? "class='check'" : "class='nocheck'"} onclick="changeCarriage(${carriage.carriage });">
			</li>
		</c:forEach>
	</ol>
	</div>
	<fieldset>
	<center>
	<div>
	<table>
			<c:forEach var="seats" items="${allSeats }">
				<c:if test="${fn:startsWith(seats.seatLocation, '1')}">
					<tr>
				</c:if>
					<c:set var="Continue" value="0"/>
						<td class="seat">
							<c:forEach var="sale" items="${saleSeats }">
								<c:if test="${Continue==0}">
									<c:if test="${seats.seatId == sale.seatId}">
										<button disabled="disabled" class="unable">
											<i class='fas fa-couch' style='font-size:24px'> </i><br>
											${seats.seatLocation }
										</button>
										<c:set var="Continue" value="1"/>	
									</c:if>
								</c:if>
							</c:forEach>
								<c:if test="${Continue==0}">
										<button class="able" name="${seats.seatId }"id="${seats.seatLocation }" onclick="selectSeat(this.id,${seats.seatId });">
											<i class='fas fa-couch' style='font-size:24px'> </i><br>
											${seats.seatLocation }
										</button>
								</c:if>
						</td>
			</c:forEach>
	</table>
	</center>
	</div>
	</fieldset>
	<div class="selected" id="selected">
		선택한 좌석번호 : 
	</div>
	<div>
		<input type="button"  value="예약하기" onclick="reserve();" class="reserve">
	</div>

</body>
</html>