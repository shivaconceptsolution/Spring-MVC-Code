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
<%
HiberTemplate.setConfiguration();
Query q=HiberTemplate.getData("from Reg r where r.username=?");
//q.setParameter("a",request.getAttribute("msg"));
q.setString(0, ""+request.getAttribute("msg"));
List lst = q.list();
Iterator it = lst.iterator();
if(it.hasNext())
{ 
	
	out.println("username already exist in database");
}
else
{
	out.println("username not exist in database");
}

HiberTemplate.closeConn();
//s.close();%>
</table>
</body>
</html>