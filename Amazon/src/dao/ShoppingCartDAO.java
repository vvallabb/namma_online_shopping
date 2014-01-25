package dao;

import java.sql.*;
import java.util.*;
import common.*;
import entity.ShoppingCart;

public class ShoppingCartDAO {

	public ArrayList getShoppingCartDetails(String username) {
		ArrayList sHoppingCartList = new ArrayList();
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c
					.prepareStatement("SELECT SHOPPING_CART_ITEM_DATE, "
							+ "SHOPPING_CART_ITEM_NAME, SHOPPING_CART_ITEM_PRICE, SHOPPING_CART_ITEM_QTY,  "
							+ "SHOPPING_CART_STATUS, SHOPPING_CART_DISCOUNT, SHOPPING_CART_ID,item_type "
							+ " FROM SHOPPING_CART where username='" + username
							+ "'");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ShoppingCart sc = new ShoppingCart();
				sc.setItemDate(rs.getDate(1));
				sc.setItemName(rs.getString("SHOPPING_CART_ITEM_NAME"));
				sc.setItemPrice(Math.round(rs
						.getFloat("SHOPPING_CART_ITEM_PRICE")));
				sc.setItemQuantity(rs.getInt(4));
				sc.setItemStatus(rs.getInt("SHOPPING_CART_STATUS"));
				sc.setItemDiscount(rs.getFloat("SHOPPING_CART_DISCOUNT"));
				sc.setItemId(rs.getInt("SHOPPING_CART_ID"));
				sc.setItemType(rs.getString("item_type"));

				sHoppingCartList.add(sc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return sHoppingCartList;
	}

	public double RetrieveShoppingCartSubTotal(String username) {
		double ShoppingCartSubTotal = 0;
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c
					.prepareStatement("SELECT SUM(SHOPPING_CART_ITEM_PRICE)"
							+ " FROM SHOPPING_CART where username=" + username);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ShoppingCartSubTotal = rs.getDouble(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return ShoppingCartSubTotal;

	}

	public boolean UpdateShoppingCartSaveForLaterDao(int itemId, int status,
			String username) {
		boolean UpdateStatus = false;
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c.prepareStatement("UPDATE SHOPPING_CART "
					+ "SET SHOPPING_CART_STATUS = ? "
					+ "WHERE SHOPPING_CART_ID = ? and username=?");

			ps.setInt(1, status);
			ps.setInt(2, itemId);
			ps.setString(3, username);
			int ret = ps.executeUpdate();
			if (ret >= 0) {
				UpdateStatus = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return UpdateStatus;
	}

	public boolean DeleteShoppingCartItemDao(int itemId, String username) {
		boolean UpdateStatus = false;
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c
					.prepareStatement("DELETE FROM SHOPPING_CART  "
							+ "WHERE SHOPPING_CART_ID = ? and username=?");

			ps.setInt(1, itemId);
			ps.setString(2, username);
			int ret = ps.executeUpdate();
			if (ret >= 0) {
				UpdateStatus = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return UpdateStatus;
	}

	public boolean InsertShoppingCartItemDao(String BookName,
			String AuthorBookName, float BookPrice, int quantity,
			String username, String itemType) {
		boolean UpdateStatus = false;
		DBService cs = new DBService();
		Connection c = cs.initiateCon();

		try {
			PreparedStatement ps = c
					.prepareStatement(" INSERT INTO SHOPPING_CART "
							+ "(SHOPPING_CART_ITEM_NAME, SHOPPING_CART_ITEM_PRICE, SHOPPING_CART_ITEM_QTY, "
							+ " SHOPPING_CART_STATUS, SHOPPING_CART_DISCOUNT, SHOPPING_CART_ID,SHOPPING_CART_ITEM_DATE,username,item_type ) "
							+ " VALUES (?,?,?,?,?,?,sysdate(),?,?) ");

			ps.setString(1, BookName);
			ps.setFloat(2, BookPrice);
			ps.setInt(3, quantity);
			ps.setInt(4, 1);
			ps.setFloat(5, (float) 10);
			ps.setInt(6, 0);
			ps.setString(7, username);
			ps.setString(8, itemType);
			int ret = ps.executeUpdate();
			if (ret >= 0) {
				UpdateStatus = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return UpdateStatus;
	}

	public void deleteShoppingCart(String username) {

		String query = "delete from shopping_cart where username='" + username
				+ "' and SHOPPING_CART_STATUS=1";
		DBService db = new DBService();
		Connection c = db.initiateCon();
		try {
			PreparedStatement ps = c.prepareStatement(query);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
