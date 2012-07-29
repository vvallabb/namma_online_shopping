package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Categories;

public class CategoryDAO {
Categories category;

public ArrayList getAllCategories(Connection c){
	
	String sCategories="select * from category";
	ArrayList arrCategories = new ArrayList();
	
	try {
		PreparedStatement ps = c.prepareStatement(sCategories);
		ResultSet rs1 = ps.executeQuery();
		while(rs1.next())
		{
			arrCategories.add(rs1.getString(2));

		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return arrCategories;
	
}


}
