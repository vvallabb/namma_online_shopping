/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package entity;

import dao.ShippingAddressDAO;
import java.util.ArrayList;

/**
 *
 * @author vasanth
 */
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

    /**
     * @return the userDetailsId
     */
    public int getUserDetailsId() {
        return userDetailsId;
    }

    /**
     * @param userDetailsId the userDetailsId to set
     */
    public void setUserDetailsId(int userDetailsId) {
        this.userDetailsId = userDetailsId;
    }

    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the userDetailsFirstName
     */
    public String getUserDetailsFirstName() {
        return userDetailsFirstName;
    }

    /**
     * @param userDetailsFirstName the userDetailsFirstName to set
     */
    public void setUserDetailsFirstName(String userDetailsFirstName) {
        this.userDetailsFirstName = userDetailsFirstName;
    }

    /**
     * @return the userDetailsMiddleName
     */
    public String getUserDetailsMiddleName() {
        return userDetailsMiddleName;
    }

    /**
     * @param userDetailsMiddleName the userDetailsMiddleName to set
     */
    public void setUserDetailsMiddleName(String userDetailsMiddleName) {
        this.userDetailsMiddleName = userDetailsMiddleName;
    }

    /**
     * @return the userDetailsSurName
     */
    public String getUserDetailsSurName() {
        return userDetailsSurName;
    }

    /**
     * @param userDetailsSurName the userDetailsSurName to set
     */
    public void setUserDetailsSurName(String userDetailsSurName) {
        this.userDetailsSurName = userDetailsSurName;
    }

    /**
     * @return the userDetailsAddressLine1
     */
    public String getUserDetailsAddressLine1() {
        return userDetailsAddressLine1;
    }

    /**
     * @param userDetailsAddressLine1 the userDetailsAddressLine1 to set
     */
    public void setUserDetailsAddressLine1(String userDetailsAddressLine1) {
        this.userDetailsAddressLine1 = userDetailsAddressLine1;
    }

    /**
     * @return the userDetailsAddressLine2
     */
    public String getUserDetailsAddressLine2() {
        return userDetailsAddressLine2;
    }

    /**
     * @param userDetailsAddressLine2 the userDetailsAddressLine2 to set
     */
    public void setUserDetailsAddressLine2(String userDetailsAddressLine2) {
        this.userDetailsAddressLine2 = userDetailsAddressLine2;
    }

    /**
     * @return the userDetailsCity
     */
    public String getUserDetailsCity() {
        return userDetailsCity;
    }

    /**
     * @param userDetailsCity the userDetailsCity to set
     */
    public void setUserDetailsCity(String userDetailsCity) {
        this.userDetailsCity = userDetailsCity;
    }

    /**
     * @return the userDetailsRegion
     */
    public String getUserDetailsRegion() {
        return userDetailsRegion;
    }

    /**
     * @param userDetailsRegion the userDetailsRegion to set
     */
    public void setUserDetailsRegion(String userDetailsRegion) {
        this.userDetailsRegion = userDetailsRegion;
    }

    /**
     * @return the userDetailsPhoneNumber
     */
    public String getUserDetailsPhoneNumber() {
        return userDetailsPhoneNumber;
    }

    /**
     * @param userDetailsPhoneNumber the userDetailsPhoneNumber to set
     */
    public void setUserDetailsPhoneNumber(String userDetailsPhoneNumber) {
        this.userDetailsPhoneNumber = userDetailsPhoneNumber;
    }

     /**
     * @return the userDetailsZip
     */
    public String getUserDetailsZip() {
        return userDetailsZip;
    }

    /**
     * @return the userDetailsCountry
     */
    public String getUserDetailsCountry() {
        return userDetailsCountry;
    }

       public ArrayList RetrieveUserDetails(String userName)
    {
        ShippingAddressDAO shippingDao = new ShippingAddressDAO();
        ArrayList sc = shippingDao.RetrieveUserDetailsDAO(userName);
        return  sc;
    }

    public boolean InsertUserDetailsDAO(int UserDetailsId, String UserDetailsFirstName,
            String UserDetailsMiddleName, String UserDetailsSurName, String UserDetailsAddr1,
            String UserDetailsAddr2, String UserDetailsCity, String UserDetailsRegion,
            String userDetailsZip, String userDetailsCountry, String UserDetailsPhoneNumber)
    {
        ShippingAddressDAO shippingDao = new ShippingAddressDAO();
        if(shippingDao.InsertUserDetailsDAO(UserDetailsId, UserDetailsFirstName,
                UserDetailsMiddleName, UserDetailsSurName, UserDetailsAddr1,
                UserDetailsAddr2, UserDetailsCity, UserDetailsRegion, userDetailsZip,
                userDetailsCountry, UserDetailsPhoneNumber))
            return true;
        else
            return false;
    }

    /**
     * @param userDetailsZip the userDetailsZip to set
     */
    public void setUserDetailsZip(String userDetailsZip) {
        this.userDetailsZip = userDetailsZip;
    }

    /**
     * @param userDetailsCountry the userDetailsCountry to set
     */
    public void setUserDetailsCountry(String userDetailsCountry) {
        this.userDetailsCountry = userDetailsCountry;
    }
}