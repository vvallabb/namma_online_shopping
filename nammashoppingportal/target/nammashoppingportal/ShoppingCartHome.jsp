<%-- 
    Document   : ShoppingCartHome
    Created on : Mar 6, 2010, 1:33:59 AM
    Author     : vasanth
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Shopping Cart</h1>
        <form name="ShoppingCartHomeForm" method="post" action="ShoppingCartServlet.do">
            <a href="#" onclick="javascript:document.ShoppingCartHomeForm.submit();"><img src="shop-cart-header-blue._V47060241_.gif" width="218" height="31" alt="shop-cart-header-blue._V47060241_"/> </a>
        </form>
    </body>
</html>
