<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문내용</title>
	<script type="text/javascript">
		function updateQnA(){
 	        var editor = document.getElementById("editor_q");
 	        
 	       if(editor.readOnly ==true){
 	 	       editor.removeAttribute("readOnly");  //editor 텍스트필드의 readonly를 풀어줌
 	       }else{
 	    	   if(editor.value == ""){
 	    		   alert("내용이 없습니다. \n내용을 입력해주세요!!!");
 	    	   }else{
 	 				var url = "/trainProject/train/user/qnaDetail.do?qseq=${qna.qseq}&update="+editor.value;
 	 			    var b = encodeURI(url);
 	 	 	 		window.location.href=b;
 	    	   }
 	       }
		}
	
	</script>

</head>
<body>

<c:choose>
	<c:when test="${requestScope.resultUp == 1 or requestScope.resultUp == 0}">
		<script type="text/javascript">
			alert("질문 수정 성공!!");
			window.location.reload;
		</script>
	</c:when>
	<c:when test="${requestScope.resultUp == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 질문 수정 실패");
						window.history.go(-1);
		</script>
	</c:when>
</c:choose>

	<jsp:include page="Header.jsp" />
	<form action=""  name="frm" style="text-align: center;">
		<table>	
			<tr >
				<th colspan="6" style="font-size: 30px; color: #6F9FD8; text-align:center ;">
				Q & A
				</th>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					제 목
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					<input type="text" name="subject" id="subject" maxlength="15" size="40" readonly="readonly" value="${qna.subject }"> 
				</th>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					작 성 일
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid #6F9FD8;border-top: 3px solid #6F9FD8;">
					<fmt:formatDate value="${qna.indate }" type="Date"/> 
				</th>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid #6F9FD8;">
					내용
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid #6F9FD8;">
					
				</th>
			</tr>
			<tr>
				<td colspan="6"  style=" border-bottom: 3px solid #6F9FD8;">
					<textarea cols="60" id ="editor_q" name='editor' rows="5" 
					style="padding:5 ; border: 2 silver solid; width: 100%; font-size: 18px; font-weight: 900;" 
					readonly="readonly"/>${qna.content}</textarea>
				</td>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid #6F9FD8;">
					답변내용
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid #6F9FD8;">
					<span style="color: gray; font-size: 13px; ">(답변 id : ${qna.rep_id}  )</span>
				</th>
			</tr>
			
	<c:choose>  
		<c:when test="${qna.rep == 2 }"> 
			<tr>
				<td colspan="6"  style=" border-bottom: 3px solid #6F9FD8;">
					<textarea cols="60" id ="editor_r" name='editor' rows="5" readonly="readonly"
					style="padding:5 ; border: 2 silver solid; width: 100%; font-size: 18px; font-weight: 900;" />답 변 내 용:  ${qna.reply}</textarea>
				</td>
			</tr>
			
		</c:when>
		<c:when test="${qna.rep == 1 }"> 
			<tr>
				<td colspan="6"  style=" border-bottom: 3px solid #6F9FD8;" align="center">
					<textarea cols="60" rows="5" readonly="readonly" 
					style=" border: 2 silver solid; width: 100%; font-size: 30px; color: #FFE4E1; font-weight: 900;" />        
                    	아직 답변한 내용이 없습니다.
					</textarea>
				</td>
			</tr>
		</c:when>
	</c:choose>
			<tr>
			<td colspan="6"  align="right" style="padding-right: 10em;">
				<c:if test="${sessionScope.memberInfo.id == qna.id && qna.rep ==1 }">
					<input type="button" value="질문 수정" onclick="updateQnA()" style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8; border-radius: 12px; cursor:pointer"/>
					&nbsp;&nbsp;&nbsp;
				</c:if>
			 	<input type="button" value="목록보기"  onclick='location.href="/trainProject/train/user/qnaList.do?pageNo=1&viewCnt_onePage=5"' style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8; border-radius: 12px; cursor:pointer" />
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="열차 예약" onclick='location.href="/trainProject/train/user/index.do"'style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8; border-radius: 12px; cursor:pointer;" />
			</td>
			</tr>
	</table>
	</form>
	
	<jsp:include page="Footer.jsp"/>

</body>
</html>