package entity;

public class Electronics {
	private int item_id;
	private String name;
	private String brand;
	private float price;
	private float list_price;
	private String type;
	private byte[] pic = new byte[2000000];

	public int getitem_id() {
		return item_id;
	}

	public void setitem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getname() {
		return name;
	}

	public void setnamed(String name) {
		this.name = name;
	}

	public String getbrand() {
		return brand;
	}

	public void setbrand(String brand) {
		this.brand = brand;
	}

	public float getprice() {
		return price;
	}

	public void setprice(float price) {
		this.price = price;
	}

	public float getlist_price() {
		return list_price;
	}

	public void setlist_price(float list_price) {
		this.list_price = list_price;
	}

	public String gettype() {
		return type;
	}

	public void settype(String type) {
		this.type = type;
	}
}
