package entity;

public class Books {

	private int book_id;
	private String book_name;
	private String book_author;
	private float list_price;
	private float price;
	private float new_from;
	private float used_from;
	private float digital_list_price;
	private float print_list_price;
	private int kindle_price;
	private String book_type;
	private String book_category;
	private float book_discount;

	public float getBook_discount() {
		return book_discount;
	}

	public void setBook_discount(float bookDiscount) {
		book_discount = bookDiscount;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int bookId) {
		book_id = bookId;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String bookName) {
		book_name = bookName;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String bookAuthor) {
		book_author = bookAuthor;
	}

	public float getList_price() {
		return list_price;
	}

	public void setList_price(float listPrice) {
		list_price = listPrice;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getNew_from() {
		return new_from;
	}

	public void setNew_from(float newFrom) {
		new_from = newFrom;
	}

	public float getUsed_from() {
		return used_from;
	}

	public void setUsed_from(float usedFrom) {
		used_from = usedFrom;
	}

	public float getDigital_list_price() {
		return digital_list_price;
	}

	public void setDigital_list_price(float digitalListPrice) {
		digital_list_price = digitalListPrice;
	}

	public float getPrint_list_price() {
		return print_list_price;
	}

	public void setPrint_list_price(float printListPrice) {
		print_list_price = printListPrice;
	}

	public int getKindle_price() {
		return kindle_price;
	}

	public void setKindle_price(float kindlePrice) {
		kindle_price = Math.round(kindlePrice);
	}

	public String getBook_type() {
		return book_type;
	}

	public void setBook_type(String bookType) {
		book_type = bookType;
	}

	public String getBook_category() {
		return book_category;
	}

	public void setBook_category(String bookCategory) {
		book_category = bookCategory;
	}

}
