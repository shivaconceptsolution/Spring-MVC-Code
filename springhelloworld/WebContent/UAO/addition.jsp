<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="add" method="post">
Enter first number
<br>
<input type="text" name="txtnum1"  />
<br>
Enter second number
<br>
<input type="text" name="txtnum2"  />
<br>
<input type="submit" name="btnsubmit" value="Add" />

</form>
${msg}
</body>
</html>