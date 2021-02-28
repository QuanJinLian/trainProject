<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<style type="text/css">
	div.one{
			width : 40em;
			height :10em;
			float : center; 
			margin-top: 10em;
			}
	div.two{
			width : 40em;
			height :10em;
			float : center;  }
	.button{
			width : 20em;
			height : 10em;
			background-color: #FFB6C1;
			font-size: 0.8em;
			font-weight: 900;
			text-align: center;
	}
	.one{
		font-size: 1.5em;
	}
	
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp"/>
	<center>
	<div class="one">
		<input type="button" class="button" value="주문 리스트" onclick="location.href='/trainProject/train/admin/OrderList.do'"/>
		&nbsp;&nbsp;&nbsp;
		<button  class="button"  onclick="location.href='/trainProject/train/admin/OrderCancelList.do?cancelyn=y'">
			환불요청	<span class="w3-badge w3-red w3-right" > ${requestScope.cancelCnt }</span>
		</button>
	</div>

	</center>
</body>
</html>