<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> Header </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <style type="text/css">
   .style1{
   font-size: 16px;
	text-decoration: none;
	}
  </style>
 </HEAD>

 <BODY>
 
<TABLE>

<TR>
	<TD>
	<form name="homepageform" method="post" action="login.do">
	<a href="#" onclick="javascript:document.homepageform.submit();"><IMG SRC="images/Capture1.JPG" alt="nothing" onclick=""></a>
	</form>
	</TD>
	<% if(session.getAttribute("uname")==null){ %>
	<TD>&nbsp;&nbsp;&nbsp;<font size=-1>Hello. <a href = "am_login.jsp"> Sign in </a> to get personalized recommendations. New customer?<a href = "Register.jsp">  Start here.</a> </font></TD>
	<%}else{ %>
	<TD>&nbsp;&nbsp;&nbsp;<font size=-1 color="blue">Hello, <%= session.getAttribute("uname") %></font></TD>
	<%} %>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
	<TD>
	<form name="logoutform" method="post" action="logout.do">
	<% if(session.getAttribute("uname")!=null){ %>
	<a href = "SiteUnderConstruction.jsp" class="style1"> Your Account </a> |
	<%} %><a href = "SiteUnderConstruction.jsp" class="style1"> Help</a>
	<% if(session.getAttribute("uname")!=null){ %>
	<a href = "#" onclick="javascript:document.logoutform.submit();">Log Out</a>
	</form>
	<%} %> 
	</TD>
</TR>
</TABLE>

<TABLE>
<TR>
<form name="ShoppingCartHomeForm" method="post" action="ShoppingCartServlet.do">
	<TD bgcolor = "blue"><a href = "SiteUnderConstruction.jsp"><IMG SRC="images/ShopAll.JPG" WIDTH="170" HEIGHT="30" BORDER="0" ALT=""></a></TD>
	<TD bgcolor = "blue">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ffffff">Search:</font> <SELECT NAME="Category">
		<OPTION VALUE="All Departments" SELECTED>All Departments</Option>
		<OPTION VALUE="Automotives">Automotives</Option>
		<OPTION VALUE="Baby">Baby</Option>
		<OPTION VALUE="Books">Books</Option>
		<OPTION VALUE="Books">Tools & Home Improvement</Option>
	</SELECT> &nbsp;&nbsp;<INPUT TYPE="text" NAME="Search" size = "80">&nbsp;
	<a href = "SiteUnderConstruction.jsp"><IMG SRC="images/go2.jpg" WIDTH="22" BORDER="0" ALT=""></a>&nbsp;&nbsp;&nbsp;<a href="#" onclick="javascript:document.ShoppingCartHomeForm.submit();"><IMG SRC="images/Cart.JPG" WIDTH="100" HEIGHT="25" BORDER="0" ALT=""></a>
	&nbsp;&nbsp;&nbsp;<a href = "SiteUnderConstruction.jsp">
	<IMG SRC="images/WishList.JPG" WIDTH="72" HEIGHT="25" BORDER="0" ALT=""></a></TD>
</form>
</TR>
</TABLE>

 </BODY>
</HTML>
