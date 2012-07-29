package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.*;
import entity.*;


public class ComputerDao {
	
	public ArrayList getLaptopDetails(){
		ArrayList laptop_list = new ArrayList();
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c.prepareStatement("SELECT * FROM computers");

			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Computers lb = new Computers();
				lb.setType(rs.getString("Type"));
				lb.setBrand(rs.getString("Brand"));
				
				lb.setLaptopId(rs.getInt("ItemId"));
				
				lb.setModel(rs.getString("Model"));
				lb.setRating(rs.getInt("Rating"));
				lb.setPrice(rs.getInt("Price"));
				
				String imgLen = rs.getString("Pic");
			
				
				int len = imgLen.length();
			
				RetrieveImg ri = new RetrieveImg();
				byte pic[] = ri.ReadImg(rs.getInt("ItemId"));
           	lb.setPic(pic);
            	lb.setImgLen(len);
	/*			System.out.println("LaptopID = "+ rs.getInt("LaptopId"));
				System.out.println("Brand = "+ rs.getString("Brand"));
				System.out.println("Model = " + rs.getString("Model"));
				System.out.println("Rating = " + rs.getInt("Rating"));
				System.out.println("Price = " + rs.getInt("Price"));	*/
				laptop_list.add(lb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			}
		
		cs.closeCon(c);
	
		return laptop_list;
	}
	
}

