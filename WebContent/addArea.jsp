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
<h2 style="text-align: center;" >거주지 정보 등록 화면</h2>
<hr>
<form name="form" method="post" action="addAreaProcess.jsp">
<table border="1" id="tab1">
<tr>
<th>거주지 코드</th>
<td>
<input type="text" name="areacode">
</td>
</tr>
<tr>
<th>거주자 이름</th>
<td>
<input type="text" name="areaname">
</td>
</tr>
<tr>
<td colspan="2" id="td1">
<input type="submit" value="등록" style="background: gray; color: white;">
<input type="reset" value="취소" style="background: gray; color: white;">
</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>

</body>
</html>