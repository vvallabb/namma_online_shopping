package dao;

import java.sql.*;
import java.util.*;
import common.*;
import entity.UserDetails;

public class ShippingAddressDAO {

	public ArrayList RetrieveUserDetailsDAO(String userName) {
		ArrayList ShippingAddressArr = new ArrayList();
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c
					.prepareStatement("SELECT USER_DETAILS_ID, "
							+ "USER_ID_FIRST_NAME, USER_ID_MIDDLE_NAME, USER_ID_SURNAME,  "
							+ "USER_ID_ADDRESS_LINE1, USER_ID_ADDRESS_LINE2, USER_ID_CITY, "
							+ "USER_ID_REGION, USER_ID_ZIP, USER_ID_COUNTRY, USER_ID_PHONE_NUMBER "
							+ " FROM USER_DETAILS ud,user u"
							+ " WHERE u.username = ? and u.User_id = ud.USER_ID");

			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserDetails ud = new UserDetails();
				ud.setUserDetailsId(rs.getInt("USER_DETAILS_ID"));
				ud.setUserDetailsFirstName(rs.getString("USER_ID_FIRST_NAME"));
				ud.setUserDetailsMiddleName(rs.getString("USER_ID_MIDDLE_NAME"));
				ud.setUserDetailsSurName(rs.getString("USER_ID_SURNAME"));
				ud.setUserDetailsAddressLine1(rs
						.getString("USER_ID_ADDRESS_LINE1"));
				ud.setUserDetailsAddressLine2(rs
						.getString("USER_ID_ADDRESS_LINE2"));
				ud.setUserDetailsCity(rs.getString("USER_ID_CITY"));
				ud.setUserDetailsRegion(rs.getString("USER_ID_REGION"));
				ud.setUserDetailsZip(rs.getString("USER_ID_ZIP"));
				ud.setUserDetailsCountry(rs.getString("USER_ID_COUNTRY"));
				ud.setUserDetailsPhoneNumber(rs
						.getString("USER_ID_PHONE_NUMBER"));
				ShippingAddressArr.add(ud);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return ShippingAddressArr;
	}

	public boolean InsertUserDetailsDAO(int UserDetailsId,
			String UserDetailsFirstName, String UserDetailsMiddleName,
			String UserDetailsSurName, String UserDetailsAddr1,
			String UserDetailsAddr2, String UserDetailsCity,
			String UserDetailsRegion, String userDetailsZip,
			String userDetailsCountry, String UserDetailsPhoneNumber) {
		boolean InsertStatus = false;
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		try {
			PreparedStatement ps = c
					.prepareStatement("INSERT INTO AMAZON.USER_DETAILS  "
							+ " ( "
							+ " USER_DETAILS_ID, "
							+ "USER_ID_FIRST_NAME, USER_ID_MIDDLE_NAME, USER_ID_SURNAME,  "
							+ "USER_ID_ADDRESS_LINE1, USER_ID_ADDRESS_LINE2, USER_ID_CITY "
							+ "USER_ID_REGION, USER_ID_ZIP, USER_ID_COUNTRY, USER_ID_PHONE_NUMBER )  VALUES ( "
							+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ) ");

			ps.setInt(1, UserDetailsId);
			ps.setString(2, UserDetailsFirstName);
			ps.setString(3, UserDetailsMiddleName);
			ps.setString(4, UserDetailsSurName);
			ps.setString(5, UserDetailsAddr1);
			ps.setString(6, UserDetailsAddr2);
			ps.setString(7, UserDetailsCity);
			ps.setString(8, UserDetailsRegion);
			ps.setString(9, userDetailsZip);
			ps.setString(10, userDetailsCountry);
			ps.setString(11, UserDetailsPhoneNumber);
			ResultSet rs = ps.executeQuery();

			if (rs != null) {
				InsertStatus = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		cs.closeCon(c);
		return true;
	}
}
