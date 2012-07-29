<%@page import = "java.util.*" %>

<%@page import = "web.*" %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Textbooks</title>
<style type="text/css">
<!--
.style1 {
	color: #FF9900;
	font-size: 28px;
	font-weight: bold;
}
.style2 {
	color: #666666;
	font-weight: bold;
}
.style8 {font-size: 18px}
.kcLabel
 {
  color: #CC6600;
  padding: 0 0 2px 0;
  margin: 0;
  font-size: 100%;
  font-weight: bold;
  text-align:left;
  } 
-->
</style>
</head>

<body>
<table>
<tr>
<td><jsp:include page="Header.jsp" flush="true" /></td>
</tr>
<tr>
<td><a href="#"><img src="images/tradeText.jpg"></img></a></td>
</tr>
</table>
<table width="1179" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  
  <tr>
    <td width="155" height="28"></td>
    <td width="34"></td>
    <td width="750">&nbsp;</td>
    <td width="240"></td>
  </tr>
  <tr>
    <td height="12"></td>
    <td></td>
    <td rowspan="3" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" > 
      <!--DWLayoutTable-->
      <tr>
        <td width="9" height="14"></td>
          <td width="125"></td>
          <td width="7"></td>
          <td width="368"></td>
          <td width="215"></td>
          <td width="9"></td>
          <td width="17"></td>
        </tr>
      <tr>
        <td height="33"></td>
          <td valign="top"><span class="style1">Textbooks</span></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="21"></td>
          <td colspan="3" valign="top"><span class="style2">Save up to 30% on New Textbooks and up to 90% off Used Listings</span> </td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="14"></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      <tr>
        <td height="95"></td>
          <td rowspan="2" valign="top"><img src="images/Textbooks_1.jpg" width="121" height="124" /></td>
          <td>&nbsp;</td>
          <td colspan="2" valign="top"><p><strong>New Textbooks:&nbsp;</strong><strong>Save up to 30% off the price of over 100,000 new textbooks.</strong>&nbsp;Shop for the latest test prep, reference, and study guides.</p>          <p><strong>Used Textbooks:&nbsp;</strong><strong>Save up to 90% off millions of used listings</strong>. All used textbook purchases are backed by our&nbsp;<a href="SiteUnderConstruction.jsp">A-to-z Guarantee</a>.</p></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      <tr>
        <td height="33"></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      
      <tr>
        <td height="15"></td>
      </tr>
      <tr>
        <td height="230"></td>
          <td colspan="5" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
              <!--DWLayoutTable-->
              <tr>
                <td width="724" height="230" valign="top" class="style8">
				
                  <iframe src="FindTextbooks.htm" width="650" height="350" style="border-color:#add2e2">
                  <!--DWLayoutEmptyCell-->                </iframe>				  </td>
              </tr>
              </table>          </td>
          <td> </td>
        </tr>
      <tr>
        <td height="57"></td>
          <td>&nbsp;</td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>      
    </table></td>
    <td></td>
  </tr>
  <tr>
    <td height="394" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EAFBFB">
      <!--DWLayoutTable-->
      <tr>
        <!-- <td width="155" height="394">&nbsp;</td>-->
        <td>
<table border="0">
<tr><td>
<b>Browse Textbooks</b><br />
<font color="orange"><h2 class="kcLabel">Textbook Categories</h2></td></tr>
<%
ArrayList TextBookSubCategory = (ArrayList)request.getAttribute("TextBookSubCategoryatr");


Iterator TextBookSubCategoryIterator = TextBookSubCategory.iterator();
%>

<%
while(TextBookSubCategoryIterator.hasNext())
{
String s = (String)TextBookSubCategoryIterator.next();
%>


<tr>
	<td><a href="#"><%=s%></a></td>
</tr>
<%}%>
</table>
</td>
        
        </tr>
    </table></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td height="226">&nbsp;</td>
    
  </tr>
  
  <tr>
    <td height="338"></td>
    
  </tr>
</table>
</body>
</html>
    