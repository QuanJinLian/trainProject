<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<style type="text/css">
  form{text-align: center; padding-top: 50px}
	ol {
            display: flex;
            flex-flow: row nowrap;
            justify-content: center;
        }
	ol li{	 
            list-style: none;
            text-align: center;
            line-height: 10px;
            padding: 5px;
            height: 10px;
            width: 10px;
            margin: 10px;}
 
</style>
	<script type="text/javascript">
		function WriteQnA(){
			var url ="/trainProject/train/user/writeQ&A.do?form=form";
			window.location.href=url;
		}
		function changeViewCnt_onePage(){
			var cnts = document.getElementById("viewCnt_onePage");
			var viewCnt_onePage = cnts.options[cnts.selectedIndex].value;
			var url ="/trainProject/train/user/qnaList.do?pageNo=1&viewCnt_onePage="+viewCnt_onePage;
			window.location.href=url;
		}
		function page(page){
			var cnts = document.getElementById("viewCnt_onePage");
			var viewCnt_onePage = cnts.options[cnts.selectedIndex].value;
			var url ="/trainProject/train/user/qnaList.do?pageNo="+page+"&viewCnt_onePage="+viewCnt_onePage;
			window.location.href=url;
		}
	
	</script>
</head>
<body>
	<c:set var="qnas" value="${requestScope.qnas}" />
	<c:set var="pageCnt" value="${requestScope.pageCnt}" />
	<c:set var="pageNo" value="${requestScope.pageNo}" />
	<jsp:include page="Header.jsp" />
	
	<form action=""  name="frm" style="text-align: center;">
		<table>	
			<tr >
				<th colspan="6" style="font-size: 30px; color: #6F9FD8; text-align:center ;">
				Q & A
				</th>
			</tr>
			<tr   style="font-weight: 900; color: black;">
				<th  colspan="3" style="font-size: 8px; color: #6F9FD8;">
					&nbsp;
				</th>
				<th   style="font-size: 1em; color: #6F9FD8;  " align="right">
					&nbsp; 
				</th>
				<th   style="font-size: 1em; color: purple;">
					<select name="viewCnt_onePage" id="viewCnt_onePage" style="height: 100%;" onchange="changeViewCnt_onePage()">
						<option value="5" ${viewCnt_onePage ==5 ? "selected" : "" }>5개씩
						<option value="10" ${viewCnt_onePage ==10 ? "selected" : "" }>10개씩
						<option value="15" ${viewCnt_onePage ==15 ? "selected" : "" }>15개씩
					</select>
				</th>
				<th   style="font-size: 1em; color: #6F9FD8;">
					&nbsp;
				</th>
			</tr>
			<tr>
				<th  style="font-size: 18px; width: 15% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					번호
				</th>
				<th   style="font-size: 18px; width: 20% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					제 목
				</th>
				<th   style="font-size: 18px; width: 40% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					내 용
				</th>
				<th   style="font-size: 18px; width: 15% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					작성자
				</th>
				<th colspan="2" style="font-size: 18px; width: 15% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					작성일
				</th>
			</tr>
		<c:choose>
		<c:when test="${requestScope.qnas.size()>0}">
		<c:forEach  var="qnas" items="${qnas}">	
			<tr >
				<td style="height: 50px; ">
					${qnas.qseq}
				</td>
				<td>
					${qnas.subject}
				</td>
				<td>
					<a href="/trainProject/train/user/qnaDetail.do?qseq=${qnas.qseq}">
					${qnas.content}
					</a>
					&nbsp; &nbsp; [${qnas.rep-1}]
				</td>
				<td>
					${qnas.id}
				</td>
				<td>
					<fmt:formatDate value="${qnas.indate}" type="date"/>
					
				</td>
			</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr >
				<th colspan="6" style="font-size: 50px; color: #6F9FD8; text-align:center ; border-bottom: 3px solid #6F9FD8;">
				<hr>
				질문 내용이 없습니다. ㅠ ㅠ 
				<hr>
				</th>
			</tr>
		</c:otherwise>
		</c:choose>	
			<tr >
				<th colspan="6" style=" text-align: right; border-bottom: 1px solid gray;border-top: 3px solid #6F9FD8;">
					<input type="button" value="글쓰기"  onclick="WriteQnA();"
					style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8">
				</th>
			</tr>
		
		<tr>
			<th colspan="6" style=" text-align:center ; font-size: 18px; ">
			<ol>
				<c:choose>
					<c:when test="${pageNo != 1}">
						<li><a onclick="page(${pageNo-1});"><%="<" %></a></li>
					</c:when>
				</c:choose>
				
				<c:forEach var="pageNum"  begin="1" end="${pageCnt}">
						<li><a  onclick="page(${pageNum});">${pageNum}</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageNo != pageCnt}">
						<li><a  onclick="page(${pageNo+1});"><%=">" %></a></li>
					</c:when>
				</c:choose>
			</ol>
			</th>
		</tr>
	
	
	
	
	
	
	
	</table>
	</form>
	<jsp:include page="Footer.jsp"/>
</body>
</html>