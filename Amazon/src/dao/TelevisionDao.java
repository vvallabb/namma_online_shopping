package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBService;

import entity.Electronics;
import dao.*;



public class TelevisionDao {
	
	public ArrayList getTeleDetails(){
		ArrayList Television_list = new ArrayList();
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c.prepareStatement("SELECT distinct brand FROM electronics");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Electronics lb = new Electronics();
				lb.setbrand(rs.getString("brand"));
				Television_list.add(lb);
				//System.out.println("brnd = "+rs.getString("brand"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			}
		
		cs.closeCon(c);
		
		return Television_list;
	}
	
}