<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 관리</title><style type="text/css">
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
	var checkBoxs = document.getElementsByName("qnas");
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
	var checkBoxs = document.getElementsByName("qnas");
	if(checkBoxs[0].checked == true){
		checkBoxs[0].checked = false;
	}
}
function delete_member(){
		var qseqs = [];
	var checkBoxs = document.getElementsByName("qnas");
		for(var i =0; i < checkBoxs.length; i++){
			if( i > 0 && checkBoxs[i].checked ==true){
				qseqs.push(checkBoxs[i].value);
			}
		} 
 		if(qseqs.length == 0){
			alert("삭제할 질문을 체크해주세요.");
			return;
		}
		var url ="/trainProject/train/admin/QnADelete.do?qseqs="+qseqs;
		window.location.href=url; 
}
</script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>
<c:set var="size" value="${requestScope.qnas.size()+1 }"/>
	<form action="">
	<center>
		<table class="list">
		<tr class="title">
			<td colspan="6"  class="ti" >
				Q&A List
			</td>
		</tr>
		<tr>
			<td colspan="3" align="left">
			 	<input type="button" value="삭제하기" class="b_delete" onclick="delete_member();">
			</td>
			<td colspan="3" align="right">
			</td>
		</tr>
		<tr class="colName">
			<th class="th">
				<input type='checkbox' name='qnas' onclick="selectAll();">
			</th>
			<th class="th" >
				번호
			</th>
			<th class="th">
				제목
			</th>
			<th class="th">
				내용
			</th>
			<th class="th">
				작성자
			</th>
			<th class="th">
				작성일
			</th>
		</tr>
	<c:forEach var="qnas" items="${requestScope.qnas }">
		<c:set var="size" value="${size-1 }"/>
		<tr >
			<td class="td">
				<input type='checkbox' name='qnas' value="${qnas.qseq }" onclick="checkbox();">
			</td>
			<td class="td">
				${size}
			</td>
			<td class="td">
				${qnas.subject }
			</td>
			<td class="td">
				<a href="/trainProject/train/admin/qnaDetail.do?qseq=${qnas.qseq }">
				${qnas.content } [${qnas.rep-1 }]
				</a>
			</td>
			<td class="td">
				${qnas.id }
			</td>
			<td class="td">
				<fmt:formatDate value="${qnas.indate }"/>
			</td>
		</tr>
	</c:forEach>
		</table>
	</center>
	</form>

</body>
</html>