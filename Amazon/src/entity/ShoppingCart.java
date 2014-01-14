

package entity;

import java.util.ArrayList;
import java.util.Date;
import dao.*;

public class ShoppingCart {

	private int ItemId;
	private String ItemName;
	private Date ItemDate;
	private int ItemPrice;
	private int ItemQuantity;
	private float ItemDiscount;
	private int ItemStatus;
	private String itemType;

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public int getItemId() {
		return ItemId;
	}

	public void setItemId(int ItemId) {
		this.ItemId = ItemId;
	}

	public String getItemName() {
		return ItemName;
	}

	public void setItemName(String ItemName) {
		this.ItemName = ItemName;
	}

	public Date getItemDate() {
		return ItemDate;
	}


	public void setItemDate(Date ItemDate) {
		this.ItemDate = ItemDate;
	}

	public int getItemPrice() {
		return ItemPrice;
	}

	/**
	 * @param ItemPrice
	 *            the ItemPrice to set
	 */
	public void setItemPrice(int ItemPrice) {
		this.ItemPrice = Math.round(ItemPrice);
	}

	public int getItemQuantity() {
		return ItemQuantity;
	}

	public void setItemQuantity(int ItemQuantity) {
		this.ItemQuantity = ItemQuantity;
	}

	public float getItemDiscount() {
		return ItemDiscount;
	}

	public void setItemDiscount(float ItemDiscount) {
		this.ItemDiscount = ItemDiscount;
	}

	public ArrayList RetrieveShoppingCartDtls(String username) {
		ShoppingCartDAO scDao = new ShoppingCartDAO();
		ArrayList sc = scDao.getShoppingCartDetails(username);
		if (sc == null)
			System.out.println("null in scart.java");
		return sc;
	}

	public boolean UpdateShoppingCartSaveForLater(int itemId, int status,
			String username) {
		ShoppingCartDAO scDao = new ShoppingCartDAO();
		if (scDao.UpdateShoppingCartSaveForLaterDao(itemId, status, username))
			return true;
		else
			return false;
	}

	public boolean DeleteShoppingCartItem(int itemId, String username) {
		ShoppingCartDAO scDao = new ShoppingCartDAO();
		if (scDao.DeleteShoppingCartItemDao(itemId, username))
			return true;
		else
			return false;
	}

	public int getItemStatus() {
		return ItemStatus;
	}


	public void setItemStatus(int ItemStatus) {
		this.ItemStatus = ItemStatus;
	}

	public boolean InsertShoppingCartDetails(String BookName,
			String AuthorBookName, float BookPrice, int quantity,
			String username, String itemType) {
		ShoppingCartDAO scDao = new ShoppingCartDAO();

		if (scDao.InsertShoppingCartItemDao(BookName, AuthorBookName,
				BookPrice, quantity, username, itemType)) {
			return true;
		} else {
			return false;
		}
	}

}
