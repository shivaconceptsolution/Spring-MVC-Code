<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.Reg"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="template.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%= request.getAttribute("msg") %>

<table border="1">
<tr><th>Username</th><th>Password</th><th>Mobile</th></tr>

<%

HiberTemplate.setConfiguration();
Query q=HiberTemplate.getData("from Reg r where r.username=?");
//q.setParameter("a",request.getAttribute("msg"));
q.setString(0, ""+request.getAttribute("msg"));
List lst = q.list();
Iterator it = lst.iterator();
while(it.hasNext())
{
	Reg r1 = (Reg)it.next(); %>
	<tr>
	<td><%= r1.getUsername() %></td>
	<td><%= r1.getPassword() %></td>
	<td><%= r1.getMobile() %></td>
	<td><a href="FindReg.html?q=<%= r1.getUsername() %>">EDIT</a></td>
	<td><a href="DeleteReg.html?q=<%= r1.getUsername() %>">DELETE</a></td>
	</tr>
	
	
<% }

HiberTemplate.closeConn();
//s.close();%>
</table>
</body>
</html>