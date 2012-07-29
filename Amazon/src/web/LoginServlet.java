package web;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DBService;
import dao.CategoryDAO;
import dao.PublisherDAO;
import dao.SubcategoryDAO;
import entity.Categories;
import entity.Subcategories;

/**
 * Servlet implementation class AddMarkerServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String sUsername = request.getParameter("uname");
		String sPassword = request.getParameter("upass");
		
		
		
		HttpSession session = request.getSession();
		
		if(sUsername==null && sPassword==null)
		{
			sUsername = (String)session.getAttribute("uname");
			sPassword = (String)session.getAttribute("upass");
		}
		
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		int validUser = cs.authenticateUser(sUsername, sPassword, c);
		String currency = cs.getUserCurrency(sUsername,sPassword,c);
		String conversionRate = cs.getUserConversionRate(sUsername,sPassword,c);
		
		PublisherDAO publisherDAO  = new PublisherDAO();
		
		ArrayList deliveredItems = publisherDAO.getDeliveredItems(sUsername);
		
		if(!deliveredItems.isEmpty())
		{
			request.setAttribute("deliveredItems", deliveredItems);
		}
		
		Categories categories = new Categories();
		Subcategories subcategories = new Subcategories();
		CategoryDAO catDAO = new CategoryDAO();
		SubcategoryDAO subcatDAO = new SubcategoryDAO();
		categories.setCategoryNames(catDAO.getAllCategories(c));
		//subcategories.setSubcategoryNames(subcatDAO.getAllSubcategories(c));
		request.setAttribute("subcategories", subcatDAO.getAllSubcategories(c));
		request.setAttribute("categories", categories.getCategoryNames());
		session.setAttribute("currency", currency);
		session.setAttribute("conversionRate", conversionRate);
		
		
		if(validUser==1)
		{
		session.setAttribute("valid", "yes");
		session.setAttribute("uname", sUsername);
		session.setAttribute("upass", sPassword);
		RequestDispatcher rd = request.getRequestDispatcher("home1.jsp");
		rd.forward(request, response);
		}
		else if(((String)session.getAttribute("valid"))==null)
		{
			request.setAttribute("valid", "no");
			RequestDispatcher rd = request.getRequestDispatcher("am_login.jsp");
			rd.forward(request, response);
		}
		else{
			request.setAttribute("valid", "no");
			RequestDispatcher rd = request.getRequestDispatcher("am_login.jsp");
			rd.forward(request, response);
		}
		
		cs.closeCon(c);
		
	}

}
