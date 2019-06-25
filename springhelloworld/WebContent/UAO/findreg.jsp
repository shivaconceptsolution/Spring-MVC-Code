<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="dao.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="editreg.html" method="post">
<%
Reg r = (Reg)request.getAttribute("data");
%>
<input type="text" readonly="true" name="txtuser" value="<%= r.getUsername() %>" />
<br>
<br>
<input type="text" name="txtpass" value="<%= r.getPassword() %>" />
<br>
<br>
<input type="text" name="txtmobile" value="<%= r.getMobile() %>" />
<br>
<br>
<input type="submit" name="btnsubmit" value="UPDATE" />



</form>
</body>
</html>