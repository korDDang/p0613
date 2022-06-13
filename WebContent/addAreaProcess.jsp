<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%

PreparedStatement pstmt=null;
try{
	String sql="insert into area0613 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("areacode"));
	pstmt.setString(2, request.getParameter("areaname"));
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}

%>
</body>
</html>