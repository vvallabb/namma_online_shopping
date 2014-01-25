package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DBService;

/**
 * Servlet implementation class abcServlet
 */
public class BookImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookImageServlet() {
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
		System.out.println("inside Book Image servlet");
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			// System.out.println("request brand:"+request.getParameter("laptopBrand"));
			System.out.println("book id:" + request.getParameter("bookId"));
			PreparedStatement ps = c
					.prepareStatement("select book_image from books where book_id="
							+ request.getParameter("bookId"));

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				byte barray[] = rs.getBytes("book_image");
				response.setContentType("image/jpeg");
				response.setContentLength(barray.length);
				response.getOutputStream().write(barray);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
