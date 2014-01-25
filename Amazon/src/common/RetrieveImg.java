package common;

import java.sql.*;
import java.io.*;

public class RetrieveImg {

	// public byte[] pic = new byte[20000000];
	public byte[] ReadImg(int id) {
		byte[] rb = null;
		String connectionURL = "jdbc:mysql://localhost:3306/amazon";
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(connectionURL, "root", "root321");
			Statement st1 = con.createStatement();
			
			ResultSet rs1 = st1
					.executeQuery("select Pic from computers where ItemId= "
							+ id);
			String imgLen = "";
			if (rs1.next()) {
				imgLen = rs1.getString(1);
				System.out.println(imgLen.length());
			}
			rs1 = st1.executeQuery("select Pic from computers where ItemId= "
					+ id);
			
			if (rs1.next()) {
				int len = imgLen.length();
				rb = new byte[len];
				InputStream readImg = rs1.getBinaryStream(1);
				int index = readImg.read(rb, 0, len);
				System.out.println("index" + index);
				st1.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rb;
	}

}
