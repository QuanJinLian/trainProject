<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배차 하기</title>
<style type="text/css">
	form{text-align: center;
			float: center
			}
	.center{text-align: center;
			font-size: 1em;
			font-weight: bold;}
	.right{text-align: right;
			font-size: 1em;
			font-weight: bold;}
	.left{text-align: left;}
	.title{font-size: 1.8em;
			font-weight: 900;}
	table{text-align: center;
			margin-top: 5em;
			font-size: 1.2em;
			width: 70em;}
	input{font-size: 1.2em;}
	.button{
				width: 7%;
				height: 100%;
				font-size: 18px;
				font-weight: bold;}
	select {font-size: 1.2em;
			width: 15em;
	}
	textarea {
	font-size: 1.8em;
}
	.bt{
	width: 50em;
	height: 2em;
	
	}
</style>
<script type="text/javascript">

var count = 1;
var check = false;
	// 오늘 이전의 날짜는 선택 불가 상태로 만든다
	function datepicker(){
		try{
			var date = new Date();
			var year = date.getFullYear();
			var month = ('0'+ (date.getMonth() + 1)).slice(-2);
			var day = ('0' + date.getDate()).slice(-2);
			var time = year +'-'+ month +'-'+ day;
			console.log(time);
			document.getElementById('startDate').setAttribute('min', time);
			document.getElementById('endDate').setAttribute('min', time);
		}catch (e) {
			alert(e);
		}
	}

	function addrows(){

        var addedFormDiv = document.getElementById("addedFormDiv");

       

        var str = "";

        str+="<br>"+count+"-출발역 <input type='text' name='startStation'  size='5'>";

        str+="출발시간<input type='text' name='startTime' placeholder='예)14:05:00' size='10'>";

        str+="도착역<input type='text' name='endStation' size='5'>";

        str+="도착시간<input type='text' name='endTime' placeholder='예)16:10:00' size='10'>";
        
        str+="가격 <input type='text' name='price' size='5'> 정차시간<input type='text' name='stoptime' size='5' placeholder='예)3 or 0'> <br>";
        

        // 추가할 폼(에 들어갈 HTML)
			
			
			
			
       

        var addedDiv = document.createElement("div"); // 폼 생성

        addedDiv.id = "added_"+count; // 폼 Div에 ID 부여 (삭제를 위해)

        addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입

        addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입



        count++;

        document.baseForm.count.value=count;

        // 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장
	}
	function deleterow(){

        var addedFormDiv = document.getElementById("addedFormDiv");



        if(count >2){ // 현재 폼이 두개 이상이면

                   var addedDiv = document.getElementById("added_"+(--count));

                   // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴

                   addedFormDiv.removeChild(addedDiv); // 폼 삭제 

        }else{ // 마지막 폼만 남아있다면

                   document.baseForm.reset(); // 폼 내용 삭제

        }
    }
	
	function checktrim(){
		var inputs = document.getElementsByTagName("input");
		var select = document.getElementById("trainId");
		var i = select.selectedIndex;
		var name = select.options[i].text;
		var id =  select.options[i].value;
		var timeExp = /\d{2}:\d{2}:\d{2}$/;
		
		if(id == "열차선택"){
			alert("열차 선택해주세요!!!");
			check = false;
			return check;
		}else{
			if(inputs[0].value == "" || inputs[1].value == ""){
				alert("날짜를 선택해 주세요!!!");
				check = false;
				return check;
			}else{
				if(inputs[0].value > inputs[1].value){
					alert("시작일이 종료일보다 작아야 합니다.");
					check = false;
					return check;
				}
			}
			if(inputs.length < 8){
				alert("+버튼을 클릭하여 배차를 진행해주십시오!!!");
				check = false;
				return check;
			}else{
				for(var i = 0 ; i < inputs.length; i++){
					 if(inputs[i].value == ""){
						alert("비어있는 내용이 없어야 합니다!!!");
						check = false;
						return check;
					}else{
						if((i - 5) % 6 == 0 && i > 5 && inputs[i].value != inputs[i-4].value && inputs[i].value != "배차하기"){
							alert("위라인의 도착역과 다음라인의 출발역은 같아야 합니다.");
							check = false;
							return check;
						}else if((i - 7) % 6 == 0 && i > 4  && inputs[i].value == inputs[i-2].value){
							alert("출발역과 도착역이 달라야 합니다.");
							check = false;
							return check;
						}else if(i > 5 && (i -6) % 6 ==0 && !timeExp.test(inputs[i].value) && inputs[i].value != "취소"){
							alert("출발시간 중 정규식과 맞지않은 내용이 있습니다");
							check = false;
							return check;
						}else if(i > 5 && (i -8) % 6 ==0 && !timeExp.test(inputs[i].value)){
							alert("도착시간 중 정규식과 맞지않은 내용이 있습니다");
							check = false;
							return check;
						}
					}
				}
			}
			check = true;
		}
		return check;
// 		if(name == "" || type == "" ){
// 			alert("비어있는 내용이 없어야 합니다!!!");
// 			return false;
// 		}else if(name != "" && type != ""){
// 			return true;
// 		}
	}
	
	function creatTimetable(){
		try{
		checktrim();
		if(check == true){
			var startStations =  new Array();
			var startTimes =  new Array();
			var endStations =  new Array();
			var endTimes = new Array();
			var prices =  new Array();
			var stoptimes =  new Array();
			
			var select = document.getElementById("trainId");
			var i = select.selectedIndex;
			var name = select.options[i].text;
			var id =  select.options[i].value;
			
			var startDate = document.getElementById("startDate").value;
			var endDate = document.getElementById("endDate").value;
			
			var startStation = document.getElementsByName("startStation");
			var startTime = document.getElementsByName("startTime");
			var endStation = document.getElementsByName("endStation");
			var endTime = document.getElementsByName("endTime");
			var price = document.getElementsByName("price");
			var stoptime = document.getElementsByName("stoptime");
			
			
			for(var i = 0 ; i < startStation.length; i++){
				startStations.push(startStation[i].value);
				startTimes.push(startTime[i].value);
				endStations.push(endStation[i].value);
				endTimes.push(endTime[i].value);
				prices.push(price[i].value);
				stoptimes.push(stoptime[i].value);
			}			
			
			
// 			alert("startDate-" +startDate);
// 			alert("endDate-" +endDate);
// 			alert("startStation-" +startStations);
// 			alert("startTime-" +startTimes);
// 			alert("endStation-" +endStations);
// 			alert("endTime-" +endTimes);
// 			alert("price-" +prices);
// 			alert("stoptime-" +stoptimes);
// 			alert("name-" +name);
// 			alert("id-" +id);
			url = "/trainProject/train/admin/insertTimetable.do?id="+id+"&name="+name
					+"&startDate="+startDate+"&endDate="+endDate+"&startStations="+startStations
					+"&startTimes="+startTimes+"&endStations="+endStations+"&endTimes="+endTimes
					+"&prices="+prices+"&stoptimes="+stoptimes;
			window.location.href=url; 
		}
		}catch (e) {
			alert(e);
		}
	}

</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<form action="" method="post"   >
<center>
		<table id="timetable" border="1" >
			<tr class="title">
				<th colspan="11" class="title" >
					열차 배차
				</th>
			<tr>
				<td class="left">
					열차 아이디
				</td>
				<td colspan="10" class="left">
					<select name="trainId" id="trainId">
							<option  value="열차선택">열차 선택하기
						<c:forEach var="trains" items="${requestScope.trains }">
							<option  value="${trains.id }">${trains.name }
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td  colspan="11" class="left">
				시작일<input type="date" id="startDate" onclick="datepicker();">
				종료일<input type="date" id="endDate" onclick="datepicker();">
				</td>
			</tr>
			<tr>
				<td colspan="11" class="right">
					<input type="button" value="+" class="button" onclick="addrows();" >
					&nbsp;
					<input type="button" value="-" class="button" onclick="deleterow();" >
				</td>
			</tr>
			<tr>
			<td colspan="11">
           <input type="hidden" name="count" value="0">
			<div id="addedFormDiv">
			</div>
			</td>
			</tr>
		</table>
		<table class="bt">
			<tr>
				<td colspan="11"  >
				 	<input type="button" value="배차하기"  
				 	style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="creatTimetable();">
				 	&nbsp;
				 	<input type="button" value="취소" style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="window.history.go(-1)">
				</td>
			</tr>
		</table>
	</center>
	</form>
</body>
</html>