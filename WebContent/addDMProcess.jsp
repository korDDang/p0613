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
	String sql="insert into DM0613 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("dmno"));
	pstmt.setString(2, request.getParameter("custid"));
	pstmt.setString(3, request.getParameter("maildate"));
	pstmt.setString(4, request.getParameter("contents"));
	pstmt.setString(5, request.getParameter("dept"));
	pstmt.setString(6, request.getParameter("grade"));
	pstmt.setString(7, request.getParameter("campain"));
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}

%>
</body>
</html>