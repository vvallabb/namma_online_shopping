package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import common.DBService;

import entity.DeliveredItems;
import entity.ShoppingCart;

public class PublisherDAO {

	public void putValues(ArrayList ShoppingCarts, String uname, String address) {

		Iterator ShoppingCartsIterator = ShoppingCarts.iterator();
		int orderId = 0;
		while (ShoppingCartsIterator.hasNext()) {
			ShoppingCart shoppingCart = (ShoppingCart) ShoppingCartsIterator
					.next();
			if (shoppingCart.getItemStatus() == 2)
				continue;
			DBService cs = new DBService();
			Connection c = cs.initiateCon();
			Statement stmt;

			try {
				PreparedStatement ps = c
						.prepareStatement("select max(order_id) from publisher");
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					orderId = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String query = "insert into publisher(item_name,total_price,quantity,item_id,username,courier_name,order_id) values('"
					+ shoppingCart.getItemName()
					+ "',"
					+ shoppingCart.getItemPrice()
					* shoppingCart.getItemQuantity()
					+ ","
					+ shoppingCart.getItemQuantity()
					+ ","
					+ shoppingCart.getItemId()
					+ ",'"
					+ uname
					+ "','DTDC',"
					+ (orderId + 1) + ")";
			try {
				stmt = c.createStatement();
				stmt.executeUpdate(query);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String query1 = "insert into courier(item_name,total_price,quantity,username,address,delivered,courier_name,order_id,item_id) values('"
					+ shoppingCart.getItemName()
					+ "',"
					+ shoppingCart.getItemPrice()
					* shoppingCart.getItemQuantity()
					+ ","
					+ shoppingCart.getItemQuantity()
					+ ",'"
					+ uname
					+ "','"
					+ address
					+ "',0,'DTDC',"
					+ (orderId + 1)
					+ ","
					+ shoppingCart.getItemId() + ")";
			try {
				stmt = c.createStatement();
				stmt.executeUpdate(query1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			cs.closeCon(c);
		}

	}

	public ArrayList getDeliveredItems(String sUsername) {
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		PreparedStatement ps1;
		ArrayList deliveredItemArr = new ArrayList();
		try {
			ps1 = c.prepareStatement("SELECT * FROM COURIER WHERE username ='"
					+ sUsername + "' and delivered=1");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				DeliveredItems deliveredItems = new DeliveredItems();
				deliveredItems.setOrderId(rs1.getInt("order_id"));
				deliveredItems.setItemName(rs1.getString("item_name"));
				deliveredItems.setAddress(rs1.getString("address"));
				deliveredItems.setCourierName(rs1.getString("courier_name"));
				deliveredItems
						.setPrice(Math.round(rs1.getFloat("total_price")));
				deliveredItems.setQuantity(rs1.getInt("quantity"));
				deliveredItemArr.add(deliveredItems);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return deliveredItemArr;
	}

}
