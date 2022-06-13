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

<h3>DM 정보 수정 </h3>
<form name="form" method="post" action="dmupdateProcess.jsp">
<table border="1" id="tab1">

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
String dmno=request.getParameter("dmno");
String custid=request.getParameter("custid");
	try{
		String sql="select * from DM0613 where dmno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dmno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			dmno=rs.getString("dmno");
			String maildate=rs.getString("maildate");
			String contents=rs.getString("contents");
			String dept=rs.getString("dept");
			String grade=rs.getString("grade");
			String campain=rs.getString("campain");
			custid=rs.getString("custid");
	
	
%>
<tr>
<th id="th1">DM 발송번호</th>
<td colspan="3">
<input type="text" name="dmno" value="<%=dmno%>" style="width:80%;">
</td>
</tr>
<tr>
<th id="th1">고객아이디</th>
<td>
<input type="text" name="custid" value="<%=custid%>">
</td>
<th id="th1">고 객 명</th>
<td>
<input type="text" name="author" >
</td>
</tr>
<tr>
<th id="th1">발송일자</th>
<td>
<input type="text" name="maildate" value="<%=maildate%>">
</td>
<th id="th1">d m내용</th>
<td>
<input type="text" name="contents" value="<%=contents%>">
</tr>
<tr>
<th id="th1">발송부서</th>
<td>
<input type="text" name="dept" value="<%=dept%>">
</td>
<th id="th1">고객등급</th>
<td>
<select name="grade">
<option value="1" <%=grade.equals("1")?"selected":"" %>>1</option>
<option value="2" <%=grade.equals("2")?"selected":"" %>>2</option>
<option value="3" <%=grade.equals("3")?"selected":"" %>>3</option>
<option value="4" <%=grade.equals("4")?"selected":"" %>>4</option>
<option value="5" <%=grade.equals("5")?"selected":"" %>>5</option>
<option value="v" <%=grade.equals("v")?"selected":"" %>>v</option>
<option value="w" <%=grade.equals("w")?"selected":"" %>>w</option>
</select></td>
</tr>
<tr>
<th id="th1">캠페인 구분</th>
<td colspan="3">
<input type="text" name="campain" style="width:80%;" value="<%=campain%>">
</td>
</tr>
<tr>
<td colspan="4" id="td1">
<input type="button" value="목록" onclick="location.href='dmSelect.jsp'" style="background: gray; color: white;">
<input type="submit" value="저장" style="background: gray; color: white;">
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