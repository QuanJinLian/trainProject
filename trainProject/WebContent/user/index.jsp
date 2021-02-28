<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script type="text/javascript">

	function changeDay(){
		try{
			var years = document.getElementById("year");
			var months = document.getElementById("month");
			var year = years.options[years.selectedIndex].value;
			var month = months.options[months.selectedIndex].value;
			var date = new Date(year, month, 0);
			var day = date.getDate();
			var days = document.getElementById("day");
			var day_selected = days.options[days.selectedIndex].value;
			for(var i = 0; i < days.length; i++ ){
				days.remove(i);
				i = i - 1;
			}
			
			for(var i = 0; i < day; i++){
                var option=document.createElement("option");
                option.setAttribute("value", i+1);
                option.appendChild(document.createTextNode(i+1));
                days.appendChild(option);
			}
			
			if(day_selected > day){
				days.options[day-1].selected = true;
			}else{
				days.options[day_selected-1].selected = true;
			}
			
		}catch (e) {
			alert(e);
		}
		
	}

	function change(param){
		if(param < 10){
			return "0"+param;
		}else{
			return param;
		}
	}
	function search(){
		try{
			
		var adults = document.getElementById("adult");
		var disableds = document.getElementById("disabled");
		var childrens = document.getElementById("children");
		var olds = document.getElementById("old");
		var years = document.getElementById("year");
		var months = document.getElementById("month");
		var days = document.getElementById("day");
		var hours = document.getElementById("hour");
		

		var adult = adults.options[adults.selectedIndex].value;
		var disabled = disableds.options[disableds.selectedIndex].value;
		var children = childrens.options[childrens.selectedIndex].value;
		var old = olds.options[olds.selectedIndex].value;
		var year = years.options[years.selectedIndex].value;
		var month = months.options[months.selectedIndex].value;
		var day =  days.options[days.selectedIndex].value;
		var hour = hours.options[hours.selectedIndex].value;

		var startStation = document.getElementById("startStationName").value;
		var endStation = document.getElementById("endStationName").value;
		


// 		현재 날짜를 구함
		var date = new Date();
		var year_now = date.getFullYear();
		var month_now = date.getMonth()+1;
		var date_now = date.getDate();
		var hour_now = change(date.getHours());
		var checkedDay = year*10000 + parseInt(month*100) + parseInt(day);
		var nowDay = year_now*10000 + month_now*100 + date_now;

// 		alert("선택---"+checkedDay);
// 		alert("현재---"+nowDay);
		if(startStation == "" || endStation == ""){
			alert("출발역과 도착역 모두 입력해 주십시오.");
			return;
		}
		if(checkedDay < nowDay){
			alert("현재 일자보다 이전 일자를 선택하셨습니다 \n날짜를 다시 선택해 주십시오.");
			return;
		}else{
			if(adult+disabled+children+old < 1){
				alert("탑승할 인원 정보를 선택 해 주세요.");
				return;
			}
			
			url = encodeURI("/trainProject/train/user/searchTimetable.do?adult="+adult+"&disabled="+disabled
					+"&children="+children+"&old="+old+"&year="+year
					+"&month="+month+"&day="+day+"&hour="+hour
					+"&startStation="+startStation+"&endStation="+endStation);
// 					+"&directyn="+directyn);
			window.location.href=url; 
		}
		

		
		
// 		alert("adult" + adult);
// 		alert("disabled" + disabled);
// 		alert("children" + children);
// 		alert("old" + old);
// 		alert("directyn" + directyn);
// 		alert("year" + year);
// 		alert("month" + month);
// 		alert("day" + day);
// 		alert("hour" + hour);
// 		alert("startStation" + startStation);
// 		alert("endStation" + endStation);
		}catch (e) {
			alert(e);
		}
	}
	function selectSeat(trainId, tdseq1, tdseq2,className){
		if(className == "able"){
			var adults = document.getElementById("adult");
			var disableds = document.getElementById("disabled");
			var childrens = document.getElementById("children");
			var olds = document.getElementById("old");
			var adult = adults.options[adults.selectedIndex].value;
			var disabled = disableds.options[disableds.selectedIndex].value;
			var children = childrens.options[childrens.selectedIndex].value;
			var old = olds.options[olds.selectedIndex].value;
			var url = encodeURI("/trainProject/train/user/seatView.do?adult="+adult+"&disabled="+disabled
					+"&children="+children+"&old="+old+"&trainId="+trainId+"&tdseq1="+tdseq1+"&tdseq2="+tdseq2);

			window.open(url, 
					'child', 'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=1000, height=450, top=300, left=300');	
		}
		
	}

</script>
<style type="text/css">
	legend {
		font-size: 18px;
		font-weight: bold;
		color: #6B5B95;
	}
	fieldset {
		font-size: 14px;
		text-align: center;
		color: #6B5B95;
	}
	select.people {
		width: 10em;
	}
	.title{
		text-align: center;
		font-size: 18px;
		font-weight: bold;
		color: #6F9FD8;
		border-bottom: 3px solid #6F9FD8 ;
	}
	.ti{
		text-align: center;
		font-size: 14px;
		font-weight: bold;
		background-color: lightGray;
		border-bottom: 3px solid #6F9FD8 ;
	}
	.td{
		border-bottom: 1px solid gray ;
	}
	.no{
		text-align: center;
		font-size: 24px;
		font-weight: bold;
		color: #6F9FD8;
	}
	.search{
			margin-top : 1em;
            border: 4px solid #E6E6FA;
            text-align: center;
            width: 80%;
	}
	#num{
		width: 30em;
	}
	#ss{
		width: 15em;
	}
	#as{
		width: 15em;
	}
	#seats{
		width: 15em;
	}
	#price{
		width: 15em;
	}
	.able{
			background-color: #034F84;
			color: white;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	}
	.disabled{
			background-color: lightGray;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	
	}

</style>
</head>
<body>
	<jsp:include page="Header.jsp" />
	<fieldset>
		<legend>열차 검색</legend>
	<div>
		<center>
		<table>
			<tr>
				<th>
					인원정보
				</th>
				<th>
					장애인
				</th>
			</tr>
			<tr>
				<td>
					<select name="adult" id="adult" class="people">
						<c:forEach var="no" begin="0" end="9">
							<c:choose>
								<c:when test="${adult != null }">
									<option  value="${no }"  ${no == adult ? "selected" : "" }>어른 ${no }명
								</c:when>
								<c:otherwise>
									<option  value="${no }"  ${no == 1 ? "selected" : "" }>어른 ${no }명
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
				<td>
					<select name="disabled" id="disabled" class="people">
						<c:forEach var="no" begin="0" end="9">
							<c:choose>
								<c:when test="${disabled != null }">
									<option  value="${no }"  ${no == disabled ? "selected" : "" }>중경증 ${no }명
								</c:when>
								<c:otherwise>
									<option  value="${no }">중경증 ${no }명
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select name="children" id="children" class="people">
						<option  value="0">만12세 이하
						<c:forEach var="no" begin="1" end="9">
							<c:choose>
								<c:when test="${children != null }">
									<option  value="${no }"  ${no == children ? "selected" : "" }>어린이 ${no }명
								</c:when>
								<c:otherwise>
									<option  value="${no }">어린이 ${no }명
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>	
					<select name="old" id="old" class="people">
						<option  value="0">만65세 이상
						<c:forEach var="no" begin="1" end="9">
							<c:choose>
								<c:when test="${old != null }">
									<option  value="${no }"  ${no == old ? "selected" : "" }>경로 ${no }명
								</c:when>
								<c:otherwise>
									<option  value="${no }">경로 ${no }명
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		</center>
	</div>
	<div>
<!-- 		▶ 여정경로 : <input type="radio" name="di" value="1">편도 <input type="radio" name="di" value="2">왕복 <br> -->
		▶ 출발역 : <input type="text" name="startStationName" id="startStationName" value="${startStation }"><br>
		▶ 도착역 : <input type="text" name="endStationName" id="endStationName" value="${endStation }"> <br>
		▶ 출발일 : 
					<select name="year" id="year">
						<option  value="${year }">${year }
						<option  value="${year+1 }">${year+1 }
						<option  value="${year+2 }">${year+2 }
					</select>
					년
					<select name="month" id="month" onchange="changeDay()">
						<c:forEach var="no" begin="1" end="12">
						<option  value="${no }" ${month ==no ? "selected" : "" } >${no }
						</c:forEach>
					</select>
					월
					<select name="day" id="day">
						<c:forEach var="no" begin="1" end="${lastDay }">
						<option  value="${no }" ${day ==no ? "selected" : "" } >${no }
						</c:forEach>
					</select>
					일
					<select name="hour" id="hour">
						<c:forEach var="no" begin="0" end="23">
						<option  value="${no }" ${hour ==no ? "selected" : "" }>${no }
						</c:forEach>
					</select>
					시
					<input type="submit" value="조회하기" onclick="search();">
	</div>
	</fieldset>
	<div>
	<center>
		<c:choose>
		<c:when test="${timetables.size() > 0 }">
		<table class="search">
				<tr>
					<th colspan="5" class="title">
						검색결과
					</th>
				</tr>
				<tr>
					<th class="ti" id="num">
						열차 번호
					</th>
					<th class="ti" id="ss">
						출발 
					</th>
					<th class="ti" id="as">
						도착 
					</th>
					<th class="ti" id="seats">
						좌석
					</th>
					<th class="ti" id="price">
						가격
					</th>
				</tr>
				<c:forEach var="timetables" varStatus="t" items="${timetables }">
				<c:set var="index" value="${t.index }"></c:set>
					<tr>
						<td class="td">
							${timetables.trainNum }
						</td>
						<td class="td">
							${timetables.startStationName } <br>
							${timetables.startTime }
							
						</td>
						<td class="td">
							${timetables.endStationName } <br>
							${timetables.arriveTime }
							
						</td>
						<td class="td">
							<input type="button" 
							${seatCnts[index] > 0 ? 
							"value='좌석선택' class='able' id='able'" : "value='매진' class='disabled' id='disabled' disabled"}
							onclick='selectSeat(${timetables.trainId},${timetables.tdseq1},${timetables.tdseq2},this.id);'>
						</td>
						<td class="td">
						특실 : <fmt:formatNumber value="${timetables.price*1.1 }"/>원 <br>
						일반 : <fmt:formatNumber value="${timetables.price }"/>원
							
						</td>
					</tr>
				</c:forEach>
		</table>
		</c:when>
		<c:when test="${startStation !=  null }">
		<table class="search" >
				<tr>
					<th colspan="5"  class="title">
						검색결과
					</th>
				</tr>
				<tr>
					<th class="ti" id="num">
						열차 번호
					</th>
					<th class="ti" id="ss">
						출발 
					</th>
					<th class="ti" id="as">
						도착 
					</th>
					<th class="ti" id="seats">
						좌석
					</th>
					<th class="ti" id="price">
						가격
					</th>
				</tr>
			<tr>
				<th colspan="5" class="no">
					검색한 시간대에 열차가 없습니다 ㅠㅠ
				</th>
			</tr>
		</table>
		</c:when>
		</c:choose>
	</center>
	</div>
	<jsp:include page="Footer.jsp"/>
</body>
</html>