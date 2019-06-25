<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="abc">Click</a>
<a href="add">Addition</a>
<a href="si">si</a>
<form action="sicalc" method="post">
<input type="text" name="txtp" placeholder="enter amount" />
<br>
<br>
<input type="text" name="txtr" placeholder="enter rate" />
<br>
<br>
<input type="text" name="txtt" placeholder="enter time" />
<br>
<br>
<input type="submit" name="btnsubmit" value="click" />
</form>
${res}
</body>
</html>