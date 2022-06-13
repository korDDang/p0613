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
<h3>DM 발송 내역</h3>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select count(dmno) from DM0613";
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
<div style="margin: 0 20%;">총 <%=cnt %>건의 발송내역이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th id="th1">no</th>
<th id="th1">DM발송번호</th>
<th id="th1">고객아이디</th>
<th id="th1">고객성명</th>
<th id="th1">발송일자</th>
<th id="th1">DM 내용</th>
<th id="th1">발송부서</th>
<th id="th1">고객등급</th>
<th id="th1">캠페인 구분</th>
<th id="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select d.dmno,d.custid,c.author,to_char(d.maildate,'YYYY-MM-DD'),d.contents,d.dept,d.grade,d.campain from DM0613 d,customer0613 c where d.custid=c.custid ";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		
		String dmno=rs.getString(1);
		String custid=rs.getString(2);
		String author=rs.getString(3);
		String maildate=rs.getString(4);
		String contents=rs.getString(5);
		String dept=rs.getString(6);
		String grade=rs.getString(7);
		String campain=rs.getString(8);
	    no++;
	
%>



<tr>
<td id="tdtd1"><%=no %></td>
<td id="tdtd1"><a href="dmupdate.jsp?dmno=<%=dmno%>"><%=dmno%></a></td>
<td id="tdtd1"><%=custid %></td>
<td id="tdtd1"><%=author %></td>
<td id="tdtd1"><%=maildate %></td>
<td id="tdtd1"><%=contents %></td>
<td id="tdtd1"><%=dept %></td>
<td id="tdtd1"><%=grade %></td>
<td id="tdtd1"><%=campain %></td>
<td id="tdtd1"><a href="dmdelete.jsp?dmno=<%=dmno%>">삭제</a></td>

</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회실패");
	}


%>
</table>
<br>
<div id="td1"><input type="button" value="작성" onclick="location.href='addDM.jsp'" style="background: gray; color:  white;"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>