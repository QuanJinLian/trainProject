<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reply</title>
<script type="text/javascript">
	function upload_rep(){
		var reply = document.getElementById("editor_r").value.trim();
		var id = "${sessionScope.wokerInfo.id}";
		if(id ==""){
			alert("로그인을 하신 후 사용하세요.");
		}else if(reply == ""){
			alert("답변 내용을 입력 해주세요");
		}else{
			var url ="/trainProject/train/admin/qnaReply.do?reply="
					+reply+"&qseq="+${qna.qseq}+"&id="+id;
			var b = encodeURI(url);
			window.location.href=b;
		}
	}
	function delete_rep(){
		var url ="/trainProject/train/admin/qnaReplyDelete.do?qseq="+${qna.qseq};
	window.location.href=url;
	}

</script>
</head>
<body>
	<c:choose>
	<c:when test="${requestScope.result_update > -1}">
		<script type="text/javascript">
			alert("답글 달기 성공!!");
			var url = "/trainProject/train/admin/qnaDetail.do?qseq=${qseq}";
			window.location.href=url; 
		</script>
	</c:when>
	<c:when test="${requestScope.result_update == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 답글 달기 실패");
						window.history.go(-1);
		</script>
	</c:when>
	<c:when test="${requestScope.result_delete > -1}">
		<script type="text/javascript">
			alert("답글 삭제 성공!!");
			var url = "/trainProject/train/admin/qnaDetail.do?qseq=${qseq}";
			window.location.href=url; 
		</script>
	</c:when>
	<c:when test="${requestScope.result_delete == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 답글 삭제 실패");
						window.history.go(-1);
		</script>
	</c:when>
	</c:choose>

	<jsp:include page="adminHeader.jsp" />
	<form action=""  name="frm" style="text-align: center;">
		<table>	
			<tr >
				<th colspan="6" style="font-size: 30px; color: purple; text-align:center ;">
				Q & A
				</th>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					제 목
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					<input type="text" name="subject" id="subject" maxlength="15" size="40" readonly="readonly" value="${qna.subject }"> 
				</th>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					작 성 일
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid purple;border-top: 3px solid purple;">
					<fmt:formatDate value="${qna.indate }" type="Date"/> 
				</th>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid purple;">
					내용
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid purple;">
					
				</th>
			</tr>
			<tr>
				<td colspan="6"  style=" border-bottom: 3px solid purple;">
					<textarea cols="60" id ="editor_q" name='editor' rows="5" 
					style="padding:5 ; border: 2 silver solid; width: 100%; font-size: 18px; font-weight: 900;" 
					readonly="readonly"/>${qna.content}</textarea>
				</td>
			</tr>
			<tr>
				<th   style="font-size: 18px; width: 5% ; text-align: center ; border-bottom: 3px solid purple;">
					답변내용
				</th>
				<th colspan="5"  style="font-size: 18px; width: 45% ; text-align: left ; border-bottom: 3px solid purple;">
					<span style="color: gray; font-size: 13px; ">(답변 id : ${qna.rep_id}  )</span>
				</th>
			</tr>
			
	<c:choose>  
		<c:when test="${qna.rep == 2 }"> 
			<tr>
				<td colspan="6"  style=" border-bottom: 3px solid purple;">
					<textarea cols="60" id ="editor_r" name='reply' rows="5" readonly="readonly"
					style="padding:5 ; border: 2 silver solid; width: 100%; font-size: 18px; font-weight: 900;" />답 변 내 용:  ${qna.reply}</textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="6" align="left" >
				 	<input type="button" value="답글삭제"  onclick="delete_rep();"
				 	style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;">
				
				</td>
			</tr>
			
		</c:when>
		<c:when test="${qna.rep == 1 }"> 
			<tr>
				<td colspan="6"  style=" border-bottom: 3px solid purple;">
					<textarea cols="60" id ="editor_r" name='reply' rows="5" style="padding:5 ; border: 2 silver solid; width: 100%; font-size: 18px; font-weight: 900;" placeholder="아직 답변한 내용이 없습니다.
답변을 등록 해주세요." /></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="6" align="center" >
				 	<input type="button" value="등록하기"  onclick="upload_rep();"
				 	style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;">
				 	&nbsp;
				 	<input type="button" value="취소" style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1;border-radius: 12px; cursor:pointer;" onclick="window.history.go(-1)">
				</td>
			</tr>
		</c:when>
	</c:choose>
			<tr>
			<td colspan="6"  align="right" style="padding-right: 10em;">
			 	<input type="button" value="목록보기"  onclick='location.href="/trainProject/train/admin/qna.do"' style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #FFE4E1; border-radius: 12px; cursor:pointer" />

			</td>
			</tr>
	</table>
	</form>
	

</body>
</html>