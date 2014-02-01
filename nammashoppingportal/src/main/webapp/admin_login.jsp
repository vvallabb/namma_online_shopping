<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<h1>Welcome to Amazon</h1>
<h3>Please login</h3>
<% String validUser = (String)request.getAttribute("valid");
if(validUser!=null)
if(validUser.equals("no"))
		{
 %>
Username/Password combination is not valid. Please enter the correct Username/Password
<p></p>
<%} %>
<form name="loginform" action="adminLogin.do" method="post">
Username : <input type="text" name="uname">
<br></br>
<p></p>
Password : <input type="password" name="upass">
<br></br>
<p></p>
<input type="submit" value="Submit" name="submit1"/>
<input type="reset" value="Reset" />
</form>
</body>
</html>