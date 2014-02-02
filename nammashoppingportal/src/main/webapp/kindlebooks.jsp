<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Iterator" %>
<%@page import="entity.Books" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kindle books</title>
<style>

ul.nobullets {
	list-style: none;
	}
	
	ul li a {	
	text-decoration: none;
	}
	
.left-pane{
list-style: none;
width: 220px;
position: absolute;
}

.right-pane{
position: absolute;
left: 240px;
}

.kcLabel
 {
  color: #CC6600;
  padding: 0 0 2px 0;
  margin: 0;
  font-size: 100%;
  font-weight: bold;
  text-align:left;
  } 
  
  .resultheader
 {
  padding: 0 0 2px 0;
  margin: 0;
  font-size: 100%;
  text-align:left;
  background-color:#dceef5;
  width: 500px;
  } 
  .align-right{
  display:inline;
  }
</style>
 <script  type="text/javascript">
function next(pageName){
	//alert(pageName);
	//document.getElementById(categoryName).bgColor='#FFFFFF';
	document.pageform.pagenumber.value = pageName;
	document.pageform.category.value = 'Kindle Books';
	document.pageform.submit();
	}

function update(categoryName){
		document.countryform.category.value = categoryName;
		document.countryform.submit();	
	}

function AddToShoppingCart(Name,AuthorName,Price,BookQuant){
    //alert(Name);
    //alert(AuthorName);
    //alert(document.EachBookForm.quanity.value);

    //alert(document.getElementById('quantity'));
	document.EachBookForm.BookName.value = Name;
        document.EachBookForm.BookAuthorName.value= AuthorName;
        document.EachBookForm.BookPrice.value = Price;
        document.EachBookForm.BookQuantity.value = BookQuant;
        //document.EachBookForm.BookQuantity.value = EachBookForm.quantity.value;
	document.EachBookForm.submit();
	}

</script>
</head>
<body>
<jsp:include page="Header.jsp"/>
<div class="left-pane">
<h2 class="kcLabel">Your Country or Region</h2>
<p></p>
<form name="countryform" method="post" action="selectCategory.do">
<select name="country_box">
<%
ArrayList countryArr = (ArrayList)request.getAttribute("countryArr");
Iterator countryIterator = countryArr.iterator();
while(countryIterator.hasNext())
{
%>
<option><%=countryIterator.next() %></option>
<%} %>
</select>
<a href = "#" onclick="update('Kindle Books')"><IMG SRC="images/go1.JPG" BORDER="0" ALT=""></a>
<input type="hidden" name="category"/>
</form>

<form name="bookgenreform" action="choosebookgenre.do">
<hr color="#d0eaf8"/>
<h2 class="kcLabel">Kindle Book Categories</h2>
<ul class="nobullets">
<%
ArrayList bookGenreArr = (ArrayList)request.getAttribute("bookGenre");
Iterator bookGenreIterator = bookGenreArr.iterator();
int pagecount = (Integer)request.getAttribute("pagecount");
int listnumber = (pagecount-1)*12;
while(bookGenreIterator.hasNext())
{
%>
<li style="margin-left: 6px">
<a href = "SiteUnderConstruction.jsp"><%=bookGenreIterator.next() %></a>
</li>
<%} %>
</ul>
</form>
</div>
<div class="right-pane">
<h3>
<span class="kcLabel"><%= request.getAttribute("category")%></span>
        <span>&#8250;</span><span class="kcLabel">
	<%= request.getAttribute("subcategory")%></span></h3>
	<form name="sortform" action="sortByBooks.do">
	<div class="resultheader">Showing <%=listnumber+1 %>-<%=listnumber+12 %> of <%=request.getAttribute("bookcount") %> results
	</div>
	</form>

       <form name="EachBookForm" action="AddToShopCartServlet.do" method="post">
	<ul class="nobullets">
	<%
	ArrayList booksArr = (ArrayList)request.getAttribute("booksArr");
	Iterator booksIterator = booksArr.iterator();
	int count=1;
	while(booksIterator.hasNext())
	{
		Books book = (Books)booksIterator.next();
		if(count<=((pagecount-1)*12))
		{
			count++;
			if(pagecount!=1)
			continue;
		}
		else if(count>(pagecount*12))
		{
			count++;
			break;
		}
		count++;
		listnumber++;
		int price = book.getKindle_price();
		String sConversionRate = (String) session.getAttribute("conversionRate");
		float fConversionRate = Float.parseFloat(sConversionRate);
		price = Math.round(price * fConversionRate);
	%>
	<li>
	<%=listnumber %>.&nbsp;&nbsp;<img src="BookImageServlet?bookId=<%=book.getBook_id() %>" name="<%=book.getBook_id() %>">
	&nbsp;&nbsp;<%=book.getBook_name() %>
	 by <%=book.getBook_author() %> - <%= request.getAttribute("subcategory")%>
          &nbsp;&nbsp;
        <select name="<%=book.getBook_id() %>">
        <%for(int i=1;i<=30;i++){%>
        <option><%=i %></option>
        <%} %>
        </select>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddToShoppingCart('<%=book.getBook_name() %>','<%=book.getBook_author() %>','<%=book.getKindle_price()%>','<%=book.getBook_id() %>')">
     <IMG SRC="images/addtoCart1.JPG" BORDER="0" alt="addToCart">
    </a>
	 <br></br>
	 <a href="#">Buy</a>: <font color="#CC0000"><b><%= session.getAttribute("currency")%> <%=price %></b></font>
	 <%if(book.getBook_discount()>0){ %>
	 &nbsp;&nbsp;<font color="#990099"><blink><b>** Discount <%=book.getBook_discount() %>% off **</b></blink></font>
	 <%} %>
	 <br>
	 <hr color="#d0eaf8"></hr>
	</li>
	<%} %>
	</ul>
        <input type="hidden" name="BookName"/>
<input type="hidden" name="BookAuthorName"/>
<input type="hidden" name="BookPrice"/>
<input type="hidden" name="BookQuantity"/>
        </form>
<form name="pageform" action="selectCategory.do" method="post">
<div class="resultheader">
<p></p>
<p></p>
<%
if(pagecount==1)
{
%>
<font color="#999999">&lt;&lt;&nbsp; Previous</font> &nbsp;| 
<b>Page: <%= pagecount%></b> &nbsp;&nbsp;
<%if(((Integer)request.getAttribute("bookcount")) >(pagecount*12)){ %>
<a href="#" onclick="next('<%=pagecount+1 %>')"><%= pagecount+1%></a>
&nbsp;&nbsp;
<%if(((Integer)request.getAttribute("bookcount")) >((pagecount+1)*12)){ %>
<a href="#" onclick="next('<%=pagecount+2 %>')"><%= pagecount+2%></a>
&nbsp;&nbsp;...
<%} %> 
&nbsp;&nbsp;| &nbsp;&nbsp;
<a href="#" onclick="next('<%=pagecount+1 %>')">Next &gt;&gt;</a>
<%}else{ %>
&nbsp;&nbsp;| &nbsp;&nbsp;
<font color="#999999">Next &gt;&gt;</font>
<%} %>
<%}
else {%>
<a href="#" onclick="next('<%=pagecount-1 %>')">&lt;&lt;&nbsp; Previous</a>&nbsp;| <b>Page: </b> 
<a href="#" onclick="next('<%=pagecount-1 %>')"><%= pagecount-1%></a>&nbsp;&nbsp;<b><%= pagecount%></b>&nbsp;&nbsp;
<%if(((Integer)request.getAttribute("bookcount")) >(pagecount*12)){ %>
<a href="#" onclick="next('<%=pagecount+1 %>')"><%= pagecount+1%></a>&nbsp;&nbsp;... &nbsp;&nbsp;| &nbsp;&nbsp;
<a href="#" onclick="next('<%=pagecount+1 %>')">Next &gt;&gt;</a>
<%} else {%>
<font color="#999999">Next &gt;&gt;</font>
<%} %>
<%} %>
<input type="hidden" name="pagenumber"/>
<input type="hidden" name="category"/>
</div>
<p></p>
<p></p>
</form>
</div>
</body>
</html>