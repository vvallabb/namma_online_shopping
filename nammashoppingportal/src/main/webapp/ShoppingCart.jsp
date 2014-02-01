<%-- 
    Document   : ShoppingCart
    Created on : Mar 6, 2010, 1:09:52 AM
    Author     : vasanth
--%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="entity.*" %>
<%@page language= "java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ShoppingCart</title><style type="text/css">
<!--
body,td,th {
	font-size: 16px;
	color: #000000;
}
body {
	background-color: #FFFFFF;
}
.style1 {font-size: 12px}
.style3 {font-family: Arial, Helvetica, sans-serif}
.style5 {font-size: 18px;}
.style6 {font-family: Times New Roman, Times, serif;  font-size: 16px; }
.style7 {font-size: 18px;color: #CC6600;}
.style8 {font-size: 16px}
.style9{font-size: 16px;color: #cccc99;}
.style10 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
.style11 {
position: absolute;
left: 800px;
font-size: 18px;
}
.style12 {
position: absolute;
right: 10px;
display:inline;
}
.subtotalalign{
position: absolute;
left: 800px;
display:inline;
font-size: large;
font-weight: bold;
}
.h3color { font-family: verdana,arial,helvetica,sans-serif; color: #E47911; font-size: small; }

-->
</style>

<script  type="text/javascript">
function ItemSelected(ItemId,MoveToFlag,DeleteFlag){
	document.SaveForLater.ItemSelection.value = ItemId;
        document.SaveForLater.MoveToOther.value= MoveToFlag;
        document.SaveForLater.DeleteItem.value = DeleteFlag;
	document.SaveForLater.submit();
	}
function ProceedToCheckInPage(GoAhead){
        document.SaveForLater.action="ProceedToCheckOutSignIn.do";
	document.SaveForLater.submit();
	}
function ProceedtoCheckOut(){
	if(document.ProceedToCheckOutSignIn.subtotal.value==0)
		alert("Please Add items to shopping cart before checking out");
	else
		document.ProceedToCheckOutSignIn.submit();
}
</script>
</head>

<body>
<%
ArrayList ShoppingCartArrList = (ArrayList)request.getAttribute("ShoppingCartarr");
ArrayList ShoppingCartSaveForLaterArrList = new ArrayList();
ArrayList ShoppingCartArrListStatus1 = new ArrayList();
int StatusDisplay = 1;//Used to prevent saved list from getting displayed for every iteration.
int SubTotal = 0;
if(ShoppingCartArrList == null)
    {
%>
  Coming as Null
<%}else
    {

        Iterator ShoppingCartListIterator = ShoppingCartArrList.iterator();

        while(ShoppingCartListIterator.hasNext())
        {
                ShoppingCart sc1 = (ShoppingCart)ShoppingCartListIterator.next();

                if(sc1.getItemStatus() == 2)
                 {
                    ShoppingCartSaveForLaterArrList.add(sc1);
                 }
                else
                 {
                    ShoppingCartArrListStatus1.add(sc1);
                    if(sc1.getItemType().equals("computers"))
                    	SubTotal = SubTotal + Math.round(sc1.getItemPrice() * sc1.getItemQuantity() * (Float.parseFloat((String)session.getAttribute("conversionRate")))/45);
                    else
                    	SubTotal = SubTotal + Math.round(sc1.getItemPrice() * Float.parseFloat((String)session.getAttribute("conversionRate")))* sc1.getItemQuantity();
                 }
         }%>
<jsp:include page="Header.jsp"/>
<img src="images/Exclusive_financing_ad_bold_button.png" alt="imgShoppingCart"/>
<div class="style12">
            <form name ="ProceedToCheckOutSignIn" method="post" action="ProceedToCheckOutSignIn.do">
              <a href="#" onclick="ProceedtoCheckOut()">
                  <img src="images/framework.jpg" alt="ProceedtoCheckOut" width="178" height="258" border="0" align="right"/>              </a>
                 <input type="hidden" name="subtotal" value='<%=SubTotal %>'/> 
            </form>
    <br> </br>
    
    <font color="orange"><h2>Summary of bill</h2></font>
	<p></p>
	
    <table border="1">
        <tr>
            <th width="20">Item name</th>
            <th width="20">Quantity</th>
            <th width="20">Price in <%= session.getAttribute("currency") %></th>
        </tr>

    <%
    int total=0;
    Iterator ShoppingCartSummaryListIterator = ShoppingCartArrListStatus1.iterator();
    while(ShoppingCartSummaryListIterator.hasNext())
    {
   ShoppingCart scSummary = (ShoppingCart)ShoppingCartSummaryListIterator.next();
   if(scSummary.getItemType().equals("computers"))
   		total = total + Math.round(scSummary.getItemQuantity() * scSummary.getItemPrice()* (Float.parseFloat((String)session.getAttribute("conversionRate")))/45);
   else
	   total = total + scSummary.getItemQuantity() * Math.round(scSummary.getItemPrice()* Float.parseFloat((String)session.getAttribute("conversionRate"))	);
    %>
    <tr>
    
            <td width="20"><%=scSummary.getItemName()%></td>
            <td width="20"><%= scSummary.getItemQuantity() %></td>
            <% if(scSummary.getItemType().equals("computers")){ %>
            <td width="20"><%=Math.round(scSummary.getItemQuantity() * scSummary.getItemPrice()* (Float.parseFloat((String)session.getAttribute("conversionRate")))/45)%></td>
            <%}else{ %>
            <td width="20"><%=scSummary.getItemQuantity() * Math.round(scSummary.getItemPrice() * Float.parseFloat((String)session.getAttribute("conversionRate")))%></td>
            <%} %>
       </tr>
   <% }%>
   <tr>
       <th>Total</th>
       <th></th>
       <th><%=total%></th>
   </tr>
       </table>
    
        </div>
<p></p>
    <img src="images/shop-cart-header-blue._V47060241_.gif" alt="imgShoppingCart" width="218" height="31" /> <font size="3px">for <%=session.getAttribute("uname") %></font>
	<p></p><p></p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="images/cart-sim-button._V241699877_.gif" alt="MoreShoppingCart" />
  <div class="subtotalalign">

  <p></p>subtotal = <font color="#990000"><%= session.getAttribute("currency")%> <%= SubTotal %></font>
    </div>
    <p></p>
   <p>&nbsp;</p>
<img src="images/ShoppingCartitems.jpg" width="1128" height="36" alt="ShoppingCartitems"/>

<form name ="SaveForLater" method="post" action="SaveForlater.do">

        <%
Iterator ShoppingCartListIterator1 = ShoppingCartArrListStatus1.iterator();
        while(ShoppingCartListIterator1.hasNext())
         {
             ShoppingCart sc = (ShoppingCart)ShoppingCartListIterator1.next();

%>

<table border="0">
  <tr>
    <th width="200" height="214" align="left" scope="col"><div align="left">
      <div class="style6">Item Added</div>
      <div class="style6"><%=sc.getItemDate() %>
      <p></p>
      <a href="#" onclick="ItemSelected('<%=sc.getItemId() %>',2,0)">
<img src="images/SaveForLater.jpg" alt="SaveForLater" width="80" height="14"border="0"/></a>
<p></p>
      <a href="#" onclick="ItemSelected('<%=sc.getItemId() %>',2,1)">
<img src="images/delete.jpg" alt="SCDelete" width="44" height="14" border="0" />
</a>
      </div>

    </div></th>
    <th width="700" scope="col" align="left"><div align="left">
      <div class="style3"><a href=#><%=sc.getItemName() %></a></div>
      <p></p>
      <div class="style6">Condition: New</div>
      <div class="style6">In Stock
<p></p><p></p>
Eligible for FREE Super Saver Shipping</div>
<p></p><p></p>
        <div class="style3">        
         <label>         
          <input name="radiobutton" type="checkbox" value="radiobutton" />           <span class="style7">Add gift-wrap/note</span></label></div>

      <p class="style5">&nbsp; </p>
    </div></th>
    <th width="120" class="style5" scope="col"><font color="#990000"><b><%= session.getAttribute("currency")%> 
    <% if(sc.getItemType().equals("computers")){ %>
    <%=Math.round(sc.getItemPrice()* (Float.parseFloat((String)session.getAttribute("conversionRate")))/45) %></b></font>
    <%}else{ %>
    <%=Math.round(sc.getItemPrice() * Float.parseFloat((String)session.getAttribute("conversionRate")))%>
    <%} %>
    <th width="120" class="style5" scope="col"><input type="text" value=<%=sc.getItemQuantity() %> size="3"></input></th>
  </tr>
</table>
<hr class="style9" width="1140" align="left" noshade="noshade"/>
   <%}} %>
   <% if(!ShoppingCartSaveForLaterArrList.isEmpty())
	   {%>
     <img src="images/SCSavedItems.jpg" width="1000" height="36" alt="amazon"/>
<%} %>
    <% Iterator ShoppingCartListIterator2 = ShoppingCartSaveForLaterArrList.iterator();
        while(ShoppingCartListIterator2.hasNext())
        {
            ShoppingCart sc2 = (ShoppingCart)ShoppingCartListIterator2.next();
%>

        <table border="0">
      <tr>
        <th width="200" height="214" scope="col"><div align="left">
          <div class="style6">Item Added</div>
          <div class="style6"><%=sc2.getItemDate() %>
          <p></p>
 <a href="#" onclick="ItemSelected('<%=sc2.getItemId() %>',1,0)">
<img src="images/MoveToShopCart.jpg" border="0" width="80" height="14" alt="MoveToShopCart"/>
</a>
<p></p>
<a href="#" onclick="ItemSelected('<%=sc2.getItemId() %>',1,1)">
<img src="images/delete.jpg" alt="SCDelete" width="44" height="14" border="0"/>
</a>
          </div>
          </div></th>
        <th width="700" scope="col"><div align="left">
          <div class="style3"><a href=#><%=sc2.getItemName() %></a></div>
          <p></p>
      <div class="style6">Condition: New</div>
      <div class="style6">In Stock
<p></p><p></p>
Eligible for FREE Super Saver Shipping</div>
<p></p><p></p></th>
        <th width="120" class="style5" scope="col"><font color="#990000"><b><%= session.getAttribute("currency")%> 
        <% if(sc2.getItemType().equals("computers")){ %>
    <%=Math.round(sc2.getItemPrice()* Float.parseFloat((String)session.getAttribute("conversionRate"))/45)%></b></font>
    <%}else{ %>
    <%=Math.round(sc2.getItemPrice() * Float.parseFloat((String)session.getAttribute("conversionRate")))%>
    <%} %>
        </b></font>
      </tr>
    </table>
<hr class="style9" width="1140" align="left" noshade="noshade"/>

    <%}%>

   <input type="hidden" name="ItemSelection"/>
   <input type="hidden" name="MoveToOther"/>
   <input type="hidden" name="DeleteItem"/>
</form>

</body>
</html>