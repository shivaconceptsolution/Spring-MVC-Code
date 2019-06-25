<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
</head>
<body>
<%
if(session.getAttribute("uid")==null)
{
	response.sendRedirect("login.html");
}


%>
<h1>Welcome in Admin Dashboard <%= session.getAttribute("uid") %></h1>
<a href="logout.html">logout</a>
</body>
</html>