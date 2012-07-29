package entity;

public class Registration {
	String fname;
	String mname;
	String sname;
	String email;
	String add1; 
	String add2; 
	String city; 
	String state; 
	String country;
	String uname;
	String upass;
	String zip;
	String phone;
	
	public String getFirstName(){
		return fname;
	}
	
	public String getPhone(){
		return phone;
	}
	
	public String getMiddleName(){
		return mname;
	}
	
	public String getSurname(){
		return sname;
	}
	
	public String getEmail(){
		return email;
	}
	
	public String getAddress1(){
		return add1;
	}
	
	public String getAddress2(){
		return add2;
	}
	
	public String getCity(){
		return city;
	}
	
	public String getCountry(){
		return country;
	}
	
	public String getState(){
		return state;
	}
	
	public String getZip(){
		return zip;
	}
	
	public String getUname(){
		return uname;
	}
	
	public String getPassword(){
		return upass;
	}

	public void setFirstName(String fname){
		this.fname = fname;
	}
	
	public void setMiddleName(String mname){
		this.mname = mname;
	}
	
	public void setSurname(String sname){
		this.sname = sname;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public void setAddress1(String add1){
		this.add1 = add1;
	}
	
	public void setAddress2(String add2){
		this.add2 = add2;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public void setCountry(String country){
		this.country = country;
	}
	
	public void setState(String state){
		this.state = state;
	}
	
	public void setZip(String zip){
		this.zip = zip;
	}
	
	public void setUname(String uname){
		this.uname = uname;
	}
	
	public void setPassword(String upass){
		this.upass = upass;
	}
	
	public void setPhone(String phone){
		this.phone = phone;
	}
}
