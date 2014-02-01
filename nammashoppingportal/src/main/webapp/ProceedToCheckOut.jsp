<%-- 
    Document   : ProceedToCheckOut
    Created on : Mar 9, 2010, 12:06:02 PM
    Author     : vasanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="entity.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> Shipping Address </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="Madhurima">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <style type="text/css">
<!--
.style1 {color: #FF9900}
.style2 {color: #000000}
 .resultheader
 {
  padding: 0 0 2px 0;
  margin: 0;
  font-size: 100%;
  text-align:left;
  background-color:#eedc82;
  width: 1400px;
  } 
-->
  </style>
  <script type="text/javascript">
  function submitAddress(value){
	//alert(value);
	document.addressform.addresstype.value = value;
	document.addressform.submit();
  }
  
  function checkPhone(){

	  var strng = document.addressform.PhoneNumber.value;
	  var stripped = strng.replace(/[\(\)\.\-\ ]/g, '');
	//strip out acceptable non-numeric characters
	if (isNaN(parseInt(stripped))) {
	   error = "The phone number contains illegal characters.";
	   alert(error);
	   document.addressform.PhoneNumber.value="";
	}

	if (!(stripped.length >= 10)) {
		error = "The phone number is the wrong length. Make sure you included an area code.\n";
		alert(error);
		document.addressform.PhoneNumber.value="";
	}
  }

  function checkZip(){
	  
	  var strng = document.addressform.ZipPostal.value;
	  var stripped = strng.replace(/[\(\)\.\-\ ]/g, '');
	//strip out acceptable non-numeric characters
	if (isNaN(parseInt(stripped))) {
	   error = "The Zip contains illegal characters.";
	   alert(error);
	   document.addressform.ZipPostal.value="";
	}		  
  }
  </script>
</HEAD>

 <BODY>
 <div align="center">
 <img src="images/checkout-spc-address-banner.jpg"/>
 </div>
  <h2 class="style1">Choose a Shipping address</h2>
Is the address you'd like to use displayed below? If so, click the corresponding "Ship to this address" button. Or you can <a href="#SA">Enter a new Shipping Address</a>
<br>
<br>
<hr>
<div class="resultheader"><b>Address Book</b></div>
<hr>
 <form name="addressform" action="printAddress.do" method="post">
 
<a href="#" onclick="submitAddress(1)">
                  <img src="images/ship-to-address-y.gif" border="0">
              </a>
<br></br>
<%
ArrayList UserBillingAddressArr = (ArrayList)request.getAttribute("ShippingAddressarr");
session.setAttribute("ShippingAddressarr",UserBillingAddressArr);
if(UserBillingAddressArr == null)
    {
%>
No information provided
<%}
else
{
    Iterator ShippingCarIterator = UserBillingAddressArr.iterator();
    while(ShippingCarIterator.hasNext())
    {
        UserDetails ud = (UserDetails)ShippingCarIterator.next();
    %>
    <b><%=ud.getUserDetailsFirstName()%> <%=ud.getUserDetailsMiddleName()%>
    <%=ud.getUserDetailsSurName()%></b>
    <br>
        <%=ud.getUserDetailsAddressLine1()%>
    <br>
    <%=ud.getUserDetailsAddressLine2()%>
    <br>
    <%=ud.getUserDetailsCity()%>
    <br>
    <%=ud.getUserDetailsRegion()%>
    <br>
    <%=ud.getUserDetailsZip()%>
    <br>
    <%=ud.getUserDetailsCountry()%>
    <br>
    <%=ud.getUserDetailsPhoneNumber()%>
    <br>
    <%}
}
    %>

<p></p>
<a href="#">
                  <img src="images/edit-t-sm.gif" border="0">
              </a>
              <a href="#">
                  <img src="images/delete-t-sm.gif" border="0">
              </a>

<hr>
<h2 align="justify" class="style1"><a name="SA">Or enter a new shipping address</h2>
Be sure to click "Ship to this address" when done.


   <blockquote>
     <blockquote>
       <p>
         Full name:
         <input type="text" name="FullName" value="" />
         <br />
                          </p>
     </blockquote>
   </blockquote>


  <blockquote>
    <blockquote>
      <p>
        Address Line1:
        <input type="text" name="AddressLine1" value="" />
        <br />
        Street address, P.O. box, company name, c/o      </p>
    </blockquote>
  </blockquote>

  <blockquote>
    <blockquote>
      <p>
        Address Line2:
        <input type="text" name="AddressLine2" value="" />
        <br />
        Apartment, suite, unit, building, floor, etc.      </p>
    </blockquote>
  </blockquote>

  <blockquote>
    <blockquote>
      <p>City:
          <input type="text" name="City" value="" />
        <br />
          </p>
    </blockquote>
  </blockquote>

  <blockquote>
    <blockquote>
      <p>
        State/Province/Region:
        <input type="text" name="StaProReg" value="" />
        <br />
          </p>
    </blockquote>
  </blockquote>

  <blockquote>
    <blockquote>
      <p>
        Zip/Postal Code:
        <input type="text" name="ZipPostal" value="" onblur="checkZip()"/>
        <br />
          </p>
    </blockquote>
  </blockquote>

  <blockquote>
    <blockquote>
      <p name="Country">Country:
      <select name="Country">
      <%ArrayList countryArr = (ArrayList) request.getAttribute("countryArr"); 
      Iterator countryIterator = countryArr.iterator();
      while(countryIterator.hasNext())
      {
      %>
         <option value="India"><%=countryIterator.next() %></option>
       <%} %>
       </select>   
     </p>
    </blockquote>
  </blockquote>




  <blockquote>
    <blockquote>
      <p>
        <label>
        Phone Number:
        <input type="text" name="PhoneNumber" onblur="checkPhone()">


  <blockquote>
    <blockquote>
      <p>
        <label>
        <a href="#" onclick="submitAddress(2)">
                  <img src="images/ship-to-address-y.gif" border="0">
              </a>
        
        </label>
          </p>
    </blockquote>
  </blockquote>
  <input type="hidden" name="addresstype"/>
</form>
<div class="style1">
  <blockquote>
    <p align="left"><strong>Address Accuracy</strong> </p>
    <p align="left" class="style2"> Make sure you get your stuff! If the address is not entered correctly, your package may be returned as undeliverable. You would then have to place a new order. Save time and avoid frustration by entering the address information in the appropriate boxes and double-checking for typos and other errors. </p>
  </blockquote>
</div>
<hr>
 </BODY>
</HTML>

