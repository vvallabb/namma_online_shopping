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

import dao.OrderDAO;

/**
 * Servlet implementation class OrderUpdateServlet
 */
public class OrderUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUpdateServlet() {
        super();
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
		String orderId = request.getParameter("order");
		
		//System.out.println("order:"+orderId);
		OrderDAO orderDAO = new OrderDAO();
		orderDAO.updateOrder(orderId);
		HttpSession session = request.getSession();
		
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		ArrayList order = cs.authenticateCourier((String)session.getAttribute("uname"), (String)session.getAttribute("upass"), c);
		
		//String orders = null;
		request.setAttribute("orders", order);
		RequestDispatcher rd;
		
			rd = request.getRequestDispatcher("courier.jsp");
		
		rd.forward(request, response);
		
	}

}
