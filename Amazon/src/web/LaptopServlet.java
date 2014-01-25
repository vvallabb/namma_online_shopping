package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.*;
import common.*;
import entity.*;
import dao.*;

/**
 * Servlet implementation class LaptopAction
 */
public class LaptopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LaptopServlet() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request,response);
		ArrayList LaptopList = new ArrayList();
		ComputerDao ld = new ComputerDao();
		LaptopList = ld.getLaptopDetails();

		HttpSession session = request.getSession();
		session.setAttribute("Laptoparr", LaptopList);

		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		String conversionRate = cs.getUserConversionRate(
				(String) session.getAttribute("uname"),
				(String) session.getAttribute("upass"), c);
		float fConversionRate = Float.parseFloat(conversionRate);
		session.setAttribute("conversionRateLaptop", fConversionRate / 44.5214);

		RequestDispatcher rd = request.getRequestDispatcher("Laptops1.jsp");
		rd.forward(request, response);
	}

}
