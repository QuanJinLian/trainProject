<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
	table {margin:  5px 100px;
			align-content:center; align-items: center}
	#left {text-align: left;}
	#center {text-align: center;}
	a{text-decoration:none;}
	.menu{
		margin-left: 3em;
		background-color: #6B5B95;
	}
</style>
 <div style="background-color : #6F9FD8 ; height : 7em;
		padding : 1em; color: black; font-size: 1.3vw;  font-weight:bold; overflow: hidden;" >
		<c:set var="memberInfo" value="${sessionScope.memberInfo}"/>
		<c:choose>
			<c:when test="${memberInfo !=null and memberInfo.name != null}">
					<span style="float:right;  color: black;" >
						<a href="/trainProject/train/user/personalProfile.do?form=form">${memberInfo.name}님</a>  
						/  
						<a href="/trainProject/train/user/logout.do">로그아웃</a> 
						/
						<a href="/trainProject/train/user/qnaList.do?pageNo=1&viewCnt_onePage=5">고객센터</a> 
					</span><br>
			</c:when>
			<c:when  test="${memberInfo ==null or memberInfo.name == null}">
					<span style="float:right;">
						<a   href="/trainProject/train/user/login.do?form=form">LOGIN</a>   
						/
						<a   href="/trainProject/train/user/memberJoinin.do?form=form">JOIN</a>
						/
						<a  href="/trainProject/train/user/qnaList.do?pageNo=1&viewCnt_onePage=5">고객센터</a> 
					</span><br>
			</c:when>
		</c:choose>
		<center>
		<a href="/trainProject/train/user/index.do">  <!--초기화면 -->
		<img src="/trainProject/user/img/logo2.jpg"  width="120vmin" height="80vmin" /></a>
		
		<span class="menu">
		<a   href="/trainProject/train/user/index.do">승차예약권</a>  
		</span>
		
		<span class="menu">
		<a   href="/trainProject/train/user/reserveList.do?form=form">발권 / 취소</a>  
		</span>
		
		<span class="menu">
		<a   href="/trainProject/train/user/orderList.do?form=form">주문내역</a>  
		</span>  
		
		
		</center>
		
	
</div>