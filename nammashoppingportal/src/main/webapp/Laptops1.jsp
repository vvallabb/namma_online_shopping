<%@page import = "java.util.*" %>
<%@page import = "dao.*" %>
<%@page import = "entity.*" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script>
function getLaptopsByPrice(a){
	document.laptopform.price.value = a;
	document.laptopform.submit();
}

function getLaptopByBrand(b){
	document.laptopform.brand.value = b;
	document.laptopform.submit();
}

function getNetbookByBrand(c){
	document.laptopform.netbook_brand.value = c;
	document.laptopform.submit();
}	

function getLaptopByType(d){
	document.laptopform.type.value = d;
	document.laptopform.submit();
}	

</script>
</head>


<body>

<table>
<tr>
<td><jsp:include page="Header.jsp" flush="true" /></td>
</tr>

<tr>
<td>
<form name="laptopform" method="post" action="chooselaptop.do"><input
	type="hidden" name="price" /> <input type="hidden" name="brand" /> <input
	type="hidden" name="netbook_brand" /> <input type="hidden" name="type" />
<table>
<tr>
				<td width="225"><font color="Orange" size="5"><b>Price</b></font>
				<br />
				<a href="#" onclick="getLaptopsByPrice(30000)">Under Rs30000</a> <br />
				<a href="#" onclick="getLaptopsByPrice(40000)">between
				Rs30000-40000</a> <br />
				<a href="#" onclick="getLaptopsByPrice(50000)">between
				Rs40000-50000</a> <br />
				<a href="#" onclick="getLaptopsByPrice(80000)">between
				Rs50000-80000</a> <br />
				<a href="#" onclick="getLaptopsByPrice(80001)">Above Rs 80000</a> <br />
				<br />
				<font color="Orange" size="5"><b>Laptop Brands</b></font> <%
 ArrayList laptopbrand = new ArrayList();
 ArrayList laptopType = new ArrayList();
	 ArrayList laptop = (ArrayList)session.getAttribute("Laptoparr");
	Iterator i = laptop.iterator();
	while(i.hasNext()){
		Computers bn = (Computers)i.next();
		laptopbrand.add(bn.getBrand());
		laptopType.add(bn.getType());
	}	
%> <%Iterator j = laptopbrand.iterator();
      			while(j.hasNext()){
      				String tempBrand = (String)j.next();
      			%> <a href="#" onclick="getLaptopByBrand('<%=tempBrand%>')"><br /><%=tempBrand %>
				<%} %>
				</a> <br />
				<br />
				<font color="Orange" size="5"><b>Netbook Brands</b></font> <%Iterator l = laptopbrand.iterator();
      			while(l.hasNext()){
      				String tempBrand1 = (String)l.next(); %><a href="#"
					onclick="getNetbookByBrand('<%=tempBrand1%>')"><br /><%=tempBrand1 %>
				<%} %>
				</a> <br />
				<br />
				<font color="Orange" size="5"><b>Laptop Type</b></font> <% Iterator k = laptopType.iterator();
				while(k.hasNext()){
				String tempType = (String)k.next(); %><a href="#"
					onclick="getLaptopByType('<%=tempType%>')"><br />
				<%=tempType %>
				<%} %>
				</a></td>
				<td width="1000"><font Color="Orange">
				<h1>Laptops and Netbooks</h1>
				<Center><a href="Laptops.jsp"><IMG
					SRC="images/LaptopPics/TopPic.JPG" WIDTH="488" HEIGHT="204"
					BORDER="0" ALT=""></a></Center>
				<font Color="Orange">
				<h2>Laptops and Netbooks</h2>
				</font> </font>
<p>
  <table width="830"  cellpadding="0%" >
    <tr>
						<td width="200"><img src="images/LaptopPics/hp-dv1062.JPG"
							alt="pic1" width="112" height="98" /></td>
						<td width="201"><img src="images/LaptopPics/Toshiba-113.JPG"
							alt="pic2" width="118" height="111" /></td>
						<td width="211"><img src="images/LaptopPics/AsusPc.JPG"
							alt="pic3" width="103" height="105" /></td>
						<td width="198"><img src="images/LaptopPics/eepc.JPG"
							alt="pic4" width="115" height="119" /></td>
    </tr>
    <tr>
						
						<td height="45">&nbsp;Laptops By Brand</td>
					
						
						<td>&nbsp;Netbooks By Brands</td>
						
						
						<td>&nbsp;Laptops And Netbooks By Price</td>
						
						
						<td>&nbsp;Laptops By Use Case</td>
     
    </tr>
    <tr>
						<td>
						<ul>
							<%j = laptopbrand.iterator();
      			while(j.hasNext()){
      				String tempBrand = (String)j.next();
      			%>
							<a href="#" onclick="getLaptopByBrand('<%=tempBrand%>')">
							<li><%=tempBrand %></li>
							<%} %>
							</a>
						</ul>
						</td>
     
						<td>
						<ul>
							<% l = laptopbrand.iterator();
      			while(l.hasNext()){
      				String tempBrand1 = (String)l.next(); %><a href="#" onclick="getNetbookByBrand('<%=tempBrand1%>')">
							<li><%=tempBrand1 %></li>
							<%} %>
							</a>
						</ul>
						</td>
						<td>
						<ul>
							<a href="#"  onclick="getLaptopsByPrice(30000)">
							<li>Under Rs30000</li>
							</a>
							<a href="#"  onclick="getLaptopsByPrice(40000)">
							<li>between Rs30000-40000</li>
							</a>
							<a href="#"  onclick="getLaptopsByPrice(50000)">
							<li>between Rs40000-50000</li>
							</a>
							<a href="#"  onclick="getLaptopsByPrice(80000)">
							<li>between Rs50000-80000</li>
							</a>
							<a href="#"  onclick="getLaptopsByPrice(80001)">
							<li>Above Rs 80000</li>
							</a>
						</ul>
						</td>
						<td>
						<ul>
							<% k = laptopType.iterator();
				while(k.hasNext()){
				String tempType = (String)k.next(); %><a href="#" onclick="getLaptopByType('<%=tempType%>')">
							<li><%=tempType %></li>
							<%} %>
							</a>
						</ul>
						</td>
    </tr>  
  
  </table>
</p>
</td>
</tr>
</table>
</form>
</td>
</tr>

</table>


</body>
</html>
