package web;

import java.util.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Chose_laptop
 */
public class Chose_laptop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Chose_laptop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("YO");
		String callee = null;
		String value = null;
		String price = null;
		String type = null;
		String net_book = null;
		String brand = null;
		
		price = request.getParameter("price");
		brand = request.getParameter("brand");
		net_book = request.getParameter("netbook_brand");
		type = request.getParameter("type");
		
		if(!price.equals("")){
			callee = "price";
			value = price;
		}
		
		else if(!brand.equals("")){
			callee = "brand";
			value = brand;
		}
		
		else if(!net_book.equals("")){
			callee = "netbook_brand";
			value = net_book;
		}
		
		else if(!type.equals("")){
			callee = "type";
			value = type;
		}
		

		System.out.println("callee   "+callee);
		System.out.println("value   "+value);
		System.out.println("price   "+price);
		System.out.println("brand   "+brand);
		System.out.println("type   "+type);
		System.out.println("netbook   "+net_book);
		request.setAttribute("callee", callee);
		request.setAttribute("value", value);
	 	RequestDispatcher rd = request.getRequestDispatcher("BuyLaptop.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("YO1");
		doGet(request, response);// TODO Auto-generated method stub
	}

}
