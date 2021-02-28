<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
	
</style>
</head>
<body>
	<jsp:include page="adminHeader.jsp"/>
	<center>
	<div class="one">
		<input type="button" class="button" value="열차" onclick="location.href='/trainProject/train/admin/trainPageForm.do'"/>
		&nbsp;&nbsp;&nbsp;
		<input type="button" class="button" value="주문" onclick="location.href='/trainProject/train/admin/trainOrderPage.do'"/>
	</div>
	<div class="two">
		<input type="button" class="button"  value="회원" onclick="location.href='/trainProject/train/admin/user.do'"/>
		&nbsp;&nbsp;&nbsp;
		<input type="button" class="button"  value="질문" onclick="location.href='/trainProject/train/admin/qna.do'"/>
	</div>

	</center>
</body>
</html>