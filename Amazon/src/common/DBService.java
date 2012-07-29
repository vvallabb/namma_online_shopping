package common;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import entity.CourierOrder;
import entity.ShoppingCart;

public class DBService {
	
	Connection con;
	String url;
	String userName;
	String password;
	ResultSet results; // The ResultSet to interpret

	public Connection initiateCon() {
		Connection connection;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/amazon";
			connection = DriverManager.getConnection(url, "root", "root321");
			return connection;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void closeCon(Connection connection) {
		try {
			connection.close();
		} // Try to close the connection
		catch (Exception e) {
			} // Do nothing on error. At least we tried.
		connection = null;
	}

	public int authenticateUser(String username, String password,Connection c)
	   {
			
			String sLogin="select count(*) from user where username='"+username+"' and password='"+password+"'";
			
			try {
				PreparedStatement ps = c.prepareStatement(sLogin);
				ResultSet rs1 = ps.executeQuery();
				if(rs1.next())
				{
					if(rs1.getInt(1)>0)
					return 1;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return 0;

	   }

	public String getUserCurrency(String sUsername, String sPassword,
			Connection c) {
		String sCurrency = "SELECT c.currency FROM country c,user u,user_details ud where u.user_id=ud.user_id and u.username='"+
		sUsername+"' and u.password='"+sPassword+"' and c.country_name=ud.user_id_country";
		
		try {
			PreparedStatement ps = c.prepareStatement(sCurrency);
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				return rs1.getString("currency");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return "Rs";
	}

	public String getUserConversionRate(String sUsername, String sPassword,
			Connection c) {
		String sConversionRate = "SELECT c.conversion_rate FROM country c,user u,user_details ud where u.user_id=ud.user_id and u.username='"+
		sUsername+"' and u.password='"+sPassword+"' and c.country_name=ud.user_id_country";
		
		try {
			PreparedStatement ps = c.prepareStatement(sConversionRate);
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				return rs1.getString("conversion_rate");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return "45";
	}

	public String getUserCurrency(String country, Connection c) {
		String sCurrency = "SELECT currency FROM country where country_name='"+country+"'";
		
		try {
			PreparedStatement ps = c.prepareStatement(sCurrency);
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				return rs1.getString("currency");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}

	public String getUserConversionRate(String country, Connection c) {
		String sConversionRate = "SELECT conversion_rate FROM country where country_name='"+country+"'";
		
		try {
			PreparedStatement ps = c.prepareStatement(sConversionRate);
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next())
			{
				return rs1.getString("conversion_rate");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return null;
	}
	
	public ArrayList authenticateCourier(String username, String password,Connection c)
	   {
		ArrayList orderlist = new ArrayList();
		String namecourier=null;
		System.out.println("un:"+username);
		System.out.println("pa:"+password);
		try {	
		PreparedStatement ps= c.prepareStatement("select name from admin_user where username='"+username+"' and password='"+password+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				namecourier=rs.getString("name");
			else
				return null;
			
			System.out.println("cn:"+namecourier);
			
			PreparedStatement ps1 = c.prepareStatement("SELECT * FROM COURIER WHERE COURIER_NAME ='"+ namecourier +"' and delivered=0");

		                   ResultSet rs1 = ps1.executeQuery();
		                    while(rs1.next())
		                    {  
		                    	CourierOrder sc = new CourierOrder();
			                    System.out.println("hi");
		                    	sc.setadd(rs1.getString("address"));
		                    	sc.setcouriername(rs1.getString("courier_name"));
		                    	sc.setItemId(rs1.getInt("item_id"));
		                    	sc.setitemname(rs1.getString("item_name"));
		                    	sc.setnum(rs1.getInt("quantity"));
		                    	sc.setorderid(rs1.getInt("order_id"));
		                    	sc.settotalprice(rs1.getFloat("total_price"));
		                    	//sc.setUserId(rs.getInt("userid"));
		                    	orderlist.add(sc);
		                    }
			}
		    catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
		    //cs.closeCon(c);
		    return orderlist;
	   }

}
