<%@page import = "java.util.*" %>
<%@page import = "dao.*" %>
<%@page import = "entity.*" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>TV &amp; Video</title>
<style>
.kcLabel
 {
  color: #CC6600;
  padding: 0 0 2px 0;
  margin: 0;
  font-size: 100%;
  font-weight: bold;
  text-align:left;
  } 
</style>
</head>
 <%
 ArrayList Televisionbrand = new ArrayList();
 ArrayList TelevisionType = new ArrayList();
	 ArrayList Television = (ArrayList)request.getAttribute("Televisionarr");
	Iterator i = Television.iterator();
	while(i.hasNext()){
		Electronics bn = (Electronics)i.next();
		Televisionbrand.add(bn.getbrand());
		//TelevisionType.add(bn.gettype());
	}	
%>
<body>
<table>
<tr>
<td><jsp:include page="Header.jsp" flush="true" /></td>
</tr>
<tr>
<td>
<table>
<tr>
<td width="225" height="394" valign="top">
<h2 class="kcLabel">Featured Brands</h2>
<p></p>
	<%Iterator j = Televisionbrand.iterator();
      			while(j.hasNext()){
      				String tempBrand = (String)j.next();
      			%>
      			<a href = "#"><%=tempBrand %><br /><%} %></a>
                    
</td>
 <td width="1000"> 
<p>

  <!--<table width="830"  cellpadding="0%" >
    <tr>
     
    </tr>
    <tr>
    </tr>
    <tr>
      <td>
     <td></td>
      <td></td>
    </tr>  
  
  </table>-->
<!--  </p>-->
<table width="200" border="0">
  <tr>
    <td><iframe src="main_tele.jsp" width="850" height="850" style="border:medium double rgb(255,255,255)"></iframe></td>
  </tr>
</table>

</td>
</tr>
</table>
</td>
</tr>
</table>

</body>
</html>
