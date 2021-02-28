<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="javax.servlet.*" %> 
 <%@ page import ="dto.UserVO" %> 
 <%@ page import ="DBAction.*" %> 
 <%@ page import ="java.sql.*" %> 
 
<!DOCTYPE html>
<%
	Connection conn = DBAction.getInstance().getConnection();
	Statement stmt=null;
	ResultSet rs=null;
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id").trim();
	String sql = "SELECT * FROM user WHERE ID='"+id+"'";	
	try{
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	}catch (SQLException e){
		e.printStackTrace();
	}

%>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript">
	var casech =false;
	var idnullc = false
	function cannot(){
		casech = false;
		return casech;
	}
	function can(){
		casech = true;
		return casech;
	}
	
	function idnull(){
		idnullc = true;
		return idnullc;
	}
	
	function end(){
		try{
			var idct = opener.document.getElementById("idct");
	 		var idExp = /[a-z0-9][a-z0-9_\-]{4,10}$/;    
	 		if(idnullc ==true){
	 			idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>필수 입력 사항입니다.</p>";
	 		}else{
	 			if(casech == false){
		 			idct.innerHTML="<p style='font-size:12px; color:#ff0000;'>이미 사용중이거나 탈퇴한 아이디입니다.</p>";
				}else if(casech == true){
		 			idct.innerHTML="<p style='font-size:12px; color:#009933;'>멋진 아이디이네요!</p>"
		 			opener.document.frm.hid.value ="<%=request.getParameter("id")%>";
		 			opener.document.frm.hid2.value ="y";
		 			var oppener_id = opener.document.getElementById("id");
		 			oppener_id.setAttribute("readOnly","readOnly");
				}
	 		}
			self.close();
		}catch (err){
			alert(err);
		}
	}
	</script>
	</head>
	<body><br><p>
	<center>
	<hr><br><p>
		<%
		try{
			%>
			<% 
			if(id.equals("")){ %>
					아이디를 입력해주세요.<p>
					<script>idnull();</script>
				<%
			}else {
				if(rs.next()){%>
				<%= rs.getString(1)+ "는 사용할 수 없는 아이디입니다."%><p>
				<script>cannot();</script>
				<%	
				}else{ %>
				<span id="id" name="id" value="<%=id%>"></span>
				<%= id+ "는 사용 가능한 아이디입니다."%><p>
				<script>can();</script>
			<%}
			}%>
			<input type="button" value="확인" onclick="end();">
		<%	
			}catch (SQLException e){
			}finally{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();	
			}%>

</p>
</center>
</body>
</html>