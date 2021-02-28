<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style type="text/css">
  form{text-align: center; padding-top: 50px}
</style>
<script type="text/javascript">
	function upload_qna(){
		var content = document.getElementById("editor").value.trim();
		var subject = document.getElementById("subject").value.trim();
		var id = "${sessionScope.memberInfo.id}";
		if(id ==""){
			alert("로그인을 하신 후 사용하세요.");
		}else if(content == ""){
			alert("내용을 입력 해주세요");
		}else if(subject == ""){
			alert("제목을 입력 해주세요");
		}else{
			var url ="/trainProject/train/user/writeQ&A.do?&content="
					+content+"&subject="+subject;
		    var b = encodeURI(url);
			window.location.href=b;
		}
	}
	function goBack(){
		window.history.go(-1);
	}
	

</script>
		<c:choose>
			<c:when test="${requestScope.result_upQ == 1 or requestScope.result_upQ == 0}">
				<script type="text/javascript">
						alert("질문 업로드가 성공하였습니다.");
						var url ="/trainProject/train/user/qnaList.do?pageNo=1&viewCnt_onePage=5";
						window.location.href=url; 
				</script>
			</c:when>
			<c:when test="${requestScope.result_upQ == -1}">
				<script type="text/javascript">
							alert("무슨 원인인지 모르겠지만 질문 업로드 실패");
				</script>
			</c:when>
		</c:choose>
 	
</head>
<body>
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
					<input type="text" name="subject" id="subject" maxlength="15" size="40">
					<span style="color: gray; font-size: 13px; ">최대 15자까지 입력 가능합니다.</span>
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
					<textarea cols="60" id ="editor" name='editor' rows="20" style="padding:5 ; border: 2 silver solid; width: 100%; font-size: 18px; font-weight: 900;" /></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center" >
				 	<input type="button" value="등록하기"  onclick="upload_qna();"
				 	style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8">
				 	&nbsp;
				 	<input type="reset" value="취소" style="height: 100% ;width: 10% ;font-weight: bold; font-size: 15px; background-color: #6F9FD8" onclick="goBack();">
				</td>
			</tr>
	</table>
	</form>
	
	<jsp:include page="Footer.jsp"/>
</body>
</html>