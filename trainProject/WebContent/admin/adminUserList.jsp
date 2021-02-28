<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<style type="text/css">
form{text-align: center;}
table.list {
		float: center;
		margin-top: 5em;
}
tr{
	font-size: 20px;
}
.th{
	text-align:center;
	padding-left: 1em;
	padding-right: 1em;
	border-bottom: 3px solid purple;
	border-top: 3px solid purple;
}
.ti{
	text-align:center;
	border-bottom: 1px solid gray;
}
.title{
	text-align:center;
	font-size: 2em;
	text-align: left;
	font-weight: 900;
}
.td{
	text-align:center;
	border-bottom: 1px solid gray;
}
.b_delete{
			color: #FF0000; 
			background-color:#FFE4E1; 
			font-size: 15px; 
			font-weight: bold; 
			border: 2px solid #FFB6C1; 
			border-radius: 12px; 
			cursor:pointer
}
.b_update{
			background-color: #FFB6C1;  
			font-size: 24px; 
			font-weight: 900; 
			height: 100% ;  
			border: 2px solid #FFB6C1; 
			border-radius: 12px; 
			cursor:pointer
}
	a{text-decoration:none;}

</style>
<script type="text/javascript">
function selectAll(){
	var checkBoxs = document.getElementsByName("members");
	if(checkBoxs[0].checked == true){
		for(var i =0; i < checkBoxs.length; i++){
				checkBoxs[i].checked = true;
		}
	}else{
		for(var i =0; i < checkBoxs.length; i++){
			checkBoxs[i].checked = false;
		}
	}
}
function checkbox(){
	var checkBoxs = document.getElementsByName("members");
	if(checkBoxs[0].checked == true){
		checkBoxs[0].checked = false;
	}
}
function delete_member(){
		var ids = [];
	var checkBoxs = document.getElementsByName("members");
		for(var i =0; i < checkBoxs.length; i++){
			if( i > 0 && checkBoxs[i].checked ==true){
				ids.push(checkBoxs[i].value);
			}
		} 
 		if(ids.length == 0){
			alert("삭제할 회원을 체크해주세요.");
			return;
		}
		var url ="/trainProject/train/admin/MemberDelete.do?ids="+ids;
		window.location.href=url; 
}
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>
<c:set var="size" value="${members.size()+1 }"/>
	<form action="">
	<center>
		<table class="list">
		<tr class="title">
		<td colspan="12"  class="ti" >
			Member List
		</td>
		</tr>
		<tr>
		<td colspan="5" align="left">
		 	<input type="button" value="삭제하기" class="b_delete" onclick="delete_member();">
		</td>
		<td colspan="5" align="right">
<!-- 		 	<input type="button" value="회원가입 하기" class="b_update" onclick="location.href=''"> -->
		</td>
		</tr>
		<tr class="colName">
			<th class="th">
				<input type='checkbox' name='members' onclick="selectAll();">
			</th>
			<th class="th" >
				No
			</th>
			<th class="th">
				아이디
			</th>
			<th class="th">
				이름
			</th>
			<th class="th">
				이메일
			</th>
			<th class="th">
				우편번호
			</th>
			<th class="th">
				주소
			</th>
			<th class="th">
				핸드폰
			</th>
			<th class="th">
				탈퇴여부
			</th>
			<th class="th">
				가입날짜
			</th>
		</tr>
	<c:forEach var="members" items="${requestScope.members}">
	<c:set var="size" value="${size-1 }"/>
		<tr >
		<td class="td">
			<input type='checkbox' name='members' value="${members.id }" onclick="checkbox();">
		</td>
		<td class="td">
			${size}
		</td>
		<td class="td">
			<a href="/trainProject/train/admin/UserUpdate.do?id=${members.id }">
			${members.id }
			</a>
		</td>
		<td class="td">
			${members.name }
		</td>
		<td class="td">
			${members.email }
		</td>
		<td class="td">
			${members.zip_num }
		</td>
		<td class="td">
			${members.address }
		</td>
		<td class="td">
			${members.phone }
		</td>
		<td class="td">
			${members.useyn =="y" ? "가입":"탈퇴" }
		</td>
		<td class="td">
			<fmt:formatDate value="${members.indate }"/>
			
		</td>
		</tr>
	</c:forEach>
		</table>
	</center>
	</form>
</body>
</html>