/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CreditCardDAO;
import dao.PublisherDAO;
import dao.ShoppingCartDAO;

import entity.UserDetails;

/**
 *
 * @author vasanth
 */
public class ShippingAddressServlet extends HttpServlet {
   
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       String addressvalue = request.getParameter("addresstype");
       HttpSession session = request.getSession();
       String address = null;
       if(addressvalue.equals("1"))
       {
    	   ArrayList userAddrDetails = (ArrayList)session.getAttribute("ShippingAddressarr");
    	   Iterator userAddrIterator = userAddrDetails.iterator();
    	   while(userAddrIterator.hasNext())
    	   {
    		   UserDetails ud = (UserDetails)userAddrIterator.next();
    		   session.setAttribute("FullName", ud.getUserDetailsFirstName()+ud.getUserDetailsMiddleName()+ud.getUserDetailsSurName());   
    		   session.setAttribute("AddressLine1", ud.getUserDetailsAddressLine1());
    		   session.setAttribute("AddressLine2", ud.getUserDetailsAddressLine2());
    		   session.setAttribute("city", ud.getUserDetailsCity());
    		   session.setAttribute("StaProReg", ud.getUserDetailsRegion());
    		   session.setAttribute("ZipPostal", ud.getUserDetailsZip());
    		   session.setAttribute("Country", ud.getUserDetailsCountry());
    		   session.setAttribute("PhoneNumber", ud.getUserDetailsPhoneNumber());
        	   address = ud.getUserDetailsAddressLine1()+","+ud.getUserDetailsAddressLine2()+","+ud.getUserDetailsCity()+","+ud.getUserDetailsRegion()+","+ud.getUserDetailsZip()+","+ud.getUserDetailsCountry();
    	   }
       }else{
    	   String fullName = request.getParameter("FullName");
    	   session.setAttribute("FullName", fullName);
    	   String addrLine1 = request.getParameter("AddressLine1");
    	   session.setAttribute("AddressLine1", addrLine1);
    	   String addrLine2 = request.getParameter("AddressLine2");
    	   session.setAttribute("AddressLine2", addrLine2);
    	   String city = request.getParameter("City");
    	   session.setAttribute("city", city);
    	   String state = request.getParameter("StaProReg");
    	   session.setAttribute("StaProReg", state);
    	   String zip = request.getParameter("ZipPostal");
    	   session.setAttribute("ZipPostal", zip);
    	   String country = request.getParameter("Country");
    	   session.setAttribute("Country", country);
    	   String phoneNo = request.getParameter("PhoneNumber");
    	   session.setAttribute("PhoneNumber", phoneNo);
    	   address = addrLine1+","+addrLine2+","+city+","+state+","+zip+","+country;
       }
       
       session.setAttribute("shippingaddress", address);
       
      /* PublisherDAO publisher = new PublisherDAO();
       publisher.putValues((ArrayList )session.getAttribute("ShoppingCartarr"),(String) session.getAttribute("uname"),address);
       ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
       shoppingCartDAO.deleteShoppingCart((String)session.getAttribute("uname"));*/
       
       CreditCardDAO creditCardDAO = new CreditCardDAO();
       ArrayList banks = creditCardDAO.getAllBanks();
       
       session.setAttribute("banks",banks);
       
        RequestDispatcher rd = request.getRequestDispatcher("credit_details.jsp");
        rd.forward(request, response);
    }
}
