<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script>
function clearForm(){
	document.creditform.cardnumber.value = '';
	document.creditform.cardholder.value = '';
	document.creditform.cvv.value = '';
	document.creditform.cardpin.value = '';
}

</script>
</head>

<body>
<jsp:include page="Header.jsp"/>
<h2><font color="orange">Please provide your credit card details</font></h2>
<% String error = (String)request.getAttribute("error");
	if(error!=null)
	{
	if(error.equals("wrong credentials"))
	{
%>
<font color="red">Please enter the correct credit card credentials</font>
<%} else if(error.equals("no money")){%>
<font color="red">Sorry, you do not have enough balance in your credit card.
 Consider buying a few items later or enter another credit card details</font>
<%}} %>
<form name="creditform" method="post" action="creditdetails.do">
Bank : <select name="bank">
<% ArrayList banks = (ArrayList)session.getAttribute("banks");
if(banks!=null)
{
	Iterator banksIterator = banks.iterator();
	while(banksIterator.hasNext())
	{
%>
<option><%=banksIterator.next() %></option>
<%}} %>
</select>
<p>
Credit card number : <input name="cardnumber" type="text" />
<p>
Credit card holder's name : <input name="cardholder" type="text" />
<p>
CVV : <input name="cvv" type="text" />
<p>
Pin : <input name="cardpin" type="password" />
<p>
<input type="submit" value="Submit" />
<input type="button" value="Clear" onclick="clearForm()"/>
</form>
</body>
</html>
