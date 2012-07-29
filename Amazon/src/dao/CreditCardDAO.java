package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBService;

public class CreditCardDAO {

	public ArrayList getAllBanks() {
		
		DBService cs = new DBService();
		Connection c =cs.initiateCon();
		String query = "select distinct(bank_name) from bank";
		ArrayList banks = new ArrayList();
		try {
			PreparedStatement ps = c.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				banks.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return banks;
	}

	public int getBalance(String cardHolderName, String cardNumber, String cvv,
			String cardPin, String bankName) {
		DBService cs = new DBService();
		Connection c =cs.initiateCon();
		String query = "select balance from credit_card_details where credit_card_number="
		+cardNumber+" and bank_name='"+bankName+"' and cvv="+cvv+" and pin="+cardPin+
		" and credit_card_holder='"+cardHolderName+"'";
		
		try {
			PreparedStatement ps = c.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void updateBalance(String cardNumber, int iTotal) {
		DBService cs = new DBService();
		Connection c =cs.initiateCon();
		String query = "update credit_card_details set balance=? where credit_card_number=?";
		
		try {
			PreparedStatement ps = c.prepareStatement(query);
			ps.setInt(1, iTotal);
            ps.setString(2, cardNumber);
            int ret = ps.executeUpdate();
            System.out.println("Update successful:"+ret);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	

}
