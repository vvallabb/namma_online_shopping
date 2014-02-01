<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="dao.*"%>
<%@page import="entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy Laptop</title>
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

function AddToShoppingCart(ModelName,BrandName,LaptopPrice,LaptopQuant){
    document.LaptopCartForm.LaptopModelName.value = ModelName;
        document.LaptopCartForm.LaptopBrandName.value= BrandName;
        document.LaptopCartForm.LaptopPrice.value = LaptopPrice;
        document.LaptopCartForm.LaptopQuantity.value = LaptopQuant;
     document.LaptopCartForm.submit();
    }



</script>
</head>


<body>


<table>
	<tr><td><jsp:include page="Header.jsp" /></td></tr>
	<tr><td>
	<table>
	<tr>

					<td width="225"><font color="Orange" size="5">
						<form name="laptopform" method="post" action="chooselaptop.do">
<input	type="hidden" name="price" />
 <input type="hidden" name="brand" /> 
 <input	type="hidden" name="netbook_brand" />
  <input type="hidden" name="type" />
  <b>Price</b></font>
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
	 ArrayList laptop1 = (ArrayList)session.getAttribute("Laptoparr");
	Iterator i1 = laptop1.iterator();
	while(i1.hasNext()){
		Computers bn = (Computers)i1.next();
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
				</a></form></td>
				
  
	<td>
	<form name = "LaptopCartForm" Action="AddLaptopToShopCartServlet.do" method="post">
	
	 <input type="hidden" name="LaptopModelName" />
  <input type="hidden" name="LaptopBrandName" />
    <input type="hidden" name="LaptopQuantity" />
     <input type="hidden" name="LaptopPrice" />
<%  
	ArrayList laptop = (ArrayList)session.getAttribute("Laptoparr");
	Iterator i = laptop.iterator();
	
	ArrayList laptopbrand1 = new ArrayList();
	ArrayList laptopType1 = new ArrayList();
	ArrayList laptopprice = new ArrayList();
	ArrayList laptopModel = new ArrayList();
	ArrayList LaptopRating = new ArrayList();
	ArrayList LaptopId = new ArrayList();
	
	String callee = (String)request.getAttribute("callee");
	String value = (String)request.getAttribute("value");
	
//	ArrayList laptop = (ArrayList)session.getAttribute("Laptoparr");
	
//	Iterator i = laptop.iterator();
	while(i.hasNext()){
		Computers bn = (Computers)i.next();
		laptopbrand1.add(bn.getBrand());
		laptopType1.add(bn.getType());
		laptopprice.add(bn.getPrice());
		laptopModel.add(bn.getModel());
		LaptopRating.add(bn.getRating());
		LaptopId.add(bn.getLaptopId());
	}	
	
	Iterator a= laptopbrand1.iterator();
	Iterator d= laptopType1.iterator();
	Iterator c= laptopprice.iterator();
	Iterator b= laptopModel.iterator();
	Iterator e = LaptopRating.iterator();
	Iterator f = LaptopId.iterator();
	
	String temp_brand;
	String temp_model;
//	Integer temp_price;
	String temp_type;
	Integer temp_rating;
	
	if(callee.equals("price")){
%>
<br />
<font Color="Orange">
<h2> Laptops By Price</h2>
</font>

<%	
	while(a.hasNext() && b.hasNext() && c.hasNext() && d.hasNext() && e.hasNext()){
		temp_brand = (String)a.next(); 
		temp_model = (String)b.next();
		int t_price = (Integer)c.next();
		temp_type  = (String)d.next();
		temp_rating= (Integer)e.next();
		int laptop_id= (Integer)f.next();%>

<%if(value.equals("30000"))	{if(t_price<=30000){ %>
<br /><img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>
<br/>
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%} }
 else if(value.equals("40000")){ if(t_price>30000 && t_price <= 40000){ %>
<br /><img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>

<br />
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%} }
  else if(value.equals("50000")){
	if(t_price>40000 && t_price <=50000){  %>
	<br /><img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">
	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>
<br />
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%}}
  if(value.equals("80000")){
	if(t_price>50000 && t_price<=80000){  %>
	<br /><img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">
	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>
<br />
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%} }
  if(value.equals("80001")){
	if(t_price>80000){  %>
	<br /><img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">
	
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>
<br />
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%} 	}}}
	else if(callee.equals("brand")){
%>
<font Color="Orange">
<h2>Laptops By Brands</h2>
</font>
<%	
	while(a.hasNext() && b.hasNext() && c.hasNext() && d.hasNext() && e.hasNext()){
		temp_brand = (String)a.next(); 
		temp_model = (String)b.next();
		int t_price = (Integer)c.next();
		temp_type  = (String)d.next();
		temp_rating= (Integer)e.next();
		int laptop_id= (Integer)f.next();
		if(value.equals(temp_brand)){
%>
<br />
<img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">
 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>

<br/>
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%}
	}}
	else if(callee.equals("netbook_brand")){	
	%>
<font Color="Orange">
<h2>Netbooks By brand</h2>
</font>
<%	
	while(a.hasNext() && b.hasNext() && c.hasNext() && d.hasNext() && e.hasNext()){
		temp_brand = (String)a.next(); 
		temp_model = (String)b.next();
		int t_price = (Integer)c.next();
		temp_type  = (String)d.next();
		temp_rating= (Integer)e.next();
		int laptop_id= (Integer)f.next();
		if(value.equals(temp_brand) && callee.equals("netbook_brand")){
%>
<br />
<img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>
<br/>
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%}
}}
	else if(callee.equals("type")){
	%>
<font Color="Orange">
<h2>Laptops By Type</h2>
</font>
<br/><%
	while(a.hasNext() && b.hasNext() && c.hasNext() && d.hasNext() && e.hasNext()){
		temp_brand = (String)a.next(); 
		temp_model = (String)b.next();
		int t_price = (Integer)c.next();
		temp_type  = (String)d.next();
		temp_rating= (Integer)e.next();
		int laptop_id= (Integer)f.next();
		if(value.equals(temp_type)){
%>
<br />
<img src="LaptopImageServlet?Brand=<%=laptop_id%>" name="<%=temp_brand %>">

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<select name="<%=laptop_id %>"> <%for(int ij=1;ij<=30;ij++){%> <option><%=ij %></option> <%} %> </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=temp_model %>','<%=temp_brand %>','<%=t_price%>','<%=laptop_id %>')"> <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart"> </a> 
    </a>
<br/>
<font color="#CC0000"><b>Brand: </b></font><b><%=temp_brand %></b>
<br />
<font color="#CC0000"><b>Model: </b></font><b><%=temp_model %></b>
<br />
<font color="#CC0000"><b>Price: </b></font><b><%= session.getAttribute("currency")%> <%=t_price %>/-</b>
<br />
<font color="#CC0000"><b>Category: </b></font><b><%=temp_type %></b>
<br />
<font color="#CC0000"><b>Rating: </b></font><b><%=temp_rating %></b>
<%}
}} %>
</form>
</td>
</tr>
</table>
</td>
</tr>
</table>
</body>
</html>