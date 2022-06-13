<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<%@ include file="DBConn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
try{
	String sql="select * from area0613 where areacode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("areacode"));
	rs=pstmt.executeQuery();
	if(rs.next()){
		String areacode=rs.getString("areacode");
		String areaname=rs.getString("areaname");

%>
<h2 style="text-align: center;">거주지 정보 수정 화면</h2>
<hr>
<form name="form" method="post" action="areaupdateProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>거주지 코드</th>
<td>
<input type="text" name="areacode" value="<%=areacode%>">
</td>
</tr>
<tr>
<th>거주자 이름</th>
<td>
<input type="text" name="areaname" value="<%=areaname%>">
</td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="등록" style="background: gray; color: white;">
<input type="reset" value="취소" style="background: gray; color: white;">
</td>
</tr>
<%
	}
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>