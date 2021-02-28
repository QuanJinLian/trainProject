<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	form{text-align: center;
			float: center
			}
	.right{text-align: center;
			font-size: 1em;
			font-weight: bold;}
	.left{text-align: left;}
	.title{font-size: 1.8em;
			font-weight: 900;}
	table{text-align: center;
			margin-top: 5em;
			font-size: 1.2em;}
	input{font-size: 1.2em;}
	select {font-size: 1.2em;
			width: 15em;
	}
	textarea {
	font-size: 1.8em;
}
</style>
<script type="text/javascript">

	function checktrim(){
		var name = document.getElementById("name").value;
		var type = document.getElementById("type").value;
		
		if(name == "" || type == "" ){
			alert("비어있는 내용이 없어야 합니다!!!");
			return false;
		}else if(name != "" && type != ""){
			return true;
		}
	}

</script>
</head>
<body>
	<jsp:include page="adminHeader.jsp" />
	<form action="/trainProject/train/admin/addTrain.do" method="post"  onsubmit="return checktrim();" >
<center>
		<table>
			<tr class="title">
				<th colspan="3" class="title" >
					기차 등록
				</th>
			<tr>
				<td class="right">
					기차 이름
				</td>
				<td colspan="2">
					<input type="text" size="70" maxlength="50" id="name" name="name" placeholder="ex) ktx-127">
				</td>
			</tr>
			<tr>
				<td class="right">
					기차 타입
				</td>
				<td colspan="2">
					<input type="text" size="70" maxlength="50" id="type" name="type" placeholder="ex) 무궁화">
				</td>
			</tr>
			<tr>
				<td class="right">
					상태
				</td>
				<td colspan="2" class="left">
					<select name="stmt" id="stmt">
						<option value="운영">운영</option>
						<option value="고장">고장</option>
						<option value="중단">중단</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3"  >
				 	<input type="submit" value="등록하기"  
				 	style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;">
				 	&nbsp;
				 	<input type="button" value="취소" style="height: 100% ;width: 20% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="window.history.go(-1)">
				</td>
			</tr>
		</table>
	</center>
	</form>
</body>
</html>