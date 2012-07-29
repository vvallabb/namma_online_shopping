package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import entity.Categories;

public class SubcategoryDAO {


	public HashMap getAllSubcategories(Connection c){
		
		String sCategories="SELECT subcategory_name,Category_name FROM subcategory s,category c where s.category_id = c.Category_id";
		HashMap hcat = new HashMap();
		
		try {
			PreparedStatement ps = c.prepareStatement(sCategories);
			ResultSet rs1 = ps.executeQuery();
			while(rs1.next())
			{
				//System.out.println("displaying categories");
				//System.out.println("cat name:"+rs1.getString("Category_name")+" sub cat name:"+rs1.getString("subcategory_name"));
				  if ( ! hcat.containsKey( rs1.getString("Category_name") ) ) {
			            ArrayList list = new ArrayList( );
			            list.add( rs1.getString("subcategory_name"));
			            hcat.put( rs1.getString("Category_name"), list);
			        }
			        else {
			        	ArrayList list = (ArrayList) hcat.get(rs1.getString("Category_name"));
			            list.add( rs1.getString("subcategory_name") );
			        }

				//hcat.put(rs1.getString("Category_name"), rs1.getString("subcategory_name"));

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hcat;
		
	}
	
public ArrayList getAllItemsForSubcategory(String subcategoryName,Connection c){
		
		String sCategories="select subcategory_id from subcategory where subcategory_name='"+subcategoryName+"'";
		
		ArrayList itemArr = new ArrayList();
		
		try {
			PreparedStatement ps = c.prepareStatement(sCategories);
			ResultSet rs1 = ps.executeQuery();
			int subcategoryId = 0;
			if(rs1.next())
				subcategoryId = rs1.getInt("subcategory_id");
			String sItems = "select item_id from item where subcategory_id="+subcategoryId;
			PreparedStatement ps1 = c.prepareStatement(sItems);
			ResultSet rs2 = ps1.executeQuery();
			while(rs2.next())
			{
				itemArr.add(rs2.getInt("item_id"));

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return itemArr;
		
	}

public String getCategory(String subcategoryName, Connection c) {
	
	String sCategories="select c.Category_name from subcategory s,category c where s.subcategory_name='"+subcategoryName+"' and s.category_id=c.Category_id";
	try {
	PreparedStatement ps = c.prepareStatement(sCategories);
	ResultSet rs1 = ps.executeQuery();
	int categoryId = 0;
	if(rs1.next())
		return rs1.getString("Category_name");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}



}
