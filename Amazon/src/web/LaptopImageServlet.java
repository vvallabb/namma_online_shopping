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

import common.*;

/**
 * Servlet implementation class abcServlet
 */
public class LaptopImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LaptopImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("\n\ninside servlet");
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			System.out.println("request brand:"+request.getParameter("Brand"));
			PreparedStatement ps = c.prepareStatement("select * from computers where ItemId=" + request.getParameter("Brand")+"");

			ResultSet rs = ps.executeQuery();
		
			if(rs.next())
			{
			byte barray[] = rs.getBytes("Pic");
			//String get_price=rs.getString(5);
			response.setContentType("image/jpeg");
			response.setContentLength(barray.length);
			response.getOutputStream().write(barray);
			//out.println("Price in Rs. "+get_price);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */


}
