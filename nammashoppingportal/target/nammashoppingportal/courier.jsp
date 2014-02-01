<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="entity.*" %>
<%@page language= "java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Courier</title>
<script  type="text/javascript">

function update(orderId){
		document.orderform.order.value = orderId;
		document.orderform.submit();	
	}

</script>
</head>
<body>
<jsp:include page="Header.jsp" flush="true" />
<form name="orderform" method="post" action="orderupdate.do">
<%
ArrayList OrderArrList = (ArrayList)request.getAttribute("orders");
if(!OrderArrList.isEmpty())
{ %>
<h1><center>Order list</center></h1>

<h3>Please select the order id to update</h3>
<table border="1">
<tr>
<th>Order ID</th>
<th>Item Name</th>
<th>Address</th>
<th></th>
</tr>
<%
Iterator OrderListIterator = OrderArrList.iterator();

while(OrderListIterator.hasNext())
{
        CourierOrder sc1 = (CourierOrder)OrderListIterator.next();%>
		<tr>
      <td><%=sc1.getorderid() %></td><td><%=sc1.getitemname() %></td><td><%=sc1.getaddr() %></td><td><input type="button" name="Submitbutton" onclick="update('<%=sc1.getorderid() %>')" value="Update order"></td>
      </tr>
      <%}%>
      </table>
		<input type="hidden" name="order"/>
		<%}else{ %>
		<font color="orange"><h3><center>Sorry, there are no orders to be updated at this time</center></h3></font>
		<%} %>
</form>
</body>
</html>