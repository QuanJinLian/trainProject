<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload =function(){
 		// 문서 객체를 가져옵니다.
 		var second = 30;
 		var count = document.getElementById('count');
 		var interval = setInterval(function (){
 			count.innerHTML = second +"s" ;
 			second-- ;
 			if(second == -1 ){
 				clearInterval(interval );
 				alert("시간이 초과되었습니다. \n인증번호를 다시 받아주세요");
 				self.close();
 			}
 		}, 1000);
 	}

	function certify(){
		var num = document.getElementById("num").value
		var url ="/trainProject/train/user/mailCheck.do?emailR=${email}&checkNum="+num;
		window.location.href=url; 
//		alert(url);
// 		window.open(url, 
// 				'child', 'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=400, top=300, left=300');		
	}

</script>
<style type="text/css">
	fieldset {
	text-align: center;
}
</style>
</head>
<body>

 	<c:choose>
		<c:when test="${requestScope.resultMail > -1}">
			<script type="text/javascript">
					alert("인증이 완료되었습니다");
					var emailct =opener.document.getElementById("emailct");
	 	 			opener.document.frm.hid3.value = "y"; 
	 	 			opener.document.frm.hid4.value = "${email}"; 
					emailct.innerHTML="<p style='font-size:12px; color:#009933;'>인증완료!</p>";
					self.close();
			</script>
		</c:when>
		<c:when test="${requestScope.resultMail == -12}">
			<script type="text/javascript">
					alert("인증번호가 유효하지 않습니니다. \n다시 시도해 주세요.");
					var emailct =opener.document.getElementById("emailct");
	 	 			opener.document.frm.hid3.value = "n"; 
					emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'>인증번호를 다시 받으세요</p>";
					self.close();
			</script>
		</c:when>
		<c:when test="${requestScope.resultMail == -13}">
			<script type="text/javascript">
					alert("인증번호가 메일주소로 발송되었습니다. \n받으신 인증번호를 30초이내로 입력해주세요.");
					var emailct =opener.document.getElementById("emailct");
	 	 			opener.document.frm.hid3.value = "n"; 
			</script>
		</c:when>
	</c:choose>

	<fieldset>
	<legend><b>인증번호</b></legend>
	<div>
		<input type="text" id="num" placeholder="인증번호 4자리">
		<span id="count">30s</span>
		<input type="button" value="인증하기"  onclick="certify();" />
	</div>
	</fieldset>
</body>
</html>