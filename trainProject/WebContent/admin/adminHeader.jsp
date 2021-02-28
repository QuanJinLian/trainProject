<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<div style="background-color : #FFB6C1; color : black ; height : 4em;
		padding : 5px;">
		<a href="/trainProject/admin/adminPage.jsp">
		<i class='fas fa-home' style='font-size:36px; color: black; margin-left: 1em; margin-top: 0.4em;' ></i></a>
		
		<c:set var="wokerinfo" value="${sessionScope.wokerInfo}"/>

		
		<c:choose>
			<c:when test="${wokerinfo != null and wokerinfo.id !=null}">
				<span style="float:right; margin-top: 2em;">
				${wokerinfo.name}
				<a style="color : white ; "  href="${pageContext.request.contextPath }/train/admin/logout.do">로그아웃</a>
		
				</span>
			</c:when>
			<c:otherwise>
				<c:redirect url="${pageContext.request.contextPath }/train/admin/logout.do"></c:redirect>
			</c:otherwise>
		</c:choose> 
		
		

		
</div>