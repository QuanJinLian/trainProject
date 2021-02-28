<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
<script type="text/javascript">
// 	function emailCheck(){
// 		var email = document.getElementById("email").value
// 		var name = document.getElementById("name").value
// 		var url ="/trainProject/train/user/mailCheck.do?email="+email;
// //		alert(url);
// 	window.location.href=url; 
// 	}
	function allPoint(){
		var total = parseInt("${total }");
		var havingP = parseInt("${havingP }");
		if(havingP > total){
			document.getElementById("point").value = total;
		}else{
			document.getElementById("point").value = havingP;
		}
	}
	function pointCheck(){
	    var point = document.getElementById("point").value;
		var total = parseInt("${total }");
		var havingP = parseInt("${havingP }");
		if(point != ""){
			if(point > total && havingP > total ){
				 document.getElementById("point").value = total ;
			}else if(point > havingP  && havingP < total  ){
				 document.getElementById("point").value = havingP ;
			}
		}
	}
	
	function trimCheck(){
		var accountNum =  document.getElementById("accountNum").value
		var pw =  document.getElementById("pw").value
		var name =  document.getElementById("name").value
		var point =  document.getElementById("point").value
		var total = parseInt("${total }");
		var havingP = parseInt("${havingP }");

		var id = "${sessionScope.memberInfo.id}";
		if(id == ""){
			alert("로그인을 하신 후 사용하세요.");
		}else{
			if(point == total){
				return true;
			}else{
				if( accountNum == "" || pw == "" || name =="" ){
					alert("계좌번호 , 비밀번호 , 이름은 필수 입력 사항입니다.");
					return false;
				}else{
					if( point > havingP){
						alert("사용하는 포인트는 보유 포인트보다 적어야 합니다.");
						return false;
					}else{
						if(point > total){ 
						alert("사용하는 포인트는 결제금액보다 적어야 합니다.");
						return false;
						}
					}
					return true;
				}
			}
		}
	}
</script>
<style type="text/css">

	fieldset{
		text-align: center;
	}
	legend {
		font-size: 18px;
		font-weight: bold;
		color: #6B5B95;
}
	.th{
		text-align: right;
		font-size: 15px;
		font-weight: 900;
		border-bottom: 3px solid #6F9FD8 ;
	}
	.td{
		text-align: left;
		font-weight: 700;
		border-bottom: 3px solid #6F9FD8 ;
	}
	table{
			margin-top : 1em;
			margin-bottom : 1em;
            width: 30em;
	}
	
	.button{
			background-color: #034F84;
			color: white;
			font-size :18px;
			font-weight: 700;
			border-radius: 18px; 
			cursor:pointer;
	}
	.btn{
		text-align: center;
		margin: 1em;
	}

</style>
</head>
<body onclick="pointCheck();">

 	<c:choose>
		<c:when test="${requestScope.result > -1}">
			<script type="text/javascript">
				window.opener.location.reload();
					alert("결제가 완료되었습니다");
					var url ="/trainProject/train/user/ticketView.do?oseq=${oseq }";
				window.location.href=url; 
			</script>
		</c:when>
		<c:when test="${requestScope.result == -1}">
			<script type="text/javascript">
						alert("잔고가 부족하여 결제 실패 하였습니다. \n다시 시도해 주세요.");
						window.history.go(-1);
			</script>
		</c:when>
		<c:when test="${requestScope.result == -2}">
			<script type="text/javascript">
						alert("입력하신 정보가 정확하지 않습니다. \n다시 시도해 주세요.");
						window.history.go(-1);
			</script>
		</c:when>
		<c:when test="${requestScope.result == -3}">
			<script type="text/javascript">
						alert("시간이 초과되어 결제 실패하였습니다. \n다시 시도해 주세요.");
						window.opener.location.reload();
						self.close();
			</script>
		</c:when>
		<c:when test="${requestScope.result == -4}">
			<script type="text/javascript">
						alert("이미 결제되었습니다. \n주문내역을 확인해 주세요");
						window.opener.location.reload();
						self.close();
			</script>
		</c:when>
	</c:choose>
	
	
	
<form action="/trainProject/train/user/pay.do" method="post" onsubmit="return trimCheck();" name="frm">
	<fieldset>
	<legend><b>결제창</b></legend>
	<div>
	<center>
		<table>
			<tr>
					<td class="th">계좌번호 : </td>
					<td class="td"><input type="text" name="accountNum" id="accountNum" size="30"
					placeholder=" -없이 숫자로만 입력하시오."></td>
			</tr>
			<tr>
					<td class="th">비밀번호 : </td>
					<td class="td"><input type="password" size="30" maxlength="2" 
					name="pw"  id="pw" placeholder="비밀번호 앞 두자리를 입력하시오."></td>
			</tr>
			<tr>
					<td class="th">이       름:  </td>
					<td class="td"><input type="text" name="name"  id="name"
					placeholder="계좌 소유자 이름"></td>
			</tr>
			<tr>
					<td class="th">결제 금액 : </td>
					<td class="td"><fmt:formatNumber value="${total }"/> 원</td>
					<input type="hidden" value="${total }" name="price"/>
					<input type="hidden" value="${oseq }" name="oseq"/>
					<input type="hidden" value="${point }" name="plusPoint"/>
			</tr>
			<tr>
					<td class="th">보유 포인트 :  </td>
					<td class="td"><input type="text" name="point" id="point" placeholder="${havingP }" >
							<input type="button" value="전체 사용" onclick="allPoint();"></td>
			</tr>
<!-- 			<tr> -->
<!-- 					<td rowspan="2">본인 인증: </td> -->
<!-- 					<td><input type="text" name="email" id="email" placeholder="aaa@test.com" > -->
<!-- 							<input type="button" value="인증번호 받기" onclick="emailCheck();"> -->
<!-- 					</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 					<td ><input type="text" name="certity" id="certity" placeholder="인증번호 4 자리" > -->
<!-- 							<input type="button" value="인증번호 받기" onclick="certify();"></td> -->
<!-- 					<td ><p id="emailct" name="emailct" ></p></td> -->
<!-- 			</tr> -->
		
		
		</table>
	</center>
	</div>
	</fieldset>
	<div class="btn">
		<input type="submit" value="결제하기" class="button"> 
	</div>
</form>
</body>
</html>