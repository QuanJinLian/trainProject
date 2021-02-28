<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<c:set var="noMember" value="${requestScope.noMember}" />
	
	<c:choose>
		<c:when test="${noMember == 'n' }">
			<script>
			alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다. \n 다시 입력해 주세요."); 
			window.history.go(-1); 
			</script>
	</c:when>
		
		<c:when test="${noMember != 'n' }">	
			
				<form action="/trainProject/train/user/login.do" method="post">
				<h1 align="center">****로 그 인****</h1>
				<table border="0" align="center">
					<tr>
						<td colspan="2" align="center"><a href="/trainProject/train/user/index.do"> <img
								src="/trainProject/user/img/logo.jpg" width="200px" height="200px" />
						</a></td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><font color="DarkMagenta" size="4"> 
						<strong>아  이  디</strong></td>
						<td rowspan="4" align="center"><input type="submit" value="로그인">
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="text" name="id" size="50" value="${id}">
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><font color="DarkMagenta"
							size="4"> <strong>비     번</strong></td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="text"
							name="pwd" size="50"></td>
					</tr>
			
				</table><p>
				
				<center>
				<a href=" /trainProject/train/user/memberJoinin.do?form=form">회원가입</a>
				<font color="white" size="3">
				_____</font>
				<a href="#" >아이 찾기</a>
				<font color="white" size="3">
				_____</font>
				<a href="#">비번 찾기</a>
				<font color="white" size="3">
				_____</font>
				</center>
				</form>

		</c:when>
	</c:choose>
</body>
</html>