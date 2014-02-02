package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Categories;

public class CategoryDAO {
	Categories category;

	public ArrayList getAllCategories(final Connection c) {
		ArrayList arrCategories = new ArrayList();
		if (c != null) {
			String sCategories = "select * from category";
			try {
				PreparedStatement ps = c.prepareStatement(sCategories);
				ResultSet rs1 = ps.executeQuery();
				while (rs1.next()) {
					arrCategories.add(rs1.getString(2));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return arrCategories;
	}

}
