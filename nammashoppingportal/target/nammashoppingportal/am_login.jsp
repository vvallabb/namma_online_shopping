<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Login </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <script>
function changeTextbox(a)
{
        if(a=="Yes")
            document.loginform.upass.disabled=true;
        else if(a=="No")
           document.loginform.upass.disabled=false;
       
}
</script>
 </HEAD>

 <BODY>
 

<table>
<tr>
<td><jsp:include page="Header.jsp" flush="true" /></td>
</tr>
</table>
<form name="loginform" action="login.do" method="post">
 <!-- <form name = "form1">-->
  <font Color = "Orange"> <h2> Sign In</h2></font>
  <font color="red"><h3>Are you an admin/courier company? <a href="courierLogin.jsp">Start here</a></h3></font>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <font size="5" Color = "Orange"><b>What is your Amazon.com username?</b></font>
<br></br>
<% 
session.setAttribute("uname",null);
String validUser = (String)request.getAttribute("valid");
if(validUser!=null)
if(validUser.equals("no"))
        {
 %>
<font color="red">Username/Password combination is not valid. Please enter the correct Username/Password</font></pre>
<p></p>
<%} %> 
 <pre><font size = "3"><b>          User Name:  <input type="text" size = "30" name="uname"> </b>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <font size="5" Color = "Orange"><b>Do you have an Amazon.com password?</b></font>
  <pre><font size = "3"><b>        <input type="radio" name="isNewUser" value="Yes" CHECKED onClick="changeTextbox(this.value)"/> <b>No,I am a new customer. </b>
          <input type="radio" name="isNewUser" value="No" onClick="changeTextbox(this.value)" /> <b>Yes,I have a password  <input type="password" name="upass" disabled = "true"> <pre>
 </b>
<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:document.loginform.submit();"><IMG SRC="images/signIn.JPG" WIDTH="221" HEIGHT="25" BORDER="0" ALT=""/></a>
 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "SiteUnderConstruction.jsp">Forgot your password? Click here </a>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href = "SiteUnderConstruction.jsp">Has your e-mail address changed since your last order?</a>
 </form>
 <table> 
<tr>
<td><jsp:include page="Footer.jsp" flush="true" /></td>
</tr>
</table>
 </BODY>
</HTML>