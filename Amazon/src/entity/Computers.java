package entity;

public class Computers {
	
	private int laptop_id;
	private String brand;
	private String model;
	private int rating;
	private int price;
	private String type;
	private int image_len;
	private byte[] pic = new byte[2000000];

	public int getLaptopId() {
		return laptop_id;
	}

	public void setLaptopId(int laptop_id) {
		this.laptop_id = laptop_id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public byte[] getPic() {
		return pic;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

	public void setImgLen(int imagelen) {
		this.image_len = imagelen;
	}

	public int getImgLen() {
		return image_len;
	}
}
