package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DBService;

import entity.*;

public class RegistrationDAO {
	public int addUser(Registration user){
		String fname = user.getFirstName();
		String mname = user.getMiddleName();
		String sname = user.getSurname();
		String email = user.getEmail();
		String add1 = user.getAddress1();
		String add2 = user.getAddress2();
		String city = user.getCity();
		String state = user.getState();
		String country = user.getCountry();
		String zip = user.getZip();
		String phone = user.getPhone();
		String uname = user.getUname();
		String upass = user.getPassword();
		
		
		DBService cs = new DBService();
		Connection c = cs.initiateCon();
		
		String query1 =  "insert into user(name,username,password) values('"+fname+"','"+uname+"','"+upass+"')";
		System.out.println("query1 = " +query1);
		Statement stmt,stmt1;
		try {
			PreparedStatement ps = c.prepareStatement("SELECT count(*) FROM user WHERE username= '"+uname+"'");
			ResultSet rs = ps.executeQuery();
			int check_dupli=0;
			if(rs.next())
			check_dupli = rs.getInt(1);
			
			if(check_dupli>0){
				return -1;//USERNAME ALREADY EXISTS
			}

			stmt = c.createStatement();
			stmt.executeUpdate(query1);
			System.out.println("testing");
			PreparedStatement ps1 = c.prepareStatement("SELECT User_id FROM user WHERE username= '"+uname+"'");
			ResultSet rs1 = ps1.executeQuery();
			int user_id=0;
			if(rs1.next())
			user_id = rs1.getInt(1);
			
			
			String query2 = "INSERT INTO user_details (USER_ID,USER_ID_FIRST_NAME,USER_ID_MIDDLE_NAME,USER_ID_SURNAME,USER_ID_ADDRESS_LINE1,USER_ID_ADDRESS_LINE2,USER_ID_CITY,USER_ID_ZIP,USER_ID_COUNTRY,USER_ID_REGION,USER_ID_PHONE_NUMBER)" +
							" values("+user_id+",'"+fname+"','"+mname+"','"+sname+"','"+add1+"','"+add2+"','"+city+"','"+zip+"','"+country+"','"+state+"','"+phone+"')";
			System.out.println("query 2 ="+ query2);
			stmt1 = c.createStatement();
			stmt1.executeUpdate(query2);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return 0;	
	}
}
