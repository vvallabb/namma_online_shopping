package web;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.DBService;

/**
 * Servlet implementation class CourierLoginServlet
 */
public class CourierLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CourierLoginServlet() {
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
		// System.out.println("hi");
		// TODO Auto-generated method stub
		String sUsername = request.getParameter("uname");
		String sPassword = request.getParameter("upass");

		HttpSession session = request.getSession();

		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		ArrayList order = cs.authenticateCourier(sUsername, sPassword, c);
		cs.closeCon(c);
		// String orders = null;
		request.setAttribute("orders", order);

		RequestDispatcher rd;
		if (order == null) {
			request.setAttribute("valid", "no");
			rd = request.getRequestDispatcher("courierLogin.jsp");
		} else {
			// session.setAttribute("valid", "yes");
			session.setAttribute("uname", sUsername);
			session.setAttribute("upass", sPassword);
			rd = request.getRequestDispatcher("courier.jsp");
		}

		rd.forward(request, response);
	}

}
