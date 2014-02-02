<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.ArrayList" %>
<%@page import="entity.Categories" %>
<%@page import="java.util.Iterator" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
</head>
 <BODY>
<jsp:include page="Header.jsp"/>
   <script  type="text/javascript">
function update(categoryName){
	//alert(categoryName);
	document.getElementById(categoryName).bgColor='#FFFFFF';
	document.categoryform.category.value = categoryName;
	document.categoryform.submit();
	}
</script>
  <FORM name="categoryform" METHOD=POST ACTION="selectCategory.do">

  <table width="200" border="1" bgcolor="#0033FF">
 
  
  <%ArrayList categories = (ArrayList)request.getAttribute("categories"); 
  Iterator it = categories.iterator();
  while(it.hasNext())
  {
	  String categoryName = (String)it.next();
  %>
  
   <tr>
    <td bgcolor="#edfcff" id=<%=categoryName %> onmouseover="update('<%=categoryName %>')">
<%= categoryName %></td>
</tr>
<%} %>
</table>
<input type="hidden" name="category"/>
  </FORM>
  <p></p><p></p><p></p>
  <jsp:include page="Footer.jsp"/>
 </BODY>
</HTML>
