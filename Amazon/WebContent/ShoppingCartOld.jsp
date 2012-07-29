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
.style5 {font-size: 14px}
.style6 {font-family: Arial, Helvetica, sans-serif; font-size: 12px; }
.style10 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
-->
</style>

<script  type="text/javascript">
function ItemSelected(ItemId,MoveToFlag,DeleteFlag){
	alert(ItemId);
	document.SaveForLater.ItemSelection.value = ItemId;
        document.SaveForLater.MoveToOther.value= MoveToFlag;
        document.SaveForLater.DeleteItem.value = DeleteFlag;
	document.SaveForLater.submit();
        alert("hi");
	}
</script>
</head>

<body>
<jsp:include page="Header.jsp"/>
<img src="images/Exclusive_financing_ad_bold_button.png" alt="imgShoppingCart"/>
<p></p>
    <img src="images/shop-cart-header-blue._V47060241_.gif" alt="imgShoppingCart" width="218" height="31" /> <font size="3px">for Vasanth Vallabh</font>
<table width="996" height="87" border="0" bordercolor="#FFFFFF">
  <tr>
    <td width="142" height="50"><img src="images/cart-sim-button._V241699877_.gif" alt="MoreShoppingCart" /></td>
    <td width="168">&nbsp;</td>
    <td width="430"><div align="right">

      <p><strong>Sub total = $404.95 </strong></p>
    </div>
    <p align="right" class="style1"> Make any changes below? <img src="images/Update.jpg" alt="UpdateShoppingCart" width="50" height="17" /></p></td>
    <th width="238" scope="col">
        <div align="left">
            <form name ="ProceedToCheckOutSignIn" method="post" action="ProceedToCheckOutSignIn.do">
              <a href="#" onclick="javascript:document.ProceedToCheckOutSignIn.submit();">
                  <img src="images/framework.jpg" alt="ProceedtoCheckOut" width="178" height="258" border="0" align="right">              </a>
            </form>
        </div>
    </th>
  </tr>
</table>
<p>&nbsp;</p>
<img src="images/ShoppingCartitems.jpg" width="1128" height="36" alt="ShoppingCartitems"/>

<form name ="SaveForLater" method="post" action="SaveForlater.do">
<%
ArrayList ShoppingCartArrList = (ArrayList)request.getAttribute("ShoppingCartarr");
ArrayList ShoppingCartSaveForLaterArrList = new ArrayList();
ArrayList ShoppingCartArrListStatus1 = new ArrayList();
int StatusDisplay = 1;//Used to prevent saved list from getting displayed for every iteration.
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
                 }
         }
        Iterator ShoppingCartListIterator1 = ShoppingCartArrListStatus1.iterator();
        while(ShoppingCartListIterator1.hasNext())
         {
             ShoppingCart sc = (ShoppingCart)ShoppingCartListIterator1.next();

%>

<table width="810" height="218" border="0">
  <tr>
    <th width="165" height="214" align="left" scope="col"><div align="left">
      <pre class="style6">Item Added</pre>
      <pre class="style6">on Febrauary</pre>
      <pre class="style6"><%=sc.getItemDate() %>
      <%=sc.getItemStatus()%>
      <a href="#" onclick="ItemSelected('<%=sc.getItemId() %>',2,0)">
<img src="images/SaveForLater.jpg" alt="SaveForLater" width="80" height="14"border="0"/></a>
      <a href="#" onclick="ItemSelected('<%=sc.getItemId() %>',2,1)">
<img src="images/delete.jpg" alt="SCDelete" width="44" height="14" border="0" />
</a>
      </pre>

    </div></th>
    <th width="453" scope="col"><div align="left">
      <pre class="style3"><%=sc.getItemName() %></pre>
      <pre class="style6">Condition: New</pre>
      <pre class="style6">In Stock

Eligible for FREE Super Saver Shipping</pre>

        <pre class="style3">         <label>           <input name="radiobutton" type="radio" value="radiobutton" />           <span class="style1">Add gift-wrap/note</span></label></pre>

      <p class="style5">&nbsp; </p>
    </div></th>
    <th width="94" class="style5" scope="col"><p class="style5">$<%=sc.getItemPrice() %></p>
    <p class="style5">You Save:</p>
    <p class="style5">$<%=sc.getItemDiscount() %> </p></th>
    <th width="99" class="style5" scope="col"><table width="51" border="1">
      <tr>
        <th width="41" scope="col"><%=sc.getItemQuantity() %></th>
      </tr>
    </table></th>
  </tr>
</table>
<p class="style5">________________________________________________________________________________________________________</p>
   <%}} %>
     <img src="images/SCSavedItems.jpg" width="1000" height="40" alt="amazon"/>

    <% Iterator ShoppingCartListIterator2 = ShoppingCartSaveForLaterArrList.iterator();
        while(ShoppingCartListIterator2.hasNext())
        {
            ShoppingCart sc2 = (ShoppingCart)ShoppingCartListIterator2.next();
%>

        <table width="810" height="218" border="0">
      <tr>
        <th width="165" height="214" align="left" scope="col"><div align="left">
          <pre class="style6">Item Added</pre>
          <pre class="style6">on Febrauary</pre>
          <pre class="style6"><%=sc2.getItemDate() %>
          <%=sc2.getItemStatus()%>
 <a href="#" onclick="ItemSelected('<%=sc2.getItemId() %>',1,0)">
<img src="images/MoveToShopCart.jpg" border="0" width="80" height="14" alt="MoveToShopCart"/>
</a>
<a href="#" onclick="ItemSelected('<%=sc2.getItemId() %>',1,1)">
<img src="images/delete.jpg" alt="SCDelete" width="44" height="14" border="0"/>
</a>
          </pre>
          </div></th>
        <th width="453" scope="col"><div align="left">
          <pre class="style3"><%=sc2.getItemName() %></pre>
          <pre class="style6">Condition: New</pre>
          <p class="style5">&nbsp; </p>
        </div></th>
        <th width="92" class="style5" scope="col"><p class="style5">$<%=sc2.getItemPrice() %></p>
        <p class="style5">You Save:</p>
        <p class="style5">$<%=sc2.getItemDiscount() %> </p></th>
        <th width="99" class="style5" scope="col"><table width="51" border="1">
          <tr>
            <th width="41" scope="col"><%=sc2.getItemQuantity() %></th>
          </tr>
        </table></th>
      </tr>
    </table>
    <p class="style5">________________________________________________________________________________________________________</p>

    <%}%>

   <input type="hidden" name="ItemSelection"/>
   <input type="hidden" name="MoveToOther"/>
   <input type="hidden" name="DeleteItem"/>
</form>
<p class="style5">&nbsp;</p>
<p class="style5">&nbsp;</p>
<p class="style5">&nbsp;</p>
<p class="style5">&nbsp;</p>
<p class="style5">&nbsp;</p>
<p class="style5">&nbsp;</p>
<p class="style5">&nbsp;</p>

</body>
</html>