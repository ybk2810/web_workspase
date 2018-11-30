package VO;

public class MaterialVO {

	int mno;
	String mname;
	int price;
	String scale;
	int amount;
	String image;
	
	
	public MaterialVO() {
		
	}
	
	
	public MaterialVO(int mno, String mname, int price, String scale, int amount, String image) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.price = price;
		this.scale = scale;
		this.amount = amount;
		this.image = image;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}