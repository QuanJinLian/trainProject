<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script type="text/javascript">
	
	var name_case = 0;
	var phone_case = 0;
	var email_case = 0;
	var add_case = 0;
	
	var nameField = false;
	var phoneField = false;
	var emailField = false; 

/* <!-- 주소검색 팝업창 --> */
	function post(){
		window.open("/webapp/shoppingMall/zipCodeSearch.jsp", 'child', 
			'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=600, top=300, left=300');		
	}


	function nameFieldAction(){
		nameField = true;
		return nameField;
	}
	function phoneFieldAction(){
		phoneField = true;
		return phoneField;
	}
	function emailFieldAction(){
		emailField = true;
		return emailField;
	}
	
	function allcheck(){
 		try{
 		var name = document.getElementById("name").value;
 		var phoneNum = document.getElementById("phoneNum").value;
 		var email = document.getElementById("email").value;
 		var postNum = document.getElementById("postNum").value;
 		var address = document.getElementById("address").value;
 		var addressDetail = document.getElementById("addressDetail").value;
	 	var hidden = document.getElementById("hidden").value;
		var namect = document.getElementById("namect");
		var phonect = document.getElementById("phonect");
 		var emailct = document.getElementById("emailct");
		var addct = document.getElementById("addct");

	    var nameExp=  /[가-힣|A-Z]{2,30}$/;      //한글 정규식 영어 대문자
	    var phoneExp = /\d{3}-\d{3,4}-\d{4}$/;  //핸드폰 번호 정규식
 		var emailExp = /\w+@\w+\.\w+(\.\w+)?$/; 


	    	
	    	
	    	
	    	if(nameField){
	    		if(name == ""){
	    			namect.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	    			name_case =2;
	    		}else if(!nameExp.test(name)){
	    			namect.innerHTML="<p style='font-size:12px; color:#ff0000;'>2~30자의 영문 대문자 혹은 한글만 사용 가능합니다.</p>";
	     			document.frm.name.focus();
	     			name_case =2;
	    		}else if(nameExp.test(name)){
	    			namect.innerHTML="";
	    			name_case =1;
	    		}
	    	}else{
    			name_case =1;
	    	}
	    	
	    	if(emailField){
	    		if(email ==""){
	    			emailct.innerHTML="";
	    			email_case =1;
	    		}else if(!emailExp.test(email)){
	    			emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'> 정규식에 맞지 않으니 다시 입력하세요.</p>";
	    			email_case =2;
	    		}else if(phoneExp.test(phoneNum)){
	    			emailct.innerHTML="";
	    			email_case =1;
	    		}
	    	}else{
	    		email_case =1;
	    	}
	    	
	    	if(phoneField){
	    		if(phoneNum ==""){
	    			phonect.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	    			phone_case =2;
	    		}else if(!phoneExp.test(phoneNum)){
	    			phonect.innerHTML="<p style='font-size:12px; color:#ff0000;'> ex) 123-4567-8900 혹은 123-456-7890 같이 입력해 주세요.</p>";
	    			phone_case =2;
	    		}else if(phoneExp.test(phoneNum)){
	    			phonect.innerHTML="";
	    			phone_case =1;
	    		}
	    	}else{
	    		phone_case =1;
	    	}
	    	
	    	if(hidden == "y"){
	    		if(address=="" | postNum==""){
	    			addct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.  주소 검색 해주세요.</p>";
	    			add_case =2;
	    		}else if(hidden=="y" && addressDetail ==""){
	    			addct.innerHTML="<p style='font-size:12px; color:#ff0000;'>상세 주소를 입력 해주세요.</p>";
	    			document.frm.addressDetail.focus();
	    			add_case =2;
	    		}else if(address !="" && postNum !="" && addressDetail !="" && hidden =="y"){
	    			addct.innerHTML="";
	    			add_case =1;
	    		}
	    	}else{
	    		if(address !="" && postNum !="" && addressDetail =="" && hidden !="y"){
	    			addct.innerHTML="";
	    			add_case =1;
	    		}
	    	}
 		}catch (err){
 			alert(err);
 		}
 	}
	
 	function caseCheck(){
 		var name = document.getElementById("name").value;
 		var email = document.getElementById("email").value;
 		var phoneNum = document.getElementById("phoneNum").value;
 		var postNum = document.getElementById("postNum").value;
 		var addressDetail = document.getElementById("addressDetail").value;
		
 		if( email_case == 1 && name_case==1 && phone_case==1 && add_case==1){
 			return true;
 		}else{
 	 	 	alert("정규식이 옳바르지 않은 정보가 있습니다. \n 다시 입력해 주세요."); 
 	 	 	 if (name_case !=1){
 	 	 		document.frm.name.focus();
 	 	 	}else if (email_case !=1){
 	 	 		document.frm.email.focus();
 	 	 	}else if (phone_case !=1){
 	 	 		document.frm.phoneNum.focus();
 	 	 	}else if (add_case !=1){
 	 	 		if(postNum ==""){
 	 	 	 		document.frm.postNum.focus();
 	 	 		}else{
 	 	 	 		document.frm.addressDetail.focus();
 	 	 		}
 	 	 	}
 			return false;
 		}
 	}
 	
 	function joinOut(){
 		var id = document.getElementById("id").value;
 		if(!confirm('정말 탈퇴하시겠습니까?')){
			
		}else{
			var url = "/trainProject/train/admin/UserJoinOut.do?id="+id;
 	 		window.location.href=url;
		}
 	}
	
</script>
</head>
<body  onclick="allcheck();">
	<c:set var="member" value="${requestScope.member}"></c:set>

	<jsp:include page="adminHeader.jsp" />
		
	<form action='/trainProject/train/admin/UserUpdate.do' method='post' 
	name="frm" onsubmit="return caseCheck();">
	<h1 align='center'>****회원정보****</h1>
	<center>
	<table border='0'  align='center'>
	<tr>
	<td colspan='3' align='center'>
	<a href=''> 
	<img src='/webapp/shoppingMall/img/pikachu.jpg' width='120px' height='120px' />
	</a>
	</td>
	</tr>
	
	<tr>
	<td colspan='3'  align='center'>
	<font color='DarkMagenta' size='4'>아  이  디</font>
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='id' id="id" size='50' maxlength='16' align='center' value='${member.id}'  readonly>
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="idct" name="idct" ></p>
	</tr>
	
	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>이    름
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='name' id="name" size='50' maxlength='16' align='center' 
	value='${member.name}'  onclick="nameFieldAction()">
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="namect" name="namect" ></p>
	</tr>
	
	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>전화번호
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='phone' id="phoneNum" size='50' maxlength='16' 
	align='center' value='${member.phone}'  onclick="phoneFieldAction()">
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="phonect" name="phonect" ></p>
	</tr>

	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>이 메 일
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='email' id="email" size='50' maxlength='50' align='center' 
	value='${member.email}' onclick="emailFieldAction()" readonly>
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="emailct" name="emailct" ></p>
	</tr>

	<tr>
	<td colspan="3" align="center">
	<font color="DarkMagenta" size="4"> 기 본 주 소
	</td>
	</tr>
	<tr>
	<td  align="left"><input type="text" id="postNum"
	name="zip_num" size="35" maxlength='30' 
	readonly="readonly" value="${member.zip_num}"></td>
	<td align="center">
	<input type='button' value='주소 검색' onclick='post()' />
		<input type="hidden"  id="hidden"    name="hidden"   value="n"/>
	</td>
	</tr>
	<tr>
	<td colspan="3" align="center"><input type="text" id="address"
		name="address" size="50" maxlength='13' 
	    readonly="readonly" value="${member.address}"></td>
	</tr>
	<tr>
	<td colspan="3" align="center"><input type="text"
			id="addressDetail" name="addressDetail" size="50" maxlength='13'></td>
	</tr>
	<tr>
	<td colspan="3" ><p id="addct" name="addct" ></p>
	</tr>

	<tr> 
	<td colspan='3'  align='center'>
	<font color='DarkMagenta' size='4'>가입 상태
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
					<select  name="useyn" style="width: 27em; height: 1.8em;">
						<option value="y" ${member.useyn == "y" ? "selected" : ""}>가입
						<option value="n" ${member.useyn == "n" ? "selected" : ""}>탈퇴
					</select>
	  
	</td>
	</tr> 

	<tr> 
	<td colspan='3'  align='center'>
	<font color='DarkMagenta' size='4'>가입날짜
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='joinDate' id="joinDate" size='50' maxlength='16' align='center' value="${member.indate}"  readonly>
	</td>
	</tr> 
	

	
	<tr>
	<td colspan='3'  align='center'>
	<input type='submit' value='저장'>
	<input type='button' value='회원탈퇴 시키기' onclick="joinOut();">
	<input type='button' value='취소' onclick='window.history.go(-1)'>
	</td>
	</tr>	
	
</table>
	</center>
</form>
</body>
</html>