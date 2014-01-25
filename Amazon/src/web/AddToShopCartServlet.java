package web;

import com.mysql.jdbc.Connection;
import common.DBService;
import dao.ItemDAO;
import dao.SubcategoryDAO;
import entity.Books;
import entity.ShoppingCart;
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

public class AddToShopCartServlet extends HttpServlet {

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
		ShoppingCart ShopCart = new ShoppingCart();
		String quantityParamName = request.getParameter("BookQuantity");
		String Strquantity = request.getParameter(quantityParamName);
		String BookName = request.getParameter("BookName");
		String BookAuthorName = request.getParameter("BookAuthorName");
		String StrBookPrice = request.getParameter("BookPrice");
		int BookPrice = Integer.parseInt(StrBookPrice);
		int quantity = Integer.parseInt(Strquantity);

		if (ShopCart.InsertShoppingCartDetails(BookName, BookAuthorName,
				BookPrice, quantity, (String) session.getAttribute("uname"),
				"books")) {
			String subCategory = "Kindle Books";
			String pageNumber = request.getParameter("pagenumber");

			ArrayList bookArr = null;
			ArrayList bookGenre = null;
			ArrayList countryArr = null;
			int bookCount = 0;

			SubcategoryDAO sDao = new SubcategoryDAO();
			DBService cs = new DBService();
			Connection c = (Connection) cs.initiateCon();
			String categoryName = sDao.getCategory(subCategory, c);
			ArrayList itemArr = sDao.getAllItemsForSubcategory(subCategory, c);
			ItemDAO itemDAO = new ItemDAO();

			bookArr = itemDAO.getBooks(itemArr, c);
			bookCount = itemDAO.getBookCount(itemArr, c);
			bookGenre = itemDAO.getBooksGenre(c);
			countryArr = itemDAO.getAllCountries(c);

			// if(subCategory.equals("Laptops & Netbooks"))

			Iterator bookIterator = bookArr.iterator();

			while (bookIterator.hasNext()) {
				Books book = (Books) bookIterator.next();
				System.out.println("Book name:" + book.getBook_name());
			}
			cs.closeCon(c);

			request.setAttribute("countryArr", countryArr);
			request.setAttribute("booksArr", bookArr);
			request.setAttribute("bookGenre", bookGenre);
			request.setAttribute("category", categoryName);
			request.setAttribute("subcategory", subCategory);
			request.setAttribute("bookcount", bookCount);
			if (pageNumber == null)
				request.setAttribute("pagecount", 1);
			else
				request.setAttribute("pagecount", Integer.parseInt(pageNumber));

			RequestDispatcher rd = request
					.getRequestDispatcher("kindlebooks.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}

	}

}
