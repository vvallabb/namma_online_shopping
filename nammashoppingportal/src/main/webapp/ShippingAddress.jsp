<%-- 
    Document   : ShippingAddress
    Created on : Mar 9, 2010, 6:02:53 PM
    Author     : vasanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipping Address</title>
    </head>
    <body>
    <jsp:include page="Header.jsp"/>
        <font color="orange"><h1>The product will be shipped to the Shipping Address:</h1></font>
        <%
        String fullName = (String)session.getAttribute("FullName");
 	  
 	   String addrLine1 = (String)session.getAttribute("AddressLine1");
 	  
 	   String addrLine2 = (String)session.getAttribute("AddressLine2");
 
 	   String city = (String)session.getAttribute("city");
 
 	   String state = (String)session.getAttribute("StaProReg");
 	
 	   String zip = (String)session.getAttribute("ZipPostal");
 
 	   String country = (String)session.getAttribute("Country");
 
 	   String phoneNo = (String)session.getAttribute("PhoneNumber");
 	
        %>
        <font color="blue">
        <%= fullName%>,
        <br></br>
        <%=addrLine1 %>,
        <br></br>
        <%=addrLine2 %>,
        <br></br>
        <%=city %>,
        <br></br>
        <%=state %>,
        <br></br>
        <%=zip %>,
        <br></br>
        <%=country %>,
        <br></br>
        <%=phoneNo %></font>
    </body>
</html>
