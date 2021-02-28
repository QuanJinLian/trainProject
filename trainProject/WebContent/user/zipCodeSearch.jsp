<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*"    %>
 <%@ page import ="dto.zipCodeBin" %> 
<!DOCTYPE html> 
<html>
<head>
<script type="text/javascript">
	var z ="";
	var a ="";
	var y ="";
	var s = false;
	
	function select(zipCode,add){
		try{
			z = zipCode;
			a = add;
			s = true;
			y = "y";
			return z,a,s,y;
		}catch(err){
			alert(err);
		}
	}

 	function input(form){
 		try{
 			var  i = form.zipcode.selectedIndex;
 			if(s == true){
 	 			/* var zipCode=form.zipcode.options[i].text;  */
 	 		 	opener.document.frm.address.value = a;
 	 			opener.document.frm.postNum.value = z; 
 	 			opener.document.frm.hidden.value = y; 
 	 		   	self.close();
 	 		}else {
 	 			alert("추가할 주소를 선택하세요");
 	 		} 
 		}catch(err){
 			alert(err);
 		}
	} 
/*   	function close(){
   			document.close();
	}  */
	function result(zipCode,sido,gugun,dong){
		opener.document.frm.address.value = sido+" "+gugun+" "+dong;
		self.close();
	}
	
	
</script>


<meta charset="UTF-8">
<title>우편번호 검색</title>
<script type="text/javascript">
</script>
</head>
<body>
	<% List<zipCodeBin> adds = (ArrayList<zipCodeBin>)request.getAttribute("adds"); 
			String str, str2, str3;
	%>
	<form action="/trainProject/train/user/zipcode.do" method="post">
		<fieldset><center>
			<legend >주소 검색</legend>
			<p align="justify">
찾으시려는 도로명주소+건물번호/건물명 혹은 지번주소+번지수/건물명을 입력해주세요.<br>
예) 도로명 : 불정로 432번길 / 지번 : 정자동 178-1, 대치동 현대아파트
* 단, 도로명 혹은 동(읍/면/리)만 검색하시는 경우 정확한 검색결과가 나오지 않을 수 있습니다.<br></p>
				<table border='1'>
					<tr>
						<th align='center'>주소로 검색</th>
						<td align='center'><input type='text' name='add' size='50' >
							<input type="submit" value="검색" "></td>
					</tr>
					<%if(adds!=null){ 
							int addSize ;
							if(adds.size() == 1 ){
								addSize = adds.size()+1 ;
							}else{
								addSize = adds.size() ;
							}%>
				 	<tr>
					<td colspan="3" name ="select" align="center">
					<select name="zipcode" size="<%=addSize%>"> 
					<% 
						 for(zipCodeBin add: adds){
							str =add.getSido() +"\t\t"
								+add.getGugun() +"\t\t"
								+add.getDong() +"\t\t"
								+add.getBldg() +"\t\t"
								+add.getBunji() +"\t\t"	
								+add.getSeq() +"\t\t";
							
							str2 = "\t\t"+ add.getZipcode(); 
							
							str3 =add.getSido()+ " "+add.getGugun()+ " "+add.getDong()
									+ " "+add.getBldg()+ " "+add.getBunji() + " "+add.getSeq() ;
						%>
						 <option onclick="select('<%=add.getZipcode()%>','<%=str3%>')">
						 <%=str%> &nbsp;&nbsp;&nbsp;<%=str2 %> 
						 </option> 
					<%};%>
				 	</select>
					</td>
					</tr>  
				</table>
				<input type="button" value="주소입력" onclick="input(this.form)">
			 	<input type="button" value="닫기" onclick="self.close();"> 
			 	<%}%>
				</center>
				
		</fieldset>
	</form>
</body>
</html>