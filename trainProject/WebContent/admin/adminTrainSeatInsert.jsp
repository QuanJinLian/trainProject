<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열차 시트 생성</title>
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

	function addrows(){

        var addedFormDiv = document.getElementById("addedFormDiv");

       

        var str = "";

        str+="<br>"+count+"-*호차 : <input type='number' name='carriage'  size='10' min='1' max='30' placeholder='예)1'>&nbsp;";

        str+="한열의 시트수 : <input type='number' name='seatsCnt' placeholder='예)4' size='10' min='1' max='30'>&nbsp;";

        str+="총 열수 : <input type='number' name='row'  placeholder='예)4' size='10' min='1' max='30'>&nbsp;";

        str+="일반 / 특실 : <input type='radio'  name='"+count+"' value='일반'  checked='checked'  />일반 &nbsp;<input type='radio'  name='"+count+"' value='특실'  />특실<br> ";

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
	function checkCarriage(){
		
	}
	
	function checktrim(){
		var inputs = document.getElementsByTagName("input");
		
			if(inputs.length < 6){
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
						if((i-3) % 5 == 0){
							for(var j = 3; j <inputs.length; j +=5){
								if(i != j){
									if(inputs[i].value == inputs[j].value){
										alert("호차번호가 중복되어서는 않됩니다.");
										check = false;
										return check;
									}
								}
							}
						}
					}
					 
				}
			}
			check = true;
		return check;
	}
	
	function creatSeats(){
		try{
		checktrim();
		if(check == true){
			var carriages =  new Array();
			var seatsCnts =  new Array();
			var rows = new Array();
			var types = new Array();
			var id = "${id}";
			
			
			var carriage = document.getElementsByName("carriage");
			var seatsCnt = document.getElementsByName("seatsCnt");
			var row = document.getElementsByName("row");
			
			var radios = document.getElementById("addedFormDiv").getElementsByTagName("input")
			for(var i =0; i < radios.length; i++){
				if(radios[i].checked ==true){
					types.push(radios[i].value);
				}
			} 
			
			for(var i = 0 ; i < carriage.length; i++){
				carriages.push(carriage[i].value);
				seatsCnts.push(seatsCnt[i].value);
				rows.push(row[i].value);
			}			
			
			
// 			alert("carriages-" +carriages);
// 			alert("seatsCnts-" +seatsCnts);
// 			alert("rows-" +rows);
// 			alert("types-" +types);
// 			alert("id-" +id);

			url = "/trainProject/train/admin/insertSeats.do?id="+id+"&carriages="+carriages
					+"&seatsCnts="+seatsCnts+"&rows="+rows+"&types="+types;
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
		<table id="timetable">
			<tr class="title">
				<th colspan="11" class="title" >
					열차 시트 생성
				</th>
			<tr>
				<td class="right">
					열차 아이디 : 
				</td>
				<td colspan="10" class="left">
					${id }
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
				 	<input type="button" value="생성하기"  
				 	style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="creatSeats();">
				 	&nbsp;
				 	<input type="button" value="취소" style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="window.history.go(-1)">
				</td>
			</tr>
		</table>
	</center>
	</form>
</body>
</html>