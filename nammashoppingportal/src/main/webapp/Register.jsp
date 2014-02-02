<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Login </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <script>
  function checkPass(a,b){
	  var a = registerform.upass.value;
	  var b = registerform.upass1.value;
	  if(a!=b){
		  alert("Both passwords do not match");
		  var b = registerform.upass1.value="";
	  } 
  }
	  function checkPhone(){
		  var strng = registerform.phone.value;
		  var stripped = strng.replace(/[\(\)\.\-\ ]/g, '');
		//strip out acceptable non-numeric characters
		if (isNaN(parseInt(stripped))) {
		   error = "The phone number contains illegal characters.";
		   alert(error);
		   registerform.phone.value="";
		}

		if (!(stripped.length >= 10)) {
			error = "The phone number is the wrong length. Make sure you included an area code.\n";
			alert(error);
			registerform.phone.value="";
		}
		
	  }

  function checkEmail(a,b){
	  var a = registerform.email.value;
	  var b = registerform.email1.value;
	  if(a!=b){
		  alert("Both emails do not match");
		  var b = registerform.email1.value="";
	  }  
  }

function checkZip(){
	  
	  var strng = registerform.zip.value;
	  var stripped = strng.replace(/[\(\)\.\-\ ]/g, '');
	//strip out acceptable non-numeric characters
	if (isNaN(parseInt(stripped))) {
	   error = "The Zip contains illegal characters.";
	   alert(error);
	   registerform.zip.value="";
	}		  
  }
</script>
 </HEAD>

 <BODY>
 
</p>

<table>
<tr>
<td><jsp:include page="Header.jsp" flush="true" /></td>
</tr>
</table>
<form name="registerform" action="register.do" method="post">
 <!-- <form name = "form1">-->
  <font Color = "Orange"> <h2> Registration</h2></font>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <font size="5" Color = "Orange"><b>New to Amazon.com? Register below</b></font>
 <pre><font size = "3">
 <b>         First Name:  <input type="text" size = "30" name="fname"> </b>
 <b>        Middle Name:  <input type="text" size = "30" name="mname"> </b> 
 <b>            Surname:  <input type="text" size = "30" name="sname"> </b> 

 <b>        My Email Is:  <input type="text" size = "30" name="email"> </b>
  <b>     Type it Again:  <input type="text" size = "30" name="email1" onblur="checkEmail()"> </b>
  
   <b>    Address Line1:  <input type="text" size = "30" name="add1"> </b>
    <b>	  Address Line2:  <input type="text" size = "30" name="add2"> </b>
	 <b>        City:  <input type="text" size = "30" name="city"> </b>			 <b>       Zip:  <input type="text" size = "30" name="zip" onblur="checkZip()"> </b>
	 <b>State/Region:  <input type="text" size = "30" name="state"> </b>          <b>       Country:  <input type="text" size = "30" name="country"> </b>
	  
	   <b>      Phone:  <input type="text" size = "30" name="phone" onblur="checkPhone()"> </b></pre> 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <font size="5" Color = "Orange"><b>Protect your information with a username & password?</b></font>
  <%
  if(request.getAttribute("error")!=null){
  int i = (Integer)request.getAttribute("error");
  if(i==-1){
  %>
  <br /><font size = "5" color="red"><b><pre>                      Username Already Exists</b></font></pre><%} }%> 
  <pre><font size = "3"><b>        
           <b>    Enter a Username <input type="text" name="uname"> </b>
		  <b>Enter a Password <input type="password" name="upass"> </b>
    <b>           ReEnter Password <input type="password" name="upass1" onblur="checkPass()"> </b></pre>

<br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:document.registerform.submit();"><IMG SRC="images/signIn.JPG" WIDTH="221" HEIGHT="25" BORDER="0" ALT=""/></a>
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