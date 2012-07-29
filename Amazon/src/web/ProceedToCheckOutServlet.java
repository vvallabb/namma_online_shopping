/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import common.DBService;

import dao.ItemDAO;

import entity.UserDetails;
/**
 *
 * @author vasanth
 */
public class ProceedToCheckOutServlet extends HttpServlet {
   

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
    	
    	HttpSession session = request.getSession();
    	
    	UserDetails ud = new UserDetails();
        ArrayList shArr = ud.RetrieveUserDetails((String)session.getAttribute("uname"));
        ItemDAO itemDAO = new ItemDAO();
        DBService cs = new DBService();
		Connection c = cs.initiateCon();
        ArrayList countryArr = itemDAO.getAllCountries(c);
        request.setAttribute("ShippingAddressarr", shArr);
        request.setAttribute("countryArr", countryArr);
        RequestDispatcher rd = request.getRequestDispatcher("ProceedToCheckOut.jsp");
	rd.forward(request, response);
        
    }


}
