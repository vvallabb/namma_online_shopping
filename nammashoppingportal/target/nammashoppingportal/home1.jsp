<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>
<%@page import="entity.Categories" %>
<%@page import="java.util.Iterator" %>
<%@page import="entity.DeliveredItems" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
  <script  type="text/javascript">
function update(categoryName){
	//alert(categoryName);
	//document.getElementById(categoryName).bgColor='#FFFFFF';
	if(categoryName == 'Laptops & Netbooks')
	{
		//alert("hi");
		//document.location.href="src/web/LaptopAction";
		document.categoryform.action="LaptopServlet";
		document.categoryform.submit();
		
	}
	else if(categoryName == 'Textbooks')
	{
		//alert("in text books");
		//document.location.href="src/web/LaptopAction";
		document.categoryform.action="startTextBooks.do";
		document.categoryform.submit();
	}
	else if(categoryName == 'TV & Video')
	{
		//alert("in TV & Video");
		//document.location.href="src/web/LaptopAction";
		document.categoryform.action="TeleServlet";
		document.categoryform.submit();
	}
	else if(categoryName == 'Kindle Books'){		
		document.categoryform.category.value = categoryName;
		document.categoryform.submit();
	}
	else{
		window.location.href = "SiteUnderConstruction.jsp"
	}
	}
</script>
<style>

ul {
	margin: 0;
	padding: 0;
	list-style: none;
	width: 203px;
	border-bottom: 1px solid #0033FF;
	}

ul li {
	position: relative;
	}
	
	li ul {
	position: absolute;
	left: 202px;
	top: 0;
	display: none;
	}

li:hover ul { background: #ffffff;
display: block; 
}

ul li a {
	display: block;
	text-decoration: none;
	color: #000;
	background: #edfcff;
	padding: 2px;
	border: 1px solid #0033FF;
	border-bottom: 0;

	}
	
	.right-element {
   position: absolute;
   left: 180px;
   text-align: left;
   } 
   
   .right-pane{
position: absolute;
left: 420px;
}

 .bottom-pane{
position: absolute;
text-align: center;
}

</style>
</head>
 <BODY>

 
<jsp:include page="Header.jsp"/>
  <FORM name="categoryform" METHOD=POST ACTION="selectCategory.do">

   <ul> 
 
  
  <%
  ArrayList categories = (ArrayList)request.getAttribute("categories");
  HashMap hcat = (HashMap) request.getAttribute("subcategories");
  Iterator it = categories.iterator();
  while(it.hasNext())
  {
	  String categoryName = (String)it.next();
	  ArrayList subcatarrlist = (ArrayList)hcat.get(categoryName);
	  Iterator subit = subcatarrlist.iterator();
  %>
  
   <li>
    <a href="#"><b><font size=-1>
<%= categoryName %></font></b><font color="#FF6600">
<%
int countSpace = 0;
while(countSpace<(18-categoryName.length()))
{
%>
&nbsp;
<%
countSpace++;
} 
%>
&gt;</font></a>
<ul> 
<% while(subit.hasNext())
{
	String subcategoryName = (String) subit.next();
%>
        <li onclick="update('<%=subcategoryName %>')"><a href="#"><font color="#FF6600">&nbsp;&nbsp;&nbsp;&nbsp;</font><font size=-1><%= subcategoryName %></font></a></li>
        <%} %>
      </ul>
</li>
<%} %>
</ul>
<input type="hidden" name="category"/>
  </FORM>
  <div class="right-pane">
  <%
  ArrayList deliveredItems = (ArrayList)request.getAttribute("deliveredItems");
  if(deliveredItems!=null)
  { %>
  
  <h2><font color="orange">Delivered list of items</font></h2>
  
  <table border=1">
  <tr>
  <th>Order id</th>
  <th>Item name</th>
  <th>Item quantity</th>
  <th>Item price</th>
  <th>Courier name</th>
  <th>Address</th>
  </tr>
	<% Iterator deliveredItemsIterator = deliveredItems.iterator();
	  while(deliveredItemsIterator.hasNext())
	  {
		  DeliveredItems deliveredItem = (DeliveredItems)deliveredItemsIterator.next();
  %>
  	<tr>
  	<td><%= deliveredItem.getOrderId() %></td>
  	<td><%= deliveredItem.getItemName() %></td>
  	<td><%= deliveredItem.getQuantity() %></td>
  	<td><%= deliveredItem.getPrice() %></td>
  	<td><%= deliveredItem.getCourierName() %></td>
  	<td><%= deliveredItem.getAddress() %></td>
  	</tr>
  <%  
  	  }
  } 
  %>
  </table>
<img src="images/kindle.jpg" alt="kindle" />
  <p></p><p></p><p></p><p></p><p></p><p></p>
  <div class="bottom-pane">
  <jsp:include page="Footer.jsp"/>
  </div>
</div>
 </BODY>
</HTML>
