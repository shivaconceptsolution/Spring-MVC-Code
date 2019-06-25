<%@page import="template.HiberTemplate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.*" %>  
<%@page import="org.hibernate.*" %> 
<%@page import="java.util.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="savefile.html" method="post" enctype="multipart/form-data">  
Select File: <input type="file" name="file"/> 
<br>
File Description
<br>
<textarea name="txtdesc" rows="10" cols="30">

</textarea> 
<br>
<input type="submit" value="Upload File"/>  
</form> 
${fname}
<%
HiberTemplate.setConfiguration();

Query q = HiberTemplate.getData("from Upload u");
List lst = q.list();
Iterator it = lst.iterator();
while(it.hasNext())
{
Upload u = (Upload)it.next();
%>
<div style="float:left;margin-left:10px;">
<img src="<%= u.getPath() %>" width="300" height="300"/>
</div> 
<%
}

%>

</body>
</html>