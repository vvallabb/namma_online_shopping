<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp" flush="true" />
<font color="orange"><h1>Admin Login</h1></font>
<% String validUser = (String)request.getAttribute("valid");
if(validUser!=null)
{
if(validUser.equals("no"))
		{
 %>
<font color="red">Username/Password combination is not valid. Please enter the correct Username/Password</font>
<p></p>
<%} }%>
<form name="courierloginform" action="courierlogin.do" method="post">
<font color="blue">Username : </font><input type="text" name="uname">
<br></br>
<p></p>
<font color="blue">Password : </font><input type="password" name="upass">
<br></br>
<p></p>
<input type="submit" value="Submit" name="submit1"/>
<input type="reset" value="Reset" />
</form>
</body>
</html>