<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script type="text/javascript">
	
	var pw1_case = 0;
	var pw2_case = 0;
	var name_case = 0;
	var phone_case = 0;
	var add_case = 0;
	
	var pw1Field = false;
	var pw2Field = false;
	var nameField = false;
	var phoneField = false;
// 	var emailField = false; 

/* <!-- 주소검색 팝업창 --> */
	function post(){
		window.open("/trainProject/user/zipCodeSearch.jsp", 'child', 
			'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=600, top=300, left=300');		
	}


	function pw1FieldAction(){
		pw1Field = true;
		return pw1Field;
	}
	function pw2FieldAction(){
		pw2Field = true;
		return pw2Field;
	}
	function nameFieldAction(){
		nameField = true;
		return nameField;
	}
	function phoneFieldAction(){
		phoneField = true;
		return phoneField;
	}
// 	function emailFieldAction(){
// 		emailField = true;
// 		return emailField;
// 	}
	
	function allcheck(){
 		try{
 		var pw = document.getElementById("pw").value;
 		var pw1 = document.getElementById("pw1").value;
 		var pw2 = document.getElementById("pw2").value;
 		var name = document.getElementById("name").value;
 		var phoneNum = document.getElementById("phoneNum").value;
//  		var email = document.getElementById("email").value;
 		var postNum = document.getElementById("postNum").value;
 		var address = document.getElementById("address").value;
 		var addressDetail = document.getElementById("addressDetail").value;
	 	var hidden = document.getElementById("hidden").value;
		var pw1ct = document.getElementById("pw1ct");
		var pw2ct = document.getElementById("pw2ct");
		var namect = document.getElementById("namect");
		var phonect = document.getElementById("phonect");
//  		var emailct = document.getElementById("emailct");
		var addct = document.getElementById("addct");
// 		var hidden3 = document.getElementById("hid3").value;  //메일 인증 확인
// 		var hidden4 = document.getElementById("hid4").value;  //메일 인증 확인

	 	
	    var pwdExp =  /[A-z0-9_\-]{6,16}$/;     // + 는 대/소 영문자,숫자가 한번 이상 , {6,16}$/; 6자이상,16자 이하의 문자열 pwd 6자이상
	    var nameExp=  /[가-힣|A-Z]{2,30}$/;      //한글 정규식 영어 대문자
	    var phoneExp = /\d{3}-\d{3,4}-\d{4}$/;  //핸드폰 번호 정규식
 		var emailExp = /\w+@\w+\.\w+(\.\w+)?$/; 

	    	if(pw1Field){
	    		if(pw1 == ""){
	    			pw1ct.innerHTML="";
	    			pw1_case =1;
	    		}else if(!pwdExp.test(pw1)){
	    			pw1ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>6~16자의 영문 대/소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>";
	     			pw1_case =2;
	    		}else if(pw == pw1){
	    			pw1ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>새비번은 기존비번와 달라야 합니다.</p>";
	     			pw1_case =2;
	    		}else if(pwdExp.test(pw1) && pw != pw1){
	    			pw1ct.innerHTML="";
	    			pw1_case =1;
	    		}
	    	}else{
	    		if(pw1 == ""){
	    			pw1_case =1;
	    		}
	    	}
	    	
	    	if(pw2Field){
	    		if(pw2 == "" && pw1 != ""){
	    			pw2ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>비밀번호를 확인 해 주세요.</p>";
	     			pw2_case =2;
	    		}else if(pw2 != pw1){
	    			pw2ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>비밀번호를 다르게 입력하였습니다.</p>";
	     			pw2_case =2;
	    		}else if(pw2 == pw1){
	    			pw2ct.innerHTML="";
	    			pw2_case =1;
	    		}else if(pw2 == "" && pw1 == ""){
	    			pw2ct.innerHTML="";
	    			pw2_case =1;
	    		}
	    	}else{
	    		if(pw2 == "" && pw1 != ""){
	    			pw2ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>비밀번호를 확인 해 주세요.</p>";
	     			pw2_case =2;
	    		}else if(pw2 == "" && pw1 == ""){
	    			pw2_case =1;
	    		}
	    	}
	    	
	    	
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
	    	


//  	 		if(emailField){
//  	 			if(email == "" ) {
//  	 					emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
//  	 					document.getElementById("hid3").value= "n";
//  	 			}else if(!emailExp.test(email)){
//  	 					emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'>ex) example@example.com 같이 입력해 주세요.</p>";
//  	 					document.getElementById("hid3").value= "n";
//  	 	        //아이디 test로 4~10자 이상 영어대문자 한글 검사
//  	 	 		}else if(emailExp.test(email)){
//  	 	 			if(email != hidden4){
//  	 	 					emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'>메일 인증을 해주세요.</p>"
//  	 	 					document.getElementById("hid3").value= "n";
//  	 	 			} else {
//  	 	 				document.getElementById("hid3").value= "y";
//  	 	 			}
//  	 	 		}
//  	 		}
	    	
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
//  		var email = document.getElementById("email");
// 	 	var hid3 = document.getElementById("hid3").value;
 		var pw1 = document.getElementById("pw1").value;
 		var pw2 = document.getElementById("pw2").value;
 		var name = document.getElementById("name").value;
 		var phoneNum = document.getElementById("phoneNum").value;
 		var postNum = document.getElementById("postNum").value;
 		var addressDetail = document.getElementById("addressDetail").value;
//  		var emailct = document.getElementById("emailct");
//  		alert("pw1_case - " +pw1_case);
//  		alert("pw2_case - " +pw2_case);
//  		alert("hid3 - " +hid3);
//  		alert("name_case - " +name_case);
//  		alert("phone_case - " +phone_case);
//  		alert("add_case - " +add_case);
		
//  		if(pw1_case ==1 && pw2_case == 1 &&  hid3=="y" && name_case==1 && phone_case==1 && add_case==1){
 	 		if(pw1_case ==1 && pw2_case == 1  && name_case==1 && phone_case==1 && add_case==1){
 			return true;
 		}else{
//  			if(emailct.innerHTML=="" &&pw1_case ==1 && pw2_case == 1 && name_case==1 && phone_case==1 && add_case==1 ){
 	 			if(pw1_case ==1 && pw2_case == 1 && name_case==1 && phone_case==1 && add_case==1 ){
 				return true;
 			}else{
 	 	 	 	alert("정규식이 옳바르지 않은 정보가 있습니다. \n 다시 입력해 주세요."); 
 	 	 	 	if (pw1_case !=1){
 	 	 	 		document.frm.pw1.focus();
 	 	 	 	}else if (pw2_case !=1){
 	 	 	 		document.frm.pw2.focus();
 	 	 	 	}else if (name_case !=1){
 	 	 	 		document.frm.name.focus();
 	 	 	 	}else if (phone_case !=1){
 	 	 	 		document.frm.phoneNum.focus();
 	 	 	 	}else if (add_case !=1){
 	 	 	 		if(postNum ==""){
 	 	 	 	 		document.frm.postNum.focus();
 	 	 	 		}else{
 	 	 	 	 		document.frm.addressDetail.focus();
 	 	 	 		}
//  	 	 	 	}else if ( hid3 !="y"){
//  	 	 	 		document.frm.email.focus();
 	 	 	 	}
 	 			return false;
 			}
 		}
 	}
 	
 	function joinOut(){
 		var id = document.getElementById("id").value;
 		if(!confirm('정말 탈퇴하시겠습니까?')){
			
		}else{
			var url = "/trainProject/train/user/UserJoinOut.do?id="+id;
 	 		window.location.href=url;
		}
 	}
 	
 	/* <!-- 이메일 체크 --> */
 	function emailCheckButton(){
		var email = document.getElementById("email").value;
 		var emailExp = /\w+@\w+\.\w+(\.\w+)?$/; 
			if(email == "" ) {
					emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	 		}else if(!emailExp.test(email)){
					emailct.innerHTML="<p style='font-size:12px; color:#ff0000;'>ex) example@example.com 같이 입력해 주세요.</p>";
	 	 	}else if(emailExp.test(email)){
	 	 			window.open("/trainProject/train/user/mailCheck.do?email="+email,"checkemail",
	 	 					'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=300, top=300, left=300');
	 	 } 
 	} 
 	/* <!-- 이메일 수정버튼 --> */
 	function mailChange(){
 		try{
 	        var emailChange = document.getElementById("emailChange");
 	        var addedForm = document.getElementById("addedForm");
 	        var email = document.getElementById("email");
 		 	var hid3 = document.getElementById("hid3").value;
 	        
 	        email.onclick = emailFieldAction();  // email 텍스트필드에 onclick을 적용
 	        email.removeAttribute("readOnly");  //email 텍스트필드의 readonly를 풀어줌
 	        addedForm.removeChild(emailChange); 

 			var str = "<input type='button'  id ='emailCheck'  name='emailCheck' value='메일인증' style='background-color: red;' onclick='emailCheckButton();' >"
 			
 	        var addedDiv = document.createElement("span"); // 폼 생성

 	        addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입

 	        addedForm.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
 		}catch (e) {
			alert(e);
		}
 	}
 	
	
</script>
<c:choose>
	<c:when test="${requestScope.joinOutResult == 1 or requestScope.result_joinOut == 0}">
		<script type="text/javascript">
			alert("회원탈퇴 성공!!");
			var url ="/trainProject/train/user/logout.do";
			window.location.href=url;
		</script>
	</c:when>
	<c:when test="${requestScope.joinOutResult == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 회원탈퇴  실패");
						window.history.go(-1);
			</script>
	</c:when>
	<c:when test="${requestScope.result_update == 1 or requestScope.result_update == 0}">
		<script type="text/javascript">
			alert("회원정보 수정 성공!!");
			var url ="/trainProject/train/user/personalProfile.do?form=form";
			window.location.reload;
		</script>
	</c:when>
	<c:when test="${requestScope.result_update == -1}">
		<script type="text/javascript">
						alert("무슨 원인인지 모르겠지만 회원정보 수정 실패");
						window.history.go(-1);
		</script>
	</c:when>
</c:choose>
</head>
<body  onclick="allcheck();">
	<c:set var="userinfo" value="${requestScope.userinfo}"></c:set>

	<jsp:include page="Header.jsp" />
		
	<form action='/trainProject/train/user/personalProfile.do' method='post' 
	name="frm" onsubmit="return caseCheck();">
	<h1 align='center'>****회원정보****</h1>
	<center>
	<table border='0'  align='center'>
	<tr>
	<td colspan='3' align='center'>
	<a href='/trainProject/train/user/index.do'> 
	<img src='/trainProject/user/img/logo.jpg' width='120px' height='120px' />
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
	<input type='text' name='id' id="id" size='50' maxlength='16' align='center' value='${userinfo.id}'  readonly>
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="idct" name="idct" ></p>
	</tr>
	
	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>기존 비번
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='pwd' id="pw" size='50' maxlength='16' align='center' 
	value='${userinfo.pwd}' readonly>
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="pwct" name="pwct" ></p>
	</tr>
		
	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>새 비번
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='pw1'  id="pw1" size='50' maxlength='16' align='center'  onclick="pw1FieldAction()">
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="pw1ct" name="pw1ct" ></p>
	</tr>
		
	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>새 비번 확인
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='pw2'  id="pw2"size='50' maxlength='16' align='center' onclick="pw2FieldAction()">
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="pw2ct" name="pw2ct" ></p>
	</tr>	
	
	<tr>    
	<td colspan='3' align='center'>
	<font color='DarkMagenta' size='4'>이    름
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='name' id="name" size='50' maxlength='16' align='center' 
	value='${userinfo.name}'  onclick="nameFieldAction()">
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
	align='center' value='${userinfo.phone}'  onclick="phoneFieldAction()">
	</td>
	</tr>
	<tr>
	<td colspan="3" ><p id="phonect" name="phonect" ></p>
	</tr>

<!-- 	<tr>     -->
<!-- 	<td colspan='3' align='center'> -->
<!-- 	<font color='DarkMagenta' size='4'>이 메 일 -->
<!-- 	</td> -->
<!-- 	</tr> -->
	
	
<!-- 	<tr> -->
<!-- 		<td align="left"><input type="text" id="email" name="email" size="40" maxlength='40'  -->
<%-- 				value="${userinfo.email}"   readonly="readonly"> --%>
<!-- 		</td> -->
<!-- 		<td align="center" > -->
<!-- 		<span id="addedForm"> -->
<!-- 		<input type="button" id="emailChange" name="emailChange" value="메일 수정" onclick="mailChange()"> -->
<!-- 		</span> -->
<!-- 		<input type="hidden" id="hid3"  name="hid3"  value=""/> -->
<!-- 		<input type="hidden" id="hid4"  name="hid4"  value=""/> -->
<!-- 		</td> -->
<!-- 	</tr> -->

<!-- 	<tr> -->
<!-- 	<td colspan="3" ><p id="emailct" name="emailct" ></p> -->
<!-- 	</tr> -->

	<tr>
	<td colspan="3" align="center">
	<font color="DarkMagenta" size="4"> 기 본 주 소
	</td>
	</tr>
	<tr>
	<td  align="left"><input type="text" id="postNum"
	name="zip_num" size="40" maxlength='30' 
	readonly="readonly" value="${userinfo.zip_num}"></td>
	<td align="center">
	<input type='button' value='주소 검색' onclick='post()' />
		<input type="hidden"  id="hidden"    name="hidden"   value="n"/>
	</td>
	</tr>
	<tr>
	<td colspan="3" align="center"><input type="text" id="address"
		name="address" size="50" maxlength='13' 
	    readonly="readonly" value="${userinfo.address}"></td>
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
	<font color='DarkMagenta' size='4'>가입날짜
	</td>
	</tr>
	
	<tr>
	<td colspan='3' align='center'>
	<input type='text' name='joinDate' id="joinDate" size='50' maxlength='16' align='center' value="${userinfo.indate}"  readonly>
	</td>
	</tr> 
	

	
	<tr>
	<td colspan='3'  align='center'>
	<input type='submit' value='저장'>
	<input type='button' value='회원탈퇴' onclick="joinOut();">
	<input type='button' value='취소' onclick='window.history.go(-1)'>
	</td>
	</tr>	
	
</table>
	</center>
</form>
	
	<jsp:include page="Footer.jsp" />
</body>
</html>