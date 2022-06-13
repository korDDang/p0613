<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.custid.value==""){
		alert("고객아이디를 입력하세요.");
		doc.custid.focus();
	}else if(doc.author.value==""){
		alert("고객이름를 입력하세요.");
		doc.author.focus();
	}else{
		alert("등록이 완료되었습니다");
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<%@ include file="DBConn.jsp" %>
<%ResultSet rs=null;
PreparedStatement pstmt=null;
int ma=0;
try{
	String sql="select max(dmno) from DM0613";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}else{
		ma=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}


%>
<h3>dm 정보 등록 </h3>
<form name="form" method="post" action="addDMProcess.jsp">
<table border="1" id="tab1">
<tr>
<th id="th1">dm 발송번호</th>
<td colspan="3">
<input type="text" name="dmno" value="<%=ma%>" style="width:80%;">
</td>
</tr>
<tr>
<th id="th1">고객아이디</th>
<td>
<input type="text" name="custid">
</td>
<th id="th1">고 객 명</th>
<td>
<input type="text" name="author">
</td>
</tr>
<tr>
<th id="th1">발송일자</th>
<td>
<input type="text" name="maildate">
</td>
<th id="th1">dm내용</th>
<td>
<input type="text" name="contents">
</tr>
<tr>
<th id="th1">발송부서</th>
<td>
<input type="text" name="dept">
</td>
<th id="th1">고객등급</th>
<td>
<select name="grade">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="v">v</option>
<option value="w">w</option>
</select></td>
</tr>
<tr>
<th id="th1">캠페인 구분</th>
<td colspan="3">
<input type="text" name="campain" style="width:80%;">
</td>
</tr>
<tr>
<td colspan="4" id="td1">
<input type="button" value="목록" onclick="location.href='dmSelect.jsp'" style="background: gray; color: white;">
<input type="submit" value="저장" style="background: gray; color: white;">
</table>
</form>


</section>
<%@ include file="footer.jsp" %>
</body>
</html>