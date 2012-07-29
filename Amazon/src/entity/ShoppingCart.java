/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

/**
 *
 * @author vasanth
 */

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

	/**
     * @return the ItemId
     */
    public int getItemId() {
        return ItemId;
    }

    /**
     * @param ItemId the ItemId to set
     */
    public void setItemId(int ItemId) {
        this.ItemId = ItemId;
    }

    /**
     * @return the ItemName
     */
    public String getItemName() {
        return ItemName;
    }

    /**
     * @param ItemName the ItemName to set
     */
    public void setItemName(String ItemName) {
        this.ItemName = ItemName;
    }

    /**
     * @return the ItemDate
     */
    public Date getItemDate() {
        return ItemDate;
    }

    /**
     * @param ItemDate the ItemDate to set
     */
    public void setItemDate(Date ItemDate) {
        this.ItemDate = ItemDate;
    }

    /**
     * @return the ItemPrice
     */
    public int getItemPrice() {
        return ItemPrice;
    }

    /**
     * @param ItemPrice the ItemPrice to set
     */
    public void setItemPrice(int ItemPrice) {
        this.ItemPrice = Math.round(ItemPrice);
    }

    /**
     * @return the ItemQuantity
     */
    public int getItemQuantity() {
        return ItemQuantity;
    }

    /**
     * @param ItemQuantity the ItemQuantity to set
     */
    public void setItemQuantity(int ItemQuantity) {
        this.ItemQuantity = ItemQuantity;
    }

    /**
     * @return the ItemDiscount
     */
    public float getItemDiscount() {
        return ItemDiscount;
    }

    /**
     * @param ItemDiscount the ItemDiscount to set
     */
    public void setItemDiscount(float ItemDiscount) {
        this.ItemDiscount = ItemDiscount;
    }

public ArrayList RetrieveShoppingCartDtls(String username)
{
    ShoppingCartDAO scDao = new ShoppingCartDAO();
    ArrayList sc = scDao.getShoppingCartDetails(username);
    if(sc==null)
    	System.out.println("null in scart.java");
    return  sc;
}

public boolean UpdateShoppingCartSaveForLater(int itemId,int status,String username)
{
    ShoppingCartDAO scDao = new ShoppingCartDAO();
    if(scDao.UpdateShoppingCartSaveForLaterDao(itemId,status,username))
        return true;
    else
        return false;
}

public boolean DeleteShoppingCartItem(int itemId,String username)
{
    ShoppingCartDAO scDao = new ShoppingCartDAO();
    if(scDao.DeleteShoppingCartItemDao(itemId,username))
        return true;
    else
        return false;
}
    /**
     * @return the ItemStatus
     */
    public int getItemStatus() {
        return ItemStatus;
    }

    /**
     * @param ItemStatus the ItemStatus to set
     */
    public void setItemStatus(int ItemStatus) {
        this.ItemStatus = ItemStatus;
    }
//Vasanth code changes : Start
    public boolean InsertShoppingCartDetails(String BookName, String AuthorBookName,   float BookPrice, int quantity,String username,String itemType){
        ShoppingCartDAO scDao = new ShoppingCartDAO();

        if(scDao.InsertShoppingCartItemDao (BookName, AuthorBookName, BookPrice,quantity,username,itemType) )
            return true;
        else
            return false;
    }
//Vasanth code changes : End
}
