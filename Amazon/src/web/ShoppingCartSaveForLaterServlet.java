/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import entity.ShoppingCart;
import java.io.IOException;
import java.util.ArrayList;
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
public class ShoppingCartSaveForLaterServlet extends HttpServlet {
   
    
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
        // Integer.parseInt(request.getParameter("ItemSelection"));
         boolean updateShoppingCartState = false;

         String variableName = request.getParameter("ItemSelection");
        int itemId = Integer.parseInt(variableName);
        variableName = request.getParameter("MoveToOther");
        int status = Integer.parseInt(variableName);
        variableName = request.getParameter("DeleteItem");
        int deleteflag = Integer.parseInt(variableName);
        
        System.out.println("Item received"+itemId);

        ShoppingCart ShopCart = new ShoppingCart();
      if(deleteflag != 1)
      {
          updateShoppingCartState = ShopCart.UpdateShoppingCartSaveForLater(itemId,status,(String)session.getAttribute("uname"));
            if(!updateShoppingCartState)
            {
                RequestDispatcher rd = request.getRequestDispatcher("ShoppingCartHome.jsp");
                rd.forward(request, response);

            }
            else
            {
                ArrayList scArr = ShopCart.RetrieveShoppingCartDtls((String)session.getAttribute("uname"));
                request.setAttribute("ShoppingCartarr", scArr);
                session.setAttribute("ShoppingCartarr", scArr);
                RequestDispatcher rd = request.getRequestDispatcher("ShoppingCart.jsp");
                rd.forward(request, response);
            }
         
      }
      else
      {
            boolean deleteShoppingCartItemState = ShopCart.DeleteShoppingCartItem(itemId,(String)session.getAttribute("uname"));
              if(!deleteShoppingCartItemState)
            {
                RequestDispatcher rd = request.getRequestDispatcher("ShoppingCartHome.jsp");
                rd.forward(request, response);

            }
            else
            {
                ArrayList scArr = ShopCart.RetrieveShoppingCartDtls((String)session.getAttribute("uname"));
                request.setAttribute("ShoppingCartarr", scArr);
                session.setAttribute("ShoppingCartarr", scArr);
                RequestDispatcher rd = request.getRequestDispatcher("ShoppingCart.jsp");
                rd.forward(request, response);
            }
      }
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */

}
