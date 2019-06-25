<%@page import="dao.Reg"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="template.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
span
{
color:red;
}
</style>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
function showdata(a)
{
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("res").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("POST","showdata.html?q="+a,true);
	xmlhttp.send();
	
}

function checkdata(a)
{
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		document.getElementById("res").innerHTML = xmlhttp.responseText;
	}
	xmlhttp.open("POST","showdata.html?q="+a,true);
	xmlhttp.send();
	
}
function validate()
{
	email=document.getElementById("txtemail").value;
	pass = document.getElementById("txtpass").value;
	mobile = document.getElementById("txtmobile").value;
	atpos = email.indexOf("@");
	dotpos=email.lastIndexOf(".");
	
	c=0;
	for(i=0;i<pass.length;i++)
		{
		if(pass[i]=="@")
			{
			c++;
			}
		  if(pass[i]=="$")
		   {
		     c++;
		   }
		  if(pass[i]=="#")
		   {
		     c++;
		    }
		if(pass[i]=="_")
		{
		c++;
		}
		
		}
	if(atpos==-1 || dotpos==-1 || atpos>dotpos||(dotpos-atpos)<3||(dotpos+1==email.length))
	{
		document.getElementById("sp4").innerHTML="invalid emailid";
		
		return false;
	}
	else if(!isNaN(document.getElementById("txtuser").value))
		{
		document.getElementById("sp1").innerHTML="username should be alphabetical";
		//alert("username should be alphabetical");
		return false;
		}
	else if(pass.length<5)
		{
		document.getElementById("sp2").innerHTML="password length should be above five";
		
		return false;
		}
	else if(c<3)
		{
document.getElementById("sp2").innerHTML="minimum two special char should be exist";
		
		return false;
		}
	else if(isNaN(mobile))
		{
document.getElementById("sp3").innerHTML="mobile no should be numeric";
		
		return false;
		}
	else if(mobile.length!=10)
	{
document.getElementById("sp3").innerHTML="mobile no should be 10 digit";
	
	return false;
	}
	else
		{
		document.getElementById("sp1").innerHTML="";
		document.getElementById("sp2").innerHTML="";
		document.getElementById("sp3").innerHTML="";
		
		}
	
}

</script>
</head>
<body>
<header>
<ul>
<li><a href="home.html">Home</a></li>
<li><a href="about.html">About us</a></li>
<li><a href="services.html">Services</a></li>
<li><a href="gallery.html">Gallery</a></li>
<li><a href="contact.html">Contact us</a></li>
</ul>
</header>
<section>
<div style="float:left">
<h1>Welcome in home page</h1>
<form action="home.html" method="post">
<input type="text" id="txtemail" name="txtemail" placeholder="enter email" onblur="checkdata(this.value)" required />
<span id="sp4"></span>
<br>
<br>
<input type="text" id="txtuser" name="txtuser" placeholder="enter username" required />
<span id="sp1"></span>
<br>
<br>
<input type="text" id="txtpass" name="txtpass" placeholder="enter password" required />
<span id="sp2"></span>
<br>
<br>
<input type="text" id="txtmobile" name="txtmobile" placeholder="enter mobile no" required/>
<span id="sp3"></span>
<br>
<br>
<input type="submit" name="btnsubmit" value="Register" onclick="return validate()" />
<br>
<a href="login.html">Already Register Login Here</a>
</form>
${msg}
</div>
<div style="float:right;width:50%;">
<select name="du" onchange="showdata(this.value)">
<%
HiberTemplate.setConfiguration();
Query q1=HiberTemplate.getData("from Reg r");
List lst1 = q1.list();
Iterator it1 = lst1.iterator();
while(it1.hasNext())
{
	Reg r1 = (Reg)it1.next(); %>
%>
<option value="<%= r1.getUsername() %>"><%= r1.getUsername() %></option>

<%
}
%>
</select>
<div id="res">


</div>
<h1>VIEW REGISTERED USER'S</h1>

<table border="1">
<tr><th>Username</th><th>Password</th><th>Mobile</th></tr>

<%


Query q=HiberTemplate.getData("from Reg r");
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
</div>
</section>
<footer>

</footer>
</body>
</html>