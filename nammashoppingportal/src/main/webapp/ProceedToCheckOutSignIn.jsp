<%-- 
    Document   : ProceedToCheckOutSignIn
    Created on : Mar 9, 2010, 6:01:38 PM
    Author     : vasanth
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> Sign In - Amazon.com Checkout</TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <script>
function changeTextbox(a)
{
if(a=="Yes")
{
document.forms[0].passwd.disabled=true;
}
else if(a=="No")
{
document.forms[0].passwd.disabled=false;
}
}
</script>


 </HEAD>
 <BODY>
 <div align="center">
 <img src="images/check_out_header_new.jpg"/>
 </div>
     <form name ="ProceedToCheckOut1" method="post" action="ProceedToCheckOut.do">
 <table border="0">
 <tr>
 <td>
  <h2><font color="orange"> Ordering from Amazon.com is quick and easy</font></h2><br />
  </td>
  <td></td>
   <tr>
   <td>
	<div align="right"><font size="4"><b>Enter your e-mail address:</b></font></div>
	 </td>
	 <td>
	 <input type="text" name="userEmail">
	 </td>
	 </tr>
	 <tr>
	 <td></td>
	 <td>
	  <input type="radio" name="isNewUser" value="Yes"  checked onClick="changeTextbox(this.value)"/> <b>I am a new customer. </b> <br />
	  </td>
	  </tr>
	  <tr>
	  <td></td>
	  <td>
	 (You'll create a password later)
	 </td>
<br />
</tr>
<tr>
<td></td>
<td>
<input type="radio" name="isNewUser" value="No" onClick="changeTextbox(this.value)" /> <b>I am a returning customer,
and my password is: </b>
</td>
</tr>
<tr>
<td></td>
<td>
<input type="password" name="passwd" disabled=true >
<br />
</td>
</tr>
<tr>
<td></td>
<td>
<br />
<!--<input type="submit" value="Sign In using our secure server">-->
<!--<a href="ShippingAddress.jsp" ><img src="signIn.jpg" border="0"/></a> -->
            
              <a href="#" onclick="javascript:document.ProceedToCheckOut1.submit();">
                  <img src="images/signIn.JPG" border="0" align="right">
              </a>
            
<br /><br />
</td>
</tr>
<tr>
<td></td>
<td>
<a href="SiteUnderConstruction.jsp">Forgot your password? Click here</a><br />
<a href="SiteUnderConstruction.jsp">Has your e-mail address changed since your last order?</a><br />
</td>
</tr>
</table>
         </form>
<br />
<br />
<hr />
<div align="center">
<font size="2" >
Redeeming a gift card or gift certificate? We'll ask for your claim code when it's time to pay.<br />
Having difficulties? Please visit our Help pages to learn more about placing an order.
</font>
</div>
<hr />
 </BODY>
</HTML>
