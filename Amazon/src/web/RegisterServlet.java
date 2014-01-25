package web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import common.DBService;

import entity.*;
import dao.*;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("fname");
		String mname = request.getParameter("mname");
		String sname = request.getParameter("sname");
		String email = request.getParameter("email");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String zip = request.getParameter("zip");
		String phone = request.getParameter("phone");

		Registration user = new Registration();
		user.setFirstName(fname);
		user.setMiddleName(mname);
		user.setSurname(sname);
		user.setEmail(email);
		user.setAddress1(add1);
		user.setAddress2(add2);
		user.setCity(city);
		user.setState(state);
		user.setCountry(country);
		user.setZip(zip);
		user.setUname(uname);
		user.setPassword(upass);

		DBService cs = new DBService();
		Connection c = cs.initiateCon();

		RegistrationDAO reg_user = new RegistrationDAO();
		int i = reg_user.addUser(user);
		Categories categories = new Categories();
		Subcategories subcategories = new Subcategories();
		CategoryDAO catDAO = new CategoryDAO();
		SubcategoryDAO subcatDAO = new SubcategoryDAO();
		categories.setCategoryNames(catDAO.getAllCategories(c));
		// subcategories.setSubcategoryNames(subcatDAO.getAllSubcategories(c));
		request.setAttribute("subcategories", subcatDAO.getAllSubcategories(c));
		request.setAttribute("categories", categories.getCategoryNames());

		if (i == 0) {
			HttpSession session = request.getSession();
			session.setAttribute("user_details", user);
			session.setAttribute("uname", uname);
			session.setAttribute("upass", upass);
			RequestDispatcher rd = request.getRequestDispatcher("home1.jsp");
			rd.forward(request, response);
		} else if (i == -1) {
			request.setAttribute("error", i);
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
