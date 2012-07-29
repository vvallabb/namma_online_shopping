package web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CreditCardDAO;
import dao.PublisherDAO;
import dao.ShoppingCartDAO;

/**
 * Servlet implementation class CreditCardServlet
 */
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreditCardServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cardHolderName = request.getParameter("cardholder");
		System.out.println("credit card holder:"+cardHolderName);
		String cardNumber = request.getParameter("cardnumber");
		System.out.println("credit card number:"+cardNumber);
		String cvv = request.getParameter("cvv");
		System.out.println("cvv:"+cvv);
		String cardPin = request.getParameter("cardpin");
		System.out.println("card pin:"+cardPin);
		String bankName = request.getParameter("bank");
		System.out.println("bank:"+bankName);
		CreditCardDAO creditCard = new CreditCardDAO();
		int balance = creditCard.getBalance(cardHolderName,cardNumber,cvv,cardPin,bankName);
		
		
		HttpSession session = request.getSession();
		
		String total = (String)session.getAttribute("Subtotal");
		int iTotal = Integer.parseInt(total);
		
		if(balance==-1)
		{
			request.setAttribute("error","wrong credentials");
			RequestDispatcher rd = request.getRequestDispatcher("credit_details.jsp");
			rd.forward(request, response);
		}else if(iTotal>balance)
		{
			request.setAttribute("error","no money");
			RequestDispatcher rd = request.getRequestDispatcher("credit_details.jsp");
			rd.forward(request, response);
		}else{
			creditCard.updateBalance(cardNumber,balance-iTotal);
			PublisherDAO publisher = new PublisherDAO();
			publisher.putValues((ArrayList )session.getAttribute("ShoppingCartarr"),(String) session.getAttribute("uname"),(String)session.getAttribute("shippingaddress"));
			ShoppingCartDAO shoppingCartDAO = new ShoppingCartDAO();
			shoppingCartDAO.deleteShoppingCart((String)session.getAttribute("uname"));
			RequestDispatcher rd = request.getRequestDispatcher("ShippingAddress.jsp");
			rd.forward(request, response);
		}
	}

}
