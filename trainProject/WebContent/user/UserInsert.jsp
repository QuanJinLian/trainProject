<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 
<!DOCTYPE html>

<html>
<script type="text/javascript">
 	
 	var pw1_case = 0;
 	var pw2_case = 0;
 	var name_case = 0;
 	var phone_case = 0;
 	var add_case = 0;
 	
	var idField = false;
	var pw1Field = false;
	var pw2Field = false;
	var nameField = false;
	var phoneField = false;
	var addField = false; 
	var addressField = false;

/* <!-- 주소검색 팝업창 --> */
	function post(){
/* 		window.open("/webapp/htmlEx/zipCodeSearch.html", 'child', 
				'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=600, top=300, left=300');	 */	
	window.open("/trainProject/user/zipCodeSearch.jsp", 'child', 
		'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=600, height=600, top=300, left=300');		
	}
	


 	function idFieldAction(){
 		idField = true;
		return idField;
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

 	function addressAction(){
 		addressField = true;
		return addressField;
 	}

 	
 	function allcheck(){
 		try{
 		var id = document.getElementById("id").value;
 		var pw1 = document.getElementById("pw1").value;
 		var pw2 = document.getElementById("pw2").value;
 		var name = document.getElementById("name").value;
 		var phoneNum = document.getElementById("phoneNum").value;
 		var idcheck = document.getElementById("idcheck").value;
 		var postNum = document.getElementById("postNum").value;
 		var address = document.getElementById("address").value;
 		var addressDetail = document.getElementById("addressDetail").value;
		var idct = document.getElementById("idct");
		var pw1ct = document.getElementById("pw1ct");
		var pw2ct = document.getElementById("pw2ct");
		var namect = document.getElementById("namect");
		var phonect = document.getElementById("phonect");
		var addct = document.getElementById("addct");
	 	var hidden = document.getElementById("hid").value;
		var hidden2 = document.getElementById("hid2").value;
		
 		var idExp = /[a-z0-9][a-z0-9_\-]{4,10}$/;       //"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."
	    var pwdExp =  /[A-z0-9_\-]{6,16}$/;     // + 는 대/소 영문자,숫자가 한번 이상 , {6,16}$/; 6자이상,16자 이하의 문자열 pwd 6자이상
	    var nameExp=  /[가-힣|A-Z]{2,30}$/;      //한글 정규식 영어 대문자
	    var phoneExp = /\d{3}-\d{3,4}-\d{4}$/;  //핸드폰 번호 정규식
 		
 	 		if(idField){
 	 			if(id == "" ) {
 	 				idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	 	 				hidden2= "n";
 	 			}else if(!idExp.test(id)){
 	 				idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>4~10자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>";
	 	 				hidden2= "n";
 	 	        //아이디 test로 4~10자 이상 영어대문자 한글 검사
 	 	 		}else if(idExp.test(id)){
 	 	 			if(id != hidden){
 	 	 				idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>아이디 중복확인을 해주세요.</p>"
 	 	 	 				hidden2= "n";
 	 	 			} else {
 	 	 				hidden2= "y";
 	 	 			}
 	 	 		}
 	 		}
	    	if(pw1Field){
	    		if(pw1 == ""){
	    			pw1ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	    			pw1_case =2;
	    		}else if(!pwdExp.test(pw1)){
	    			pw1ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>6~16자의 영문 대/소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>";
	     			document.frm.pw1.focus();
	     			pw1_case =2;
	    		}else if(pwdExp.test(pw1)){
	    			pw1ct.innerHTML="";
	    			pw1_case =1;
	    		}
	    	}
	    	if(pw2Field){
	    		if(pw2 == ""){
	    			pw2ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	    			pw2_case =2;
	    		}else if(pw2 != pw1){
	    			pw2ct.innerHTML="<p style='font-size:12px; color:#ff0000;'>비밀번호를 다르게 입력하였습니다.</p>";
	     			document.frm.pw2.focus();
	     			pw2_case =2;
	    		}else if(pw2 == pw1){
	    			pw2ct.innerHTML="";
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
	    	}
	    	if(addressField){
	    		if(address=="" | postNum==""){
	    			addct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.  주소 검색 해주세요.</p>";
	    			add_case =2;
	    		}else if(addressDetail ==""){
	    			addct.innerHTML="<p style='font-size:12px; color:#ff0000;'>상세 주소를 입력 해주세요.</p>";
	    			document.frm.addressDetail.focus();
	    			add_case =2;
	    		}else if(address !="" && postNum !="" && addressDetail !=""){
	    			addct.innerHTML="";
	    			add_case =1;
	    		}
	    	}
 		}catch (err){
 			alert(err);
 		}
 	}
 	
 	function caseCheck(){
	 	var hid2 = document.getElementById("hid2").value;
 		var id = document.getElementById("id").value;
 		var pw1 = document.getElementById("pw1").value;
 		var pw2 = document.getElementById("pw2").value;
 		var name = document.getElementById("name").value;
 		var phoneNum = document.getElementById("phoneNum").value;
 		var postNum = document.getElementById("postNum").value;
 		var addressDetail = document.getElementById("addressDetail").value;
		
 		if(hid2=="y" && pw1_case ==1 && pw2_case == 1 && name_case==1 && phone_case==1 && add_case==1){
 			return true;
 		}else{
 	 	 	alert("정규식이 옳바르지 않은 정보가 있습니다. \n 다시 입력해 주세요."); 
 	 	 	if(hid2 !="y"){
 	 	 		document.frm.id.focus();
 	 	 	}else if (pw1_case !=1){
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
 	 	 	}
 			return false;
 		}
 	}
 	
 	/* <!-- 아이디 체크 --> */
 	function idCheckButton(){
		var id = document.getElementById("id").value;
 		var idExp = /[a-z0-9][a-z0-9_\-]{4,10}$/; 
			if(id == "" ) {
	 				idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력사항입니다.</p>";
	 			}else if(!idExp.test(id)){
	 				idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>4~10자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>";
	 	 		}else if(idExp.test(id)){
	 	 			window.open("/trainProject/user/checkId.jsp?id="+id,"checkid",
	 	 					'toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=300, height=300, top=300, left=300');
//	 	 			window.open("/webapp/BankIdCheck?id="+id,"checkid","width=400, heigth=100");
	 	 		} 
 	} 

 	
</script>
<head>
<meta charset="UTF-8">

<title>회원가입</title>
</head>
<body onclick="allcheck();">
	<jsp:include page="Header.jsp" />

			<form action="/trainProject/train/user/memberJoinin.do" method="post" name="frm"  
			onsubmit="return caseCheck();">
				<h1 align="center">****회원가입****</h1>
				<center>
				<table border="0"  align="center">
					<tr>
						<td colspan="3" align="center"> <img src="/trainProject/user/img/logo.jpg" width="150px" height="130px" />
						</td>
					</tr>
					<!-- 아이디 -->
					<tr>
						<td></td>
						<td colspan="2"  align="center"><font color="DarkMagenta" size="4"> 
						<strong>아  이  디</strong></td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="text" id="id" name="id" size="59" maxlength='10' 
						onclick="idFieldAction();">
						</td>
						<td align="center">
						<input type="button"  id ="idcheck"  name="idcheck" value="중복체크" onclick="idCheckButton();" ></button>
						<input type="hidden" id="hid"  name="hid"  value=""/>
						<input type="hidden" id="hid2"  name="hid2"  value=""/>
						</td>
					</tr>
					<tr>
					<td colspan="3" ><p id="idct" name=idct" ></p>
					</tr>
					<!-- 비번 -->
					<tr>
						<td></td>
						<td colspan="2" align="center"><font color="DarkMagenta"
							size="4"> <strong>비    번</strong></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="text" name="pwd" id="pw1" 
							size="70" maxlength='16'  onclick="pw1FieldAction()"></td>
					</tr>
					<tr>
					<td colspan="3" ><p id="pw1ct" name="pw1ct" ></p>
					</tr>
					<!-- 비번 재확인 -->
					<tr>
						<td></td>
						<td colspan="2" align="center"><font color="DarkMagenta"
							size="4"> <strong>비번 재확인</strong></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="text" name="pw2" id="pw2" 
							size="70" maxlength='16'  onclick="pw2FieldAction()"></td>
					</tr>
					<tr>
					<td colspan="3" ><p id="pw2ct" name="pw2ct" ></p>
					</tr>
					<!-- 이름 -->
					<tr>
						<td></td>
						<td colspan="2" align="center"><font color="DarkMagenta"
							size="4"> <strong>이    름</strong></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="text" name="name" id="name" 
							size="70" maxlength='30'  onclick="nameFieldAction()"></td>
					</tr>
					<tr>
					<td colspan="3" ><p id="namect" name="namect" ></p>
					</tr>
					<!-- 전화번호 -->
					<tr>
						<td></td>
						<td colspan="2" align="center"><font color="DarkMagenta"
							size="4"> <strong>전화번호</strong></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="text" id="phoneNum" 
							name="phone" size="70" maxlength='13'  onclick="phoneFieldAction()"></td>
					</tr>
					<tr>
					<td colspan="3" ><p id="phonect" name="phonect" ></p>
					</tr>
					<!-- 주소 -->
					<tr>
						<td></td>
						<td colspan="2"  align="center"><font color="DarkMagenta" size="4"> 
						<strong>주    소</strong></td>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="text" id="postNum" name="zip_num" 
						size="59" maxlength='30'  onclick="addressAction()" readonly="readonly">
						</td>
						<td align="center">
						<input type='button' value='주소 검색' onclick='post()'/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="text" id="address" 
							name="address" size="70" maxlength='13'  onclick="addressAction()" readonly="readonly"></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="text" id="addressDetail" 
							name="addressDetail" size="70" maxlength='13'  onclick="addressAction()"></td>
					</tr>
					<tr>
					<td colspan="3" ><p id="addct" name="addct" ></p>
					</tr>
					<tr>
						<td></td>
						<td colspan="2" align="center"><input type="submit" value="가입하기"  />
							<input type="reset" value="취소" onclick='window.history.go(-1)'/></td>
					</tr>
				</table><p>
				</center>
				
			</form>
</body>
</html>