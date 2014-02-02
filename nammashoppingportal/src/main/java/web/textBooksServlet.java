package web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TextBookSubCategoryDAO;

/**
 * Servlet implementation class textBooksServlet
 */
public class textBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public textBooksServlet() {
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
		HttpSession session = request.getSession();

		TextBookSubCategoryDAO SubCat = new TextBookSubCategoryDAO();
		ArrayList scArr = SubCat.getSubSubcategoryTextBook();
		request.setAttribute("TextBookSubCategoryatr", scArr);
		RequestDispatcher rd = request
				.getRequestDispatcher("enterTextBook.jsp");
		rd.forward(request, response);
		// response.sendRedirect("enterTextBooks.jsp");
	}

}
