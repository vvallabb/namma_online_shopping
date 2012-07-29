package web;

import java.io.IOException;
import java.io.PrintWriter;
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

import dao.ItemDAO;
import dao.SubcategoryDAO;
import entity.Books;

/**
 * Servlet implementation class SelectCategoryServlet
 */
public class SelectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCategoryServlet() {
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
		// TODO Auto-generated method stub
		System.out.println("inside Select Category servlet");
		String subCategory = request.getParameter("category");
		String pageNumber = request.getParameter("pagenumber");
		String country = request.getParameter("country_box");
		
		HttpSession session = request.getSession();
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		
		if(country!=null)
		{
			String currency = cs.getUserCurrency(country,c);
			String conversionRate = cs.getUserConversionRate(country,c);
			System.out.println("conversion rate:"+conversionRate);
			session.setAttribute("currency", currency);
			session.setAttribute("conversionRate", conversionRate);
		}
		
		ArrayList bookArr = null;
		ArrayList bookGenre = null;
		ArrayList countryArr = null;
		int bookCount=0;
		
		SubcategoryDAO sDao = new SubcategoryDAO();
		
		String categoryName = sDao.getCategory(subCategory,c);
		ArrayList itemArr = sDao.getAllItemsForSubcategory(subCategory, c);
		ItemDAO itemDAO = new ItemDAO();
		if(categoryName.equals("Books"))
		{
			bookArr = itemDAO.getBooks(itemArr, c);
			bookCount = itemDAO.getBookCount(itemArr,c);
			bookGenre = itemDAO.getBooksGenre(c);
			countryArr = itemDAO.getAllCountries(c);
		}
		
		//if(subCategory.equals("Laptops & Netbooks"))
		
		Iterator bookIterator = bookArr.iterator();
		
		while(bookIterator.hasNext())
		{
			Books book = (Books)bookIterator.next();
			System.out.println("Book name:"+book.getBook_name());
		}
		cs.closeCon(c);
		
		if(subCategory.equals("Kindle Books"))
		{
			System.out.println("inside kindle books");
			request.setAttribute("countryArr", countryArr);
			request.setAttribute("booksArr", bookArr);
			request.setAttribute("bookGenre", bookGenre);
			request.setAttribute("category", categoryName);
			request.setAttribute("subcategory", subCategory);
			request.setAttribute("bookcount", bookCount);
			if(pageNumber==null)
			request.setAttribute("pagecount", 1);
			else
				request.setAttribute("pagecount", Integer.parseInt(pageNumber));
			RequestDispatcher rd = request.getRequestDispatcher("kindlebooks.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
