package entity;

import dao.ShippingAddressDAO;
import java.util.ArrayList;

public class UserDetails {
	private int userDetailsId;
	private int userId;
	private String userDetailsFirstName;
	private String userDetailsMiddleName;
	private String userDetailsSurName;
	private String userDetailsAddressLine1;
	private String userDetailsAddressLine2;
	private String userDetailsCity;
	private String userDetailsRegion;
	private String userDetailsZip;
	private String userDetailsCountry;
	private String userDetailsPhoneNumber;

	public int getUserDetailsId() {
		return userDetailsId;
	}

	public void setUserDetailsId(int userDetailsId) {
		this.userDetailsId = userDetailsId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserDetailsFirstName() {
		return userDetailsFirstName;
	}

	public void setUserDetailsFirstName(String userDetailsFirstName) {
		this.userDetailsFirstName = userDetailsFirstName;
	}

	public String getUserDetailsMiddleName() {
		return userDetailsMiddleName;
	}

	public void setUserDetailsMiddleName(String userDetailsMiddleName) {
		this.userDetailsMiddleName = userDetailsMiddleName;
	}

	public String getUserDetailsSurName() {
		return userDetailsSurName;
	}

	public void setUserDetailsSurName(String userDetailsSurName) {
		this.userDetailsSurName = userDetailsSurName;
	}

	public String getUserDetailsAddressLine1() {
		return userDetailsAddressLine1;
	}

	public void setUserDetailsAddressLine1(String userDetailsAddressLine1) {
		this.userDetailsAddressLine1 = userDetailsAddressLine1;
	}

	public String getUserDetailsAddressLine2() {
		return userDetailsAddressLine2;
	}

	public void setUserDetailsAddressLine2(String userDetailsAddressLine2) {
		this.userDetailsAddressLine2 = userDetailsAddressLine2;
	}

	public String getUserDetailsCity() {
		return userDetailsCity;
	}

	public void setUserDetailsCity(String userDetailsCity) {
		this.userDetailsCity = userDetailsCity;
	}

	public String getUserDetailsRegion() {
		return userDetailsRegion;
	}

	public void setUserDetailsRegion(String userDetailsRegion) {
		this.userDetailsRegion = userDetailsRegion;
	}

	public String getUserDetailsPhoneNumber() {
		return userDetailsPhoneNumber;
	}

	public void setUserDetailsPhoneNumber(String userDetailsPhoneNumber) {
		this.userDetailsPhoneNumber = userDetailsPhoneNumber;
	}

	public String getUserDetailsZip() {
		return userDetailsZip;
	}

	public String getUserDetailsCountry() {
		return userDetailsCountry;
	}

	public ArrayList RetrieveUserDetails(String userName) {
		ShippingAddressDAO shippingDao = new ShippingAddressDAO();
		ArrayList sc = shippingDao.RetrieveUserDetailsDAO(userName);
		return sc;
	}

	public boolean InsertUserDetailsDAO(int UserDetailsId,
			String UserDetailsFirstName, String UserDetailsMiddleName,
			String UserDetailsSurName, String UserDetailsAddr1,
			String UserDetailsAddr2, String UserDetailsCity,
			String UserDetailsRegion, String userDetailsZip,
			String userDetailsCountry, String UserDetailsPhoneNumber) {
		ShippingAddressDAO shippingDao = new ShippingAddressDAO();
		if (shippingDao.InsertUserDetailsDAO(UserDetailsId,
				UserDetailsFirstName, UserDetailsMiddleName,
				UserDetailsSurName, UserDetailsAddr1, UserDetailsAddr2,
				UserDetailsCity, UserDetailsRegion, userDetailsZip,
				userDetailsCountry, UserDetailsPhoneNumber)){
			return true;
		}
		else{
			return false;
		}
	}

	public void setUserDetailsZip(String userDetailsZip) {
		this.userDetailsZip = userDetailsZip;
	}

	public void setUserDetailsCountry(String userDetailsCountry) {
		this.userDetailsCountry = userDetailsCountry;
	}
}