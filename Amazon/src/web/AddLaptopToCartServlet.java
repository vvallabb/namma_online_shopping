/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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

/**
 *
 * @author vasanth
 */
public class AddLaptopToCartServlet extends HttpServlet {
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession();
        ShoppingCart ShopCart = new ShoppingCart();
        String quantityParamName = request.getParameter("LaptopQuantity");
        String Strquantity = request.getParameter(quantityParamName);
        String ModelName = request.getParameter("LaptopModelName");
        String BrandName = request.getParameter("LaptopBrandName");
        String StrLaptopPrice = request.getParameter("LaptopPrice");
        float LaptopPrice = Float.parseFloat(StrLaptopPrice);
        int quantity = Integer.parseInt(Strquantity);


        if(ShopCart.InsertShoppingCartDetails(ModelName, BrandName, LaptopPrice, quantity,(String)session.getAttribute("uname"),"computers"))
        {
         RequestDispatcher rd = request.getRequestDispatcher("Laptops1.jsp");
            rd.forward(request, response);
         
            /////////////////////////////////////////////////////////////
        }
        else
        {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

    }


}
