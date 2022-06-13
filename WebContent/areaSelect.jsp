<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
<h3>거주지 정보 목록</h3>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select count(areacode) from area0613";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}else{
		cnt=1;
	}
	
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div style="margin: 0 40%;">총 <%=cnt %>개의 거주지가 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th id="th1">no</th>
<th id="th1">거주지 코드</th>
<th id="th1">거주지 이름</th>
<th id="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select * from area0613 ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		
		String areacode=rs.getString(1);
		String areaname=rs.getString(2);
	    no++;
	
%>



<tr>
<td id="tdtd1"><%=no %></td>
<td id="tdtd1"><%=areacode %></td>
<td id="tdtd1"><%=areaname %></td>
<td id="tdtd1"><a href="areaupdate.jsp?areacode=<%=areacode%>">수정</a>/<a href="areadelete.jsp?areacode=<%=areacode %>">삭제</a>

</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}


%>
</table>
<div id="td1"><input type="button" value="작성" onclick="location.href='addArea.jsp'" style="background: gray; color:  white;"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>