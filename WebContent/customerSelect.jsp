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
<h3>고객 정보 목록</h3>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select count(custid) from customer0613";
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
<div style="margin: 0 20%;">총 <%=cnt %>명의 고객이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th id="th1">no</th>
<th id="th1">고객아이디</th>
<th id="th1">고객성명</th>
<th id="th1">관심상품</th>
<th id="th1">전화</th>
<th id="th1">이메일</th>
<th id="th1">거주지코드</th>
<th id="th1">거주지</th>
<th id="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select c.custid,c.author,c.goods,c.phone,c.email,c.areacode,a.areaname from customer0613 c, area0613 a where c.areacode=a.areacode";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String custid=rs.getString(1);
		String author=rs.getString(2);
		String goods=rs.getString(3);
		String phone=rs.getString(4);
		String email=rs.getString(5);
		String areacode=rs.getString(6);
		String areaname=rs.getString(7);
	    no++;
	
%>



<tr>
<td id="tdtd1"><%=no %></td>
<td id="tdtd1"><a href="customerupdate.jsp?custid=<%=custid %>"><%=custid %></a></td>
<td id="tdtd1"><%=author %></td>
<td id="tdtd1"><%=goods %></td>
<td id="tdtd1"><%=phone %></td>
<td id="tdtd1"><%=email %></td>
<td id="tdtd1"><%=areacode %></td>
<td id="tdtd1"><%=areaname %></td>
<td id="tdtd1"><a href="customerdelete.jsp?custid=<%=custid %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>

</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}


%>
</table>
<div id="td1"><input type="button" value="작성" onclick="location.href='addCustomer.jsp'" style="background: gray; color:  white;"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>