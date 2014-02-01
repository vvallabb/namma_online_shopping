package entity;

public class CourierOrder {
	private String itemname;
	private float totalprice;
	private int number;
	private int itemid;
	private int userid;
	private String address;
	private String courier_name;
	private int orderid;

	public String getitemname() {
		return itemname;
	}

	public String getcouriername() {
		return courier_name;
	}

	public int getorderid() {
		return orderid;
	}

	public float gettotalprice() {
		return totalprice;
	}

	public int getnumber() {
		return number;
	}

	public int getitemid() {
		return itemid;
	}

	public int getuserid() {
		return userid;
	}

	public String getaddr() {
		return address;
	}

	public void setitemname(String s) {
		this.itemname = s;
	}

	public void settotalprice(Float s) {
		this.totalprice = s;
	}

	public void setnum(int s) {
		this.number = s;
	}

	public void setadd(String s) {
		this.address = s;
	}

	public void setcouriername(String s) {
		this.courier_name = s;
	}

	public void setorderid(int s) {
		this.orderid = s;
	}

	public void setUserId(int ItemId) {
		this.userid = ItemId;
	}

	public void setItemId(int ItemId) {
		this.itemid = ItemId;
	}

}
