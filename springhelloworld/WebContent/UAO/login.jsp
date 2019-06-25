<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>LOGIN HERE</h1>
<form action="dashboard.html" method="post">
<input type="text" name="txtuser" placeholder="enter username" />
<br>
<br>
<input type="text" name="txtpass" placeholder="enter password" />
<br>
<br>

<input type="submit" name="btnsubmit" value="Login" />
<br>
<%
if(request.getAttribute("msg")!=null)
{
	out.print("<script>alert('"+request.getAttribute("msg")+"')</script>");
	
}
	
%>

<br>
<a href="home.html">Back</a>
</form>
</body>
</html>