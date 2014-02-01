/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import entity.*;
import dao.*;

public class ShoppingCartServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */

	// <editor-fold defaultstate="collapsed"
	// desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * 
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("uname") == null) {
			RequestDispatcher rd = request.getRequestDispatcher("am_login.jsp");
			rd.forward(request, response);
		} else {
			ShoppingCart ShopCart = new ShoppingCart();
			ArrayList scArr = ShopCart
					.RetrieveShoppingCartDtls((String) session
							.getAttribute("uname"));
			if (scArr != null)
				System.out.println("not null");
			request.setAttribute("ShoppingCartarr", scArr);
			session.setAttribute("ShoppingCartarr", scArr);
			RequestDispatcher rd = request
					.getRequestDispatcher("ShoppingCart.jsp");
			rd.forward(request, response);
		}
	}
}
