package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import common.DBService;

import entity.Books;

public class ItemDAO {
	
	public ArrayList getBooks(ArrayList itemArr,Connection c)
	{
		Iterator itemIterator = itemArr.iterator();
		ArrayList bookArr = new ArrayList();
		String sBooks = null;
		while(itemIterator.hasNext())
		{
			sBooks = "select * from books b,item i where b.book_id = i.item_id and i.item_id="+itemIterator.next();
			try {
				PreparedStatement ps = c.prepareStatement(sBooks);
				ResultSet rs1 = ps.executeQuery();
				while(rs1.next())
				{
					Books book = new Books();
					book.setBook_id(rs1.getInt("book_id"));
					book.setBook_name(rs1.getString("book_name"));
					book.setBook_author(rs1.getString("book_author"));
					book.setList_price(rs1.getFloat("list_price"));
					book.setPrice(rs1.getFloat("price"));
					book.setNew_from(rs1.getFloat("new_from"));
					book.setUsed_from(rs1.getFloat("used_from"));
					book.setDigital_list_price(rs1.getFloat("digital_list_price"));
					book.setPrint_list_price(rs1.getFloat("print_list_price"));
					book.setKindle_price(rs1.getFloat("kindle_price"));
					book.setBook_type(rs1.getString("book_type"));
					book.setBook_category(rs1.getString("book_category"));
					book.setBook_discount(rs1.getFloat("discount"));
					bookArr.add(book);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return bookArr;
	}
	
	public ArrayList getBooksGenre(Connection c)
	{
		
		ArrayList bookGenre = new ArrayList();
		String sBooks = null;
			sBooks = "SELECT distinct book_category FROM books";
			try {
				PreparedStatement ps = c.prepareStatement(sBooks);
				ResultSet rs1 = ps.executeQuery();
				while(rs1.next())
				{
					bookGenre.add(rs1.getString("book_category"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return bookGenre;
	}
	
	public ArrayList getAllCountries(Connection c)
	{
		
		ArrayList countryArr = new ArrayList();
		String sCountry = null;
		sCountry = "SELECT country_name FROM country";
			try {
				PreparedStatement ps = c.prepareStatement(sCountry);
				ResultSet rs1 = ps.executeQuery();
				while(rs1.next())
				{
					countryArr.add(rs1.getString("country_name"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return countryArr;
	}

	public int getBookCount(ArrayList itemArr, Connection c) {

		Iterator itemIterator = itemArr.iterator();
		ArrayList bookArr = new ArrayList();
		String sBooks = null;
		int count=0;
		while(itemIterator.hasNext())
		{
			sBooks = "select 1 from books b,item i where b.book_id = i.item_id and i.item_id="+itemIterator.next();
			try {
				PreparedStatement ps = c.prepareStatement(sBooks);
				ResultSet rs1 = ps.executeQuery();
				while(rs1.next())
				{
					count++;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	
	}
	
	public ArrayList getSubSubcategoryTextBook()
	{
	ArrayList textBookCategory=new ArrayList();
	DBService cs = new DBService();
	Connection c = cs.initiateCon();
		try {
        PreparedStatement ps = c.prepareStatement("SELECT distinct book_category from books b,subcategory s,item i where b.book_id=item_id and i.subcategory_id = s.subcategory_id and s.subcategory_name='Textbooks' order by book_category");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            textBookCategory.add(rs.getString("book_category"));
        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cs.closeCon(c);
		return textBookCategory;
	}

}
