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
String email=request.getParameter("email1")+"@"+request.getParameter("email2");
String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
String goods[]=request.getParameterValues("goods");
String goodssum="";
PreparedStatement pstmt=null;
try{
	String sql="insert into customer0613 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custid"));
	pstmt.setString(2, request.getParameter("author"));
	for(int i=0;i<goods.length;i++){
		if(i==0){
			goodssum=goods[i];
		}else{
			goodssum+=","+goods[i];
		}
	}
	pstmt.setString(3, goodssum);
	pstmt.setString(4, phone);
	pstmt.setString(5, email);

	pstmt.setString(6, request.getParameter("areacode"));
	pstmt.executeUpdate();
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("저장실패");
}

%>
</body>
</html>