package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import common.DBService;

public class OrderDAO {
	public void updateOrder(String orderId) {

		String sOrder = "update courier set delivered=1 where order_id="
				+ orderId;
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {

			Statement stmt = c.createStatement();
			stmt.executeUpdate(sOrder);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
	}
}
