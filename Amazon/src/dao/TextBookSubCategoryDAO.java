package dao;

import common.*;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TextBookSubCategoryDAO {

	public ArrayList getSubSubcategoryTextBook() {
		ArrayList textBookCategory = new ArrayList();
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c
					.prepareStatement("SELECT distinct book_category from books b,subcategory s,item i where b.book_id=item_id and i.subcategory_id = s.subcategory_id and s.subcategory_name='Textbooks' order by book_category");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				textBookCategory.add(rs.getString("book_category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return textBookCategory;
	}

}
